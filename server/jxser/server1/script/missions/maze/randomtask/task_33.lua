-- 33.	20个小怪钰龙高手围着一个剑冢秘宝，杀完小怪才能开剑冢秘宝，开箱子有30%几率过关，30%几率继续刷小怪,40%几率继续刷剑冢秘宝
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(33)

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_box = self:GetPosition().t33_box
	local pos_monster = self:GetPosition().t33_monster
	self.m_BoxIndex = DlgNpcManager:AddNpc("Ki誱 Gia B� B秓", 1698, mapid, pos_box.x, pos_box.y, self)
	self.m_BarId = 0
	self:AddMonsters()
end

function pTask:DelMonsters()
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
		self.m_Monsters = nil
	end
end

function pTask:AddMonsters()
	local mapid = self:GetMapId()
	local pos_monster = self:GetPosition().t33_monster
	self.m_Monsters = {}
	for i = 1, 20 do
		local nNpcIndex = FightNpcManager:AddNpc("Ng鋍 Long Cao Th�", 1695, mapid, pos_monster[i].x, pos_monster[i].y, self, i, 1, 1)
		tinsert(self.m_Monsters, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_BoxIndex > 0) then
		DlgNpcManager:DelNpc(self.m_BoxIndex)
		self.m_BoxIndex = 0
	end
	self:DelMonsters()
	if (self.m_BarId > 0) then
		ProgressBarList:Close(self.m_BarId)
		self.m_BarId = 0
	end
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	self.m_Monsters[nIndex] = 0
end

function pTask:Say(pPlayer)
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			return
		end
	end
	if (self.m_BarId > 0) then
		return
	end
	self.m_BarId = ProgressBarList:Open("ng m�", pPlayer, 3, self)
end

function pTask:OnProgressbarTimeout(nId, param, player)
	self:BroadCast("M� th祅h c玭g.")
	self.m_BarId = 0
	local nNum = random(1, 100)
	if (nNum <= 30) then
		player:Say("C竎 ngi  m� rng, th祅h c玭g l祄 kinh ng n c� quan, ch骳 m鮪g ch� v�  qua 秈")
		self:Proceed()
	elseif (nNum <= 60) then
		self:DelMonsters()
		self:AddMonsters()
		player:Say("C竎 ngi  m� rng, nh璶g m�  l祄 cho m閠 m qu竔 xu蕋 hi謓")
	else
		player:Say("C竎 ngi  m� rng, ph竧 hi謓 b猲 trong c遪 c� m閠 c竔 rng n鱝")
	end
end

function pTask:OnProgressbarBreak(nId)
	self:BroadCast("M� th蕋 b筰.")
	self.m_BarId = 0
end
