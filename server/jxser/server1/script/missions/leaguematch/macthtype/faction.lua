Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============门派单项赛相关数据===============

if (not tmp_process_data) then
	return
end

--全部门派单项赛相关数据
local nTmpLadderBase	= 10201
WLLS_DATA = {
	
	name = "Danh s竎h m玭 ph竔 thi u",
	
	--地图信息
	match_type = {
		{
			name = "Thi誹 L﹎",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = "Thi猲 Vng",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = "Л阯g M玭",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = "Ng� чc",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = "Nga Mi",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = "Th髖 Y猲",
			level = 1,
			ladder = nTmpLadderBase + 5,
			map = {{406, 565, 407, ""}},
		},
		{
			name = "C竔 Bang",
			level = 1,
			ladder = nTmpLadderBase + 6,
			map = {{408, 566, 409, ""}},
		},
		{
			name = "Thi猲 Nh蒼",
			level = 1,
			ladder = nTmpLadderBase + 7,
			map = {{410, 567, 411, ""}},
		},
		{
			name = "V� ng",
			level = 1,
			ladder = nTmpLadderBase + 8,
			map = {{412, 568, 413, ""}},
		},
		{
			name = "C玭 L玭",
			level = 1,
			ladder = nTmpLadderBase + 9,
			map = {{414, 569, 415, ""}},
		},
		{
			name = "Thi誹 L﹎",
			level = 2,
			ladder = nTmpLadderBase + 10,
			map = {{540, 570, 541, ""}},
		},
		{
			name = "Thi猲 Vng",
			level = 2,
			ladder = nTmpLadderBase + 11,
			map = {{542, 571, 543, ""}},
		},
		{
			name = "Л阯g M玭",
			level = 2,
			ladder = nTmpLadderBase + 12,
			map = {{544, 572, 545, ""}},
		},
		{
			name = "Ng� чc",
			level = 2,
			ladder = nTmpLadderBase + 13,
			map = {{546, 573, 547, ""}},
		},
		{
			name = "Nga Mi",
			level = 2,
			ladder = nTmpLadderBase + 14,
			map = {{548, 574, 549, ""}},
		},
		{
			name = "Th髖 Y猲",
			level = 2,
			ladder = nTmpLadderBase + 15,
			map = {{550, 575, 551, ""}},
		},
		{
			name = "C竔 Bang",
			level = 2,
			ladder = nTmpLadderBase + 16,
			map = {{552, 576, 553, ""}},
		},
		{
			name = "Thi猲 Nh蒼",
			level = 2,
			ladder = nTmpLadderBase + 17,
			map = {{554, 577, 555, ""}},
		},
		{
			name = "V� ng",
			level = 2,
			ladder = nTmpLadderBase + 18,
			map = {{556, 578, 557, ""}},
		},
		{
			name = "C玭 L玭",
			level = 2,
			ladder = nTmpLadderBase + 19,
			map = {{558, 579, 559, ""}},
		},
	},
	
	award_rank = {
		{	--排行奖励，新秀
			{1, 1500},	--第1名
			{2, 1000},	--第2名
			{3, 800},	--第3名
			{4, 600},	--第4名
			{8, 400},	--第5-8名
			{16, 300},	--第9-16名
			{32, 250},	--第17-32名
			{64, 200},	--第33-64名
			{128, 150},	--第65-128名
		}, {	--联赛
			{1, 3000},	--第1名
			{2, 2000},	--第2名
			{3, 1600},	--第3名
			{4, 1200},	--第4名
			{8, 800},	--第5-8名
			{16, 600},	--第9-16名
			{32, 500},	--第17-32名
			{64, 400},	--第33-64名
			{128, 300},	--第65-128名
		}
	},
	
	max_member = 1,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"V� l﹎ li猲 u ki謙 xu蕋 l莕 n祔 l� M玭 ph竔 n u, ch鋘 ra  ngi xu蕋 s綾 nh蕋 trong m鏸 m玭 ph竔",
		"V� l﹎ li猲 u ki謙 xu蕋 l莕 n祔 l� M玭 ph竔 n u, ch鋘 ra  ngi xu蕋 s綾 nh蕋 trong m鏸 m玭 ph竔",
	},
	
	--====Functions====
	--返回当前角色可以参加的比赛类型，nil为不能参赛
	player_type = function()
		local n_level = wlls_player_level()
		if (n_level <= 0) then
			return nil
		end
		local n_fact = GetLastFactionNumber() + 1
		if (n_fact <= 0) then
			wlls_descript("<enter>  Зy l� cu閏 thi gi鱝 c竎 m玭 ph竔, ngi kh玭g m玭 kh玭g ph竔 kh玭g 頲 tham gia.")
			return nil
		end
		return (n_level - 1) * 10 + n_fact
	end,
	
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  L莕 n祔"..str_des.."v� <color=red>n u m玭 ph竔<color>, n誹 b筺 l莕 u tham gia thi u, h� th鑞g s� l藀 cho b筺 m閠 chi課 i.")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>Chi課 i c馻 b筺 hi謓 l�:<color=yellow>"..str_lgname.."<color><enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>Ch� �: H筺 ch� thi u m颽 sau l� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n誹 mu鑞 thi u m颽 sau, xin h穣 l藀 chi課 i m韎.<color><enter>"
		end
		local tb_option = {}
		str = str.."<enter>   Trong th阨 gian <color=red>t筸 ngh�<color> ho芻 <color=red>ch璦 tham gia thi u m颽 trc<color>, b筺 c� th� r阨 chi課 i, chi課 i s� t� ng gi秈 t竛<color>."
		tb_option[getn(tb_option)+1] = "R阨 kh醝 i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem chi課 t輈h c馻 i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� ti謓 gh� qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(2,WLLS_DATA)
