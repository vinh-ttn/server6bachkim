-- 2005中秋节活动 花灯NPC脚本 by wangbin 2005-09-02

IncludeLib("FILESYS")
Include("\\script\\event\\mid_autumn\\oddsaward.lua")
Include("\\script\\event\\mid_autumn\\create_lanterns.lua")
Include("\\script\\tong\\tong_award_head.lua");

LANTERN_TSKID_DATE = 1604;
LANTERN_TSKID_WCNT = 1605;
MX_LANTERN_COUNT = 100;
LANTERN_FILE = "\\settings\\event\\zhongqiuhuodong\\zhongqiudengmi.txt"

function main()
	local npcidx = GetLastDiagNpc()
	if (GetNpcParam(npcidx, 4) == 0 ) then
		return
	end
	
	local nDay = tonumber(date("%m%d"))
	if ( GetTask(LANTERN_TSKID_DATE) ~= nDay ) then
		SetTask(LANTERN_TSKID_DATE, nDay)
		SetTask(LANTERN_TSKID_WCNT, 0)
	end
	
	if ( GetTask(LANTERN_TSKID_WCNT) >= MX_LANTERN_COUNT ) then
		Say("<#> B筺  畂竛 ng 100 c﹗  r錳! Nhng c� h閕 cho ngi kh竎 甶!", 0)
		return
	end
	local rannum = random(100)
	if ( rannum <= 1 ) then
		AddItem(6, 1, 900, 1, 0, 0, 0)		--<#>“火漆密函”
		local str = "<#> Xem c﹗  ti誴 theo /#show_riddle (0, '<#> c﹗  nh� sau: <enter>') "
		Say("<#> B筺 ch╩ ch� xem, cu鑙 c飊g ph竧 hi謓 tr猲 ng鋘 n gi蕌 m閠 m秐h gi蕐, k� thu藅 r蕋 tinh vi", 1, str)
		Msg2Player("<#> B筺 nh薾 頲 'H醓 t蕋 M藅 H祄'")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account:"..GetAccount()..",Name:"..GetName()..",in the mid_autumn get shenzhaoyuan shougao.")
	else
		show_riddle(0, "<#> c﹗  nh� sau: <enter>" )
	end
	SetNpcParam(npcidx,4,0)
	delnpcsafe(npcidx)	--delete npc
end

function delnpcsafe(nNpcIndex)
	if (nNpcIndex <= 0 )  then
		return
	end
	
	PIdx = NpcIdx2PIdx(nNpcIndex);
	if (PIdx > 0) then 
		WriteLog("ERROR!!!DelNpc WANT TO DELETE Player");
		return
	end;
	
	DelNpc(nNpcIndex)
	local mapid = SubWorldIdx2ID(SubWorld)
	for i = 1, getn( tbLANTERNS_NPC ) do
		if ( tbLANTERNS_NPC[i][1] == mapid ) then
			SetGlbValue( tbLANTERNS_NPC[i][2], (GetGlbValue( tbLANTERNS_NPC[i][2] ) - 1) )
			break
		end
	end
end;

-- 显示灯谜对话
tbl_answer_index = {
	['A'] = 1,
	['B'] = 2,
	['C'] = 3,
	['D'] = 4,
	['a'] = 1,
	['b'] = 2,
	['c'] = 3,
	['d'] = 4,
};

tbl_answer_order = {
	"A",
	"B",
	"C",
	"D",
};

-- 概率
tbl_odds = {
	15,
	15,
	15,
	27.639,
	5,
	15,
	5,
	1.5,
	0.3,
	0.05,
	0.05,
	0.05,
	0.2,
	0.05,
	0.01,
	0.001,
	0.02,
	0.02,
	0.02,
	0.02,
	0.02,
	0.01,
	0.01,
	0.01,
	0.01,
	0.01,
};


