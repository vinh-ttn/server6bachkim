--Storm 活动开始
--Include("\\script\\event\\storm\\function.lua")
--storm_ask2start(gameid)

--Storm 加积分
--Include("\\script\\event\\storm\\function.lua")
--storm_addpoint(gameid, addpoint)

--Storm 加奖励积分（宋金）
--local add_time = 60 * FRAME2TIME / TIMER_1
--Include("\\script\\event\\storm\\function.lua")
--storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

--storm_gettime
--storm_gametime	中加入相关游戏计时

Include("\\script\\event\\storm\\head.lua")

--检查当前是否可以开始活动积分
--返回1表示可以开始，nil为不可以
function storm_can_start(gameid, silent)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end
	
	storm_anotherday()
	
	local str = ""
	if (GetTask(STORM_TASKID_DAY) > STORM_END_DAY) then	--风暴积分系统已经关闭了
		str = "Xin l鏸! H� th鑞g t輈h l騳 Phong Ba  ng l筰."
	elseif (GetLevel() < 50) then	--50级以上
		str = "Xin l鏸! Ъng c蕄 b筺 qu� th蕄, kh玭g th� tham gia ho箃 ng t輈h l騳."
	elseif (storm_valid_game(gameid)) then	--正在活动中
		str = "Trc m総 b筺"..storm_gamename(gameid, "red").." tham gia ho箃 ng khi猽 chi課 Phong Ba. Mau 甶 t輈h l騳 甶觤 甶!"
	elseif (GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT]) >= TB_STORM_TRYTIMES[gameid] or	--该活动尝试次数达到上限
		(GetTask(STORM_TASKID_GAMES) >= 3 and GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT]) == 0)) then	--或参加活动数达到上限（三个）且当前活动没有参加过
		str = "Xin l鏸! H玬 nay b筺 kh玭g th� tham gia"..storm_gamename(gameid, "red").."t輈h l騳 Phong Ba r錳. Ng祔 mai h穣 n 甶!"
	elseif (gameid == 1) then
		local n_timer = tonumber(GetLocalDate("%H%M"))
		if (n_timer > 2245 or n_timer < 200) then	--宋金最后一场
			str = "ngi n tr� qu�, ng祔 mai h穣 n khi猽 chi課 甶!"
		end
	end
	
	if (str ~= "") then
		if (not silent) then
			Say(str, 0)
		end
		return nil
	end
	
	return 1
end

--将此次比赛纳入到风暴积分活动中的对话
function storm_ask2start(gameid, b_nonext)
--	if (storm_can_start(gameid, 1)) then
--		Say("　　风暴活动开放日期为9月8日-10月2日，包括宋金大战、野叟任务链、杀手试炼任务。每天根据你在各个系统中的成绩转化为你的风暴积分（参加条件：50级及以上玩家）。<enter>"..
--		"　　每日积分将在每日<color=red>24：00清空<color>，请在24：00前领取积分奖励。<enter>"..
--		"　　每天<color=red>23：30<color>开始的宋金大战，成绩不计入风暴积分。<enter>"..
--		"　　你现在要开始今天的"..storm_gamename(1, "red").."之风暴挑战吗？", 2,
--		"我已经准备好了/#storm_want2start("..gameid..","..tostring(b_nonext)..")",
--		"我还是下次再开始吧/#storm_goon_start("..gameid..","..tostring(b_nonext)..")")
--		return 1
--	end
	if not b_nonext then
		storm_goon_start(gameid)	--开始具体的活动
	end
	return nil
end

