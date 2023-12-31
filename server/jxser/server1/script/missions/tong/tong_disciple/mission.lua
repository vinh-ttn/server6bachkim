Include([[\script\missions\tong\tong_disciple\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	SetMissionV(MS_TIMERSTATE, 1);

	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
	
	StartMissionTimer(DIS_MISSIONID, DIS_RUNTIMERID, DIS_RUNINTERVER); --
	StartMissionTimer(DIS_MISSIONID, DIS_SMALLTIMERID, DIS_INTERVER);	--打开计时器
end;

function EndMission()
	local i;
	for i = 1, DIS_SMALLMAPCOUNT do
		if (GetMSPlayerCount(DIS_MISSIONID, i) > 0) then
			groupsort(i);
		end;
	end;
	clearfairy();	--清除场地内所有的怪
	gameover(DIS_MAPID[2], DIS_MISSIONID);	--将所有玩家清除出地图
	strGlbNews = "Nh鱪g nh﹏ s� 甶 chi猽 m�  t�  quay tr� v�, c竎  t� tr� trung cng tr竛g l祄 m鋓 ngi nh� l筰 qu� kh� h祇 h飊g c馻 m譶h, v� c騨g m鮪g cho tng lai c馻 bang h閕."
	AddGlobalNews(strGlbNews);

	StopMissionTimer(DIS_MISSIONID, DIS_SMALLTIMERID);
	StopMissionTimer(DIS_MISSIONID, DIS_RUNTIMERID);
	gb_SetTask(CHRISMAS_SHREWMOUSE, 1, 0);
	SetGlbValue(GLB_DIS_PHASE, 0); 
end;

function OnLeave()
	SetLogoutRV(0);
end

--排序函数(根据点击个数由多到少确定将一组成员的名次)；
function groupsort(nGroupId)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local idx = 0;
	local pidx;
	
	local i;
	for i = 1, DIS_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(DIS_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(DIS_COUNT_ONETIME);
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
			szMsg = szMsg.."<enter> <color=green>"..i.." "..GetName()..", chi猽 m� 頲 "..tabPlayer[i][2].."c竔"..DIS_MOUSENAME
		end
	end
	--排序后从前到后就是名次的先后
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(DIS_TK_RANK, i);
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		Msg2Player("B筺 x誴 h筺g th� <color=yellow>"..i.."<color>, c� th� n g苝 <color=yellow>T鎛g qu秐 Ho箃 ng phng<color>  nh薾 thng!");
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;
