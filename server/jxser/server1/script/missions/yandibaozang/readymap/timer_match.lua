-- description	: 比赛定时器
-- author		: wangbin
-- datetime		: 2005-06-04
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")

-- 炎帝宝藏
-- by 小浪多多
-- 2007.10.24
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..

function YDBZ_cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "比赛取消！")
end

-- 开始比赛
function YDBZ_ready_start_match()
	-- 设置为比赛状态
	local oldworld = SubWorld
	SetMissionV(YDBZ_READY_STATE, 3);

	local player_count = GetMSPlayerCount(YDBZ_READY_MISSION);
	local teams_count = GetMissionV(YDBZ_READY_TEAM)
	if (player_count == 0 or teams_count < YDBZ_TEAM_START_LIMIT) then
		-- 取消比赛
		Msg2MSAll(YDBZ_READY_MISSION,"Do v� t� i kh玭g , kh玭g th� m� b秓 t祅g Vi猰 д")
		YDBZ_cancel_match();
	else
		broadcast("Ho箃 ng b秓 t祅g Vi猰 д  ch輓h th鴆 b総 u, c竎 cao th� 產ng trong tr筺g th竔 thi u");
		SubWorld = oldworld
		YDBZ_ready_start_missions(YDBZ_MAP_MAP, SubWorld,YDBZ_MISSION_MATCH,YDBZ_READY_MISSION);	
		
		-- 启动比赛结束定时器
--		YDBZ_start_close_timer();
		
		-- 通告
		SubWorld = oldworld
		

		-- 初始化变量
--		SetMissionV(VARV_NPC_BATCH, 1);	-- 怪的批次
--		SetMissionV(VARV_MISSION_RESULT, 0);
--		SetMissionV(VARV_PLAYER_USE_INDEX, 0);
--		SetMissionV(VARV_NPC_USE_INDEX, 0);
		
--		-- 保存玩家信息
--		save_player_info();
--    	
--		-- 清理地图
		SetMissionV(YDBZ_READY_STATE, 0);
		SetMissionV(YDBZ_READY_TEAM, 0);
		--YDBZ_ready_close_match()
--    	
--		-- 生成第1批怪
--		create_batch_npc(1);
	end
	
	-- 设置玩家数量
	--SetMissionV(VARV_PLAYER_COUNT, player_count);
	YDBZ_ready_close_match_timer()
	YDBZ_ready_close_match()
end
function YDBZ_ready_match()
	broadcast(format("Th阨 gian b竜 danh vt 秈 b秓 t祅g vi猰   k誸 th骳, xin m阨 c竎 v� l﹎ nh﹏ s� h穣 chu萵 b� l莕 cu鑙, c遪 %s b総 u.",YDBZ_READY_LIMIT_WAIT));
	Msg2MSAll(YDBZ_READY_MISSION,format("Th阨 gian b竜 danh b秓 t祅g Vi猰 д k誸 th骳, xin m阨 c竎 v� v� l﹎ cao th� chu萵 b� l莕 cu鑙. C遪 <color=yellow>%s gi﹜<color> b総 u tranh 畂箃.",YDBZ_READY_LIMIT_WAIT))
	StartMissionTimer(YDBZ_READY_MISSION, YDBZ_READY_TIMER, YDBZ_READY_LIMIT_WAIT * 18);
	SetMissionV(YDBZ_READY_STATE, 2);
end

function YDBZ_ready_broad_talk()
	local broadstate = GetMissionV(YDBZ_READY_BROAD_STATE)
	local nlimittime = floor((YDBZ_READY_LIMIT_SIGNUP - (broadstate * YDBZ_READY_LIMIT_BROAD))/60)
	Msg2MSAll(YDBZ_READY_MISSION,format("Vt 秈 b秓 t祅g vi猰  c遪 <color=yellow>%s ph髏<color> k誸 th骳 th阨 gian b竜 danh, h穣 nhanh nhanh b竜 danh.",nlimittime))
	SetMissionV(YDBZ_READY_BROAD_STATE,broadstate + 1)
end
-- 关闭比赛定时器
function YDBZ_ready_close_match_timer()
	StopMissionTimer(YDBZ_READY_MISSION, YDBZ_READY_TIMER);
end

function OnTimer()
	local state = GetMissionV(YDBZ_READY_STATE)
	local broadstate = GetMissionV(YDBZ_READY_BROAD_STATE)
	if state == 1 then
		-- 报名结束
		if ( broadstate * YDBZ_READY_LIMIT_BROAD ) >= YDBZ_READY_LIMIT_SIGNUP then
			YDBZ_ready_close_match_timer();
			-- 准备阶段
			YDBZ_ready_match();
			--print("报名结束")
		else
			YDBZ_ready_broad_talk()
		end
	elseif state == 2 then
		--print("准备结束")
		YDBZ_ready_close_match_timer();
		YDBZ_ready_start_match();
	end
--	start_board_timer();
end
