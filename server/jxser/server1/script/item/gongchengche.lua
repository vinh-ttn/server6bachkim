Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--攻城战的地图ID
MSBegin = MS_GCCBEGIN;
Count = g_nMaxGccPerDoor * g_nDoorCount;
NpcTempl = 524;
NpcLevel = 60;

function main()
--看当前位置是否处在攻城战地图上
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID();

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("B筺 kh玭g th� s� d鬾g Nghi謙 Long Xung Xa t筰 y! ")
	return 1;
end

if (GetCurCamp() ~= 2) then
	Msg2Player("Ch� c� phe C玭g Th祅h m韎 c� th� s� d鬾g Nghi謙 Long Xung Xa! ")
	return 1;
end

PosId = GetNearstPos(X*32,Y*32, GccPos);
if (PosId == 0) then 
	Say("B筺 ng c竎h Nghi謙 Long Xung Xa qu� xa, kh玭g th� s� d鬾g! ",0)
	return 1
end;



if (GetMissionV(MS_DOORBEGIN + PosId - 1)  == 0 ) then 
	Msg2Player("Th祅h m玭 ph輆 trc m苩 ngi 產ng ng  b� c玭g ph�, kh玭g th� s� d鬾g Nghi謙 Long Xung Xa ");
	return 1
end;

if (GetMissionV(MSBegin + PosId - 1) == 0) then 
	ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, GccPos[PosId][1], GccPos[PosId][2], 1, "", 1);
	if (ToolIndex > 0) then
		SetNpcCurCamp(ToolIndex, 2);
		SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
		SetMissionV(MSBegin + PosId -1, ToolIndex); 
		SetSiegeVoitureParam(ToolIndex, GetMissionV(MS_DOORBEGIN + PosId - 1))
		Msg2MSAll(MISSIONID, GetName().."S緋 t th猰 m閠 chi誧 Nghi謙 Long Xung Xa, h� tr� C玭g Th祅h. ");
		WriteLog(GetLoop()..GetName()..":AddCC"..ToolIndex)
		return 0
	end;
else
	Msg2Player("Nghi謙 Long Xung Xa m� b筺 b� tr� trc y hi謓 v蒼 c遪, t筸 th阨 kh玭g th� b� tr� th猰 n鱝 ");
	return 1
end;

return 0;
end;
