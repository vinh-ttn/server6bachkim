Include([[\script\missions\springfestival\festival_head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	SetMissionV(MS_FE_TIMERSTATE, 1);

	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(FE_MAPID[2]);
	
	StartMissionTimer(FE_MISSIONID, FE_FAIRY_SMALLTIMERID, FE_INTERVER);	--刷怪计时器
	StartMissionTimer(FE_MISSIONID, FE_REPORT_SMALLTIMERID, FE_RUNINTERVER);     --报道计时器
end;

function EndMission()
	local i;
	for i = 1, FE_SMALLMAPCOUNT do
		if (GetMSPlayerCount(FE_MISSIONID, i + FE_SMALLMAPCOUNT) > 0 or
		    GetMSPlayerCount(FE_MISSIONID, i) > 0) then
			groupsort(i);
		end;
	end;
	festival_gameover(FE_MAPID[2], FE_MISSIONID);	--将所有玩家清除出地图
	strGlbNews = "c竎 hi謕 s� 甶 t譵"..FE_MOUSENAME.."  tr� v�.";
	AddGlobalNews(strGlbNews);
	
	ClearMapObj(FE_MAPID[2]);

	StopMissionTimer(FE_MISSIONID, FE_FAIRY_SMALLTIMERID);
	StopMissionTimer(FE_MISSIONID, FE_REPORT_SMALLTIMERID);
end;

function OnLeave()
	SetLogoutRV(0);
end

--排序函数(根据点击个数由多到少确定将一组成员的名次)；
function groupsort(nGroupId)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(FE_MAPID[2]);
	
	local nGroupId_nianshou = festival_getgroupid(nGroupId);
	
	local OldPlayer = PlayerIndex;
	local tabNormalPlayer = {};
	tabNormalPlayer = festival_sort(nGroupId);
	local tabMsg = {}
	local nMsgCount;
	tabMsg, nMsgCount = festival_getsz(tabMsg, 0, tabNormalPlayer, nGroupId);
	
	local tabNianshouPlayer = {};
	tabNianshouPlayer = festival_sort(nGroupId_nianshou);
	tabMsg, nMsgCount = festival_getsz(tabMsg, nMsgCount, tabNianshouPlayer, nGroupId_nianshou);
	
	festival_broadcast(tabMsg, nMsgCount, tabNormalPlayer);
	festival_broadcast(tabMsg, nMsgCount, tabNianshouPlayer);
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;

function festival_sort(nGroupId)
    local tabPlayer = {};
    local idx = 0;
	local pidx;
    local i;
	for i = 1, FE_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(FE_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(TK_FE_COUNT_ONETIME);
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
	return tabPlayer;
end;

function festival_getsz(tabMsg, nMsgCount, tabPlayer, nGroupId)
    local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	local i;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1];
			if (nGroupId > FE_SMALLMAPCOUNT) then
			    tabMsg[i + nMsgCount] = "<color=green>th� "..i.." "..GetName()..", b総 頲"..tabPlayer[i][2].."c竔"..FE_MOUSENAME;
			else
			    tabMsg[i + nMsgCount] = "<color=orange>th� "..i.." "..GetName()..", nh tr髇g"..FE_ANIMALNAME..tabPlayer[i][2].."l莕";
			end;
		end
	end
	nMsgCount = getn(tabMsg);
	if (nMsgCount > 0) then
	    tabMsg[nMsgCount] = tabMsg[nMsgCount];
	end;
	return tabMsg, nMsgCount;
end;

function festival_broadcast(tabMsg, nMsgCount, tabPlayer)
    nCount = getn(tabPlayer);
    local i, j;
    --排序后从前到后就是名次的先后
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(TK_FE_RANK, i);
		for j = 1, nMsgCount do
		    Msg2Player(tabMsg[j]);
		end;
		if (GetTask(TK_FE_GROUPID) > FE_SMALLMAPCOUNT) then
    		Msg2Player("B筺 l� ngi th� <color=yellow>"..i.."<color> tho竧 kh醝 Qu竔 th� nh藀 v祇 ngi, c� th� n g苝 <color=yellow>Sai d辌h Nha m玭<color>  nh薾 qu� thng b蕋 ng� ");
    	else
    	    Msg2Player("B筺 l� ngi nh tr髇g Qu竔 th� <color=yellow>"..i.."<color> l莕, c� th� n <color=yellow>Sai d辌h Nha m玭<color> nh薾 ph莕 thng!");
    	end;
	end;
end;