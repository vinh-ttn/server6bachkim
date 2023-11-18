function main()
	local nPlayerLevel = GetLevel();
	local nNpcIdx = GetLastDiagNpc();
	
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	local nSeedLevel = GetNpcParam(nNpcIdx, 1)
	
	if  nSeedLevel ~= 4 and nGetSeedLevel~= nSeedLevel then -- 如果级别不对,不能进行拾取
		--这里告诉玩家级别不对,不能拾取
		if (1 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("Ch� c� ngi ch琲 c蕄 di 90 m韎 c� th� h竔 qu� n祔!")
		elseif (2 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("Lo筰 qu� n祔 ch� t� c蕄 90 n c蕄 119 ngi ch琲 m韎 c� th� h竔 頲.")
		else
			Msg2Player("Lo筰 qu� n祔 ngi ch琲 t� c蕄 120 tr� l猲 m韎 c� th� h竔!")
		end
		return
	elseif nSeedLevel == 4 and nGetSeedLevel ~= 3 then
			Msg2Player("Ch� c� ngi ch琲 t� c蕄 120 tr� l猲 m韎 c� th� h竔 qu� n祔!")
			return
	end;
	Msg2Player("Qu� v蒼 ch璦 ch輓, ph秈 i 5 ph髏 n鱝.")
end;