if (1) then -- not __FESTIVAL_HEAD__) then
	__FESTIVAL_HEAD__ = 1;
	
	IncludeLib("BATTLE");
	Include("\\script\\missions\\tong\\tong_springfestival\\npcpoint.lua");
	Include("\\script\\lib\\common.lua")
	Include("\\script\\lib\\gb_taskfuncs.lua")
	Include("\\script\\missions\\tong\\tong_head.lua");
	
	--常值部分
	SF_PREPAREMISSIONID = 39;
	SF_MISSIONID = 40;
	
	SF_FRAME = 18;	--每秒18帧
	SF_REFRASHTIME = 15 * SF_FRAME; -- 每15秒钟刷一次怪
	SF_VANISHTIME = 10 * SF_FRAME;	--圣诞精灵停留10秒钟
	SF_RUNINTERVER = 30 * SF_FRAME; --30秒一次，可以公告游戏
	SF_MAXPLAYTIMES = 5; --每人最多一天玩5次
	SF_LEVELLIMIT = 50; --玩家参加需要的最小级别
	
	SF_PREPARETIME = 68; --准备场计时器
	SF_FAIRY_SMALLTIMERID = 69;	--刷怪计时器
	SF_REPORT_SMALLTIMERID = 70;	--RunMission用的计时器；
	SF_INTERVER = 5 * SF_FRAME;	--5秒钟触发刷怪和清楚怪触发器
	
	--GLB值
	GLB_SF_PHASE = 853; --春节活动的时间
	--===============和怪相关==================
	SF_NPCID = 361;	--刷出怪的NCP index
	SF_MAPID = {823, 824};	--圣诞活动地图Id
	
	SF_SMALLMAPCOUNT = 19;	--一共有12张小地图
	SF_MOUSECOUNT_MIN = 10;	--一个小地图一次最少刷地鼠数目
	SF_MOUSECOUNT_MAX = 10;	--一个小地图一次最多刷地鼠数目
	SF_MAXPLAYERCOUNT = 10;	--每个游戏最多10个人；
	SF_NIANSHOU_XUANYUN = 10;   --年兽每被攻击10次就被眩晕
	SF_ALL_MAXPLAYERCOUNT = 100; --一共最多120人；
	--=========================================
	
	--=========任务变量===============
--	TK_LEAVERMAPID = 2402;	--存储明月镇的mapid
--	TK_LEAVERPOSX = 2403;	--存储离开游戏的x坐标点
--	TK_LEAVERPOSY = 2404;	--存储离开游戏的y坐标点
	
	SF_TK_DAYKEY = 2405;	--记录是哪一天
	SF_TK_PLAYTIMES = 2406; --记录一天内玩的次数

	SF_COUNT_ONETIME = 2407;	--记录一场点了多少个	
	SF_TK_RANK = 2408;		--记录一场的排名；

