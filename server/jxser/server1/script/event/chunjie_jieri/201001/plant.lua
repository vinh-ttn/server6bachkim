-------------------------------------
-- description 	: 新年梅树
-- author		: wangbin
-- date			: 2010.1.10
-------------------------------------
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\global\\judgeoffline_limit.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\pay.lua")

SCRIPT_TREE = "\\script\\event\\chunjie_jieri\\201001\\tree.lua"
TASKGROUP_WINTERSWEET	= 3
TASKINDEX_DATE			= 1
TASKINDEX_COUNT			= 2
LOG_HEAD				= "EVENT201001"

-- 允许种梅树的地图
tbTreeMap = {
	20,		-- 江津村
	53,		-- 巴陵县
	174,	-- 龙泉村
	121,	-- 龙门镇
	153,	-- 石鼓镇
	101,	-- 稻香村
	99,		-- 永乐镇
	100,	-- 朱仙镇
	1,		-- 凤翔
	11,		-- 成都
	37,		-- 汴京
	78,		-- 襄阳
	80,		-- 扬州
	162,	-- 大理
	176,	-- 临安
}

-- 梅花种类表
tbTreeName = {
	[1] = "Mai Trng Th�",
	[2] = "Mai An Khang",
	[3] = "Mai Th辬h Vng",
	[4] = "Mai H筺h Ph骳",
	[5] = "Mai T礽 Ph�"
}
-- 梅树种类概率
tbTreeRate = {
	[1] = 8,
	[2] = 15,
	[3] = 34,
	[4] = 35,
	[5] = 8,
}

-- 奖励表
tbAwardList = {
	-- 		25积分		15->24积分	1->14积分	0积分
	[1] = {30000000,	25000000,	20000000,	0},		-- 长寿梅
	[2]	= {20000000,	15000000,	10000000,	0},		-- 安康梅
	[3] = {10000000,	8000000,	6000000,	0},		-- 旺盛梅
	[4] = {8000000,		6000000,	4000000,	0},		-- 幸福梅
	[5] = {6000000,		4000000,	3000000,	0},		-- 财富梅
}


tbTreeList = {}
tbSeed = {}
tbTree = {}
tbTeam = {}
tbMaintainState = {}
tbAwardState = {}
tbShowState = {}

function clone(obj)
	local otype = type(obj)
	if (otype == "number") then
		return obj
	elseif (otype == "string") then
		local ret = obj
		return ret
	elseif (otype == "nil") then
		return obj
	elseif (otype == "table") then
		local ret = {}
		for key, val in obj do
			ret[clone(key)] = clone(val)
		end
		return ret
	else
		return obj
	end
end

function dialog_tree()
	local npc = GetLastDialogNpc()
	local tree = tbTreeList[npc]
	if (tree) then
		tree:Dialog()
	end
end

function select_tree()
	local npc = GetLastDlgNpc()
	if (npc > 0) then
		local tree = tbTreeList[npc]
		if (tree) then
			tree:Select()
		end
	end
end

function ontime(npcidx)
	local tree = tbTreeList[npcidx]
	if (tree) then
		return tree:Upgrade()
	else
		return 0, 0
	end
end

function tbSeed:InMapList(MapList)
	local MapId, _, _ = GetWorldPos()
	for i = 1, getn(MapList) do
		if (MapId == MapList[i]) then
			return 1
		end
	end
	return 0
end

-- DEBUG
function getplantcount()
	return tbSeed:GetPlantCount()
end

function setplantcount(Count)
	tbSeed:SetPlantCount(Count)
end

function addplantcount()
	tbSeed:AddPlantCount()
end

function tbSeed:GetPlantCount()
	local curr_date = tonumber(GetLocalDate("%y%m%d"))
	local task_date = TaskManager:GetTask(TASKGROUP_WINTERSWEET, TASKINDEX_DATE)
	if (task_date == 0 or task_date ~= curr_date) then
		return 0
	end
	local count = TaskManager:GetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT)
	return count
end

function tbSeed:AddPlantCount()
	local curr_date = tonumber(GetLocalDate("%y%m%d"))
	local task_date = TaskManager:GetTask(TASKGROUP_WINTERSWEET, TASKINDEX_DATE)
	if (curr_date ~= task_date) then
		TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_DATE, curr_date)
		TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT, 1)
	else
		local count = TaskManager:GetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT)
		TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT, count + 1)
	end
end

