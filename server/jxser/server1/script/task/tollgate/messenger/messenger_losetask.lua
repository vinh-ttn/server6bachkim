-------------------------------------------------------------------------
-- FileName		:	messenger_losetask.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-07 17:33:14
-- Desc			:	信使任务中所有玩家失败所调用的脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的赖

function losemessengertask()
	
	local _, _, nMapIndex = GetPos()
	
	if (nt_getTask(1203) == 21 or  nt_getTask(1203) == 20 ) then
		nt_setTask(1201,0)
		nt_setTask(1202,0)
		nt_setTask(1203,0)
		nt_setTask(1204,0)
		nt_setTask(1207,0)
		nt_setTask(1212,0)
		nt_setTask(1213,0)
		nt_setTask(1214,0)
		nt_setTask(1215,0)
		
		local Uworld1211 = nt_getTask(1211)  --任务开始时间（一直在变化）
		local Uworld1222 = nt_getTask(1222)
		local Uworld1221 = nt_getTask(1221)             --获得当前任务日期
		local messenger_date = tonumber(date("%y%m%d")) --获得现在日期	  	 
		local lasttime   = GetGameTime()
--		
		if ( Uworld1211 ~= 0 ) then
			if ( lasttime - Uworld1211 > Uworld1222  ) then
				nt_setTask(1222,0)
			else
				Uworld1222 = Uworld1222 - ( lasttime - Uworld1211 )
				nt_setTask(1222,Uworld1222)
				nt_setTask(1211,lasttime)
			end
		end
		Msg2Player("Nhi謒 v� T輓 s� c馻 b筺  th蕋 b筰!")
	end
	
	local MapId = SubWorldIdx2ID( nMapIndex )
	if ( MapId >= 387  and MapId <= 395) then
		DisabledUseTownP(0)
		SetFightState(0)		-- 打完仗后改为非战斗状态
		--SetLogoutRV(0);       -- 当设置了此脚本后，重生点已被取消，无法再去其他地方勒，所以原地重生了。
		SetPunish(1);
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
	end
		
	nt_setTask(1211,0)
	local MapId = SubWorldIdx2ID( nMapIndex )
	if ( MapId >= 387  and MapId <= 389 ) then
		SetPos(1563,3118);
	elseif ( MapId >= 390  and MapId <= 392 ) then
		SetPos(1337,3154);
	elseif ( MapId >= 393  and MapId <= 395 ) then
		SetPos(1414,3197);
	end
end


