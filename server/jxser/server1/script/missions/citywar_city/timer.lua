Include("\\script\\missions\\citywar_city\\head.lua");
Include("\\script\\missions\\citywar_city\\ctc3tru.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V+1);
	if (timestate == 2) then --开战了
		ReportBattle(V);
	end;
end;

function ReportBattle(V)
--战斗进行过程中，系统定期通知石碑的情况
	local Ctc3tru_GameCity = Ctc3tru_GetNameCityWarWithnCan1to7(GetWarOfCity());
	gametime = (floor(GetMSRestTime(MISSIONID,13) / 18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str = format("Hi謓 t筰 <color=yellow>%s<color> 產ng tranh 畂箃 quy誸 li謙! Th阨 gian c遪 <color=green>%d<color> ph髏; hi謓 t筰 <color=green>%d<color> Long tr�  h錳 ph鬰 thu閏 t輓h ", Ctc3tru_GameCity, RestMin, MS_SYMBOLCOUNT);
	for i = 1, MS_SYMBOLCOUNT do 
		if (GetMissionV(MS_SYMBOLBEGIN + i - 1)  == 1) then
			str = str .. "<color=green>Phe Th�. "	;
		else 	
			str = str .. "<color=yellow>Phe C玭g. ";
		end;
	end;

	--2004.11.5关闭向全球发送广播的功能
	--if (mod(V, 18) == 0) then 
	--	AddGlobalNews(str)
	--else
		Msg2MSAll(MISSIONID, str)
	--end;
end;
 