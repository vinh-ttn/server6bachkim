Include("\\script\\missions\\challenge\\challengehead.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V+1);

	if (V == GO_TIME) then
		RunMission(MISSIONID)
		return
	end

	--报名阶段
	if (timestate == 1) then 
		ReportMemberState(V);
	elseif (timestate == 2) then --开战了
		ReportBattle(V);
	elseif (timestate == 3) then  --战斗结束了
		Msg2MSAll(MISSIONID, "Chi課 d辌h k誸 th骳 ");
		StopMissionTimer(MISSIONID, 10);
		StopMissionTimer(MISSIONID, 11);
	end;
end;

function ReportMemberState(V)
	--在报名期间，系统定期通知玩家当前的报名情况
	if (V == GO_TIME) then
		if (GetMSPlayerCount(MISSIONID,1) == 0 or GetMSPlayerCount(MISSIONID , 2) == 0) then
			Msg2MSAll(MISSIONID, "Х h誸 gi� b竜 danh nh璶g s� ngi hai b猲 v蒼 kh玭g ph� h頿 y猽 c莡, tr薾 u nh h駓 b� ");
			CloseMission(MISSIONID)
			return
		else
			Msg2MSAll(MSSIONID, "Х h誸 gi� b竜 danh, tr薾 u ch輓h th鴆 b総 u ");
			RunMission(MISSIONID);
			return
		end
	end;
		RestTime = (GO_TIME - V) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		local str1 = "<#> Khi猽 chi課 產ng trong giai 畂筺 b竜 danh, i khi猽 chi課 xin nhanh ch鉵g nh藀 trng u"..RestMin.."<#> ph髏 ";
		str1 = "<#> Khi猽 chi課 產ng trong giai 畂筺 b竜 danh, c竎 i khi猽 chi課 xin nhanh ch鉵g nh藀 trng u! Nh﹏ s� 2 b猲 hi謓 l�:"..GetMSPlayerCount(MISSIONID, 1)..","..GetMSPlayerCount(MISSIONID, 2).."<#>. Th阨 gian b竜 danh c遪 l筰:"..RestMin.."<#> ph髏 "..RestSec.."<#> gi﹜ ";
		Msg2MSAll(MISSIONID, str1);	
end;

function ReportBattle(V)
--战斗进行过程中，系统定期通知各方的阵亡情况
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "Tr薾 u  k誸 th骳, phe T輒  gi祅h 頲 th緉g l頸 chung cu閏 ");
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "Tr薾 u  k誸 th骳, phe V祅g  gi祅h 頲 th緉g l頸 chung cu閏 ");
		CloseMission(MISSIONID);
		return
	end;
		
	s_death = GetMissionV(MS_S_DEATHCOUNT);
	j_death = GetMissionV(MS_J_DEATHCOUNT);
	gametime = (floor(GetMSRestTime(MISSIONID,11)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#> Giai 畂筺 chi課 u. T譶h h譶h thng vong hi謓 t筰: phe V祅g:"..s_death.."<#> ngi, phe T輒:"..j_death.."<#> ngi. Th阨 gian c遪 l筰"..RestMin.."<#> ph髏 "..RestSec.."<#> gi﹜ ";
	Msg2MSAll(MISSIONID, str1);
end;
 