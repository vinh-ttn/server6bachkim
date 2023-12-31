
-- ====================== 文件信息 ======================

-- 剑侠情缘online 2006 元旦活动武林盟主诏书文件
-- Edited by peres
-- 2005/12/22 PM 15:12

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 读入 2006 元旦活动头文件
Include("\\script\\event\\newyear_2006\\newyear_head.lua");

-- 随机任务的处理支持
Include("\\script\\task\\random\\task_head.lua");

function main()

Say("в tri ﹏ c竎 anh h飊g hi謕 kh竎h, v祇 d辮 T誸  L辌h, ta mu鑞 t苙g m閠 s� l� v藅, v祇 ng祔 <color=yellow>30/12 n 01/01<color> c� th� n ch� ta nh薾 qu�--чc C� Ki誱",
	7,
	"Nh薾 甶觤 kinh nghi謒 t╪g g蕄 i trong 8 gi� m鏸 ng祔/getDoubleExp",
	"Nh薾 ph莕 thng 甶觤 kinh nghi謒 m鏸 ng祔/getMoreExp_Confirm",
	"Nh薾 m藅 t辌h nhi謒 v� m鏸 ng祔/getTaskBook",
	"Li猲 quan v� t� l� t╪g 甶觤 kinhn nghi謒 c馻 nhi謒 v� ng蓇 nhi猲/getRandomTaskInfo",
	"Tin t鴆 m韎 v� B筩h C﹗ ho祅/getBaijuInfo",
	"C� th� s� d鬾g Ti襫 ng mua d鬾g c� m韎/getCoppercashInfo",
	"Х c xong/OnExit");
	
	return 1;

end;


function getDoubleExp()

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- 如果日期不对，直接返回
	if isNewYearTime()==0 then
		Say("Gi�  h誸 Nguy猲 Цn r錳!", 0);
		return
	end;

	-- 如果等级未达到 80 级
	if GetLevel()<80 then
		Say("Ch� c� ngi ch琲 t� c蕄 80 tr� l猲 m韎 c� th� nh薾 頲 ph莕 thng g蕄 i 甶觤 kinh nghi謒!", 0);
		return
	end;

	if nDate~= GetTask(ID_GETDOUBLEEXP_DATE) then
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);	
		
	elseif GetTask(ID_GETDOUBLEEXP_NUM)>=1 then
	
		Say("H玬 nay b筺  nh薾 ph莕 thng g蕄 i 甶觤 kinh nghi謒 r錳!", 0);
		return
		
	else
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);
			
	end;
	
	-- 80 级以上的人每天可以领取一次 8 小时经验双倍
	if GetLevel()>=80 then
	
		AddSkillState(531,10,1,8*60*60*18);
		AddSkillState(461,1, 1,8*60*60*18);
		
		Msg2Player("B筺 nh薾 頲 <color=green>Ph莕 thng 甶觤 kinh nghi謒 g蕄 i trong 8 gi�!<color>");
		WriteTaskLog("Nh薾 頲 ph莕 thng 甶觤 kinh nghi謒 g蕄 i trong 8 gi�!");
		
	else
		Say("Ch� c� ngi ch琲 t� c蕄 80 tr� l猲 m韎 c� th� nh薾 頲 ph莕 thng g蕄 i 甶觤 kinh nghi謒!", 0);
	end;

end;


function getTaskBook()

local nRandomTaskID, nRandomItemIndex = 0, 0;

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- 如果日期不对，直接返回
	if isNewYearTime()==0 then
		Say("Gi�  h誸 Nguy猲 Цn r錳!", 0);
		return
	end;
	
	-- 如果是非冲卡用户
	if IsCharged()==0 then
		Say("Ho箃 ng Nguy猲 Цn l莕 n祔 ch� c� n筽 th� m韎 s� d鬾g 頲!", 0);
		return
	end;
	
	-- 如果等级未达到 80 级
	if GetLevel()<80 then
		Say("Ch� c� ngi ch琲 t� c蕄 80 tr� l猲 m韎 c� th� nh薾 頲 m藅 t辌h nhi謒 v� n祔!", 0);
		return
	end;
	
	if nDate~= GetTask(ID_GETTASKBOOK_DATE) then
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	elseif GetTask(ID_GETTASKBOOK_NUM)>=1 then
	
		Say("H玬 nay b筺  nh薾 m閠 m藅 t辌h nhi謒 v� r錳!", 0);
		return
		
	else
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	end;
	
	-- 选择一个第二层的随机任务
	nRandomTaskID = TaskNo(selectNextTask());
		
	-- 生成一个任务卷轴
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	
	-- 同步物品魔法属性
	SyncItem(nRandomItemIndex);

	Msg2Player("B筺 nh薾 琧 <color=green>nhi謒 v� ng蓇 nhi猲!<color>");
	
	WriteTaskLog("Nh薾 頲 1 m藅 t辌h nhi謒 v�, m� s� l�:"..nRandomTaskID);
	