-- DEBUG
function tbSeed:SetPlantCount(Count)
	local curr_date = tonumber(GetLocalDate("%y%m%d"))
	TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_DATE, curr_date)
	TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT, Count)
end

function tbSeed:Check()
	-- 检查地图和战斗状态
	if (tbSeed:InMapList(tbTreeMap) == 0 or GetFightState() == 1) then
		Say("Ch� 頲 tr錸g c﹜ mai t筰 n琲 phi chi課 u th祅h th�, t﹏ th� th玭!")
		return 0
	end
	-- 检查队伍人数
	local member_count = GetTeamSize()
	if (member_count ~= 2) then
		Say("T� i hai ngi m韎 c� th� tr錸g 頲 c﹜ mai!")
		return 0
	end
	-- 检查是否在车夫、商店附近
	if (offlineCheckPermitRegion() == 0) then
		Say("Kh玭g 頲 tr錸g c﹜ mai t筰 nh鱪g n琲 g莕 xa phu ho芻 xung quanh nh鱪g n琲 ng ngi")
		return 0
	end
	-- 检查是否充值用户、级别和种树次数限制
	local player = PlayerIndex
	local self_name = GetName()
	local sex = {}
	for i = 1, member_count do
		PlayerIndex = GetTeamMember(i)
		local mate_name = GetName()
		if (IsCharged() == 0) then
			PlayerIndex = player
			Say(format("%s kh玭g ph秈 l� t礽 kho秐  n筽 th�!", mate_name))
			return 0
		elseif (GetLevel() < 50) then
			PlayerIndex = player
			Say(format("Nh﹏ v藅 %s ch璦  c蕄 50!", mate_name))
			return 0
		-- 检查种树次数
		elseif (tbSeed:GetPlantCount() >= 4) then
			PlayerIndex = player
			Say(format("H玬 nay %s  tham gia  4 l莕 r錳!", mate_name))
			return 0
		end
		sex[i] = GetSex()
	end
	PlayerIndex = player
	-- 检查性别
	if (GetSex() == 1) then
		Say("Nh﹏ v藅 nam trong t� i m韎 c� th� tr錸g c﹜!")
		return 0
	elseif (sex[1] == sex[2]) then
		Say("Y猽 c莡 ph秈 1 nh﹏ v藅 nam 1 nh﹏ v藅 n� t� i m韎 c� th� tr錸g c﹜ mai!")
		return 0
	end
	return 1
end

function tbSeed:RandomKind()
	local num = floor(random(1, 100))
	local sum = 0
	local count = getn(tbTreeRate)
	for i = 1, count do
		sum = floor(sum + tbTreeRate[i])
		if (num <= sum) then
			return i
		end
	end
	return count
end

function tbSeed:Grow(Kind)
	local membercount = GetTeamSize()
	if (membercount == 0) then
		Say("Ph秈 t� i m韎 c� th� tr錸g c﹜!")
		return 0
	end
	local player = PlayerIndex
	local self_name = GetName()
	local members = {self_name}
	for i = 1, membercount do
		PlayerIndex = GetTeamMember(i)
		local mate_name = GetName()
		if (mate_name ~= self_name) then
			tinsert(members, mate_name)
		end
	end
	PlayerIndex = player
	local tree = tbTree:New(Kind, members)
	if (not tree) then
		return 0
	end
	-- 累加种树次数
	player = PlayerIndex
	for i = 1, membercount do
		PlayerIndex = GetTeamMember(i)
		tbSeed:AddPlantCount()
	end
	PlayerIndex = player
	-- 如果是"安康梅"或"长寿梅"，就全部频道通告
	if (Kind == 1 or Kind == 2) then
		local handle = OB_Create()
		local msg = format("Ch骳 m鮪g %s  trong th祅h c玭g %s!", GetName(), tbTreeName[Kind])
		ObjBuffer:PushObject(handle, msg)
		RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
		OB_Release(handle)
	end
	
	return 1
end

function tbTeam:New(Members)
	local tb = clone(tbTeam)
	tb.MemberList = Members
	tb.Score = 0
	return tb
end

function tbTeam:FindMember(Name)
	for i = 1, getn(self.MemberList) do
		if (self.MemberList[i] == Name) then
			return 1
		end
	end
	return 0
end

function tbTeam:BroadCast(Msg)
	local player = PlayerIndex
	for i = 1, getn(self.MemberList) do
		local member = SearchPlayer(self.MemberList[i])
		if (member > 0) then
			PlayerIndex = member
			Msg2Player(Msg)
		end
	end
	PlayerIndex = player
