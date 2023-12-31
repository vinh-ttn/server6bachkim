-- 文件名　：event.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-01-17 14:48:26
--队长组队(8人) 跟 NPC北斗老人对话以及接受任务
Include("\\script\\event\\springfestival08\\lib\\compose.lua")
Include("\\script\\event\\springfestival08\\lib\\addaward.lua")
Include("\\script\\event\\springfestival08\\allbrother\\taskhead.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\lib\\log.lua")
allbrother_0801_tbLingPai = 
	{
		{szName="Thi猲 Xu L謓h", tbProp={6, 1, 1643, 1, 0, 0}, },
		{szName="Thi猲 To祅 L謓h", tbProp={6, 1, 1644, 1, 0, 0}, },
		{szName="Thi猲 C� L謓h", tbProp={6, 1, 1645, 1, 0, 0}, },
		{szName="Thi猲 Quy襫 L謓h", tbProp={6, 1, 1646, 1, 0, 0}, },
		{szName="Ng鋍 Ho祅h L謓h", tbProp={6, 1, 1647, 1, 0, 0}, },
		{szName="Khai Dng L謓h", tbProp={6, 1, 1648, 1, 0, 0}, },
		{szName="Dao Quang L謓h", tbProp={6, 1, 1649, 1, 0, 0}, },
		{szName="Th蕋 Tinh L謓h", tbProp={6, 1, 1650, 1, 0, 0}, },
	}

function allbrother_0801_main()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	
	
	if allbrother_0801_IsAct() ~= 1 then
		Say(format("Xin l鏸, <color=yellow>%s<color> ho箃 ng  k誸 th骳, 產 t�  tham gia ho箃 ng.",allbrother_0801_szActName), 0)
		return 0;
	end
	
	local szTitle = "Xin ch祇, t筰 h� l� truy襫 nh﹏ c馻 B綾 u M玭, ch糿g hay c竎 h� c莕 g�?";
	local tbOpt = 
	{
		"T筰 h� v� c竎 huynh  mu鑞 ti誴 nh薾 nhi謒 v�./allbrother_0801_WantTask",
		"T筰 h�  ho祅 th祅h nhi謒 v� c馻 ti襫 b鑙./allbrother_0801_TaskPersonTaskAward",
		"T筰 h� c飊g c竎 huynh   ho祅 th祅h nhi謒 v� c馻 ti襫 b鑙./allbrother_0801_TeamTaskAward",
		"Th藅 竬 n竬, phi襫 l穙 n鉯 l筰 1 l莕 n鱝 nhi謒 v�./allbrother_0801_QueryPersonTask",
		"T筰 h� kh玭g th� ho祅 th祅h nhi謒 v� c� nh﹏ l莕 n祔./allbrother_0801_CancelTask",
		"T筰 h� c竜 t�./OnCancel"
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

--某个人执行某个函数
function allbrother_0801_PlayerDo(nPlayerIdx,fun,...)
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIdx
	local re = call(fun, arg);
	PlayerIndex = nOldPlayer;
	return re
end

--查询个人任务
function allbrother_0801_QueryPersonTask()
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	if allbrother_0801_CheckTaskState() == 0 then
		Say("C竎 h� v蒼 ch璦 nh薾 nhi謒 v�.", 0)
	else
		if nTaskState > 1073741824 then
			nTaskState = nTaskState - 1073741824
		end
		Say(format("Nhi謒 v� hi謓 t筰 l�: %s", allbrother_0801_tbTaskList[nTaskState].szShow), 0)
	end
	
end

--队伍想接任务
function allbrother_0801_WantTask()
	local nTeamSize = GetTeamSize()
	local i
	if IsCaptain() ~= 1 then
		Say("Vi謈 n祔厖 Phi襫 c竎 h� nh� i trng c飊g ta b祅 chuy謓.", 0)
		return 0;
	end
	if nTeamSize < allbrother_0801_TeamSizeLimit then
		Say(format("S� th祅h vi猲 trong t� i kh玭g , xin h穣 chi猽 m� th猰 <color=yellow>%d<color> ngi n鱝 r錳 quay l筰 y ta giao cho nhi謒 v�.", allbrother_0801_TeamSizeLimit-nTeamSize), 0)
		return 0;
	end
	for i=1,nTeamSize do
		if not allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_islvl50) then
			Say("T� i c馻 b筺 c� ngi ng c蕄 ch璦 t 50 ho芻 ch璦 n筽 th�, kh玭g th� ti誴 nh薾 nhi謒 v�.", 0)
			return 
		end
	end
	
	local nCount = allbrother_0801_CheckTeamTaskState();
	local tbTeamTask = {}
	if nCount == nTeamSize then
		for i=1,nTeamSize do
			local nTaskId = random(1,getn(allbrother_0801_tbTaskList))
			while tbTeamTask[nTaskId] == 1 do
				nTaskId = random(1,getn(allbrother_0801_tbTaskList))
			end
			tbTeamTask[nTaskId] = 1
			allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_AcceptTask, nTaskId)
		end
	else
		Say("T� i c馻 b筺 c� ngi ch璦 ho祅 th祅h nhi謒 v� ho芻  l祄 h誸 nhi謒 v� r錳 .", 0)
	end
	tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuBacDau")