-- 奖励
tbl_awards = {
	{5, nil},
	{10, nil},
	{15, nil},
	{30, nil},
	{50, nil},
	{0, {"<#> 1 Ti猲 Th秓 l� ", 6, 1, 71, 0}},
	{0, {"<#> 1 Ph骳 Duy猲 l� (ti觰) ", 6, 1, 122, 0}},
	{0, {"<#> 1 Ph骳 Duy猲 l� (trung) ", 6, 1, 123, 0}},
	{0, {"<#> 1 Ph骳 Duy猲 l� (i) ", 6, 1, 124, 0}},
	{0, {"<#> 1 Lam Th駓 Tinh", 238}},
	{0, {"<#> 1 L鬰 Th駓 Tinh", 240}},		
	{0, {"<#> 1 T� Th駓 Tinh", 239}},
	{0, {"<#> 1 Huy襫 Tinh Kho竛g Th筩h c蕄 4", 6,1,147,4}},
	{0, {"<#> 1 Huy襫 Tinh Kho竛g Th筩h c蕄 5", 6,1,147,5}},
	{0, {"<#> 1 Huy襫 Tinh Kho竛g Th筩h c蕄 6", 6,1,147,6}},
	{0, {"<#> 1 Th莕 B� Kho竛g th筩h", 6, 1, 398, 0}},
	{0, {"<#> M閠 b� Gi竛g Sa B祇 6 thu閏 t輓h (Kim) ", 2,0,2,3,10,0,1,-1}},
	{0, {"<#> M閠 b� Gi竛g Sa B祇 6 thu閏 t輓h (M閏) ", 2,0,2,3,10,1,1,-1}},
	{0, {"<#> M閠 b� Gi竛g Sa B祇 6 thu閏 t輓h (Th駓) ", 2,0,2,3,10,2,1,-1}},
	{0, {"<#> M閠 b� Gi竛g Sa B祇 6 thu閏 t輓h (H醓) ", 2,0,2,3,10,3,1,-1}},
	{0, {"<#> M閠 b� Gi竛g Sa B祇 6 thu閏 t輓h (Th�) ", 2,0,2,3,10,4,1,-1}},
	{0, {"<#> M閠 b� C鱱 V� B筩h H� 6 thu閏 t輓h (Kim) ", 2,0,2,9,10,0,1,-1}},
	{0, {"<#> M閠 b� C鱱 V� B筩h H� 6 thu閏 t輓h (M閏) ", 2,0,2,9,10,1,1,-1}},
	{0, {"<#> M閠 b� C鱱 V� B筩h H� 6 thu閏 t輓h (Th駓) ", 2,0,2,9,10,2,1,-1}},
	{0, {"<#> M閠 b� C鱱 V� B筩h H� 6 thu閏 t輓h (H醓) ", 2,0,2,9,10,3,1,-1}},
	{0, {"<#> M閠 b� C鱱 V� B筩h H� 6 thu閏 t輓h (Th�) ", 2,0,2,9,10,4,1,-1}},
};

-- 发奖
function issue(items)
local szLog = date("%y-%m-%d,%H:%M,").."Account:"..GetAccount()..",Name:"..GetName()..",in the mid_autumn "
	if (items[1] ~= 0) then
		local exp = items[1] * 10000
		AddOwnExp(exp)
		Msg2Player("<#> B筺 nh薾 頲 " .. exp .. "甶觤 kinh nghi謒.");
		szLog = szLog.."get "..exp.." point experience;"
	end
	local attrs = items[2]
	if (attrs ~= nil) then
		local count = getn(attrs)
		if (count == 2) then
			AddEventItem(attrs[2])
		elseif (count == 5) then
			AddItem(attrs[2], attrs[3], attrs[4], attrs[5], 0, 0, 0)
		elseif (count == 9) then
			AddQualityItem(attrs[2], attrs[3], attrs[4], attrs[5], attrs[6], attrs[7], attrs[8], attrs[9])
		end
		Msg2Player("<#> B筺 nh薾 頲 " .. attrs[1] .. "!");
		szLog = szLog.."get "..attrs[1]..";"
	end
	WriteLog(szLog)
end

g_count = 0
-- 显示灯谜问题
function show_riddle(count, caption)
--	print(format("g_count:%d", g_count))
	g_count = g_count + 1
	file = LANTERN_FILE
	TabFile_Load(file, file)
	local row_count = TabFile_GetRowCount(file) - 1
	if (row_count > 1) then
		local row = random(2, row_count)
		local answer = TabFile_GetCell(file, row, 2)
		local question = format("%s%s", caption, TabFile_GetCell(file, row, 3))
		local options = {}
		local tbi = {}
		
		for i = 1, 4 do
			options[i] = TabFile_GetCell(file, row, 3 + i)
			if (tbl_answer_index[answer] == i) then
				options[i] = format("%s/#answer_ok(%d)", options[i], count)
			else
				options[i] = format("%s/answer_fail", options[i])
			end
		end
		ReSort(options)
		Say(question, 5, options[1], options[2], options[3], options[4], "<#> H駓 b� /answer_cancel")
	end
end

function ReSort(options)
	local count = getn(options)
	for i = 1, count do
		j = random(1, count)
		local tmp = options[i]
		options[i] = options[j]
		options[j] = tmp  
	end
	
	for i = 1, count do
		options[i] = format("%s. %s", tbl_answer_order[i], options[i])
	end
end

-- 灯谜回答正确
function answer_ok(count)
	tongaward_riddle()
	-- print(format("answer_ok(%d)", count))
	if (count >= 2) then
		-- 发奖
		local index = get_odds_award(tbl_odds, 100)
		if (index >= 1) then
			issue(tbl_awards[index])
			Talk(1, "", "<#> Ch骳 m鮪g b筺  p ng li猲 t鬰 3 c﹗! Xin nh薾 ph莕 thng.")
			SetTask(LANTERN_TSKID_WCNT, GetTask(LANTERN_TSKID_WCNT) + 1)
		end
	else
		show_riddle(count + 1, "<#> b筺  p ng. H穣 ti誴 t鬰.<enter>")
	end
end

-- 灯谜回答错误
function answer_fail()
	show_riddle(0, "<#> b筺  p sai. H穣 ti誴 t鬰.<enter>")
end

-- 取消灯谜问答 
function answer_cancel()
	-- nothing
end
