IncludeLib("TIMER")
Include("\\script\\missions\\newpracticemap\\head.lua")

function OnTimer()
	
	-- 检查当前的 mapid
	local nMapType = tbNewPracticeMap:checkMapId();
	
	if nMapType ~= 1 and nMapType ~= 2 then
		if tbNewPracticeMap.bDeBug == 1 then
			print("Wrong Map");
		end
		return
	end
	
	-- 检查并预扣除玩家的剩余的时间
	local nTimeLeft;
	
	if nMapType == 1 then
		nTimeLeft = GetTask(tbNewPracticeMap.TimeLeft_A) - 1;
		SetTask(tbNewPracticeMap.TimeLeft_A, nTimeLeft);
	elseif nMapType == 2 then
		nTimeLeft = GetTask(tbNewPracticeMap.TimeLeft_B) - 1;
		SetTask(tbNewPracticeMap.TimeLeft_B, nTimeLeft);
	end

	if tbNewPracticeMap.bDeBug == 1 then
		print("Name:"..GetName().." MapType:"..nMapType.." TimeLeft:"..nTimeLeft);
	end
	
	-- 开启下一个Timer
	TM_SetTimer(tbNewPracticeMap.interval, tbNewPracticeMap.timerId, 1, 0);
	
	if nTimeLeft < 0 then
		Msg2Player("Th阨 gian tu luy謓 c馻 i hi謕  k誸 th骳, s� b� cng ch� y kh醝 b秐 !");
		local nSubWorldId, nX, nY = RevID2WXY(GetPlayerRev());
		NewWorld(nSubWorldId, nX/32, nY/32);
		return
	end
		
	if nTimeLeft <= tbNewPracticeMap.WarningTime then
		Msg2Player("Th阨 gian tu luy謓 c馻 i hi謕  k誸 th骳, h穣 chu萵 b� r阨 kh醝 b秐 !");
	end
		
end

