-- 出现一个对话NPC冯光光，要求所有队友猜数字（1-100），可以同时猜，1-100中随机一个是幸运数字，猜对了过关并猜对的人有奖励，随机一个是倒霉数字（不等于幸运数字），猜中倒霉数字的会被丢到万花池，记一次死亡次数

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\playerlist.lua")

CallbackList = {m_Index = 0}

pTask = Task:New(42)

function pTask:OnStart()
	local pos = self.m_Pos.gujuesha
	self.m_NpcIndex = DlgNpcManager:AddNpc("Ph飊g Quang Quang", 1656, self.m_Maze.m_MapId, pos.x, pos.y, self)
	self.m_Players = {}
	self.m_LuckNumber = random(1, 100)
	self.m_LoseNumber = random(1, 100)
	while (self.m_LoseNumber == self.m_LuckNumber) do
		self.m_LoseNumber = random(1, 100)
	end
end

function pTask:OnClose()
	if (self.m_NpcIndex > 0) then
		DlgNpcManager:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	self.m_Players = nil
end

function pTask:Say(player)
	player:AskClientForNumber("guess_number", 1, 100, "H穣 畂竛 m閠 con s� (1-100)")
end

function pTask:Guess(num, player)
	if (num == self.m_LuckNumber) then
		-- TODO: here
	elseif (num == self.m_LoseNumber) then
		-- TODO: here
	else
		player:Say("Ngi 畂竛 s� kh玭g ng.")
	end
end

function guess_number(num)
	local player = PlayerList:GetPlayer(PlayerIndex)
	-- TODO: here
end
