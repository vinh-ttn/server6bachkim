Include("\\script\\event\\zhongqiu_jieri\\201009\\support.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")

function OnDeath(nNpcIndex)
	
	local szOwnerName = tb2010ZhongQiu.tbNpcSet[nNpcIndex];
	tb2010ZhongQiu.tbNpcSet[nNpcIndex] = nil;
	
	if szOwnerName == nil then 
		return 
	end
	
	if tb2010ZhongQiu:IsActivityTime() ~= 1 then
		Msg2Player("Ho箃 ng  k誸 th骳!");
		return
	end
	
--	if szOwnerName ~= GetName() then
--		Msg2Player("不是自己召唤的BOSS");
--		return
--	end

	if ST_IsTransLife() ~= 1 and GetLevel() < 50 then
		Msg2Player("Ph秈 c蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng!");
		return		
	end
	
	local szNpcName = GetNpcName(nNpcIndex);
	local tbNpcInfo = tb2010ZhongQiu.tbNpcInfo[szNpcName];
	
	if tbNpcInfo == nil then
		return
	end
	
	local nAwardExp = 0;
	
	if type(tbNpcInfo.nAwardExp) == "number" then
		nAwardExp = tbNpcInfo.nAwardExp;
	else
		local nRand = random(1, 100);
		for i = 1,getn(tbNpcInfo.nAwardExp) do
			if nRand <= tbNpcInfo.nAwardExp[i][3] then
				nAwardExp = tbNpcInfo.nAwardExp[i][1];
				break
			end
		end
	end
	
	-- 奖励经验
	tb2010ZhongQiu:AwardExp( nAwardExp, 
													 tbNpcInfo.nTaskId, 
													 tbNpcInfo.nMaxExp, 
													 format("Th祅h c玭g  b筰 %s", szNpcName), 
													 format("[Ho箃 ng trung thu][Цnh b筰 %s]", szNpcName));
	
	-- 掉落物品
	if tbNpcInfo.tbDrop ~= nil then
		tbDropTemplet:GiveAwardByList(nNpcIndex, 
																	PlayerIndex, 
																	tbNpcInfo.tbDrop, 
																	format("[Ho箃 ng trung thu][Цnh b筰 %s]", szNpcName), 
																	1);
	end

end