end;


-- 询问玩家是否领取经验
function getMoreExp_Confirm()
	Say("Trong kho秐g th阨 gian t� <color=yellow>20-12-2005 n 01-01-2006<color>, m鏸 ng祔 l猲 m筺g u nh薾 頲 甶觤 kinh nghi謒 do V� l﹎ minh ch� t苙g.<color=yellow>Trong v遪g 3 ng祔 n祔 c� th� nh薾 1 l莕 <color>, nh璶g 2 l莕 nh薾 ph秈 c竎h nhau <color=yellow>tr猲 m閠 gi� tr猲 m筺g<color>. Ngi ng � nh薾 kh玭g?",2,
		"Л頲 r錳! Ta mu鑞 nh薾 l穘h!/getMoreExpMain",
		"Th玦  l竧 甶/OnExit");
	return
end;


-- 领取每日的经验
function getMoreExpMain()

local nExp = countMoreExpNum();

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- 如果日期不对，直接返回
	if isNewYearTime()==0 then
		Say("Gi�  h誸 Nguy猲 Цn r錳!", 0);
		return
	end;
	
	-- 如果是非冲卡用户
	if IsCharged()==0 then
		Say("Ho箃 ng Nguy猲 Цn l莕 n祔 ch� c� n筽 th� m韎 s� d鬾g 頲!", 0);
		return
	end;
	
	if canGetMoreExp()==1 then
		if GetLevel()<50 then
			addPlayerExpForLimit(nExp, 5); -- 限制只能升 5 级
		else
			addPlayerExpForLimit(nExp, 0); -- 不限制
		end;
		
		Msg2Player("B筺 nh薾 頲 ph莕 thng trong ho箃 ng Nguy猲 Цn:<color=yellow>"..nExp.."<color> 甶觤 kinh nghi謒!");
		
		writeMoreExpData();  -- 记录领取经验的相关数据
	
		WriteTaskLog("nh薾 頲 ph莕 thng 甶觤 kinh nghi謒 m鏸 ng祔:"..nExp);
		
	else
		Say("Hi謓 t筰 ngi kh玭g  甶襲 ki謓  nh薾.<color=yellow>Trong v遪g 3 ng祔 m鏸 ng祔 s� nh薾 1 l莕<color>, nh璶g 2 l莕 nh薾 ph秈 c竎h nhau <color=yellow>tr猲 1 gi� tr猲 m筺g<color>!", 0);
		return
	end;


end;


-- 获取铜钱的提示
function getCoppercashInfo()

	Say("G莕 y D� dung thu藅 s� � L﹎ An c� b竛 m閠 s� M苩 n� Tinh Linh, M苩 n� T﹏ Ni猲 Hi謕 Kh竎h, M苩 n� T﹏ Ni猲 Hi謕 N�, M苩 n� Thu莕 L閏匓猲 c筺h  H祅h cc thng nh﹏ m閠 s� n琲 c騨g c� nh藀 v祇 m閠 s� h閜 l� v藅 m祏 xanh, h閜 hoa, n琲 H祅g Rong c騨g c� b竛 Thi謕 Nh� � cho ngi ch琲 c� th� vi誸 l阨 ch骳 ph骳 l猲 , hoan ngh猲h m鋓 ngi n mua!", 0);
	return
	
end;


function getBaijuInfo()

	Say("Trong th阨 gian <color=yellow>30/12/2005 n 01/01/2006<color> m鏸 ng祔 t� <color=red>0:00~18:00<color>, s� d鬾g B筩h C﹗ ho祅 treo m竬 nh薾 頲 t╪g i 甶觤 kinh nghi謒, K� n╪g B筩h C﹗ ho祅 treo m竬 nh薾 頲 k� n╪g t╪g 1.5 l莕 ", 0);
	return

end;


function getRandomTaskInfo()

	Say("Trong th阨 gian <color=yellow>30-12-2005 n 01-01-2006<color> nh薾 頲 nhi謒 v� ng蓇 nhi猲 - ph莕 thng nh﹏ i!", 0);
	return

end;



function OnExit()

end;