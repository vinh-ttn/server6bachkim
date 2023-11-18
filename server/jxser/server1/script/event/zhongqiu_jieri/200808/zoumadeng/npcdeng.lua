--走马灯npc

--每轮按顺序点完4个灯的玩家可以获得奖励
--+前10名点完灯的玩家获得10.000.000 EXP
--+ 11名及11名以后的玩家获得2.000.000 EXP
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	local tbFnagxiang = 
	{
		[1] = "n k衞 qu﹏ Йng",
		[2] = "n k衞 qu﹏ T﹜",
		[3] = "n k衞 qu﹏ Nam",
		[4] = "n k衞 qu﹏ B綾",
	}
	local nNpcIndex = GetLastDiagNpc();
	local nCurNpcType = GetNpcParam(nNpcIndex, 1)
	local nTaskStep = GetNpcParam(nNpcIndex, 3)
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("Ch� c� ngi ch琲 c蕄 50 tr� l猲  n筽 th� m韎 c� th� tham gia ho箃 ng.", 0)
		return 
	end
	local tbItem = {szName="N課 ", tbProp={6, 1, 1820, 1, 0, 0},nCount = 1}
	
	if (GetNpcParam(nNpcIndex, 4) == 1 ) then
		return
	end;
	
	SetNpcParam(nNpcIndex, 4, 1);
	
	local nTaskState = GetTask(zhongqiu0808_TSK_TaskState)
	
	if (nCurNpcType == 1 or nTaskStep - nTaskState == 1) and ((nTaskStep - nTaskState) < -4 or (nTaskStep - nTaskState) > 0) then
		if ConsumeEquiproomItem(tbItem.nCount, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4]) ~= 1 then
			
			Say("C莕 1 n課   th緋 l錸g n.", 0)
		else
			SetTask(zhongqiu0808_TSK_TaskState, nTaskStep)
			Msg2Player(format("Th緋 頲 %s", tbFnagxiang[nCurNpcType]))
			
			if nCurNpcType == 4 then
				local nRank = GetNpcParam(nNpcIndex, 2)
				nRank = nRank + 1
				Msg2Player(format("Xin ch骳 m鮪g, i hi謕 l� ngi th� %d  th緋 s竛g t蕋 c� l錸g n.", nRank))
				if nRank <= 10 then
					tbAwardTemplet:GiveAwardByList({nExp = 10000000}, "Ho箃 ng n k衞 qu﹏." )
				else
					tbAwardTemplet:GiveAwardByList({nExp = 2000000}, "Ho箃 ng n k衞 qu﹏." )
				end
				SetNpcParam(nNpcIndex, 2, nRank)
			end
		end
		
		
		
		
	elseif (nTaskStep - nTaskState) >= -4 and (nTaskStep - nTaskState) <= 0  then
		Msg2Player("n k衞 qu﹏ n祔  頲 th緋 s竛g r錳.")
	elseif tbFnagxiang[nCurNpcType-1] then
		Msg2Player(format("Trc ti猲 c莕 ph秈 th緋 s竛g %s", tbFnagxiang[nCurNpcType-1]))
	end
	
	
	SetNpcParam(nNpcIndex, 4, 0);
end

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0 ) then
		DelNpc(nNpcIdx)
		return 0;
	end;
	DelNpc(nNpcIdx)
end;