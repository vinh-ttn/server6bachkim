
-- ====================== 文件信息 ======================

-- 剑侠情缘online 越南版完美安邦脚本头文件
-- Edited by bel
-- 2008/05/07 AM 11:02

-- ======================================================

IncludeLib("ITEM");						-- 物品库支持
IncludeLib("TASKSYS");					-- 任务系统库支持
Include("\\script\\lib\\equipex.lua");	-- 读入生成相似装备支持的头文件
Include("\\script\\task\\system\\task_debug.lua");		-- 读入 DEBUG 输出处理文件
Include("\\script\\task\\system\\task_head.lua");		-- 读入WriteTaskLog信息

ID_EQUIPEX_TASK		= 2536;             -- 记录安邦任务的流程
ID_EQUIPEX_FINISH	= 2540;             -- 记录安邦任务的完成状态
ID_EQUIPEX_TOTAL  	= 2541;             -- 记录安邦任务是否全部完成
ID_EQUIPEX_TASK_RANDOMSEED	= 2539;  	-- 记录黄金的随机种子

GLB_EQUIPEX_CLOSE 	= 1244  			-- 紧急关闭用的临时变量
TASK_CHECKITEM_NUM 	= 202;				-- 用于临时记录的物品 ID 总数
TAKS_CHECKITEM_MAX 	= 20;				-- 用于临时记录的物品 ID 最大数
TASK_CHECKITEM_START 		= 203;		-- 用于临时记录的物品 ID 起始变量号
NUM_PAY_TOPITEMTOPERFECT	= 1000;		-- 极品的安邦打造成完美的收费，单位（万）
NUM_PAY_PERFECTITEM_REVERT 	= 500;


-- 普通的安邦索引
aryItem = {
	--   完美的序号  普通的序号  完美的文字描述   普通的文字描述   需要固定的属性
	[1]	= {211, 165, "An bang Ho祅 m� - C骳 hoa th筩h ch� ho祅", "An Bang C骳 Hoa Th筩h Ch� ho祅", 105},
	[2] = {213, 167, "An bang Ho祅 m� - K� huy誸 th筩h gi韎 ch�", "An Bang K� Huy誸 Th筩h Gi韎 Ch� ", 102},
	[3] = {210, 164, "An bang Ho祅 m� - B╪g tinh th筩h h筺g li猲", "An Bang B╪g Tinh Th筩h H筺g Li猲", 114},
	[4] = {212, 166, "An bang Ho祅 m� - 襫 ho祅g th筩h ng鋍 b閕", "An Bang 襫 Ho祅g Th筩h Ng鋍 B閕", 101},
}

-- 极品的安邦索引
aryTopItem = {
	--   完美的序号  普通的序号  完美的文字描述   普通的文字描述
	[1]	= {425, 409, "[Ho祅 M黓 C鵦 Ph萴 An Bang C骳 Hoa Th筩h Ch� Ho祅", "[C鵦 ph萴] An Bang C骳 Hoa Th筩h Ch� Ho祅"},
	[2] = {427, 411, "[Ho祅 M黓 C鵦 Ph萴 An Bang K� Huy誸 Th筩h Gi韎 Ch�", "[C鵦 ph萴] An Bang K� Huy誸 Th筩h Gi韎 Ch�"},
	[3] = {424, 408, "[Ho祅 M黓 C鵦 Ph萴 An Bang B╪g Tinh Th筩h H筺g Li猲", "[C鵦 ph萴] An Bang B╪g Tinh Th筩h H筺g Li猲"},
	[4] = {426, 410, "[Ho祅 M黓 C鵦 Ph萴 An Bang 襫 Ho祅g Th筩h Ng鋍 B閕", "[C鵦 ph萴] An Bang 襫 Ho祅g Th筩h Ng鋍 B閕"},	
}