--将此次比赛纳入到风暴积分活动中的对话
function storm_want2start(gameid, b_nonext)
	if (storm_can_start(gameid)) then
		local str = TB_STORM_HELP[gameid]..TB_STORM_DIALOG[gameid]
		if (gameid == 1) then	--宋金大战需要额外的显示级别和当前积分
			local tb_levelstr = {
				"Trong chi課 trng T鑞g Kim s� c蕄, m鏸 ngi m鏸 ng祔 nh薾 頲 t輈h l騳 Phong Ba cao nh蕋 <color=yellow>80<color> 甶觤.",
				"Trong chi課 trng T鑞g Kim trung c蕄, m鏸 ngi m鏸 ng祔 nh薾 頲 t輈h l騳 Phong Ba cao nh蕋 <color=yellow>90<color> 甶觤.",
				"Trong chi課 trng T鑞g Kim cao c蕄, m鏸 ngi m鏸 ng祔 nh薾 頲 t輈h l騳 Phong Ba cao nh蕋 <color=yellow>100<color> 甶觤."
			}
			local level = BT_GetGameData(GAME_LEVEL)
			local point = 0
			if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER)) then
				point = GetTask(751)
			end
			str = format(str,tb_levelstr[level],point)
		end
		Say(str, 2,"Ta mu鑞 x竎 nh b総 u/#storm_start("..gameid..",nil,"..tostring(b_nonext)..")","ьi m閠 l竧 甶!/#storm_goon_start("..gameid..","..tostring(b_nonext)..")")
		return 1
	end
	return nil
end

--开始某一活动的计分
--gameid：	1~10	活动的ID
--返回值：	1启动成功	nil启动失败
function storm_start(gameid, silent, b_nonext)
	if (not storm_can_start(gameid, silent)) then	--不能开始该活动
		return nil
	end
	
	local nowtime = storm_gettime(gameid)
	if (nowtime == 0) then
		Say("Hi謓 t筰"..storm_gamename(gameid, "red").."ho箃 ng ch璦 b総 u, i m閠 l竧 quay l筰 甶!", 0)
	end
	
	local gamemode = 0
	--部分活动特殊要求
	if (gameid == 1) then
		local ruleid = BT_GetGameData(GAME_RULEID)
		local sjmode = 0
		if (ruleid == 16) then	--元帅模式
			sjmode = 3
		elseif (ruleid == 20) then	--杀戮模式
			sjmode = 4
		elseif (ruleid == 11) then
			local tempSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(BT_GetGameData(GAME_MAPID))
			sjmode = GetMissionV(2)	--1、固定夺旗；2、随即夺旗
			SubWorld = tempSubWorld;
		end
		local level = BT_GetGameData(GAME_LEVEL)
		if (sjmode == 0 or level == 0) then
			Say("Xin l鏸! Ch璦 x竎 nh 頲 phng th鴆, kh玭g th� b総 u khi猽 chi課 Phong Ba, xin li猲 h� GM  gi秈 quy誸!", 0)
			return nil
		end
		gamemode = sjmode*10+level
	elseif (gameid == 2) then
		gamemode = map_isadvanced[SubWorldIdx2ID(SubWorld)]
		if (gamemode == nil) then
			Say("Xin l鏸! Ch璦 x竎 nh 頲 ng c蕄 s竧 th�, kh玭g th� b総 u khi猽 chi課 Phong Ba, xin li猲 h� GM  gi秈 quy誸!", 0)
			return nil
		end
	elseif (gameid == 4) then
		TM_SetTimer(STORM_TIMER_YS*60*18, STORM_TIMERID_YS, 60/STORM_TIMER_YS, 2)
	end
	
	--活动种类计数
	local trycount = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT])
	if (trycount == 0) then	--今天第一次进行这个活动，增加活动计数
		SetTask(STORM_TASKID_GAMES, GetTask(STORM_TASKID_GAMES) + 1)
	end
	
	--初始化变量
	nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START], nowtime)
	nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT], trycount + 1)
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX], 0)
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR], 0)
	if (gameid ~= 2) then	--杀手试炼不清除原始成绩
		SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA], 0)
	end
	
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE], gamemode)	--游戏当前模式
	
	Msg2Player(storm_gamename(gameid).."khi猽 chi課 Phong Ba b総 u r錳.")
	debug_out(storm_gamename(gameid).."H譶h th鴆 chi ti誸:"..gamemode)
	
	if (tonumber(GetLocalDate("%H")) == 23) then
		local str = "Ch� �: T輈h l騳 Phong Ba h玬 nay s� m蕋 hi謚 d鬾g v祇 l骳 24h:00 (l蕐 gi� tr猲 Server l祄 chu萵) , xin k辮 th阨 nh薾 ph莕 thng c馻 m譶h!"
		Talk(1, "", str)
		Msg2Player(str)
	end
	
	if (gameid == 4) then
		storm_add_pointex(4, 40)
	end

	if not b_nonext then
		storm_goon_start(gameid)	--开始具体的活动
	end
	return 1