end

function tbTree:New(Kind, Members)
	local tb = clone(tbTree)
	tb.Team = tbTeam:New(Members)
	local pos = {}
	pos[1] = SubWorld
	_, pos[2], pos[3] = GetWorldPos()
	pos[2] = pos[2] * 32
	pos[3] = pos[3] * 32
	tb.Pos = pos
	tb.Kind = Kind
	tb.Name = format("%s[%s]", tbTreeName[Kind], GetName())
	tb.Npc = AddNpc(tbMaintainInfo[1].Npc, 1, pos[1], pos[2], pos[3], 1, tb.Name)
	if (tb.Npc > 0) then
		SetNpcScript(tb.Npc, SCRIPT_TREE)		
	else
		return nil
	end

	local state = tbMaintainState:New(tb)
	state:NotifyTeam(tb.Team)
	tb.State = state

	tbTreeList[tb.Npc] = tb
	-- 加入定时器
	AddTimer(state.Timeout * 18, "ontime", tb.Npc)
	return tb
end

function tbTree:Dialog()
	local name = GetName()
	if (self.Team:FindMember(name) == 0) then
		Say("Зy kh玭g ph秈 l� c﹜ mai c馻 c竎 h�.")
	else
		self.State:Dialog()
	end
end

function tbTree:Select()
	local name = GetName()
	if (self.Team:FindMember(name) == 1) then
		self.State:Process(self, self.Team, name)
	end
end

function tbTree:Upgrade()
	local oldnpc = self.Npc
	local state = self.State:NextState(self, self.Team)
	if (not state) then
		DelNpc(self.Npc)
		tbTreeList[self.Npc] = nil
		return 0, 0
	else
		state:NotifyTeam(self.Team)
		self.State = state
		local newnpc = self.Npc
		if (oldnpc ~= newnpc) then
			tbTreeList[oldnpc] = nil
			tbTreeList[newnpc] = self
		end
		return state.Timeout * 18, self.Npc
	end
end

tbMaintainInfo = {
	[1] = {
		Dlg = "B鉵 ph﹏ cho c﹜ mai",
		Msg = "H穣 ti課 h祅h b鉵 ph﹏ cho c﹜ mai",
		Err = "Чi hi謕  b鉵 ph﹏ cho c﹜ r錳",
		Npc = 1529,
		},
	[2] = {
		Dlg = "Ti nc cho c﹜ mai",
		Msg = "H穣 ti課 h祅h ti nc cho c﹜ mai",
		Err = "Чi hi謕  ti nc cho c﹜ r錳.",
		Npc = 1530,
		},
	[3] = {
		Dlg = "Di謙 c� d筰 cho c﹜",
		Msg = "H穣 ti課 h祅h di謙 c� d筰 cho c﹜",
		Err = "Чi hi謕  di謙 c� cho c﹜ r錳",
		Npc = 1531,
		},
	[4] = {
		Dlg = "B総 s﹗ cho c﹜",
		Msg = "H穣 ti課 h祅h b総 s﹗ cho c﹜",
		Err = "Чi hi謕  b総 s﹗ cho c﹜ r錳",
		Npc = 1532,
		},
	[5] = {
		Dlg = "Tr葃 l� cho c﹜",
		Msg = "H穣 ti課 h祅h tr葃 l� cho c﹜",
		Err = "Чi hi謕  tr葃 l� r錳",
		Npc = 1533,
		}
}

function tbMaintainState:New(Tree)
	local tb = clone(tbMaintainState)
	tb.Turn = 1
	tb.Step = 1
	tb.OpFlag = {}
	tb.Time = tbMaintainState:Now()
	tb.Timeout = 60
	print(format("[%s]Tree[%d] begin to maintain",
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Tree.Npc))
	return tb
end

function tbMaintainState:Dialog()
	Say("Зy l� 1 c﹜ mai th藅 p",
		2,
		format("%s/select_tree", tbMaintainInfo[self.Step].Dlg),
		"Ta ch� n ch琲/Cancel")
end

function tbMaintainState:NotifyTeam(Team)
	local msg = tbMaintainInfo[self.Step].Msg
	Team:BroadCast(msg)
end

function tbMaintainState:Now()
	-- 返回当前时间（秒数）
	return GetLocalTime()
end

function tbMaintainState:CaculateScore(Seconds)
	if (Seconds >= 46) then
		return 2
	elseif (Seconds >= 36) then
		return 4
	elseif (Seconds >= 26) then
		return 5
	elseif (Seconds >= 16) then
		return 3
	else
		return 1
	end
