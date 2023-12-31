--玩家死亡脚本

Include("\\script\\missions\\tongwar\\match\\head.lua")

function OnDeath(Launcher)
	
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;

	PlayerIndex1 = NpcIdx2PIdx(Launcher);
	OrgPlayer  = PlayerIndex;
	DeathName = GetName();
	deathcamp = GetCurCamp();
	currank = tongwar_getdata(TONGWAR_RLTASK_CURRANK)
	

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		launchrank = tongwar_getdata(TONGWAR_RLTASK_CURRANK)
		if (GetCurCamp() ~= deathcamp) then
			LaunName = GetName();
			
			--更新杀Npc数目和排行榜
			tongwar_setdata(TONGWAR_RLTASK_KILLPLAYER, tongwar_getdata(TONGWAR_RLTASK_KILLPLAYER) + 1); --记录玩家杀其它玩家的总数
			serieskill = tongwar_getdata(TONGWAR_RLTASK_SERIESKILL) + 1;
			tongwar_setdata(TONGWAR_RLTASK_SERIESKILL, serieskill); --记录玩家当前的连斩数
		
		if (TAB_SERIESKILL[launchrank][currank] == 1) then
			serieskill_r = GetTask(TV_SERIESKILL_REALY) 
			serieskill_r = serieskill_r + 1
			SetTask(TV_SERIESKILL_REALY,serieskill_r)
			if (mod(serieskill_r, 3) == 0) then
				if (deathcamp == 1) then
					bt_addtotalpoint(tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
					but_addmissionpoint(tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
					Msg2Player("<color=yellow> b筺 nh薾 頲 甶觤 t輈h l騳 Li猲 tr秏 "..tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
				else
					bt_addtotalpoint(tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
					but_addmissionpoint(tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
					Msg2Player("<color=yellow> b筺 nh薾 頲 甶觤 t輈h l騳 Li猲 tr秏 "..tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
				end
			end
			if (mod(tongwar_getdata(TONGWAR_RLTASK_KILLPLAYER), 5) == 0) then
				tongwar_setdata(TONGWAR_RLTASK_MAXDEATH, GetTask(TONGWAR_RLTASK_MAXDEATH) + 1)
				Msg2Player("<color=green>S� l莕 t� vong t╪g l猲:"..(GetTask(TONGWAR_RLTASK_MAXDEATH)- GetTask(TONGWAR_RLTASK_NDEATH)).."l莕")
			end
		end
			
		if (tongwar_getdata(TONGWAR_RLTASK_MAXSERIESKILL) < serieskill) then 
				tongwar_setdata(TONGWAR_RLTASK_MAXSERIESKILL, serieskill) -- 统计玩家的最大连斩数
		end
			
		local rankradio = 1;
			
		if ( RANK_PKBONUS[launchrank] == nil or RANK_PKBONUS[launchrank][currank] == nil) then
			rankradio = 1
			print("battle rank tab error!!!please check it !")
		else
			rankradio = RANK_PKBONUS[launchrank][currank]
		end
		local earnbonus = 0
		if (deathcamp == 1) then
			earnbonus = floor(tongwar_GetTypeBonus(BONUS_KILLPLAYER) * rankradio)
		else
			earnbonus = floor(tongwar_GetTypeBonus(BONUS_KILLPLAYER) * rankradio)
		end
		bt_addtotalpoint(earnbonus)
		but_addmissionpoint(earnbonus)
			
			local rankname = "";
			rankname = tbRANKNAME[currank]
			launchrank = tongwar_getdata(TONGWAR_RLTASK_CURRANK);
			launrankname = tbRANKNAME[launchrank]
			BT_SortLadder();
			BT_BroadSelf();
		
			if (GetCurCamp()  == 1) then
				str  = GetMissionS(MS_S_CITYNAME_S)..launrankname..LaunName.." gi誸 頲"..GetMissionS(MS_S_CITYNAME_J)..rankname..DeathName..", t鎛g PK l� "..tongwar_getdata(TONGWAR_RLTASK_KILLPLAYER);
			else
				str  = GetMissionS(MS_S_CITYNAME_J)..launrankname..LaunName.." gi誸 頲"..GetMissionS(MS_S_CITYNAME_S)..rankname..DeathName..", t鎛g PK l� "..tongwar_getdata(TONGWAR_RLTASK_KILLPLAYER);
			end
			Msg2Player("<color=pink> Ch骳 m鮪g! B筺  h� 頲:"..rankname..DeathName..", T鎛g PK l� "..tongwar_getdata(TONGWAR_RLTASK_KILLPLAYER));
			Msg2MSAll(MISSIONID, str);
		end
		PlayerIndex = OrgPlayer;
	end;

	tongwar_setdata(TONGWAR_RLTASK_NDEATH, tongwar_getdata(TONGWAR_RLTASK_NDEATH) + 1)
	tongwar_setdata(TONGWAR_RLTASK_SERIESKILL, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	Msg2Player("<color=green>S� l莕 t� vong c遪 l筰:"..(GetTask(TONGWAR_RLTASK_MAXDEATH)- GetTask(TONGWAR_RLTASK_NDEATH)).."l莕")
	BT_SortLadder();
	BT_BroadSelf();
	sf_onplayerleave()
	tongwar_setdata(TONGWAR_RLTASK_LASTDTIME, GetGameTime())
end