Include([[\script\missions\tong\collectgoods\schedule\bombout.lua]]);

function OnTimer()
	local nNewsValue = GetMissionV(COLLG_MS_NEWSVALUE) + 1;
	SetMissionV(COLLG_MS_NEWSVALUE, nNewsValue);
	
	if (20 == nNewsValue) then
		CloseMission(COLLG_MISSIONID);
		return
	end;
	
	local i;
	for i = 1, COLLG_SMALLMAPCOUNT do
		if (nNewsValue >= 18) then
			groupsort(i, 1);
		else
			groupsort(i, 0);
		end;
	end;
	
	if (0 == mod(nNewsValue, 2)) then
		local nTime = floor(nNewsValue / 2);
		nTime = 10 - nTime;
		if (nTime > 0) then
			local OldSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(COLLG_MAPID[2]);
			Msg2MSAll(COLLG_MISSIONID, "Ho箃 ng v蒼 c遪<color=yellow>"..nTime.."<color>ph髏 k誸 th骳!");
			SubWorld = OldSubWorld;
		end;
	end;
	--将所有的炸弹引爆
	bombout()
end;

--排序函数(根据点击个数由多到少确定将一组成员的名次)；
function groupsort(nGroupId, bSave)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(COLLG_MAPID[2]);
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local idx = 0;
	local pidx;
	
	local i;
	for i = 1, COLLG_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(COLLG_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(COLLG_COUNT_ONETIME);
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	
	local j;
	local temptab = {};
	local nCount = getn(tabPlayer);
	for i = 2, nCount do	--采用一个冒泡排序
		for j = nCount, i, -1 do
			if (tabPlayer[j][2] > tabPlayer[j - 1][2]) then	--采用降序排序
				temptab = tabPlayer[j];
				tabPlayer[j] = tabPlayer[j - 1];
				tabPlayer[j - 1] = temptab;
			end;
		end;
	end;

	local szMsg = ""
	local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1]
			szMsg = szMsg.."<enter> <color=green>"..i.." "..GetName()..", nh薾 頲 "..tabPlayer[i][2].." t骾 h祅g h鉧"
		end
	end
	--排序后从前到后就是名次的先后
	nCount = nCount;
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		if (bSave == 1) then
			SetTask(COLLG_TK_RANK, i);
		end;
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		Msg2Player("Hi謓 t筰 thu th藀 頲 <color=yellow>"..GetTask(COLLG_COUNT_ONETIME).."<color> t骾 h祅g h鉧, x誴 h筺g th� <color=yellow>"..i.."<color>, ti誴 t鬰 c� g緉g!");
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;
