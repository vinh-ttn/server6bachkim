-- 剑侠情缘online 2007 元旦活动头文件

if (not __H_NEWYEAR_2007__) then
	__H_NEWYEAR_2007__ = 1;
Include([[\script\lib\pay.lua]]);

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 读入 2006 元旦活动头文件
Include("\\script\\event\\newyear_2006\\newyear_head.lua");

-- 随机任务的处理支持
Include("\\script\\task\\random\\task_head.lua");
Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数
--TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- 升级所需的经验表

ID_GETTASKBOOK_DATE_NY07  		 = 1789;  -- 领取任务卷轴的日期
ID_MOREEXP_ONLINETIME_NY07        = 1790;  -- 储存玩家在线时间
ID_MOREEXP_DATE_NY07              = 1791;  -- 记录玩家上次领取经验的日期
ID_MEDAL_DATE_NY07              = 1792;  -- 记录玩家上次领取荣誉令的日期


-- 判断是否元旦日期的主函数
function ny07_isactive()
	local nDate  = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070101 and nDate <= 20070103) then
		return 1;
	end;
	return 0;
end;

-- 新年活动入口
function ny07_entrance()
	if (IsCharged() == 0) then
		Say("只有<color=red>充卡玩家<color>才能参加新年活动。", 0);
		return
	end;
	Say("当今武林，人杰辈出，各大门派砺精图强。当此乱世，各位仍为武林盟尽心竭力。恰逢佳节，独孤盟主特为各位侠士侠女送上节日贺礼，祝合家安康，万事如意！", 4,
	"Nh薾 ph莕 thng 甶觤 kinh nghi謒 m鏸 ng祔/ny07_getexp",
	"Nh薾 m藅 t辌h nhi謒 v� m鏸 ng祔/ny07_getTaskBook",
	"领取每日的荣誉令牌/ny07_getmedal",
	"R阨 kh醝/no"
	);
end;


ny07_tab_medal = {
{"L謓h b礽 vinh d� Ho祅g Kim",	1	,1254	},
{"L謓h b礽 vinh d� B筩h Ng﹏",	10	,1255	},
{"L謓h b礽 vinh d� Thanh ng",	30	,1256	},
{"L謓h b礽 vinh d�",	259	,1294	},
{"L謓h b礽 vinh d� H祅 thi誸",	700	,1257	},
};
function ny07_getmedal()
	if (GetLevel() < 120) then
		Say("<color=yellow>120级<color>以上的玩家才能领取武林武林荣誉令。", 0);
		return
	end;
	
	if (ny07_isactive()==0) then
		Say("Gi�  h誸 Nguy猲 Цn r錳!", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 1) then
		Say("你的背包空间不够，请清理背包。", 0);
		return
	end;
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate == GetTask(ID_MEDAL_DATE_NY07)) then
		Say("你今天已经领取过了，不能再领取了。", 0);
		return
	end;
	
	local nSeed = random(1, 1000);
	local nSum = 0;
	for i = 1, getn(ny07_tab_medal) do
		nSum = nSum + ny07_tab_medal[i][2];
		if (nSeed <= nSum) then
			SetTask(ID_MEDAL_DATE_NY07, nDate);
			local nidx = AddItem(6, 1, ny07_tab_medal[i][3], 1, 0, 0, 0);
			SetSpecItemParam(nidx, 1, 20070131);
			SetSpecItemParam(nidx, 2, 2007);
			SetSpecItemParam(nidx, 3, 1);
			SetSpecItemParam(nidx, 4, 31);
			SyncItem(nidx);
			local str = "B筺 nh薾 頲 <color=yellow>"..ny07_tab_medal[i][1].."<color>，该令牌的有效时间截至<color=yellow>2007年1月31日<color>。"
			Msg2Player(str);
			Say(str, 0);
			break;
		end;
	end;
end;

-- 判断玩家是否能获取赠送的经验
function ny07_canGetMoreExp()
	local nTime       = GetGameTime();
	local nLateTime   = GetTask(ID_MOREEXP_ONLINETIME_NY07);
	local nDate       = tonumber(GetLocalDate("%Y%m%d"));
	local nLateDate   = GetTask(ID_MOREEXP_DATE_NY07);
	
	if (nLateDate == 0) then
		return 1;
	end;

	if ((nTime - nLateTime >= 60*60) and (nDate~=nLateDate)) then
		return 1;
	end;
	return 0;
end;

-- 有等级限制的增加玩家经验，如果 nLimitLevel 为 0 则不限制
function ny07_addPlayerExpForLimit(myExpValue, nLimitLevel)
	tl_addPlayerExpForLimit	(myExpValue, nLimitLevel);
