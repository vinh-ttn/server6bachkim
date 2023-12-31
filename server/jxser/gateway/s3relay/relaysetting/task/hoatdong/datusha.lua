local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	
	
	local nNextHour = nStartHour
	local nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	
	if nNextMinute >= 60 then
		
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end



function TaskShedule()
	--设置方案名称
	TaskName("Loan Chieu Cuu Chau Coc")
	
	local  nInterval = 60
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--设置间隔时间，单位为分钟
	TaskInterval(nInterval) --nInterval分钟一次
	--设置触发次数，0表示无限次数
	

	TaskCountLimit(0)
	


	local szMsg = format("=====> %s BAT DAU %d:%d va %d PHUT SE KET THUC", "HOAT DONG LOAN CHIEN CUU CHAU COC",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

function TaskContent()
	local nTime = tonumber(date("%H%M"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	local nTaskState = tonumber(date("%y%m%d%H"))
	if nTime >= 0000 and nTime <= 0010 then
		Ladder_ClearLadder(10269);
		OutputMsg("XOA XEP HANG LOAN CHIEN CUC CHAU COC")
	end
	local flag = 0
	if (nTime >= 1600 and nTime < 1700) then	
		flag = 1
	end
	if flag == 1 then
		local szMsg = "Lo筺 Chi課 C鰑 C鑓  n gi� b竜 danh, m鋓 ngi nhanh ch﹏ n L﹎ An g苝 Chng Жng Cung N�  ghi danh."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		OutputMsg("=====> BAT DAU BAO DANH LOAN CHIEN CUU CHAU COC (datusha.lua)")
			
		RemoteExecute("\\script\\missions\\datusha\\datusha.lua", "DaTuShaClass:Open", 0);
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