end

--重新计算当日总积分，如果有变化，则同时记录日、周、月积分
--如果gameid不为nil，则为指定的活动改变积分
function storm_calc_today(gameid, newpoint)
	if (gameid ~= nil and TB_STORM_TASKID[gameid] ~= nil) then	--改变指定的活动积分
		local gamemode = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE])
		if (gameid == 1) then	--宋金积分上限
			local level = mod(gamemode, 10)
			if (level == 1 and newpoint > 80) then	--初级80分
				newpoint = 80
			elseif (level == 2 and newpoint > 90) then	--中级90分
				newpoint = 90
			end
		elseif (gameid == 2) then	--杀手积分上限
			if (gamemode ~= 1 and newpoint > 90) then	--初级90分
				newpoint = 90
			end
		end
	
		--if (newpoint == GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR])) then	--积分无变化，直接返回
			--return
		--end
		SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR], newpoint)
		local pointmax = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX])
		if (newpoint >= pointmax) then	--超过当日最高分记录，改变最高分
			pointmax = newpoint
		end
		local str = "Trc m総 b筺"..storm_gamename(gameid).."t輈h l騳 Phong Ba i l�:"..storm_point2str(newpoint)
		if (TB_STORM_TRYTIMES[gameid] > 1) then	--该活动可以进行多次
			str = str..", th祅h t輈h t鑤 nh蕋 trong ho箃 ng h玬 nay c馻 b筺 l�:"..storm_point2str(pointmax)
		end
		debug_out(str)
		--if (pointmax == GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX])) then	--最高分没有改变，直接返回
			--return
		--end
		nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX], pointmax)
	end

	local todaypoint = 0
	--计算所有活动总积分
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i] ~= nil) then
			local point = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
			if (point > 0) then
				todaypoint = todaypoint + point
			end
		end
	end

	--记录当日、本周、本月积分
	local addpoint = todaypoint - GetTask(STORM_TASKID_DAY_POINT)	--本日积分增长
	if (addpoint ~= 0) then
		if (gameid ~= 1 or (floor(todaypoint/5) > floor((todaypoint-addpoint)/5))) then	--宋金要总分增加超过5分，告知积分情况
			Msg2Player("T輈h l騳 Phong Ba trc m総 c馻 b筺 l�:"..storm_point2str(todaypoint))
		end
		
		nt_settask(STORM_TASKID_DAY_POINT, todaypoint)
		local weekpoint = GetTask(STORM_TASKID_WEEK_POINT) + addpoint
		nt_settask(STORM_TASKID_WEEK_POINT, weekpoint)
		local monthpoint = GetTask(STORM_TASKID_MONTH_POINT) + addpoint
		nt_settask(STORM_TASKID_MONTH_POINT, monthpoint)
		
		local playername = GetName()
		local weekid = GetTask(STORM_TASKID_WEEK) - STORM_LADDER_WEEK
		if(weekid >= 0 and weekid <= 3) then 	--暂时只有4周排行
			Ladder_NewLadder(STORM_LADDERID_WEEK1 + weekid, playername, weekpoint, 1);
		end
		Ladder_NewLadder(STORM_LADDERID_MONTH, playername, monthpoint, 1);
		
		debug_out("T輈h l騳 h玬 nay:"..storm_point2str(todaypoint).."; tu莕 n祔:"..storm_point2str(weekpoint).."; th竛g n祔:"..storm_point2str(monthpoint))	--temp
	end
end

