IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\jianta\\head.lua")
Include("\\script\\battles\\jianta\\mission.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--计数器，统计当前定时器触发了多少次了
	SetMissionV(MS_TIMER1, t)
	
	--Storm 加奖励积分
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "Khu v鵦 S� c蕄 "
	elseif (lsf_level == 2) then
		resultstr = "Khu v鵦 Trung c蕄 "
	elseif (lsf_level == 3) then
		resultstr = "Khu v鵦 Cao c蕄 "
	end
	
	if (t == RUNGAME_TIME) then --如果到了正式开战时刻，则停止报名，正式进入战斗阶段
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."Th阨 gian b竜 danh T鑞g Kim h譶h th鴆 Th竝 ti詎  n, tr薾 chi課 ch輓h th鴆 b総 u!", 2);
		Msg2MSAll(MISSIONID, "T鑞g Kim ch輓h th鴆 khai chi課! C竎 chi課 s�! X玭g l猲!");
		WriteLog("jianta battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>Tr薾 nh T鑞g Kim h譶h th鴆 Th竝 ti詎 v� c飊g c╪g th糿g, trc m総 產ng � giai 畂筺 b竜 danh, nh鱪g ai mu鑞 tham chi課 xin h穣 nhanh ch鉵g n Tng Dng ho芻 Chu Ti猲 tr蕁 ng k� b竜 danh; Ho芻 s� d鬾g T鑞g Kim chi猽 th�  nhanh ch鉵g n 甶觤 b竜 danh, th阨 gian b竜 danh c遪:"..RestMin.."ph髏. 襲 ki謓 tham gia: ng c蕄 t� 40, ph� b竜 danh 3000 lng. Sau khi khai chi課, n誹 t鎛g s� ngi ch璦  v蒼 c� th� ti誴 t鬰 b竜 danh!";
			str2 = "<#> Th阨 gian b竜 danh c遪 l筰 l�:"..RestMin.."ph髏"
		else
			str1 = resultstr.."<#>Tr薾 nh T鑞g Kim h譶h th鴆 Th竝 ti詎 v� c飊g c╪g th糿g, trc m総 產ng � giai 畂筺 b竜 danh, nh鱪g ai mu鑞 tham chi課 xin h穣 nhanh ch鉵g n Tng Dng ho芻 Chu Ti猲 tr蕁 ng k� b竜 danh; Ho芻 s� d鬾g T鑞g Kim chi猽 th�  nhanh ch鉵g n 甶觤 b竜 danh, th阨 gian b竜 danh c遪:"..RestMin.."ph髏"..RestSec.."gi﹜. 襲 ki謓 tham gia: ng c蕄 t� 40, ph� b竜 danh 3000 lng. Sau khi khai chi課, n誹 t鎛g s� ngi ch璦  v蒼 c� th� ti誴 t鬰 b竜 danh!";
			str2 = "<#> Th阨 gian b竜 danh c遪 l筰 l�:"..RestMin.."ph髏"..RestSec.." gi﹜"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t >= RUNGAME_TIME) then

		--如果场上某一阵营人数低于最小数量，则比赛结束，人多的阵营直接获胜
		local group1count = GetMSPlayerCount(MISSIONID, 1)
		local group2count = GetMSPlayerCount(MISSIONID, 2)
		if ( group1count < but_getminplayerlimit() or group2count < but_getminplayerlimit()) then
			if (group1count > group2count) then
				SetMissionV(MS_MOSTDEATH, 1)
				CloseMission(MISSIONID)
			elseif (group1count < group2count) then
				SetMissionV(MS_MOSTDEATH, 2)
				CloseMission(MISSIONID)
			else
				SetMissionV(MS_MOSTDEATH, 0) 
				CloseMission(MISSIONID)
			end
			return
		end

		
		local tb_jianta_count = {0, 0};	-- 属于宋/金方的箭塔数
		for i = 1, 5 do
			local n_camp	= GetMissionV(MS_TOWER_1 + i - 1);
			if (1 == n_camp or 2 == n_camp) then
				tb_jianta_count[n_camp] = tb_jianta_count[n_camp] + 1;
			end
		end
		local tb_player_actor	= {};
		local idx 	= 0;
		local pidx 	= 0;
		for i = 1, 500 do
			idx, pidx	= GetNextPlayer(MISSIONID, idx, 0)
			if (pidx > 0) then
				tb_player_actor[getn(tb_player_actor) + 1]	= pidx;
			end
			if (idx <= 0) then
				break;
			end
		end
		
		local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID));	
		local oldPlayeridx	= PlayerIndex;
		
		for i = 1, 5 do
			local jiantaxy 		= GetIniFileData(mapfile, "Jianta_All", format("jianta_%d", i));
			local xj, yj		= bt_str2xydata(jiantaxy);	-- 获得第i个箭塔的坐标
			for j = 1, getn(tb_player_actor) do
				PlayerIndex = tb_player_actor[j];
				local mapid, xp, yp = GetWorldPos();
				if ((xp - xj) * (xp - xj) + (yp - yj) * (yp - yj) <= 20 * 20 and (GetMissionV(MS_TOWER_1 + i - 1) == GetCurCamp()) ) then
					bt_addtotalpoint(5 * tb_jianta_count[GetCurCamp()]);
				end
				BT_SortLadder();
				BT_BroadSelf();
			end
		end
		
		PlayerIndex = oldPlayeridx;
		
		mar_addmissionpoint(250 * tb_jianta_count[1], 1);
		mar_addmissionpoint(250 * tb_jianta_count[2], 2);
		--每一分钟通告当前双方积分，和npc
		if (mod(t, 3) == 0 ) then
			msstr = "C玭g c竜: hi謓 gi� t鎛g t輈h l騳 c馻 2 phe T鑞g - Kim l� "..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
			Msg2MSAll(MISSIONID, msstr)
		end
		
		but_pop2home( 1 )
		but_pop2home( 2 )
	end

end