end


--检查 队伍内每个人的任务状态， 返回没接任务的人数
function allbrother_0801_CheckTeamTaskState()
	local nTeamSize = GetTeamSize()
	local nCount = 0;
	for i=1,nTeamSize do
		nCount = nCount + allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CheckTaskState)
	end
	return nTeamSize-nCount;
end

--检查一个人的任务状态 0为没有任务，非零代表接受了哪种任务，如果任务已经超时，执行取消任务返回0 没有接任务
function allbrother_0801_CheckTaskState()
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskLimit	= GetTask(TSK_allbrother_0801_TaskLimit)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local nDate			= tonumber(GetLocalDate("%y%m%d"))
	
	if nTaskState == 0 then --没有接任务
		if nDate ~= floor(nTaskLimit/256) then --如果不是今天 ，计数清零
			nTaskLimit = nDate * 256
			SetTask(TSK_allbrother_0801_TaskLimit, nTaskLimit)
		end
		if mod(nTaskLimit, 256) < TSKV_allbrother_0801_TaskLimit then --并且今天还能接
			return 0
		else
			Msg2Team(format("%s H玬 nay  ti誴 nh薾 %d l莕 nhi謒 v� c� nh﹏, h玬 sau quay l筰 nh�.", GetName(), TSKV_allbrother_0801_TaskLimit))
			return 1;
		end
	else --接了任务，看是否超时
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --超时
			allbrother_0801_CancelTask()
			Msg2Team(format("%s Х vt qu� th阨 gian quy nh, nhi謒 v� b� h駓 b�.", GetName()))
			Msg2Player(format("%s Х vt qu� th阨 gian quy nh, nhi謒 v� b� h駓 b�.", GetName()))
			return 0;
		else --没有超时，说明已经接了任务
			Msg2Team(format("%s Х ti誴 nh薾 nhi謒 v� c馻 B綾 u L穙 Nh﹏.", GetName()))
			return 1;
		end
	end
end

--一个人接受任务的处理 给他一个nTaskId的任务，并且设置时间，个人任务次数+1
function allbrother_0801_AcceptTask(nTaskId)
	--设置人物身上 n任务状态
	SetTask(TSK_allbrother_0801_TaskState, nTaskId)
	SetTask(TSK_allbrother_0801_TaskLimit, GetTask(TSK_allbrother_0801_TaskLimit)+1)
	SetTask(TSK_allbrother_0801_TaskTime, GetCurServerTime())
	Msg2Player(format("Nh薾 頲 nhi謒 v�: %s", allbrother_0801_tbTaskList[nTaskId].szShow))
end



--队伍取消任务 
function allbrother_0801_TeamCancelTask()
	local nTeamSize = GetTeamSize()
	for i=1,nTeamSize do
		allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CancelTask)
	end
