-------------------------------------------------------------------------
-- FileName		:	NewWorldScript_H.lua
-- Author		:	LuoBaohang
-- CreateTime	:	2005-09-02
-- Desc			:  	地图切换触发脚本
-------------------------------------------------------------------------
local tbMapLevel = {
[9] = 70,
[27] = 70,
[55] = 70,
[69] = 70,
[72] = 70,
[76] = 70,
[94] = 70,
[120] = 70,
[123] = 70,
[129] = 70,
[130] = 70,
[142] = 70,
[149] = 70,
[169] = 70,
[206] = 70,
[319] = 70,
[626] = 70,
[143] = 80,
[150] = 80,
[151] = 80,
[181] = 80,
[198] = 80,
[199] = 80,
[200] = 80,
[201] = 80,
[202] = 80,
[203] = 80,
[204] = 80,
[205] = 80,
[207] = 80,
[224] = 80,
[320] = 80,
[75] = 90,
[93] = 90,
[124] = 90,
[144] = 90,
[152] = 90,
[225] = 90,
[226] = 90,
[227] = 90,
[321] = 90,
[322] = 90,
[340] = 90,
[341] = 90,
[342] = 90,
[336] = 90,
}
Include("\\script\\global\\pgaming\\configserver\\configall.lua")
Include("\\script\\lib\\string.lua")
Include("\\script\\maps\\newworldscript_h.lua")
Include("\\script\\item\\tianziyuxi.lua");	-- 天子玉玺

Include("\\script\\misc\\eventsys\\type\\map.lua")
aryChangeWorldExec = {}
function PraseParam(szParam)
	if (szParam == nil) then
		return nil
	end
	if (aryChangeWorldExec[SubWorld] == nil) then	--还没有函数链，分析参数
		aryChangeWorldExec[SubWorld] = {}
		local aryFuns = split(szParam, '|')
		local j=1;
		for i = 1,getn(aryFuns) do
			local ExecFun = aryFuncStore[aryFuns[i]]
			if (ExecFun == nil)then
				print(format("Error: (Never world: %d) Ch璦 nh ngh� h祄 s� %s", SubWorld, aryFuns[i]))
			else
				aryChangeWorldExec[SubWorld][j] =  ExecFun;
				j = j+1;
			end	
		end
	end
	return 1;
end

function OnNewWorldDefault(szParam)
--===================================================================================--
if KiemTraCapDoTrainMapVuotCap == 1 then
local nW,_,_ = GetWorldPos()
 if %tbMapLevel[nW] and %tbMapLevel[nW] > GetLevel() then
	NewWorld(53,194*8,204*16)
	Msg2Player("Ngi 產ng � map c� c蕄  qu竔 cao h琻 c蕄 hi謓 t筰 c馻 ngi. Hi謓 t筰 ngi t� ng tr� v� tr筺g th竔 luy謓 c玭g v� kh玭g th� i pk")
	SetPKFlag(0)
	ForbidChangePK(1)
	return
 end
end
--===================================================================================--
	if (PraseParam(szParam) == 1) then
		for i = 1,getn(aryChangeWorldExec[SubWorld]) do	--执行函数链
			aryChangeWorldExec[SubWorld][i](1)
		end
	end
	
	YuXiChangeMapMsg();
	EventSys:GetType("EnterMap"):OnPlayerEvent(SubWorldIdx2ID(SubWorld), PlayerIndex)
end

function OnLeaveWorldDefault(szParam)
	if (PraseParam(szParam) == 1) then
		for i = 1,getn(aryChangeWorldExec[SubWorld]) do	--执行函数链
			aryChangeWorldExec[SubWorld][i](0)
		end
	end
	EventSys:GetType("LeaveMap"):OnPlayerEvent(SubWorldIdx2ID(SubWorld), PlayerIndex)
end