aryNeedItem = {
	--      物品名称          总类  分类  细类  等级  五行  黄金  数量  随机种子记录
	[1] = {{"2 C骳 Hoa Th筩h",        4,   963,    1,   -1,   -1,    0,   2,    0},
		   {"1 B╪g Th筩h K誸 Tinh",      4,   967,    1,   -1,   -1,    0,   1,    0},
		   {"10 Lam Th駓 Tinh",       4,   238,    1,   -1,   -1,    0,   10,   0},
		   {"An Bang C骳 Hoa Th筩h Ch� ho祅", 0,   0,      0,   -1,   -1,  165,   1,    1}},
		   	
	[2] = {{"2 B╪g Thi襪 T�",        4,   965,    1,   -1,   -1,    0,   2,    0},
		   {"3 K� Huy誸 Th筩h",        4,   966,    1,   -1,   -1,    0,   3,    0},
		   {"10 L鬰 Th駓 Tinh",       4,   240,    1,   -1,   -1,    0,   10,   0},
		   {"An Bang K� Huy誸 Th筩h Gi韎 Ch� ", 0,   0,      0,   -1,   -1,  167,   1,    1}},
		   	
	[3] = {{"2 M� N穙",          4,   964,    1,   -1,   -1,    0,   2,    0},
		   {"1 M秐h thi猲 th筩h",      4,   968,    1,   -1,   -1,    0,   1,    0},
		   {"5 T� Th駓 Tinh",        4,   239,    1,   -1,   -1,    0,   5,    0},
		   {"1 Th莕 B� Kho竛g Th筩h",      6,   1,    398,   -1,   -1,    0,   1,    0},
		   {"An Bang B╪g Tinh Th筩h H筺g Li猲", 0,   0,      0,   -1,   -1,  164,   1,    1}},
		   	
	[4] = {{"10 襫 Ho祅g Th筩h",       4,   969,    1,   -1,   -1,    0,   10,   0},
		   {"1 T輓 s� Kim b礽",     6,   1,    888,   -1,   -1,    0,   1,    0},
		   {"1 Huy襫 tinh c蕄 8",       6,   1,    147,    8,   -1,    0,   1,    0},
		   {"An Bang 襫 Ho祅g Th筩h Ng鋍 B閕", 0,   0,      0,   -1,   -1,  166,   1,    1}},
}


function main_talk()
	
	local nTask = equipexTaskState();
	local nFinish = GetTask(ID_EQUIPEX_FINISH);
	
	local aryTalk = {};
	
	if GetGlbValue(GLB_EQUIPEX_CLOSE)==1 then
		Say("Th� r蘮 th莕 b�: H玬 nay ta m謙 r錳, i l莕 sau ta s� gi髉 ngi!", 0);
		return
	end;
	
	tinsert(aryTalk, "<dec><npc>L穙 phu c� th� gi髉 g� v� trang b� An bang Ho祅 m�?");
	
	if nTask>=4 and nFinish==1 then
		tinsert(aryTalk, "Ta mu鑞 玭g gi髉 ta ti誴 t鬰 ch� t筼 b� An bang./ib_nexttask_talk");
	else
		tinsert(aryTalk, "Ta mu鑞 ti課 h祅h ch� t筼 b� An bang Ho祅 m�/main_task_talk");
	end;
	
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		tinsert(aryTalk, "Ta mu鑞 ph鬰 h錳 l筰 b� An bang Ho祅 m�/ib_nexttask_revert");
	end;
	
--	tinsert(aryTalk, "我拥有[极品的]安邦首饰，你帮我强化吧/top_equipex_dialog");
--	tinsert(aryTalk, "我拥有[极品的]完美安邦首饰，你帮我还原吧/top_revert_dialog");
	tinsert(aryTalk, "R阨 kh醝/OnExit");
	
	CreateTaskSay(aryTalk);
end;


function main_task_talk()
	local nTask = equipexTaskState();
	local nFinish = GetTask(ID_EQUIPEX_FINISH);
	if nTask==0 then
		CreateTaskSay({"<dec><npc>Xem nh� l� c� duy猲, ta s� gi髉 ngi ho祅 th祅h.",
					   "B総 u nhi謒 v� An bang Ho祅 m�/main_task_001",
					   "R阨 kh醝/OnExit"});
	end;
	
	if nTask>0 and nTask<=4 and nFinish==0 then
		main_task_give();
	end;
	
	if nTask>0 and nTask<4 and nFinish==1 then
		if nTask==1 then main_task_002(); end;
		if nTask==2 then main_task_003(); end;
		if nTask==3 then main_task_004(); end;
	end;
	
end;



function main_task_001()
	SetTask(ID_EQUIPEX_TASK, 1);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>u ti猲 l� ch� t筼 {{An bang c骳 hoa th筩h ch� ho祅}}. H穣 gi髉 ta 甶 t譵 {{2 C骳 Hoa Th筩h}} v� {{1 B╪g Th筩h K誸 Tinh}}, v� {{10 Lam Th駓 Tinh}}, nghe n r籲g nh鱪g th� n祔 c� b竛 t筰 K� Tr﹏ C竎, ngi h穣 甶 xem, d� nhi猲 kh玭g th� thi誹 {{An bang c骳 hoa th筩h ch� ho祅}} c馻 ngi n鱝.",
				   "Hi觰 r錳/OnExit"});	
end;

function main_task_002()
	SetTask(ID_EQUIPEX_TASK, 2);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>Ti誴 theo l� ch� t筼 {{An bang k� huy誸 th筩h gi韎 ch� }}, h穣 gi髉 ta 甶 t譵 {{2 B╪g Thi襪 T瑌}, {{3 K� Huy誸 Th筩h}}, v� {{10 L鬰 Th駓 Tinh}}. Nghe n r籲g nh鱪g th� n祔 c� b竛 t筰 K� Tr﹏ C竎, ngi h穣 甶 xem, d� nhi猲 kh玭g th� thi誹 {{An bang k� huy誸 th筩h gi韎 ch� }}.",
				   "Hi觰 r錳/OnExit"});	
