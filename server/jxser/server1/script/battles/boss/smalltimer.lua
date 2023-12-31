IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")
Include("\\script\\battles\\boss\\bossset.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\sj_announce.lua")		-- 解放活动之千秋英烈

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
		AddGlobalCountNews(resultstr.."Th阨 gian b竜 danh h譶h th鴆 BOSS c馻 chi課 d辌h T鑞g Kim  n, xin m阨 v� l﹎ nh﹏ s� h穣 tham gia chi課 u!", 2);
		Msg2MSAll(MISSIONID, "T鑞g Kim ch輓h th鴆 khai chi課! C竎 chi課 s�! X玭g l猲!");
		WriteLog("boss battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>Chi課 d辌h T鑞g Kim h譶h th鴆 BOSS 產ng di詎 ra h誸 s鴆 c╪g th糿g, hi謓 t筰 產ng � giai 畂筺 b竜 danh, v� v� l﹎ nh﹏ s� n祇 mu鑞 tham gia th� h穣 n Tng Dng ho芻 Chu Ti猲 tr蕁  v祇 chi課 trng ho芻 s� d鬾g T鑞g Kim chi猽 th�  b竜 danh. Th阨 gian khai chi課 c遪:"..RestMin.." ph髏. 襲 ki謓 tham gia: C蕄 kh玭g 輙 h琻 40, ph� b竜 danh 100000 lng. Sau khi khai chi課 n誹 nh� v蒼 ch璦 n gi韎 h筺 cao nh蕋 th� v蒼 c� th� b竜 danh v祇 ti誴";
			str2 = "<#> Th阨 gian b竜 danh c遪 l筰 l�:"..RestMin.."ph髏"
		else
			str1 = resultstr.."<#>Chi課 d辌h T鑞g Kim h譶h th鴆 BOSS 產ng di詎 ra h誸 s鴆 c╪g th糿g, hi謓 t筰 產ng � giai 畂筺 b竜 danh, v� v� l﹎ nh﹏ s� n祇 mu鑞 tham gia th� h穣 n Tng Dng ho芻 Chu Ti猲 tr蕁  v祇 chi課 trng ho芻 s� d鬾g T鑞g Kim chi猽 th�  b竜 danh. Th阨 gian khai chi課 c遪:"..RestMin.."ph髏"..RestSec.." gi﹜. 襲 ki謓 tham gia: C蕄 kh玭g 輙 h琻 40, ph� b竜 danh 100000 lng. Sau khi khai chi課 n誹 nh� v蒼 ch璦 n gi韎 h筺 cao nh蕋 th� v蒼 c� th� b竜 danh v祇 ti誴";
			str2 = "<#> Th阨 gian b竜 danh c遪 l筰 l�:"..RestMin.."ph髏"..RestSec.." gi﹜"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t >= RUNGAME_TIME) then
		
		if (t == RUNGAME_TIME) then --正式开战的第一次触发时，产生战斗Npc的生成规则数据
			sf_buildfightnpcdata()
		else
			--到开战后半小时看双方杀死BOSS数，小的一方产生元帅
			if (t == BOSS_TIME) then
				if (GetMissionV(MS_KILLBOSSCOUNT_S) < GetMissionV(MS_KILLBOSSCOUNT_J)) then
					BattleBoss_AddBigBoss(1);
					SetMissionV(MS_MARSHAL, 1);
				elseif(GetMissionV(MS_KILLBOSSCOUNT_S) > GetMissionV(MS_KILLBOSSCOUNT_J)) then
					BattleBoss_AddBigBoss(2);
					SetMissionV(MS_MARSHAL, 2);
				elseif(GetMissionV(MS_KILLBOSSCOUNT_S) == GetMissionV(MS_KILLBOSSCOUNT_J)) then
					BattleBoss_AddBigBoss(1);
					BattleBoss_AddBigBoss(2);
					SetMissionV(MS_MARSHAL, 3);
				end
			end

			if (t == VANISHGAME_TIME) then	--到最后20分钟时将另一方的元帅产生
				mar = GetMissionV(MS_MARSHAL)
				if (mar == 1) then
					BattleBoss_AddBigBoss(2);
				elseif (mar == 2) then
					BattleBoss_AddBigBoss(1);
				end
			end
			
			-- 产生全部小BOSS
			for i = 1,getn(tbCOMMONBOSSTIME_ALL) do
				if (t == tbCOMMONBOSSTIME_ALL[i]) then
					BattleBoss_AddAllCommonBoss();
					break
				end
			end
			
			-- 产生中路小BOSS
			for i = 1,getn(tbCOMMONBOSSTIME_SOME) do
				if (t == tbCOMMONBOSSTIME_SOME[i]) then
					BattleBoss_AddSomeCommonBoss();
					break
				end
			end
			
			bt_pop2signmap()	--将在后营（fight=0）的玩家送回报名点
			
			--每一分钟通告当前双方积分，和npc
			if (mod(t, 3) == 0 ) then
				sf_callfightnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- 产生战斗Npc				
				msstr = format("Th玭g b竜: Hi謓 t筰 甶觤 T鑞g Kim c馻 hai b猲 l� <color=yellow>%d:%d<color>,  s� boss c� hai b猲 T鑞g Kim ti猽 di謙 l� <color=yellow>%d:%d<color>", GetMissionV(MS_TOTALPOINT_S), GetMissionV(MS_TOTALPOINT_J), GetMissionV(MS_KILLBOSSCOUNT_S), GetMissionV(MS_KILLBOSSCOUNT_J));
				Msg2MSAll(MISSIONID, msstr)
			end
			
			bt_announce(lsf_level, t);
			TB_QIANQIU_YINGLIE0904:announce(lsf_level, t);
		end
	end
end

function sf_callfightnpc(usedtime, totaltime) 
	if (usedtime > totaltime) then
		return
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	for i = 2, 5 do 
		if (GetMissionV(MS_NPCCOUNT1_S + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			nowadd = npccount - prenpccount;
			if (nowadd > 0) then
				print("call song npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S + i - 1), GetMissionV(MS_RANK1LVL_S + i - 1), 1, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
	
	for i = 2, 5 do 
		if (GetMissionV(MS_NPCCOUNT1_J + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			nowadd = npccount - prenpccount
			if (nowadd > 0) then
				print("call jing npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J + i - 1), GetMissionV(MS_RANK1LVL_J + i - 1), 2, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
end