end

function tbMaintainState:Process(Tree, Team, Name)
	if (Team.MemberList[self.Turn] ~= Name) then
		Say("V蒼 ch璦 n lt, xin i m閠 l骳 n鱝")
		return
	elseif (self.OpFlag[Name] == 1) then
		Say(tbMaintainInfo[self.Step].Err)
		return
	end
	self.OpFlag[Name] = 1
	local current = tbMaintainState:Now()
	-- LOG
	WriteLog(format("[%s %s]%s maintain Tree[%d]",
		LOG_HEAD,
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Name,
		Tree.Npc))
	-- 给队伍加分
	local add = tbMaintainState:CaculateScore(current - self.Time)
	Team.Score = Team.Score + add
	local msg = format("T� i c� %d 甶觤, hi謓 t筰 t鎛g 甶觤 l� %d!", add, Team.Score)
	Team:BroadCast(msg)
	-- LOG
	WriteLog(format("[%s %s]Tree[%d] add score(%d), total(%d)",
		LOG_HEAD,
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Tree.Npc,
		add,
		Team.Score))
end

function tbMaintainState:NextState(Tree, Team)
	if (self.Step >= 5) then
		return tbAwardState:New()
	else
		self.OpFlag = {}
		self.Time = tbMaintainState:Now()
		self.Step = self.Step + 1
		local count = getn(Team.MemberList)
		self.Turn = mod(self.Turn, count) + 1
		-- 创建新的NPC
		DelNpc(Tree.Npc)
		local npc = AddNpc(tbMaintainInfo[self.Step].Npc, 1, Tree.Pos[1], Tree.Pos[2], Tree.Pos[3], 1, Tree.Name)
		if (npc > 0) then
			-- LOG
			WriteLog(format("[%s %s]Tree[%d] upgrade to Tree[%d]",
				LOG_HEAD,
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				Tree.Npc,
				npc))
			SetNpcScript(npc, SCRIPT_TREE)
			Tree.Npc = npc
		end
		return self
	end
end

function tbAwardState:New()
	local tb = clone(tbAwardState)
	tb.AwardFlag = {}
	tb.Timeout = 300
	return tb
end

function tbAwardState:Dialog()
	Say("Зy l� 1 c﹜ mai th藅 p",
		2,
		"Ta mu鑞 nh薾 thng/select_tree",
		"Ta ch� n ch琲/Cancel")
end

function tbAwardState:Process(Tree, Team, Name)
	if (self.AwardFlag[Name] == 1) then
		Say("Чi hi謕  nh薾 thng r錳")
		return
	end
	local exp = tbAwardState:CalculateExp(Team.Score, Tree.Kind)
	if (exp > 0) then
		AddOwnExp(exp)
		Team:BroadCast(format("Th祅h vi猲 t� i %s  nh薾 頲 ph莕 thng kinh nghi謒 l� %d!", Name, exp))
	else
		Say("Th祅h th藅 ng ti誧, i hi謕 kh玭g c� ph莕 thng n祇. Xin h穣 n� l鵦 l莕 t韎!")
	end
	self.AwardFlag[Name] = 1
end

function tbAwardState:CalculateExp(score, kind)
	if (kind < 1) then
		kind = 1
	elseif (kind > 5) then
		kind = 5
	end
	local index = 4
	if (score >= 25) then
		index = 1
	elseif (score >= 15) then
		index = 2
	elseif (score >= 1) then
		index = 3
	end
	return tbAwardList[kind][index]
end

function tbAwardState:NotifyTeam(Team)
	Team:BroadCast("Ch骳 m鮪g i hi謕 v� n� hi謕, 2 v�  c� 1 C﹜ mai th藅 p  n T誸")
end

function tbAwardState:NextState(Tree, Team)
	return tbShowState:New()
end

function tbShowState:New()
	local tb = clone(tbShowState)
	tb.Timeout = 3600
	return tb
end

function tbShowState:Dialog()
	Say("Зy l� 1 c﹜ mai th藅 p")
end

function tbShowState:Process(Tree, Team, Name)
	-- Do nothing
end

function tbShowState:NotifyTeam(Team)
	Team:BroadCast("Th阨 gian nh薾 thng k誸 th骳")
end

function tbShowState:NextState(Tree, Team)
	return nil
end

TaskManager:AddUseGroup(TASKGROUP_WINTERSWEET)