end;

function main_task_003()
	SetTask(ID_EQUIPEX_TASK, 3);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>Ti誴 theo l� ch� t筼 {{An bang b╪g tinh th筩h h筺g li猲}}, h穣 gi髉 ta 甶 t譵 {{2 M� N穙}} v� {{1 M秐h thi猲 th筩h}}, v� {{5 T� Th駓 Tinh}} v� {{1 Th莕 b� kho竛g th筩h}}, Nghe n r籲g nh鱪g th� n祔 c� b竛 t筰 K� Tr﹏ C竎, ngi h穣 甶 xem, d� nhi猲 kh玭g th� thi誹 {{An bang b╪g tinh th筩h h筺g li猲}}.",
				   "Hi觰 r錳/OnExit"});	
end;

function main_task_004()
	SetTask(ID_EQUIPEX_TASK, 4);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>Cu鑙 c飊g l� ch� t筼 {{An bang 甶襫 ho祅g th筩h ng鋍 b閕}}. H穣 gi髉 ta 甶 t譵 {{10 襫 Ho祅g Th筩h}}, {{1 T輓 s� kim b礽}} v� {{1 Huy襫 tinh c蕄 8}}, v� d� nhi猲 kh玭g th� thi誹 {{An bang 甶襫 ho祅g th筩h ng鋍 b閕}}.",
				   "Hi觰 r錳/OnExit"});	
end;

function main_task_give()
	local nTask = equipexTaskState();
	
	local aryTaskNeed = {}; 
	
	if nTask>0 and nTask<=4 then
		aryTaskNeed = aryNeedItem[nTask];
	end;
	
	local szTask = "";
	local i=0;
	
	for i=1, getn(aryTaskNeed) do
		szTask = szTask.."<color=yellow>"..aryTaskNeed[i][1].."<color><enter>";
	end;
	
	local szTalk = {};
	tinsert(szTalk, "<dec><npc>Ngi  thu th藀 y  ch璦?<enter><enter>"..szTask);
	tinsert(szTalk, "Giao nguy猲 li謚 ch� t筼 An bang Ho祅 m�/giveTaskNeedDialog");
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		tinsert(szTalk, "Ta kh玭g mu鑞 ti誴 t鬰 ch� t筼 n鱝./ib_nexttask_cancel");
	end;
	tinsert(szTalk, "R阨 kh醝/OnExit");
	
	CreateTaskSay(szTalk);
end;


-- 每一步任务完成时的处理
function main_task_finish()
	
	local nTask = equipexTaskState();
	local nRandomSeed = 0;
	local nGold = 0;
	
	local nItem = GetTaskTemp(TASK_CHECKITEM_NUM);
	local nResult = 0;  -- 是否删除物品正确
	local i=0;

	-- 删除任务所需要的物品
	for i=1, nItem do
		nResult = RemoveItemByIndex(GetTaskTemp(TASK_CHECKITEM_START + i - 1));
		
		-- 异常处理，如果有删除不成功，则直接将任务变成还没完成
		if nResult~=1 then
			Say("Nhi謒 v� ph竧 sinh l鏸, kh玭g th� ho祅 th祅h!", 0);
			return
		end;
		
	end;
			
	if nTask>0 and nTask<=4 then
		
		nGold = aryItem[nTask][1];
		
		nRandomSeed = GetTask(ID_EQUIPEX_TASK_RANDOMSEED);
		
		-- AddItemEx 指令需要将黄金序号 -1
		AddItemEx(4, nRandomSeed, 1, 0, nGold - 1, 0, 0, 0, 0, 0);
		
		CDebug:MessageOut("Ch� t筼 th祅h c玭g 1 m鉵 An bang ho祅 m�, m� s�:"..nGold.." Nhi謒 v� ng蓇 nhi猲:"..nRandomSeed);
		WriteTaskLog("Ch� t筼 th祅h c玭g 1 m鉵 An bang ho祅 m�, m� s�:"..nGold.." Nhi謒 v� ng蓇 nhi猲:"..nRandomSeed);
		
	end;
	
	SetTask(ID_EQUIPEX_FINISH, 1);
	
	Msg2Player("Ch骳 m鮪g b筺  nh薾 頲: <color=yellow>"..aryItem[nTask][3].."<color>!");
	
	-- 如果所有任务均完成，则无论如何都将任务置为最后一步已经完成状态
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		SetTask(ID_EQUIPEX_TASK, 4);
	end;
	
	if nTask==4 then
		SetTask(ID_EQUIPEX_TOTAL, 1);
	end;
	
end;