--算积分函数
function storm_calc_point(tb_point, pointorg)
	local newpoint = 0
	for i = 1, getn(tb_point) do
		if (pointorg >= tb_point[i][2]) then
			if (i <= 1) then
				newpoint = tb_point[i][1]
			else
				newpoint = tb_point[i][1] + floor((pointorg - tb_point[i][2])*(tb_point[i-1][1] - tb_point[i][1])/(tb_point[i-1][2] - tb_point[i][2]))
			end
			break
		end
	end
	return newpoint
end

--计算并记录某一活动的当前积分（累加）
--gameid：	1~10	活动的ID
--addpoint：活动增加分
--返回值：	1计分成功	0计分失败
function storm_addpoint(gameid, addpoint)
	--检查当前活动是否有效，且addpoint大于0
	if (not storm_valid_game(gameid) or addpoint <= 0) then
		return nil
	end
	
	--根据不同的gameid，选择不同的积分表来计算积分
	local newpoint = 0
	local pointorg = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA]) + addpoint	--活动原始分
	local gamemode = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE])
	if (gameid == 1) then
		local sjmode = floor(gamemode/10)
		local sjlevel = mod(gamemode,10)
		local tb_sjmode = {"箃 c� c� nh", "箃 c� ng蓇 nhi猲", "D筺g th鴆 nguy猲 so竔", "D筺g th鴆 C鮱 s竧"}
		local tb_sjlevel = {" (S�) ", " (Trung) ", " (Cao) "}
		debug_out("觤 t輈h l騳 ban u [<color=blue>Chi課 trng T鑞g Kim-"..tb_sjmode[sjmode]..tb_sjlevel[sjlevel].."<color>] c馻 b筺 l�:"..storm_point2str(pointorg))	--temp
		newpoint = storm_calc_point(TB_STORM_POINT[1][sjmode], pointorg)
	elseif (gameid == 2) then
		local pointorg = pointorg - addpoint
		debug_out("l莕 n祔"..storm_gamename(gameid).."c遪 d� th阨 gian l�:"..storm_point2str(addpoint)..", k� l鬰 c�:"..pointorg)
		if (addpoint > pointorg) then	--此次剩余时间更多
			pointorg = addpoint
		end
		newpoint = storm_calc_point(TB_STORM_POINT[gameid], addpoint)
	else
		debug_out("c馻 b筺"..storm_gamename(gameid).."觤 t輈h l騳 ban u:"..storm_point2str(pointorg))	--temp
		newpoint = storm_calc_point(TB_STORM_POINT[gameid], pointorg)
	end
	
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA],pointorg)	--保存活动原始分
	newpoint = newpoint + GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX])	--加上奖励积分
	storm_calc_today(gameid, newpoint)	--计分
	return 1
end

--计算并记录某一活动的当前积分（更新，取历史最好值）
--gameid：	1~10	活动的ID
--addpoint：活动增加分
--返回值：	1计分成功	0计分失败
function storm_newpoint(gameid, newpoint)
	--根据不同的gameid，选择不同的积分表来计算积分
	local newpoint = 0
	local oldpoint = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA])	--活动原始分
	local gamemode = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE])
	debug_out("l莕 n祔"..storm_gamename(gameid).."甶觤 s�:"..storm_point2str(addpoint)..", 甶觤 ban u:"..pointorg)
	if (newpoint < oldpoint) then	--此次得分更低
		newpoint = oldpoint
	else
		SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA], newpoint)	--保存活动原始分
	end
	
	local stormpoint = storm_calc_point(TB_STORM_POINT[gameid], newpoint)	--算积分
	stormpoint = stormpoint + GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX])	--加上奖励积分
	storm_calc_today(gameid, stormpoint)	--计分
	
	return 1
end

--增加奖励积分
--gameid：	1~10	活动的ID
--addpoint：增加的积分
function storm_add_pointex(gameid, addpoint)
	--检查当前活动是否有效
	if (not storm_valid_game(gameid)) then
		return nil
	end
	
	local pointex = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX]) + addpoint
	
	if (pointex > 40) then	--最多40奖励分
		addpoint = addpoint - (pointex - 40)
		pointex = 40
	end
	
	if (addpoint <= 0) then	--不是正的，直接返回
		return nil
	end
	
	Msg2Player("B筺 t 頲"..storm_gamename(gameid).."Ph莕 thng tham gia - t輈h l騳 Phong Ba"..storm_point2str(addpoint).."ph髏")

	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX], GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX]) + addpoint)	--记录附加分

	storm_calc_today(gameid, GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR]) + addpoint)	--记录该活动积分、并计算今日总分等

	return 1
