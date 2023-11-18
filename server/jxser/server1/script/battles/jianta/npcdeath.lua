--Npc死亡脚本
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\jianta\\head.lua")
Include("\\script\\battles\\jianta\\mission.lua")

ITEM_DROPRATE_TABLE = { 
						{ { 6,1,156,1,0,0 }, { 0.0000,0.0200,0.0300,0.0400,0.0500,0.0600 } },	-- 战鼓
						{ { 6,1,157,1,0,0 }, { 0.0000,0.0200,0.0300,0.0400,0.0500,0.0600 } },	-- 令旗
						{ { 6,1,158,1,0,0 }, { 0.0000,0.0200,0.0300,0.0400,0.0500,0.0600 } },	-- 号角
						{ { 6,1,160,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 金之战魂
						{ { 6,1,161,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 木之战魂
						{ { 6,1,162,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 水之战魂
						{ { 6,1,163,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 火之战魂
						{ { 6,1,164,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 土之战魂
						{ { 6,1,165,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 金之护甲
						{ { 6,1,166,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 木之护甲
						{ { 6,1,167,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 水之护甲
						{ { 6,1,168,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 火之护甲
						{ { 6,1,169,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 土之护甲
						{ { 6,1,170,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 金之利刃
						{ { 6,1,171,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 木之利刃
						{ { 6,1,172,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 水之利刃
						{ { 6,1,173,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 火之利刃
						{ { 6,1,174,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 土之利刃
						{ { 6,1,175,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 行军丹
						{ { 6,1,176,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 小还丹
						{ { 6,1,177,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 五花露
						{ { 6,1,178,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用外普丸
						{ { 6,1,179,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用外毒丸
						{ { 6,1,180,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用外冰丸
						{ { 6,1,181,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用内普丸
						{ { 6,1,182,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用内毒丸
						{ { 6,1,183,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用内冰丸
						{ { 6,1,184,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用内火丸
						{ { 6,1,185,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用内电丸
						{ { 6,1,186,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用长命丸
						{ { 6,1,187,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用加跑丸
						{ { 6,1,188,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用高闪丸
						{ { 6,1,189,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用高中丸
						{ { 6,1,190,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用飞速丸
						{ { 6,1,191,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用普防丸
						{ { 6,1,192,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用冰防丸
						{ { 6,1,193,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用雷防丸
						{ { 6,1,194,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用火防丸
						{ { 6,1,195,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 宋金专用毒防丸
						{ { 6,1,207,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 疾风之靴	
						{ { 6,1,209,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 白驹护腕	
						{ { 6,1,210,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	-- 后羿之眼	
						{ { 6,1,211,1,0,0 }, { 0.0000,0.0200,0.0130,0.0160,0.0140,0.0120 } },	-- 问号
						{ { 6,1,208,1,0,0 }, { 0.0000,0.0200,0.0180,0.0160,0.0140,0.0120 } },	--三清之气
						{ { 6,1,212,1,0,0 }, { 0.0000,0.0200,0.0150,0.0200,0.0200,0.0200 } },	--信鸽
						{ { 6,1,214,1,0,0 }, { 0.0000,0.0200,0.0300,0.0200,0.0200,0.0200 } },	--抗弹之角
						{ { 6,1,393,1,0,0 }, { 0.0000,0.0160,0.0264,0.0368,0.0472,0.0576 } },	--穿心令
						{ { 6,1,394,1,0,0 }, { 0.0000,0.0160,0.0264,0.0368,0.0472,0.0576 } },	--毒刺令
						{ { 6,1,395,1,0,0 }, { 0.0000,0.0160,0.0264,0.0368,0.0472,0.0576 } },	--寒冰令
						{ { 6,1,396,1,0,0 }, { 0.0000,0.0160,0.0264,0.0368,0.0472,0.0576 } },	--地火令
						{ { 6,1,397,1,0,0 }, { 0.0000,0.0160,0.0264,0.0368,0.0472,0.0576 } },	--雷击令
					  }
					  
NPC_RANK_DROPRATE_TABLE = { 1, 1, 2, 3, 4, 5 }

function OnDeath(nNpcIndex)
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end
	
	--如果是死于其它Npc则不统计排行
	if (PlayerIndex == nil or PlayerIndex == 0) then
		return
	end
	if (rank == 7) then
		bt_addtotalpoint(BT_GetTypeBonus(PL_KILLRANK7, GetCurCamp()));	-- 打下箭塔的玩家获得500点积分
		
		local n_gamelvl			= BT_GetGameData(GAME_LEVEL);
		local tb_npclvl 		= {50, 75, 90};
		local n_jianta_index	= GetNpcParam(nNpcIndex, 1);	-- 箭塔的序号
		local x, y, nSubWID		= GetNpcPos(nNpcIndex);
		local sz_jianta_name	= "";
		if (1 == GetCurCamp()) then
			sz_jianta_name	= "Th竝 ti詎 (T鑞g)";
		else
			sz_jianta_name	= "Th竝 ti詎 (Kim)";
		end
		local n_npcidx			= AddNpc(1375, tb_npclvl[n_gamelvl], nSubWID, x, y, 1, sz_jianta_name, 1);	-- 重新生成的新的箭塔
		SetNpcCurCamp(n_npcidx, GetCurCamp());
		SetNpcParam(n_npcidx, 1, n_jianta_index);
		SetMissionV(MS_TOWER_1 + n_jianta_index - 1, GetCurCamp())
		SetNpcDeathScript(n_npcidx, tabFILE_NPCDEATH[7])
	else
		dropItem( nNpcIndex, rank, PlayerIndex );
		
		BT_SetData(PL_KILLNPC, BT_GetData(PL_KILLNPC) + 1);
		BT_SetData(PL_KILLRANK1 + rank - 1, BT_GetData(PL_KILLRANK1 + rank - 1) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_KILLRANK1 + rank - 1, GetCurCamp()))
		mar_addmissionpoint(BT_GetTypeBonus(PL_KILLRANK1 + rank - 1, GetCurCamp()))
		
		if (rank == 6) then
			if (GetCurCamp() == 1) then
				Msg2MSAll(MISSIONID, "<color=yellow> T鑞g Kim c玭g c竜: T鑞g qu﹏ "..GetName().."  gi誸 頲 Nguy猲 So竔 phe Kim!!!")
				SetMissionV(MS_MARSHALDEATH, 1)
				CloseMission(MISSIONID)
			else
				Msg2MSAll(MISSIONID, "<color=yellow> T鑞g Kim c玭g c竜: Kim qu﹏ "..GetName().."  gi誸 頲 Nguy猲 So竔 phe T鑞g!!!")
				SetMissionV(MS_MARSHALDEATH, 2)
				CloseMission(MISSIONID)
			end
		end
	end
	BT_SortLadder();
	BT_BroadSelf();
end;

function dropItem( nNpcIndex, nNpcRank, nBelongPlayerIdx )
	local nItemCount = getn( ITEM_DROPRATE_TABLE );
	local nMpsX, nMpsY, nSubWorldIdx = GetNpcPos( nNpcIndex );
	
	for nDropTimes = 1, NPC_RANK_DROPRATE_TABLE[nNpcRank] do
		local nRandNum = random();
		local nSum = 0;
		for i = 1, nItemCount do
			nSum = nSum + ITEM_DROPRATE_TABLE[i][2][nNpcRank];
			if( nSum > nRandNum ) then
				DropItem( nSubWorldIdx, nMpsX, nMpsY, nBelongPlayerIdx, ITEM_DROPRATE_TABLE[i][1][1], ITEM_DROPRATE_TABLE[i][1][2], ITEM_DROPRATE_TABLE[i][1][3], ITEM_DROPRATE_TABLE[i][1][4], ITEM_DROPRATE_TABLE[i][1][5], ITEM_DROPRATE_TABLE[i][1][6], ITEM_DROPRATE_TABLE[i][1][7] );
				break
			end
		end
	end
end