function equipexTaskState()
	return GetTask(ID_EQUIPEX_TASK);
end;


function giveTaskNeedDialog()
	GiveItemUI("Giao v藅 ph萴 cho th� r蘮", "H穣 t c竎 nguy猲 li謚 c莕 thi誸 v祇!", "checkTaskNeed", "OnExit");
end;


function checkTaskNeed(nCount)
	local aryTaskNeed = aryNeedItem[equipexTaskState()];

	-- 任务所需要物品的 MAP
	local aryNeed = {};
	
	-- 所需要删除物品的数组
	local aryDelItem = {};		
	
	-- 任务所需要的物品总数
	local nNeed = getTaskCollectNum();

	-- 任务所要的物品编号
	local w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality = 0,0,0,0,0,0,0,0;
	print(-100, w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality);
	-- 玩家传进来的物品编号
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex = 0,0,0,0,0,0,0,0;
	print(1000, nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex);
	-- 如果物品需要记录随机种子，则记录序号
	local nRandomSeedRecord = 0;
	
	local nRandomSeed = 0;
	
	local tmpNeedKey, tmpNeedLevel, tmpNeedFive = "", 0, 0;
	local tmpGetKey, tmpGetLevel, tmpGetFive = "", 0, 0;
	
	-- 真实的物品数量
	local nRealCount, nCheckCount = 0, 0;
	
	local i,j,k=0,0,0;
	
	for i=1, nCount do
		local nItemIndex	= GetGiveItemUnit(i)
		nRealCount = nRealCount + GetItemStackCount(nItemIndex);
	end;
	
	-- 如果物品数量与要找的数量不符，直接返回
	if nRealCount ~= nNeed then
		Say("S� lng v藅 ph萴 b筺  v祇 kh玭g ch輓h x竎!", 0);
		return 0;
	end;
	
	-- 构造任务所需要物品的 MAP
	for i=1, getn(aryTaskNeed) do
		
		w_Genre      = aryTaskNeed[i][2];
		w_Detail     = aryTaskNeed[i][3];
		w_Particular = aryTaskNeed[i][4];
		w_Level      = aryTaskNeed[i][5];
		w_GoodsFive  = aryTaskNeed[i][6];
		w_GoodsNum   = aryTaskNeed[i][8];
		
		w_Quality    = aryTaskNeed[i][7];
		
		nRandomSeedRecord = aryTaskNeed[i][9];
		
		if w_Quality==-1 then w_Quality=0; end;
		
		if w_Quality>0 then
			w_Genre = 0;w_Detail = 0;w_Particular = 0;
		end;

		tmpNeedKey = tostring(w_Quality)..","..
					 tostring(w_Genre)..","..
					 tostring(w_Detail)..","..
					 tostring(w_Particular);
		
		-- 如果没有这个 MAP KEY 则初始化
		if aryNeed[tmpNeedKey] then
			tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
		else
			aryNeed[tmpNeedKey]={};
			tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
		end;
		CDebug:MessageOut("S� v藅 ph萴 t筼 th祅h: ["..tmpNeedKey.."]:"..w_Level..","..w_GoodsFive..","..w_GoodsNum..","..w_DelGoods);
	end;
	
	
	for i=1, nCount do
		
		nIndex = GetGiveItemUnit(i);
		
		tmpGetKey, tmpLevel, tmpFive = TranKey(nIndex);
		CDebug:MessageOut("Ki觤 tra v藅 ph萴:"..tmpGetKey);
		nCheckCount = GetItemStackCount(nIndex);
		
		local bCorrect = 0;
		if aryNeed[tmpGetKey] then
			for j=1, getn(aryNeed[tmpGetKey]) do
				
				CDebug:MessageOut("Ki觤 tra v藅 ph萴:"..tmpGetKey);
			
				-- 如果任务物品不需要判断五行或者等级的
				if aryNeed[tmpGetKey][j][1]==-1 then tmpLevel=-1; end;
				if aryNeed[tmpGetKey][j][2]==-1 then tmpFive=-1; end;
				
				CDebug:MessageOut("Tham s� v藅 ph萴:"..tmpGetKey.."level:"..tmpLevel.."  five:"..tmpFive);
				CDebug:MessageOut("Tham s� nhi謒 v�:"..tmpGetKey.."level:"..aryNeed[tmpGetKey][j][1].."  five:"..aryNeed[tmpGetKey][j][2]);
				
				-- 如果相对应的 KEY 的五行和等级都符合的话
				if aryNeed[tmpGetKey][j][1]==tmpLevel and aryNeed[tmpGetKey][j][2]==tmpFive then
					
					-- 如果符合条件的物品需要记录随机种子，则记录
					-- 记录的格式为：[任务名][随机种子序号][随子种子数]
					if aryNeed[tmpGetKey][j][5]==1 then
						
						-- 检查这件黄金是否有保质期
						local nExpiredTime = ITEM_GetExpiredTime(nIndex);
						if nExpiredTime > 0 then
							CreateTaskSay({"<dec><npc>Kh竎h quan t v祇 kh玭g ng trang b� ta c莕!",
										   "Ta  giao nh莔 r錳!/OnExit"});
							return
						end;
						
						nRandomSeed = ITEM_GetItemRandSeed(nIndex);
						SetTask(ID_EQUIPEX_TASK_RANDOMSEED, nRandomSeed);
					end;
										
					aryNeed[tmpGetKey][j][3] = aryNeed[tmpGetKey][j][3] - nCheckCount;
					bCorrect = 1;
					CDebug:MessageOut("Ki觤 tra v藅 ph萴:"..tmpGetKey.." Th玭g qua!");
					break;
				end;
			end;
		end;
		
		if (bCorrect == 1) then
			tinsert(aryDelItem, nIndex);
		else
			
			-- 清空符合条件的数组
			aryDelItem = {};
			
			Say("V藅 ph萴 b筺  v祇 kh玭g ch輓h x竎!", 0);
			return 0;
		end;
		
	end;
	
	-- 检查是不是所有的物品都正确
	for i,j in aryNeed do
		for k=1, getn(j) do
			if j[k][3]~=0 then
				Say("V藅 ph萴 b筺  v祇 kh玭g ch輓h x竎!", 0);
				return 0;
			end;
		end;
	end;
	
	-- 记录一共有多少个物品需要删除
	SetTaskTemp(TASK_CHECKITEM_NUM, getn(aryDelItem));
	
	CDebug:MessageOut("Li謙 k� nh鱪g v藅 ph萴 c莕 lo筰 b�:"..getn(aryDelItem));
	
	for i=1, getn(aryDelItem) do
		SetTaskTemp(TASK_CHECKITEM_START + i - 1, aryDelItem[i]);
		CDebug:MessageOut("C莕 ph秈 lo筰 b�:"..aryDelItem[i]);
	end;
	
	-- 任务完成时的处理
	main_task_finish();
	
	return 1;