end
--个人取消任务,任务状态设为0
function allbrother_0801_CancelTask()
	if GetTask(TSK_allbrother_0801_TaskState) == 0 then
		Say("Hi謓 t筰, b筺 v蒼 ch璦 c� nhi謒 v� �? Vt qu� th阨 gian quy nh l祄 nhi謒 v� xem nh� nhi謒 v� b� h駓 b�.", 0)
		return 0;
	end
	SetTask(TSK_allbrother_0801_TaskState, 0)
	Msg2Player("H駓 b� nhi謒 v�.")
end

--是否50级
function allbrother_0801_islvl50()
	if GetLevel() >= 50 and IsCharged() == 1 then
		return 1
	else 
		Msg2Team(format("%s Ъng c蕄 ch璦 t 50 ho芻 ch璦 n筽 th�.",GetName()))
	end
end

function allbrother_0801_TaskPersonTaskAward() --
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local nTaskId		= 0;
	if nTaskState == 0 then
		Say("B筺 v蒼 ch璦 ti誴 nh薾 nhi謒 v� n祇 c�.",0)
		return	
	end
	if nTaskState < 1073741824 then
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --超时
			SetTask(TSK_allbrother_0801_TaskState, 0)
			Say("Xin chia bu錸! Th阨 gian tr玦 qua th藅 nhanh, v蒼 ch璦 ho祅 th祅h, nhi謒 v� th蕋 b筰 r錳.", 0)
			return
		end
		nTaskId = nTaskState
		if allbrother_0801_tbTaskList[nTaskId].nTaskType == 0 then 
			local tbAward = {0, allbrother_0801_TaskFindItemAward, 1}
			springfestival08_lib_material_compose({allbrother_0801_tbTaskList[nTaskId].tbList, tbAward, "Ho祅 th祅h nhi謒 v� ", "V藅 ph萴 nhi謒 v� kh玭g ng ho芻 s� lng kh玭g ", "Nhi謒 v� sai"}, "Giao v藅 ph萴")
		else
			Say("Nhi謒 v� v蒼 ch璦 ho祅 th祅h", 0)	
		end
	else
		allbrother_0801_TaskFindNpcAward();
	end
	
	
	
end

function allbrother_0801_TaskFindItemAward(nTaskId)
	if allbrother_0801_CompleteTask() == 1 then
		return allbrother_0801_TaskFindNpcAward()
	end
end

--个人任务领奖，判断任务是否完成，是否超时，然后给物品，任务状态设置为0
function allbrother_0801_TaskFindNpcAward()
	
	local nExpAward = 0;
	local nTransCount = ST_GetTransLifeCount();
	
	if nTransCount == 0 then
		nExpAward = 5000000;
	elseif nTransCount == 1 then
		nExpAward = 9000000;
	elseif nTransCount >= 2 then
		nExpAward = 12000000;
	end
		
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local tbAward = 
	{
		{szName="Ph骳 Duy猲 L� (Чi) ", tbProp={6, 1, 124, 1, 0, 0}},
		{nExp = nExpAward},
	}
	if (nTaskState > 1073741824) then --相当于判断最高位设置是否为1
		SetTask(TSK_allbrother_0801_TaskState, 0)
		--是否超时
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --超时
			Say("Xin chia bu錸! Th阨 gian tr玦 qua th藅 nhanh, v蒼 ch璦 ho祅 th祅h, nhi謒 v� th蕋 b筰 r錳.", 0)
			return
		end
		--给奖励
		springfestival08_lib_AddAward(tbAward[2], allbrother_0801_szActName)
		
		local nCurRate = random(1,100)
		if nCurRate < 20 then
			springfestival08_lib_AddAward(tbAward[1], allbrother_0801_szActName)
		end
		
		nCurRate = random(1,getn(allbrother_0801_tbLingPai))
		springfestival08_lib_AddAward(allbrother_0801_tbLingPai[nCurRate], allbrother_0801_szActName)
		return 1;
	else
		Say("B筺 dng nh� v蒼 ch璦 ho祅 th祅h nhi謒 v�.", 0)
	end
