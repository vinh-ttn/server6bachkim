Include("\\script\\missions\\fengling_ferry\\fld_head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
-------------Ph莕 Thng Ho箃 чng-----------------------
Include("\\script\\global\\pgaming\\configserver\\phanthuonghoatdong.lua")
----------------------------------------------------------
function InitMission()
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end
	worldid= SubWorldIdx2ID(SubWorld)
	ClearMapNpc(worldid)	
	ClearMapTrap(worldid) 
	ClearMapObj(worldid)
	StartMissionTimer(MISSIONID, 29, FLD_TIMER_1)		--20秒计时
	StartMissionTimer(MISSIONID, 28, FLD_TIMER_2)		--全场
end

function RunMission()
	for i=1, 30 do
		posx, posy = fld_getadata(npcthiefpos)
		local npcindex	= AddNpc(724, 95, SubWorld, posx, posy, 0, "Th駓 T芻");
		SetNpcDeathScript(npcindex, "\\script\\missions\\fengling_ferry\\shuizeideath.lua");
	end
	idx = 0
	for i = 1 , 100 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);

 		if (pidx > 0) then
   			PlayerIndex = pidx;
 		end
		--此时为GM发布命令
		SetFightState(1)
		PutMessage("Thuy襫 甶 r錳! 30 ph髏 sau s� n b� B綾 Phong L╪g ч.")
		if (idx == 0) then 
 			break
 		end 
 	end
 	JiluAttendCount()		-- 数据埋点第一期
end

function JiluAttendCount()
	-- 得到当前报名的人数 
 	local nCount = GetMSPlayerCount(MISSIONID, 0)
	local mapid = SubWorldIdx2ID(SubWorld)
	if (mapid == 337) then
		AddStatData("fld_chuan1canjiarenshu", nCount)
	elseif (mapid == 338) then
		AddStatData("fld_chuan2canjiarenshu", nCount)
	elseif (mapid == 339) then
		AddStatData("fld_chuan3canjiarenshu", nCount)
	end
end

function EndMission()
	StopMissionTimer(MISSIONID, 28)
	StopMissionTimer(MISSIONID ,29)
	Landing()
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end
end

function OnLeave(RoleIndex)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = RoleIndex
	Msg2MSAll(MISSIONID, GetName().." kh玭g may t� vong trong l骳 甶 thuy襫.")
	SetCreateTeam(1)
	ForbidEnmity(0);
--	SetTaskTemp(200,0);
	SetDeathScript("")
	SetFightState(0)		
	ForbidChangePK(0)
	SetPKFlag(0)
	PlayerIndex = oldPlayerIndex
end

function Landing()
	Msg2MSAll(MISSIONID, "Х n b� B綾 Phong L╪g ч.")
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));		-- by bel 到岸以后发出“消灭水贼”活动的领奖公告
	if (nDate >= jf0904_act_dateS and nDate < jf0904_act_dateE) then
		local szNews = "Quan ph� v� c竎 cao th�  ho祅 t蕋 chi課 d辌h ti猽 di謙 Th駓 T芻, h穣 nhanh ch鉵g giao [Truy C玭g L謓h] cho Thuy襫 Phu  nh薾 thng!";
		AddGlobalNews(szNews);
	end
	
	local tbPlayer = {}
	idx = 0
	for i = 1 , 100 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0)
		
		if (pidx > 0) then
   			tbPlayer[i] = pidx;
 		end
 		
		if (idx == 0) then 
	 		break
	 	end
	 	
	end
	
	worldid= SubWorldIdx2ID(SubWorld)
	
	G_ACTIVITY:OnMessage("FinishFengLingDu",tbPlayer);
	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i]
		camp = GetCamp()
		SetCurCamp(camp)
		SetCreateTeam(1)
		SetDeathScript("")
--		SetTaskTemp(200, 0)
		ForbidEnmity(0);
--============Ph莕 thng khi s� d鬾g l謓h b礽 th駓 t芻 l猲 thuy襫, � c竎 khung gi�: 10:00, 14:00, 16:00, 18:00, 20:00===================================================================================			
		if (check_new_shuizeitask() == 1) then
		local nRuong = CalcFreeItemCellCount() 
		if nRuong < SoLuongRuongTrongNhanThuong then
			Talk(1,"","Kh玭g я "..SoLuongRuongTrongNhanThuong.." rng ch鴄 , kh玭g th� nh薾 thng")
			return 1
		else
			for i = 1,getn(TAB_LBTT) do
			tbAwardTemplet:GiveAwardByList(TAB_LBTT[i], "Ph莕 thng Kim B礽 Phong L╪g ч");
			end
		end
		end
--===============================================================================================	
		local nRuong = CalcFreeItemCellCount() 
			if nRuong < SoLuongRuongTrongNhanThuong then
				Talk(1,"","Kh玭g я "..SoLuongRuongTrongNhanThuong.." rng ch鴄 , kh玭g th� nh薾 thng")
				return 1
			else
				for i = 1,getn(TAB_LBPLD) do
				tbAwardTemplet:GiveAwardByList(TAB_LBPLD[i], "Ph莕 thng Kim B礽 Phong L╪g ч");
				end
			end	
--===============================================================================================		
		local mapid = SubWorldIdx2ID(SubWorld)
		if (mapid == 337) then
			SetLogoutRV(0)
			NewWorld(fld_landingpos(1))
			SetFightState(1)
			DisabledUseTownP(1) -- 限制其进入风陵渡北岸使用回城符
			SetRevPos(175,1)	--设定死亡重生点为西山村
		elseif (mapid == 338) then
			SetLogoutRV(0)
			NewWorld(fld_landingpos(2))
			SetFightState(1)
			DisabledUseTownP(1) -- 限制其进入风陵渡北岸使用回城符
			SetRevPos(175,1)	--设定死亡重生点为西山村
		elseif (mapid == 339) then
			SetLogoutRV(0)
			NewWorld(fld_landingpos(3))
			SetFightState(1)
			DisabledUseTownP(1) -- 限制其进入风陵渡北岸使用回城符
			SetRevPos(175,1)	--设定死亡重生点为西山村
		else
			print("error:i don't know why")
		end
		
	end
	
	ClearMapNpc(worldid)	
	ClearMapTrap(worldid) 
	ClearMapObj(worldid)
end