end;

-- 计算一个任务所需要的物品数量
function getTaskCollectNum()
	local aryTaskNeed = aryNeedItem[equipexTaskState()];
	local nNum = 0;
	local i=0;
	
	for i=1, getn(aryTaskNeed) do
		nNum = nNum + aryTaskNeed[i][8];
	end;
	
	return nNum;
end;


-- 将一个传进来的物品索引转换成一个 STRING 的 KEY，以及返回等级和五行
function TranKey(nIndex)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
CDebug:MessageOut("Ki觤 tra v藅 ph萴 aaa:"..nGenre..","..nDetail..","..nParticular);
local nQuality = GetGlodEqIndex(nIndex);

local strKey = "";

	if nQuality==0 or nQuality<0 then
	
		strKey = tostring(nQuality)..","..
			     tostring(nGenre)..","..
			     tostring(nDetail)..","..
			     tostring(nParticular);
	
	else
		strKey = tostring(nQuality)..","..
			     tostring(0)..","..
			     tostring(0)..","..
			     tostring(0);	
	end;

	return strKey, nLevel, nGoodsFive;

end;


-- 玩家完成一套任务后可随意进行安邦的完美
function ib_nexttask_talk()
	CreateTaskSay({"<dec><npc>Ngi  nh薾 頲 m閠 b� An bang Ho祅 m� nh� v祇 nh鱪g n� l鵦 ng kh輈h l�. N誹 c遪 mu鑞 ti誴 t鬰 ch� t筼, c� th� n t譵 l穙 phu.",
				   "Ta mu鑞 ti誴 t鬰 ch� t筼 An bang ho祅 m� - C骳 hoa th筩h ch� ho祅/#ib_nexttask_main(1)",
				   "Ta mu鑞 ti誴 t鬰 ch� t筼 An bang Ho祅 m� - K� huy誸 th筩h gi韎 ch�/#ib_nexttask_main(2)",
				   "Ta mu鑞 ti誴 t鬰 ch� t筼 An bang Ho祅 m� - B╪g tinh th筩h h筺g li猲/#ib_nexttask_main(3)",
				   "Ta mu鑞 ti誴 t鬰 ch� t筼 An bang Ho祅 m� - 襫 ho祅g th筩h ng鋍 b閕/#ib_nexttask_main(4)",
				   "в ta suy ngh� l筰./OnExit"});	
end;


-- 重新给玩家开始一个任务
function ib_nexttask_main(nSelect)
	if nSelect==1 then main_task_001(); end;
	if nSelect==2 then main_task_002(); end;
	if nSelect==3 then main_task_003(); end;
	if nSelect==4 then main_task_004(); end;
end;


