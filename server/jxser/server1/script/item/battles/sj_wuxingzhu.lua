-- 宋金道具五行柱
-- 分 火柱、冰柱、毒柱、雷柱

Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine(nItemIdx)	-- 通过判断战场的等级和玩家的阵营来加NPC
	if (GetFightState() == 0) then
		Say("Kh玭g th� s� d鬾g � tr筺g th竔 phi chi課 u!", 0)
		return -1
	end;
	tbPK_MAP = {357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374} -- 单挑地图禁止使用号角
	for j = 1, getn(tbPK_MAP) do
		if ( nMapId == tbPK_MAP[j] ) then
			Msg2Player("Trong khu v鵦 n u kh玭g th� s� d鬾g v藅 ph萴 n祔!");
			return -1
		end
	end

	for j = 1, getn(tbCD_MAP) do
		if ( nMapId == tbCD_MAP[j] ) then
			Msg2Player("V藅 ph萴 n祔 ch� c� th� s� d鬾g � Chi課 trng T鑞g Kim");
			return -1
		end
	end
	
	local szNpcName = "";
	local n_player_camp = GetCurCamp();
	
	if (n_player_camp == 1) then
		if (GetMissionV(MS_WUXINGZHUCNT_S) >= MAX_CALLWUXINGZHU) then
			Msg2Player("S� tr� hi謓 c� � chi課 trng  t gi韎 h筺, kh玭g th� s� d鬾g n鱝.")
			return -1
		else
			SetMissionV(MS_WUXINGZHUCNT_S, GetMissionV(MS_WUXINGZHUCNT_S) + 1)
			szNpcName = "Phe T鑞g - 	";
		end
	elseif (n_player_camp == 2) then
		if (GetMissionV(MS_WUXINGZHUCNT_J) >= MAX_CALLWUXINGZHU) then
			Msg2Player("S� tr� hi謓 c� � chi課 trng  t gi韎 h筺, kh玭g th� s� d鬾g n鱝.")
			return -1
		else
			SetMissionV(MS_WUXINGZHUCNT_J, GetMissionV(MS_WUXINGZHUCNT_J) + 1)
			szNpcName = "Phe Kim -	";
		end
	end
	
	local n_level = check_pl_level(GetLevel);
	local _, _, n_part = GetItemProp(nItemIdx);
	local tb_npc_level = {50, 70, 90};
	local tb_npc_id = {	[1768] = {id = 1343, szname="H醓 Tr�"},
						[1769] = {id = 1344, szname="B╪g Tr�"},
						[1770] = {id = 1345, szname="чc Tr�"},
						[1771] = {id = 1346, szname="L玦 Tr�"},
						[1772] = {id = 1347, szname="Kim Tr�"},
						};
	
	if (not n_level or not tb_npc_id[n_part]) then	--不存在的宋金等级 或者 道具无法和召唤NPC对应
		return -1;
	end
	
	local n_npcidex = AddNpc( tb_npc_id[n_part].id, tb_npc_level[n_level], SubWorldID2Idx(W), (X - 3) * 32, Y * 32, 1, szNpcName..tb_npc_id[n_part].szname, 0);
	SetNpcCurCamp(n_npcidex, n_player_camp);
	
end	

