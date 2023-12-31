Include("\\script\\missions\\zhaojingling\\prepare\\preparegame.lua")

PrepareGame.nPassTime = 0 --每场报名开始到现在走过的时间


function PrepareGame:InitTimer()
	if SubWorldID2Idx(PREPARE_MAP) <= 0 then
		return
	end
	
	if self.nTimeIndex then
		DelTimer(self.nTimeIndex)
	end
	
	self.nPassTime = 0
	local nTime = 1 * 60
	self.nTimeIndex = AddTimer(nTime * 18, "PrepareGame:OnTime", 0)
	Msg2Map(PREPARE_MAP, "Tr薾 hu蕁 luy謓 M閏 Nh﹏ m韎  b総 u")
	AddGlobalNews("B竜 danh Ho祅g Th祅h Hu蕁 Luy謓 Cung b総 u, xin c竎 ch� v� hi謕 kh竎h nhanh ch鉵g n L﹎ An tham gia b竜 danh t筰 Quan nh綾 nh�")
end

function PrepareGame:OnTime(nTimerId, nParam)
	if SubWorldID2Idx(PREPARE_MAP) <= 0 then
		return 0, 0
	end
	
	self.nPassTime = self.nPassTime + 60
	local nRestTime = PREPARETIME * 60 - self.nPassTime
	if nRestTime > 0 then
		Msg2Map(PREPARE_MAP, format("C遪 %d ph髏 tr薾 u t譵 M閏 Nh﹏ s� b総 u", floor(nRestTime / 60)))
		return 60 * 18, 0
	end
	
	------开启比赛,将玩家传送进比赛场---
	self:GoToGame()
	DynamicExecute("\\script\\missions\\zhaojingling\\game\\gametimer.lua", "Game:InitTimer")
	return 0, 0
end