-- 取消任务
function ib_nexttask_cancel()
	SetTask(ID_EQUIPEX_TASK, 4);
	SetTask(ID_EQUIPEX_FINISH, 1);
	Msg2Player("<color=yellow>B筺  h駓 b� l莕 ch� t筼 n祔<color>!");
end;


-- 玩家要还原装备的对话
function ib_nexttask_revert()
	CreateTaskSay({"<dec><npc>V蒼 kh玭g c秏 th蕐 h礽 l遪g sao? Th玦 頲, ta c� th� gi髉 {{Kh玦 ph鬰 nguy猲 tr筺g}} th祅h {{Trang b� An bang ph� th玭g}}, {{Thu閏 t輓h c� th� s� kh竎 ch髏 so v韎 trc y}}. Kh竎h quan n猲 suy ngh� k�!",
				   "Ta mu鑞 kh玦 ph鬰 l筰 An Bang C骳 Hoa Th筩h Ch� Ho祅/#ib_nexttask_revert_talk(1)",
				   "Ta mu鑞 kh玦 ph鬰 l筰 K� Huy誸 Th筩h Gi韎 Ch�/#ib_nexttask_revert_talk(2)",
				   "Ta mu鑞 kh玦 ph鬰 l筰 B╪g Tinh Th筩h H筺g Li猲/#ib_nexttask_revert_talk(3)",
				   "Ta mu鑞 kh玦 ph鬰 l筰 B╪g 襫 Ho祅g Th筩h Ng鋍 B閕/#ib_nexttask_revert_talk(4)",
				   "в ta suy ngh� l筰./OnExit"});
end;

-- 还原的确认过程
function ib_nexttask_revert_talk(nId)
	CreateTaskSay({"<dec><npc>Kh竎h quan th藅 s� mu鑞 kh玦 ph鬰 nguy猲 tr筺g trang b� An bang n祔 sao? Chi ph� l� {{300  v筺 lng}}, c� ng � kh玭g?",
				   "Л頲, ta ng �!/#ib_nexttask_revert_dialog("..nId..")",
				   "в ta suy ngh� l筰./OnExit"});
end;


-- 弹出给予界面
function ib_nexttask_revert_dialog(nId)
	if GetCash()<3000000 then
		CreateTaskSay({"<dec><npc><sex> x竎 nh薾 mang theo  {{300  v筺 lng}} ch�?", "K誸 th骳 i tho筰/OnExit"});
	else
		GiveItemUI("Giao trang b� An bang", "H穣 t"..aryItem[nId][3].." v祇.", "ib_nexttask_revert_main", "OnExit");
	end;	
end;


-- 还原的主过程
function ib_nexttask_revert_main(nCount)
	
	local nIndex = 0;
	local nQuality = 0;
	local nSelect = 0;
	local nResult = 0;
	local nCreateResult = 0;
	local aryCreateIndex = {};
	local i = 0;
	
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>Ta ch� c莕 {{1 m鉵}} {{Trang b� An bang}} Ho祅 m� l�  r錳, h穣 ki觤 tra l筰!",
					   "K誸 th骳 i tho筰/OnExit"});
		return
	end;
	
	nIndex = GetGiveItemUnit(nCount);
	nQuality = GetGlodEqIndex(nIndex);
	
	for i=1, 4 do
		if nQuality==aryItem[i][1] then
			nSelect = i;
			break;
		end;
	end;
	
	if nSelect==0 then
		CreateTaskSay({"<dec><npc>Ta ch� c莕 {{1 m鉵}} {{Trang b� An bang}} Ho祅 m� l�  r錳, h穣 ki觤 tra l筰!",
					   "K誸 th骳 i tho筰/OnExit"});
		return
	end;
	
	-- 开始产生临时装备，看看是否符合
	nCreateResult, aryCreateIndex = createLikeEquip(nIndex, aryItem[nSelect][2], aryItem[nSelect][5], 10);
	
	if nCreateResult>0 then

		-- 先删除原来的黄金装备
		nResult = RemoveItemByIndex(nIndex);
		
		-- 异常处理，删除物品不成功时
		if nResult~=1 then
			CreateTaskSay({"<dec><npc>Th藅 ng ti誧, l莕 n祔 ta th蕋 b筰 r錳, l莕 sau gh� l筰 th� xem sao.",
						   "K誸 th骳 i tho筰/OnExit"});	
			WriteTaskLog("[L鏸 nghi猰 tr鋘g]Kh玦 ph鬰 1 trang b� An bang th蕋 b筰:"..aryItem[nSelect][4]);
			return
		end;
		
		CDebug:MessageOut("Nh薾 頲 tr� s� ch輓h x竎:"..nCreateResult);
		
		AddItemByIndex(nCreateResult);
		
		WriteTaskLog("Kh玦 ph鬰 nguy猲 tr筺g Trang b� An bang th祅h c玭g:"..aryItem[nSelect][4]);
		
		-- 删除生成的临时装备，除了正确的那个
		for i=1, getn(aryCreateIndex) do
			if aryCreateIndex[i]~=nCreateResult then
				RemoveItemByIndex(aryCreateIndex[i]);
			end;
		end;

		CreateTaskSay({"<dec><npc>Cu鑙 c飊g c騨g kh玦 ph鬰 m鉵 {{"..aryItem[nSelect][3].."}} tr� v� nguy猲 tr筺g, kh竎h quan c� th� mang 甶 頲 r錳!",
				       "K誸 th骳 i tho筰/OnExit"});	
		-- 扣钱
		Pay(3000000);
		Msg2Player("B筺  giao cho Th� r蘮 <color=yellow>300 v筺 ti襫 c玭g<color>!");
		       		
	else
		CreateTaskSay({"<dec><npc>Kh玦 ph鬰 nguy猲 tr筺g {{th蕋 b筰 r錳}}, th藅 ng筰 qu�, ta {{ch� nh薾 m閠 n鱝 ti襫 c玭g}} th玦!",
					   "K誸 th骳 i tho筰/OnExit"});	
					   
		-- 删除生成的临时装备
		for i=1, getn(aryCreateIndex) do
			RemoveItemByIndex(aryCreateIndex[i]);
		end;
		
		-- 扣钱
		Pay(1500000);
		Msg2Player("B筺  tr� cho Th� r蘮 <color=yellow>150 v筺 ti襫 c玭g<color>!");

		WriteTaskLog("Kh玦 ph鬰 nguy猲 tr筺g Trang b� An bang th蕋 b筰:"..aryItem[nSelect][4]);		
	end;
	
	return
	
