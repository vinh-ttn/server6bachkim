-- 有个彪悍的NPC路彪拦路，要求需要缴纳50万银两，不交则会召唤出路彪手下，要打死NPC和30个小怪才能过关。
-- 如果交了钱则还会要求上交某件随机物品（宋金诏书、五花玉露丸、天山玉露、玄晶3-8级、3种水晶、各种1级装备），交则过关，不交则会变成战斗NPC，杀死才能过关。
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(9)
pTask.m_BossId = 1701
pTask.m_MonsterId = 1702
pTask.m_Items = {
	"T鑞g Kim Chi誹 Th� ",
	"Ng� Hoa Ng鋍 L� Ho祅",
	"Thi猲 s琻  B秓 L� ",
	"Huy襫 Tinh c蕄 3-8",
	"M閠 trong 3 lo筰 Th駓 Tinh",
	"Trang b� c蕄 1"
}

function pTask:OnStart()
	local pos_boss = self:GetPosition().t9_boss
	local nIndex = DlgNpcManager:AddNpc("L� B璾", m_BossId, task:GetMapId(), pos_boss.x, pos_boss.y, self)
	if (nNpcIndex <= 0) then
		self:LogError("TASK9: failed to create dialog npc")
		return
	end
	local nNpcIndex = DlgNpcManager:GetNpcIndex(nIndex)
	SetNpcKind(nNpcIndex, 3)
	SyncNpc(nNpcIndex)
	self.m_DlgBossIndex = nIndex
	self.m_FightBossIndex = 0
	self.m_Step = 1
	self.m_Want = 0
end

function pTask:OnDestroy()
	if (self.m_DlgBossIndex > 0) then
		DlgNpcManager:DelNpc(self.m_DlgBossIndex)
		self.m_DlgBossIndex = 0
	end
	if (self.m_FightBossIndex > 0) then
		FightNpcManager:DelNpc(self.m_FightBossIndex)
		self.m_FightBossIndex = 0
	end
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			local nIndex = self.m_Monsters[i]
			if (nIndex > 0) then
				FightNpcManager:DelNpc(nIndex)
			end
		end
		self.m_Monsters = nil
	end
end

function pTask:Say(player)
	if (self.m_Step == 1) then
		return "H穣 giao n閜 <color=red> 50 v筺 <color> lng", {"Giao n閜", "Kh玭g giao n閜", "в ta suy ngh� l筰 !"}
	elseif (self.m_Step == 2) then
		return format("H穣 cho ta<color=red>%s<color>.", self.m_Items[self.m_Want]), {"Cho ", "Kh玭g cho! ", "в ta suy ngh� l筰 !"}
	end
end

function pTask:BossChange()
	local pos_boss = self.m_Task:GetPosition().t9_boss
	DlgNpcManager:DelNpc(self.m_DlgBossIndex)
	self.m_DlgBossIndex = 0
	self.m_FightBossIndex = FightNpcManager:AddNpc("L� B璾", self.m_Task.m_BossId, self:GetMapId(), pos_boss.x, pos_boss.y, self, 0, 1, 1)
end

function pTask:OnAnswer(player, sel)
	if (self.m_Step == 1) then
		return self:OnAnswer1(player, sel)
	elseif (self.m_Step == 2) then
		return self:OnAnswer2(player, sel)
	end
end

function pTask:OnAnswer1(player, sel)
	local pos_monster = self.m_Task:GetPosition().t9_monster
	if (sel == 1) then
		if (player:Pay(500000) == 1) then
			self.m_Want = random(1, getn(self.m_Items))
			self.m_Step = 2
			return self:Say(player)
		else
			player:Say("N祔 n祔, ti襫 u?")
		end
	elseif (sel == 2) then
		self:BossChange()
		self.m_Monsters = {}
		for i = 1, 30 do
			local nNpcIndex = FightNpcManager:AddNpc("Th� H� L� B璾", self.m_Task.m_MonsterId, self:GetMapId(), pos_monster.x, pos_monster.y, self, i, 1, 1)
			tinsert(self.m_Monsters, nNpcIndex)
		end
	end
end

function pTask:OnAnswer2(player, sel)
	if (sel == 2) then
		self:BossChange()
	elseif (sel == 1) then
		local item =  self:FindItem(player)
		if (not item) then
			player:Say(format("Ngi kh玭g c�<color=red>%s<color>.", self.m_Items[self.m_Want]))
		elseif (self:DelItem(player, item) ~= 1) then
			player:Say(format("N祔, <color=red>%s<color> c馻 ngi c� v蕁 .", self.m_Items[self.m_Want]))
		else
			self:Proceed()
		end
	end
end

function pTask:FindItem(player)
	-- TODO
end

function pTask:DeleteItem(player, item)
	-- TODO
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	if (nIndex == 0) then
		self.m_FightBossIndex = 0
	else
		self.m_Monsters[nIndex] = 0
	end
	if (self:IsAllDead() == 1) then
		self.m_Task:Finish()
	end
end

function pTask:IsAllDead()
	if (self.m_FightBossIndex > 0) then
		return 0
	end
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			return 0
		end
	end
	return 1
end