--	TK_GROUPID = 2409;	--记录玩家的Group号
--	TK_EXP_BEISHU = 2410; -- 获得经验的倍数
--	TK_EXP_TIME = 2411;  -- 获得双倍的时间
--	
	TK_ATTACKED_TIMES = 2412;    --记录年兽被攻击的次数
	TK_ATTACKED_INTERVER = 2413;     --普通玩家使用道具间隔
	
	--================================
	
	--MS部分；
	MS_SF_STATE = 1;
	MS_SF_TIMERSTATE = 2; --用来记录用于交替的进行刷怪和清除怪：0－清除怪；1－刷出怪
	MS_SF_NEWSVALUE = 3; --
	MS_SF_BEGINGMAPID = 10; --记录开始的地图的ID
	MS_SF_PREPARENEWSVALUE = 5; --准备场计时变量
	MS_SF_GAMECOUNT = 6;    --  记录一场开始的游戏的个数
	--常量部分；
	FESTIVAL_SHREWMOUSE = "TONG_SPFESTIVAL";
	SF_ANIMALNAME = "Qu竔 th� ";
	SF_MOUSENAME = "a tr� m蕋 t輈h"; --圣诞精灵的名字
	SF_GIFTNAME = "L� v藅  l筰";       --礼物NPC的名字
	SF_SIGNNPCNAME = "<color=yellow>T鎛g qu秐 Ho箃 ng phng<color>: ";    --报名圣诞老人的名字
	SF_MAPPOINTFLORDER = "springfestival2006";
	FESTIVAL_OK = 1;    --设置状态肯定表示
	FESTIVAL_NO = 0;    --设置状态否定表示
	FESTIVAL_ENTERSPEED = 16; --进行游戏的玩家的速度
	FESTIVAL_LEAVERSPEED = -1; --离开游戏的玩家的速度
	
	--播撒圣诞精灵
	function festival_putfairy()
		local nNPCCount;
		local PosTab;	--用于记录
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(SF_MAPID[2])
		local scriptfile = "\\script\\missions\\tong\\tong_springfestival\\npcs\\festival_shrewmouse.lua";
		
		local nBeginID = GetMissionV(MS_SF_BEGINGMAPID) + 1;
		local nGameCount = GetMissionV(MS_SF_GAMECOUNT);
		local nLoopLimit = nBeginID + nGameCount - 1;
		
		for i = nBeginID, nLoopLimit do
		    if (i > SF_SMALLMAPCOUNT) then
		        j = mod(i, SF_SMALLMAPCOUNT);
		    else
		        j = i;
		    end;
			nNPCCount = random(SF_MOUSECOUNT_MIN, SF_MOUSECOUNT_MAX);
			local PosFile = format("\\settings\\maps\\%s\\elf_%d.txt", SF_MAPPOINTFLORDER, j);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, SF_NPCID, SF_MOUSENAME)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--清除圣诞精灵
	function festival_clearfairy(szNPCName)
	    if ("string" ~= type(szNPCName)) then
	        return
	    end;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(SF_MAPID[2]);
		ClearMapNpcWithName(SF_MAPID[2], szNPCName);     --将所有的年兽清除
		SubWorld = OldWorld;
	end;
	
	--加入到游戏中
	function joinspringfestival(nTongID, nWorkshopID)
		local nNowTime = tonumber(GetLocalDate("%y%m%d"));
		if (GetTask(SF_TK_DAYKEY) ~= nNowTime) then
			SetTask(SF_TK_DAYKEY, nNowTime);
			SetTask(SF_TK_PLAYTIMES, 0);
		end;
		
		--进行计数
		local nTimes = GetTask(SF_TK_PLAYTIMES);
		if (nTimes >= SF_MAXPLAYTIMES) then
			Talk(1, "", SF_SIGNNPCNAME.."H玬 nay ngi  n 5 l莕 r錳, hay l� ngh� m謙 ch髏 甶!");
			return
		end;
		
		if (GetLevel() < SF_LEVELLIMIT) then
			Talk(1, "", SF_SIGNNPCNAME.."Ъng c蕄 c馻 ngi qu� th蕄, ta kh玭g mu鑞 ngi g苝 nguy hi觤, ch� n c蕄 50 r錳 quay l筰.");
			return
		end;
		
		local nPhase = gb_GetTask(FESTIVAL_SHREWMOUSE, 1);
		if (nPhase ~= 1) then
			if (nPhase == 3) then
				Talk(1, "", "T鎛g qu秐 Ho箃 ng phng: H穣 t i ho箃 ng sau. B総 u v祇 1h, 4h, 7h厖22h, v祇 ph髏 th� 15, 30, 45 b総 u cho b竜 danh.");
				return
			end;
			Talk(1, "", "T鎛g qu秐 Ho箃 ng phng: Ho箃 ng nh ni猲 th� 產ng di詎 ra, h穣 i t sau v藋. M鏸 t b総 u l骳 1h, 4h, 7h厖22h, v祇 ph髏 th� 15, 30, 45 b総 u cho b竜 danh.");
			return
		end
		
		--进行帮会相关的判断
		if (festival_tongjudge(2, nTongID, nWorkshopID) == 0) then
			return
		end;

		local ww, xx, yy = GetWorldPos();
		SetTask(TK_LEAVERMAPID, ww);
		SetTask(TK_LEAVERPOSX, xx);
		SetTask(TK_LEAVERPOSY, yy);
		local szFile = format("\\settings\\maps\\%s\\player.txt", SF_MAPPOINTFLORDER);
		local nPosX, nPosY;
		nPosX, nPosY = getadatabetween(szFile, 2, 15);
		NewWorld(SF_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--游戏结束
	function festival_gameover(nMapID, nMissionID)
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(nMapID);
		
		local pidx;
		local idx = 0;
		
		local OldPlayer = PlayerIndex;
		local tabPlayer = {};
		local i;
		for i = 1, 400 do
			idx, pidx = GetNextPlayer(nMissionID, idx, 0);
			if (pidx > 0) then
				tabPlayer[i] = pidx;
			end;
			
			if (0 == idx) then
				break;
			end;
			
		end;
		
		local nLoop = getn(tabPlayer);
		for i = 1, nLoop do
			PlayerIndex = tabPlayer[i];
			festival_setplayerleaverstate();
			NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--检察自己的状态
	function festival_get_exptimes()
		local exp_time = GetTask(TK_EXP_TIME)
		local gametime = GetGameTime()
		local nBeishu = GetTask(TK_EXP_BEISHU);
		if (exp_time == 0 or exp_time + 30 <= gametime) then
			return 1
		elseif (nBeishu ~= 2 or nBeishu ~= 4) then
			return 1
		else
			Msg2Player(nBeishu.." l莕");
			return nBeishu;
		end
	end
	
	function festival_setplayertoprepare()	--玩家进入准备场
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);
		
		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
		SetTaskTemp(200, 1);
		--设置战斗状态
		SetFightState(FESTIVAL_NO);
		--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
		SetLogoutRV(FESTIVAL_OK);
		--无死亡惩罚
		SetPunish(FESTIVAL_NO);
		--关闭组队功能
		SetCreateTeam(FESTIVAL_NO);
		
		--禁止光环
		ForbitAura(FESTIVAL_OK)
		--设置仇杀
		ForbidEnmity(FESTIVAL_OK)
		--打开PK开关 

		--开始应该都不能PK
		SetPKFlag(FESTIVAL_NO)
		--禁止交易;
		DisabledStall(FESTIVAL_OK);
		ForbitTrade(FESTIVAL_NO);
		
		ForbidChangePK(FESTIVAL_OK);
		DisabledUseTownP(FESTIVAL_OK);	--禁止使用回程；
	end;
	
	function festival_setplayerleaverstate()	--玩家离开游戏时候
		ForbitSkill(FESTIVAL_NO);
		SetMoveSpeed(FESTIVAL_LEAVERSPEED);
		
		RestoreOwnFeature();    --将所有人变成原来样子
		local i;
		for i = 1035, 1048 do
            ConsumeItem( -1, 1000, 6, 1, i, 1 );
        end;
		
		--禁止光环
		ForbitAura(FESTIVAL_NO)
		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
		SetTaskTemp(200,0);
		--设置战斗状态
		SetFightState(FESTIVAL_NO);
		--无死亡惩罚
		SetPunish(FESTIVAL_OK);
		--关闭组队功能
		SetCreateTeam(FESTIVAL_NO);
		--打开PK开关 
		
		--设置仇杀
		ForbidEnmity( FESTIVAL_NO )
		--开始应该都不能PK
		SetPKFlag(FESTIVAL_NO)
		--禁止交易;
		DisabledStall(FESTIVAL_NO);
		ForbitTrade(FESTIVAL_NO);
		
		local nCamp = GetCamp();
		SetCurCamp(nCamp);
		
		ForbidChangePK(FESTIVAL_NO);
		DisabledUseTownP(FESTIVAL_NO);	--禁止使用回程；
	end;
	
	function festival_setplayertogame()	--玩家进入游戏
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);
		
		
		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
		SetTaskTemp(200,1);
		
		SetTask(SF_TK_PLAYTIMES, GetTask(SF_TK_PLAYTIMES) + 1);
		--设置战斗状态
		--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
		SetLogoutRV(FESTIVAL_OK);
		
		--禁止光环
		ForbitAura(FESTIVAL_OK)
		SetFightState(FESTIVAL_OK);
		--无死亡惩罚
		SetPunish(FESTIVAL_NO);
		--关闭组队功能
		SetCreateTeam(FESTIVAL_NO);
		--打开PK开关 

		--设置仇杀
		ForbidEnmity( FESTIVAL_OK )
		--开始应该都不能PK
		SetPKFlag(FESTIVAL_OK)
		--禁止交易;
		DisabledStall(FESTIVAL_OK);
		ForbitTrade(FESTIVAL_NO);
		
		ForbidChangePK(FESTIVAL_OK);
		SetCurCamp(1);	--设置临时阵营
		DisabledUseTownP(FESTIVAL_OK);	--禁止使用回程；
	end;

	--生成一个相对于当前玩家的选项
	function make_option(szFunName)
		local szName = GetName()
		return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
	end

	--检查该玩家是否仍在游戏中，成功返回PlayerIndex否则返回nil
	function festival_check_pl(szPlayName)
		local nPlIdx = SearchPlayer(szPlayName)	--玩家是否在当前服务器
		if (nPlIdx > 0) then
			local nPlMsIdx = PIdx2MSDIdx(SF_MISSIONID, nPlIdx)	--玩家是否在指定Mission中
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
	--检查道具是否可以被使用
	function itemuseplacecheck(nType)   --nType :1——公共道具；2——年兽专用道具；3——普通玩家专业道具
    
	    if (GetTask(TK_GROUPID) <= SF_SMALLMAPCOUNT and 2 == nType) then
    	    Talk(1, "", "Ch� c� ngi ch琲 Qu竔 th� m韎 c� th� s� d鬾g M苩 n� n祔");
	        return 0;
	    end;
	    
	    if (GetTask(TK_GROUPID) > SF_SMALLMAPCOUNT and 3 == nType) then
    	    Talk(1, "", "Ch� c� ngi ch琲 b譶h thng m韎 s� d鬾g 頲 v藅 ph萴 n祔.");
	        return 0;
	    end;
	    
	    return 1
	end;
	--找到对立阵营，年兽——>玩家，玩家——>年兽
	function festival_getgroupid(nGroupId)
	    if (nGroupId < 1) then
	        return nil
	    end;
	    
	    if (nGroupId > SF_SMALLMAPCOUNT) then
	        return nGroupId - SF_SMALLMAPCOUNT;
	    else
	        return nGroupId + SF_SMALLMAPCOUNT;
	    end;
	end;
	
	function festival_go_other_place()  --随机传到起始点
	    local nBeginMapID = GetMissionV(MS_SF_BEGINGMAPID);
    	local nGroupId = GetTask(TK_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, SF_SMALLMAPCOUNT) + 1;
    	local szFile = format("\\settings\\maps\\%s\\elf_%d.txt", SF_MAPPOINTFLORDER, nMapId);
    	local PosX, PosY = getadata(szFile);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_go_back(nBeginMapID)  --随机传到起始点
    	local nGroupId = GetTask(TK_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, SF_SMALLMAPCOUNT) + 1;
    	local szFile = format("\\settings\\maps\\%s\\player.txt", SF_MAPPOINTFLORDER);
		local PosX, PosY = getadatabetween(szFile, 8 + 8 * nMapId, 15 + 8 * nMapId);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_checkinterver()
	    local gametime = GetGameTime();
	    if (GetTask(TK_ATTACKED_INTERVER) > gametime) then
	        return 0;
	    else
	        SetTask(TK_ATTACKED_INTERVER, gametime + 2);
	        return 1;
	    end;
	end;
end;