end;


-- 极品安邦完美
function top_equipex_dialog()
	CreateTaskSay({"<dec><npc>Giao trang b� An bang C鵦 ph萴 cho ta, ta s� gi髉 ch� tao th祅h {{Trang b� An bang ho祅 m� c鵦 ph萴}}, d� nhi猲 l� r蕋 kh� kh╪, {{ti襫 c玭g m鏸 l莕"..NUM_PAY_TOPITEMTOPERFECT.."  v筺 lng}}, c� ng � kh玭g?",
				   "T鑤 qu�, h穣 gi髉 ta ch� t筼 th祅h trang b� Ho祅 m�/top_equipex_give",
	               "в ta suy ngh� k� l筰 xem/OnExit"});
end;

function top_equipex_give()
	if GetCash()<NUM_PAY_TOPITEMTOPERFECT*10000 then
		CreateTaskSay({"<dec><npc><sex> c� mang theo   {{"..NUM_PAY_TOPITEMTOPERFECT.."  v筺 lng}} tr猲 ngi ch�?", "K誸 th骳 i tho筰/OnExit"});
	else
		GiveItemUI("Giao trang b� An bang C鵦 ph萴", "Xin h穣 t v祇 Trang b� An bang C鵦 ph萴", "top_equipex_main", "OnExit", 1);
	end;		
end;

function top_equipex_main(nCount)
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>Ta ch� c莕 {{1 m鉵 trang b� An bang C鵦 ph萴}} l�  r錳, h穣 ki觤 tra l筰!",
					   "K誸 th骳 i tho筰/OnExit"});
		return
	end;
	
	local nIndex = GetGiveItemUnit(nCount);
	local nQuality = GetGlodEqIndex(nIndex);
	local nAryIndex = 0;
	local nCheck = 0;
	
	-- 检查这件黄金是否有保质期
	local nExpiredTime = ITEM_GetExpiredTime(nIndex);
	if nExpiredTime > 0 then
		CreateTaskSay({"<dec><npc>Kh竎h quan t v祇 kh玭g ng trang b� ta c莕!",
					   "Ta  giao nh莔 r錳!/OnExit"});
		return
	end;
	
	for i=1, getn(aryTopItem) do
		if aryTopItem[i][2]==nQuality then
			nAryIndex = i;
			nCheck = 1;
			break;
		end;
	end;
	
	if nCheck==0 then
		CreateTaskSay({"<dec><npc>V� <sex> n祔, v藅 ph萴 t v祇 kh玭g ph秈 l� {{Trang b� An bang C鵦 ph萴}}, h穣 ki觤 tra l筰!",
					   "K誸 th骳 i tho筰/OnExit"});		
		return
	end;
	
	Pay(NUM_PAY_TOPITEMTOPERFECT * 10000);
	
	local nItemBindState = GetItemBindState(nIndex)	-- 获取绑定状态
	local nResult = RemoveItemByIndex(nIndex);
	
	if nResult~=1 then return end;

	-- AddItemEx 指令需要将黄金序号 -1
	-- AddGoldItem(0, aryTopItem[nAryIndex][1]);
	local nServerItemIndex = NewItemEx(4, 0, 1, 0, aryTopItem[nAryIndex][1] - 1, 0, 0, 0, 0, 0);	
	
	if nItemBindState~=0 then
		SetItemBindState(nServerItemIndex, nItemBindState)
	end;
	
	AddItemByIndex(nServerItemIndex);
	
	Msg2Player("B筺  giao cho Th� r蘮 <color=yellow>"..NUM_PAY_TOPITEMTOPERFECT.." v筺 ti襫 c玭g<color>!");
	Msg2Player("Ch� t筼 th祅h c玭g: <color=yellow>"..aryTopItem[nAryIndex][3].."<color>!");
	
	WriteTaskLog("Ch� t筼 th祅h c玭g:"..aryTopItem[nAryIndex][3]);