end;


-- 询问玩家是否领取经验
function ny07_getexp()
	Say("Trong kho秐g th阨 gian t� <color=yellow>20-12-2005 n 01-01-2006<color>, m鏸 ng祔 l猲 m筺g u nh薾 頲 甶觤 kinh nghi謒 do V� l﹎ minh ch� t苙g.<color=yellow>Trong v遪g 3 ng祔 n祔 c� th� nh薾 1 l莕 <color>, nh璶g 2 l莕 nh薾 ph秈 c竎h nhau <color=yellow>tr猲 m閠 gi� tr猲 m筺g<color>. Ngi ng � nh薾 kh玭g?",2,
		"Л頲 r錳! Ta mu鑞 nh薾 l穘h!/ny07_getexp_next",
		"Th玦  l竧 甶/no"
	);
end;

ny07_aryExp = {
5000000,
10000000, 
15000000, 
};
-- 领取每日的经验
function ny07_getexp_next()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local nIndex = tonumber(mod(nDate, 10));
	if (nIndex > 3 or nIndex < 1) then
		return
	end;
	local nExp = ny07_aryExp[nIndex];
	-- 如果日期不对，直接返回
	if ny07_isactive()==0 then
		Say("Gi�  h誸 Nguy猲 Цn r錳!", 0);
		return
	end;
	
	if (ny07_canGetMoreExp()==1) then
		if GetLevel()<50 then
			ny07_addPlayerExpForLimit(nExp, 5); -- 限制只能升 5 级
		else
			ny07_addPlayerExpForLimit(nExp, 0); -- 不限制
		end;
		Msg2Player("B筺 nh薾 頲 ph莕 thng trong ho箃 ng Nguy猲 Цn:<color=yellow>"..nExp.."<color> 甶觤 kinh nghi謒!");
		
		-- 记录领取经验的相关数据
		local nTime       = GetGameTime();
		SetTask(ID_MOREEXP_ONLINETIME_NY07, nTime);
		SetTask(ID_MOREEXP_DATE_NY07, nDate);
		WriteTaskLog("nh薾 頲 ph莕 thng 甶觤 kinh nghi謒 m鏸 ng祔:"..nExp);
	else
		Say("你现在的条件不能够领取每日的经验，在1月1日至1月3日期间，每日上线都会获得独孤盟主赠送的大批经验。<color=yellow>这三天之内每天能领一次<color>，但两次领取经验之间相隔需要<color=yellow>在线超过1小时<color>哦！", 0);
		return
	end;
end;


-- 任务系统的写入 LOG 过程
function WriteTaskLog(strMain)
	if strMain==nil then return end;	-- 如果是空值则不写入
	WriteLog("[2007年元旦活动]"..date(" [%y n╩ %m th竛g %d ng祔  %H gi� %M ph髏]").." [m藅 m�:"..GetAccount().."] [nh﹏ v藅:"..GetName().."]"..strMain);
end;

-- 得到任务卷轴
function ny07_getTaskBook()
	local nRandomTaskID, nRandomItemIndex = 0, 0;
	local nDate  = tonumber(GetLocalDate("%Y%m%d"));
	-- 如果日期不对，直接返回
	if ny07_isactive()==0 then
		Say("Gi�  h誸 Nguy猲 Цn r錳!", 0);
		return
	end;
	
	-- 如果等级未达到 80 级
	if GetLevel()<80 then
		Say("Ch� c� ngi ch琲 t� c蕄 80 tr� l猲 m韎 c� th� nh薾 頲 m藅 t辌h nhi謒 v� n祔!", 0);
		return
	end;
	
	if (GetTask(ID_GETTASKBOOK_DATE_NY07) == nDate) then
		Say("H玬 nay b筺  nh薾 m閠 m藅 t辌h nhi謒 v� r錳!", 0);
		return
	end;

	-- 设置任务变量
	SetTask(ID_GETTASKBOOK_DATE_NY07, nDate);
	
	-- 生成一个任务卷轴
	nRandomTaskID = TaskNo(selectNextTask());
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	SyncItem(nRandomItemIndex);		-- 同步物品魔法属性
	Msg2Player("B筺 nh薾 琧 <color=green>nhi謒 v� ng蓇 nhi猲!<color>");
	WriteTaskLog("Nh薾 頲 1 m藅 t辌h nhi謒 v�, m� s� l�:"..nRandomTaskID);
end;


function no()

end;
end;	--	__H_NEWYEAR_2007__