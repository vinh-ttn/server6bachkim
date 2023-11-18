
-- ====================== 文件信息 ======================

-- 剑侠情缘online 野叟召唤道具 ——— 女儿红
-- Edited by peres
-- 2006/12/26 PM 15:39

-- 嫣师姐为我穿上衣服时突然笑着说道，妹妹出落得越来越水灵了。
-- 不懂这仙女般的玉体以后会托付给哪个男人呢。
-- 女子长大以后一定会将身子托付给男人吗？我的脸微微涨红了一下。
-- 嫣师姐弯下腰帮我把裙带束好，她说，是的。
-- 因为，这是女子一生的宿命。

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

Include("\\script\\global\\forbidmap.lua");

function main()

	local subworld, x, y = GetWorldPos();
	local mapindex = SubWorldID2Idx(subworld);
	local mapname = SubWorldName(mapindex);	
		
	-- 非战斗状态不能使用
	if GetFightState()==0 then
		Say("V藅 ph萴 n祔 ch� c� th� s� d鬾g � c竎 khu v鵦 luy謓 c玭g v� chi課 u!", 0);
		return 1;
	end;
	
	if CheckAllMaps(subworld)==1 then
		Say("V藅 ph萴 n祔 ch� c� th� s� d鬾g � c竎 khu v鵦 luy謓 c玭g v� chi課 u!", 0);
		return 1;
	end;
	
	-- 野叟的类型，1为普通的，2为较强的
	local nBossType = random(1,2);	
	
	-- 野叟的头衔
	local aryBossTitle = {
		[1] = {"ngh� ng琲",
			   "l� ng",
			   "li bi課g",},
			   
		[2] = {"ph蒼 n�",
			   "hung 竎",
			   "linh ho箃",},	
	}
	
	local nBossIndex  = {
			[1]=1237,
			[2]=1238,
		}

	local nNpcIndex	 = AddNpcEx(nBossIndex[nBossType],
					95,
					random(0,4),
					mapindex,
					x*32, -- 计算 X 偏移
					y*32, -- 计算 Y 偏移
					1,
					" ("..aryBossTitle[nBossType][random(1,getn(aryBossTitle[nBossType]))]..") D� T萿",
					1);
		
		SetNpcScript(nNpcIndex, "\\script\\global\\seasonnpc_death.lua");
		
		Msg2SubWorld("Ngi ch琲 <color=yellow>"..GetName().."<color> 產ng <color=green>"..mapname.."<color> c飊g D� T萿 thao luy謓 v� ngh�!");
		
		return 0;
end;