end;


-- 极品完美安邦还原
function top_revert_dialog()
	CreateTaskSay({"<dec><npc>V蒼 kh玭g c秏 th蕐 h礽 l遪g v韎 {{Trang b� An bang ho祅 m� [C鵦 ph萴]}} sao? Th玦 頲, ta c� th� gi髉 {{Kh玦 ph鬰 nguy猲 tr筺g}} th祅h {{Trang b� An bang C鵦 ph萴}}, {{Thu閏 t輓h ho祅 to祅 gi鑞g trc y}}. {{Chi ph� l�"..NUM_PAY_PERFECTITEM_REVERT.."  v筺 lng}}, c� ng � kh玭g?",
				   "T鑤 qu�, h穣 gi髉 ta ch� t筼 th祅h trang b� Ho祅 m�/top_revert_give",
	               "в ta suy ngh� k� l筰 xem/OnExit"});	
end;


function top_revert_give()
	if GetCash()<NUM_PAY_PERFECTITEM_REVERT*10000 then
		CreateTaskSay({"<dec><npc><sex> c� mang theo   {{"..NUM_PAY_PERFECTITEM_REVERT.."  v筺 lng}} tr猲 ngi ch�?", "K誸 th骳 i tho筰/OnExit"});
	else
		GiveItemUI("Giao Trang b� An bang Ho祅 m� [C鵦 ph萴]", "Xn h穣 t v祇 Trang b� An bang Ho祅 m� [C鵦 ph萴]", "top_revert_main", "OnExit", 1);
	end;		
	
end;


function top_revert_main(nCount)
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>Ta ch� c莕 {{1 m鉵 Trang b� An bang Ho祅 m� [C鵦 ph萴]}} l�  r錳, h穣 ki觤 tra l筰!",
					   "K誸 th骳 i tho筰/OnExit"});
		return
	end;
	
	local nIndex = GetGiveItemUnit(nCount);
	local nQuality = GetGlodEqIndex(nIndex);
	local nAryIndex = 0;
	local nCheck = 0;
	
	CDebug:MessageOut("M� Trang b� An bang ho祅 m� c鵦 ph萴 l�:"..nQuality);
	
	for i=1, getn(aryTopItem) do
		if aryTopItem[i][1]==nQuality then
			nAryIndex = i;
			nCheck = 1;
			break;
		end;
	end;
	
	if nCheck==0 then
		CreateTaskSay({"<dec><npc>V� <sex> n祔, v藅 ph萴 t v祇 kh玭g ph秈 l� {{Trang b� An bang Ho祅 m� [C鵦 ph萴]}}, h穣 ki觤 tra l筰!",
					   "K誸 th骳 i tho筰/OnExit"});		
		return
	end;
	
	Pay(NUM_PAY_PERFECTITEM_REVERT * 10000);
	
	local nItemBindState = GetItemBindState(nIndex)	-- 获取绑定状态
	local nResult = RemoveItemByIndex(nIndex);
	
	if nResult~=1 then return end;
	
	-- AddGoldItem(0, aryTopItem[nAryIndex][2]);
	local nServerItemIndex = NewItemEx(4, 0, 1, 0, aryTopItem[nAryIndex][2] - 1, 0, 0, 0, 0, 0);	
	
	if nItemBindState~=0 then
		SetItemBindState(nServerItemIndex, nItemBindState)
	end;
	
	AddItemByIndex(nServerItemIndex);
		
	Msg2Player("B筺  giao cho Th� r蘮 <color=yellow>"..NUM_PAY_PERFECTITEM_REVERT.." v筺 ti襫 c玭g<color>!");
	Msg2Player("Kh玭g ph鬰 nguy猲 tr筺g th祅h c玭g: <color=yellow>"..aryTopItem[nAryIndex][4].."<color>!");
	
	WriteTaskLog("Kh玭g ph鬰 nguy猲 tr筺g th祅h c玭g:"..aryTopItem[nAryIndex][4]);		
end;


function OnExit()
	
end;