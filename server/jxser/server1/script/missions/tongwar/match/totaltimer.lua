Include("\\script\\missions\\tongwar\\match\\head.lua")

function OnTimer()
	State = GetMissionV(MS_STATE) ;
	if (State == 0) then
		return
	end
	CloseMission(MISSIONID)
end;