end

--在适当的时候为Mission中所有成员增加奖励积分
--gameid：	1~10	活动的ID
--msid：	Mission ID
--time：	当time是10、20、30时有效
function storm_addm_mspointex(gameid, msid, time)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end
	
	local addpoint = 0
	if (time == 10) then
		addpoint = 10
	elseif (time == 20) then
		addpoint = 10
	elseif (time == 30) then
		addpoint = 20
	else
		return nil
	end
	
	local orgindex = PlayerIndex
	local idx = 0;
	for i = 1, 500 do 
		idx, PlayerIndex = GetNextPlayer(msid, idx, 0);
		if PlayerIndex> 0 then
			storm_add_pointex(1, addpoint)
		end
		if (idx == 0) then 
			break
		end;
	end
	PlayerIndex = orgindex
	
	return 1
end

function storm_clear(gameid)
	if (gameid == nil) then
		Msg2Player("X鉧 h誸 c竎 tin t鴆 t輈h l騳 c馻 nh﹏ v藅 n祔!")
		--清任务变量
		SetTask(1550,0);	--杀手进行次数
		SetTask(1036,0);	--野叟取消次数
		for i = 1661, 16710 do
			SetTask(i,0);
		end
	else
		if (TB_STORM_TASKID[gameid] == nil) then
			Msg2Player("error gameid!")
			return nil
		end
		Msg2Player("X鉧 h誸 nh﹏ v藅"..storm_gamename(gameid).."tin t鴆 t輈h l騳!")
		if (GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT]) > 0) then	--参与过，减参与活动数
			SetTask(STORM_TASKID_GAMES, GetTask(STORM_TASKID_GAMES) - 1)
		end
		--减积分
		local gamepoint = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX])
		SetTask(STORM_TASKID_DAY_POINT, GetTask(STORM_TASKID_DAY_POINT) - gamepoint)
		SetTask(STORM_TASKID_WEEK_POINT, GetTask(STORM_TASKID_WEEK_POINT) - gamepoint)
		SetTask(STORM_TASKID_MONTH_POINT, GetTask(STORM_TASKID_MONTH_POINT) - gamepoint)
		--清任务变量
		if (gameid == 2) then
			SetTask(1550,0);	--杀手进行次数
		elseif (gameid == 4) then
			SetTask(1036,0);	--野叟取消次数
		end
		for i = 1, getn(TB_STORM_TASKID[gameid]) do
			SetTask(TB_STORM_TASKID[gameid][i],0);
		end
	end
	--改排行
	local weekid = GetTask(STORM_TASKID_WEEK) - STORM_LADDER_WEEK
	if (weekid >= 0 and weekid <= 3) then
		Ladder_NewLadder(10182+weekid, GetName(), GetTask(STORM_TASKID_WEEK_POINT), 0)
	end
	Ladder_NewLadder(10186, GetName(), GetTask(STORM_TASKID_MONTH_POINT), 0)

	--同步TaskValue
	SyncTaskValue(STORM_TASKID_DAY_POINT)
	SyncTaskValue(STORM_TASKID_DAY_LASTPOINT)
	SyncTaskValue(STORM_TASKID_WEEK_POINT)
	SyncTaskValue(STORM_TASKID_WEEK_LASTPOINT)
	SyncTaskValue(STORM_TASKID_MONTH_POINT)
	SyncTaskValue(STORM_TASKID_MONTH_LASTPOINT)
	SyncTaskValue(STORM_TASKID_DATE)
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i]) then
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_START])
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
		end
	end
end

--开始具体活动的函数，这里暂定一个空函数
function storm_goon_start(gameid)
end