end



function allbrother_0801_TeamTaskAward()
	local nTeamSize = GetTeamSize()
	if IsCaptain() ~= 1 then
		Say("Vi謈 n祔厖 Phi襫 c竎 h� nh� i trng c飊g ta b祅 chuy謓.", 0)
		return 0;
	end
	if nTeamSize < allbrother_0801_TeamSizeLimit then
		Say("Huynh  trong t� i v蒼 ch璦 , xin chi猽 m� th猰 nh�.", 0)
		return
	end
	for i=1,nTeamSize do
		if not allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_islvl50) then
			Say("T� i c馻 b筺 c� ngi ng c蕄 ch璦 t 50 ho芻 ch璦 n筽 th�, kh玭g th� ti誴 nh薾 nhi謒 v�.", 0)
			return 
		end
	end
	local tbAward = {0, allbrother_0801_TeamTaskAwardFun, 1}
	springfestival08_lib_material_compose({allbrother_0801_tbLingPai, tbAward, "Ho祅 th祅h nhi謒 v� ", "V藅 ph萴 nhi謒 v� kh玭g ng ho芻 s� lng kh玭g ", "Nhi謒 v� sai"}, "Giao v藅 ph萴", "8 lo筰 l謓h b礽 B綾 u M玭 (Thi猲 Xu L謓h, Thi猲 To祅 L謓h, Thi猲 C� L謓h, Thi猲 Quy襫 L謓h, Ng鋍 Ho祅h L謓h, Khai Dng L謓h, Dao Quang L謓h, Th蕋 Tinh L謓h)")
end

--function allbrother_0801_CheckAllTeamTaskLimit()
--	local nTeamSize = GetTeamSize()
--	local nCount = 0;
--	for i=1,nTeamSize do
--		nCount = nCount + allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CheckTeamTaskLimit)
--	end
--	return nCount;
--end

function allbrother_0801_CheckTeamTaskLimit()
	local nTaskTeamLimit = GetTask(TSK_allbrother_0801_TaskTeamLimit)
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate ~= floor(nTaskTeamLimit/256) then
		nTaskTeamLimit = nDate * 256
		SetTask(TSK_allbrother_0801_TaskTeamLimit, nTaskTeamLimit)
	end
	if mod(nTaskTeamLimit, 256) < TSKV_allbrother_0801_TaskTeamLimit then
		return 1;
	else
		Msg2Player(format("%s H玬 nay  ho祅 th祅h %d l莕 nhi謒 v� t藀 th�,  t n t鑙 產, kh玭g th� nh薾 ph莕 thng.", GetName(), TSKV_allbrother_0801_TaskTeamLimit))
		return 0;
	end
	return 0;
end

function allbrother_0801_TeamTaskAwardFun()
	local nTeamSize = GetTeamSize()
	for i=1,nTeamSize do
		allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_TaskAwardFun)
	end
	while GetTeamSize() > 0 do
		allbrother_0801_PlayerDo(GetTeamMember(1), LeaveTeam);
	end
	return 1;	
end

function allbrother_0801_TaskAwardFun()
	
	if allbrother_0801_CheckTeamTaskLimit() == 0 then
		return 1
	end
	
	local tbExp = {nExp = 8000000}
	local tbItem = 
	{
		{szName="Ph骳 Duy猲 L� (Чi) ", tbProp={6, 1, 124, 1, 0, 0}, nRate = 20},
		{szName="Ti猲 Th秓 L� ", tbProp={6, 1, 71, 1, 0, 0}, nRate = 5},
		{szName="T� Th駓 Tinh", tbProp={4, 239, 1, 0, 0, 0}, nRate = 1},
	}
	springfestival08_lib_AddAward(tbExp, allbrother_0801_szActName)
	springfestival08_lib_GiveRandomAward(tbItem, allbrother_0801_szActName)
	SetTask(TSK_allbrother_0801_TaskTeamLimit, GetTask(TSK_allbrother_0801_TaskTeamLimit)+1)
	return 1;
end


function OnCancel()
end