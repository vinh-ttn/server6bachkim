Include("\\script\\activitysys\\config\\40\\head.lua")
Include("\\script\\activitysys\\config\\40\\variables.lua")
Include("\\script\\activitysys\\config\\40\\data.lua")
Include("\\script\\activitysys\\config\\40\\award_ext.lua")
Include("\\script\\activitysys\\config\\40\\compose_grass.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")

function pActivity:InitAddNpc()
	self:AddHeChengHua(%tbActivityNpc[1], %tbActivityNpcPos[1])
	self:AddGrass(%tbActivityNpc[2], %tbActivityNpcPos[2])
	self:InitCompose()
end

function pActivity:AddHeChengHua(tbNpc, tbNpcPos)
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc, nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:AddGrass(tbNpc, tbNpcPos)
	local nOffSetX = 3
	local nOffSetY = 3
	local nCol = 5
	local nRow = 4
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		for j = 1, nRow do 
			for k = 1, nCol do
				local nX = nPosX + nOffSetX * k
				local nY = nPosY + nOffSetY * j
				basemission_CallNpc(tbNpc, nMapId, nX * 32, nY * 32)	
			end
		end
		
	end
end 


function pActivity:KillMonsterAward(nNpcIndex)
	local _,_, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local tbAward = %tbMonstorAward[nMapId]
	
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, %EVENT_LOG_TITLE, 1)
end 

-- 兑换绿草对话
function pActivity:ComposeGrass()
	self:composegrassdialog()
end 

function pActivity:GetCurrentTime()
	local nCurrDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCurrTime = tonumber(GetLocalDate("%H%M"))
	return nCurrDate, nCurrTime
end

-- 更新最近一次登录时间，若当天有登录，则不改变，
-- 否则，将最近一次登录时间改为当天的早上9点
function pActivity:UpdateLastLoginTime()
--	local nLastDate = self:GetTask(%TSK_LAST_ONLINEDATE)
--	local nLastTime = self:GetTask(%TSK_LAST_ONLINETIME)
--	local nCurrDate, nCurrTime = self:GetCurrentTime()
--	
--	-- 连续多天没有下线
--	if nLastDate ~= nCurrDate then
--		nLastDate = nCurrDate
--		nLastTime = %NUM_ONLINE_START_TIME
--	end
--	
--	if nLastTime < %NUM_ONLINE_START_TIME then
--		nLastTime = %NUM_ONLINE_START_TIME
--	end
--	
--	self:SetTask(%TSK_LAST_ONLINEDATE, nLastDate)
--	self:SetTask(%TSK_LAST_ONLINETIME, nLastTime)
end

function pActivity:GetOnLineAward()
	if ST_GetTransLifeCount() < 2 and GetLevel() < 120 then	
		Say("C蕄 ch璦  120, t h穣 t韎 g苝 ta!")
		return
	end		
	local nDate = self:GetTask(%TSK_LAST_ONLINEDATE)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nHour = 0
	local nCurrentOnLineTime = 0
	local nLastOnLineTime = 0
	local nCount = 0
	if nDate == nNowDate then
		nLastOnLineTime = self:GetTask(%TSK_LAST_ONLINETIME)
		nCurrentOnLineTime = GetGameTime()	
		nHour = floor((nCurrentOnLineTime - nLastOnLineTime) / 60 / 60)
		nCurrentOnLineTime = nLastOnLineTime + nHour * 60 * 60
	else
		local nCurrentH = tonumber(GetLocalDate("%H"))
		local nCurrentM = tonumber(GetLocalDate("%M"))
		local nCurrentS = tonumber(GetLocalDate("%S"))
		nHour = nCurrentH 
		nCurrentOnLineTime = GetGameTime() - nCurrentM * 60 - nCurrentS		
	end
	nCount = nHour	
	if nCount <= 0 then
		Msg2Player("Kho秐g c竎h nh薾 l莕 trc, th阨 gian tr猲 m筺g c馻 ngi ch璦  1 gi�, kh玭g th� nh薾")
		return 
	end
	local nMaxCount = %MAX_DAILY_LUCK_BELT -  self:GetTaskDaily(%TSK_DAILY_LUCK_BELT)
	nMaxCount = min(nMaxCount, nCount)
	if nMaxCount <= 0 then
		Msg2Player("H玬 nay ngi kh玭g th� nh薾 n鱝, ng祔 mai h穣 quay l筰.")
		return 
	end
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		Msg2Player("H祅h trang c馻 ngi kh玭g , s緋 x誴 l筰 h穣 g苝 ta!")
		return
	end
	self:SetTask(%TSK_LAST_ONLINEDATE, nNowDate)
	self:SetTask(%TSK_LAST_ONLINETIME, nCurrentOnLineTime)
	self:AddTaskDaily(%TSK_DAILY_LUCK_BELT, nMaxCount)	
	PlayerFunLib:GetItem(%ITEM_LUCY_BELT, nMaxCount, %EVENT_LOG_TITLE, "NhanTuiMayMan")
--	self:UpdateLastLoginTime()
--	local nLastDate = self:GetTask(%TSK_LAST_ONLINEDATE)
--	local nLastTime = self:GetTask(%TSK_LAST_ONLINETIME)
--	local nCurrDate, nCurrTime = self:GetCurrentTime()
--	if nLastTime > %NUM_ONLINE_END_TIME then
--		Say("M鏸 ng祔 t� 9 gi� n 17 gi� oline li猲 t鬰 c� qua 1 ti課g ng h� m韎 c� th� nh薾 thng")
--		return
--	end
--	
--	if nCurrTime > %NUM_ONLINE_END_TIME then
--		nCurrTime = %NUM_ONLINE_END_TIME
--	end
--	local nBase = 100
--	local nHour = floor(nCurrTime/nBase) - floor(nLastTime/nBase)
--	if mod(nCurrTime,nBase) < mod(nLastTime, nBase) then
--		nHour = nHour - 1
--	end
--	
--	if nHour < 1 then
--		Say("M鏸 ng祔 t� 9 gi� n 17 gi� oline li猲 t鬰 c� qua 1 ti課g ng h� m韎 c� th� nh薾 thng")
--		return 
--	end 
--	
--	local nGetCount = self:GetTaskDaily(%TSK_DAILY_LUCK_BELT)
--	local nCount = min(nHour, (%MAX_DAILY_LUCK_BELT - nGetCount))
--	
--	if nCount < 1 then
--		Say("H玬 nay ngi kh玭g th� nh薾 n鱝, ng祔 mai h穣 quay l筰.")
--		return
--	end
--	
--	-- 更新最后上线时间
--	nLastTime = nLastTime + nCount * nBase
--	self:SetTask(%TSK_LAST_ONLINEDATE, nLastDate)
--	self:SetTask(%TSK_LAST_ONLINETIME, nLastTime)
--	self:AddTaskDaily(%TSK_DAILY_LUCK_BELT, nCount)
--	PlayerFunLib:GetItem(%ITEM_LUCY_BELT, nCount, %EVENT_LOG_TITLE, "NhanTuiMayMan")
	
end

-- 玩家登录
function pActivity:PlayerOnLogin()
--	self:UpdateLastLoginTime()
--	local nCurrDate, nCurrTime = self:GetCurrentTime()
--	
--	self:SetTask(%TSK_LAST_ONLINEDATE, nCurrDate)
--	self:SetTask(%TSK_LAST_ONLINETIME, nCurrTime)
	local nDate = self:GetTask(%TSK_LAST_ONLINEDATE)	
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCount = 0	
	if nDate ~= nNowDate then
		nCurrentOnLineTime = GetGameTime()		
		self:SetTask(%TSK_LAST_ONLINETIME,nCurrentOnLineTime)
		self:SetTask(%TSK_LAST_ONLINEDATE,nNowDate)		
	end
end

function pActivity:Use3ColorRose()
	local tbAward = %tbItemAward["3Color_Rose"]
	local nCount = self:GetTask(%TSK_3COLOR_ROSE)
	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, ""})
	
	local tbItemLog = %tbItemOtherAward["3Color_Rose"]
	if tbItemLog[nCount + 1] then
		%tbLog:PlayerActionLog(tbItemLog[nCount + 1], %EVENT_LOG_TITLE)
	end
end

function pActivity:Use4ColorRose()
	local tbAward = %tbItemAward["4Color_Rose"]
	local nCount = self:GetTask(%TSK_4COLOR_ROSE)
	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, ""})
	
	local tbItemLog = %tbItemOtherAward["4Color_Rose"]
	if tbItemLog[nCount + 1] then
		%tbLog:PlayerActionLog(tbItemLog[nCount + 1], %EVENT_LOG_TITLE)
	end
end

function pActivity:UseCorbeil()
	local tbAward = %tbAward_Ext["Corbeil"]
	local nCount = self:GetTask(%TSK_CORBEIL)
	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, "SuDungGioHoaHongVinhCuu"})
	
	local tbItemLog = %tbItemOtherAward["Corbeil"]
	if tbItemLog[nCount + 1] then
		tbAwardTemplet:Give(tbItemLog[nCount + 1].tbAward, 1 , {%EVENT_LOG_TITLE, tbItemLog[nCount + 1].szLog})
	end
end

function pActivity:UseLucyBelt()
	local nRate = random(1,100)
	local tbRate = %tbLuckBelt
	local tbAward = %tbLuckBeltAward
	local nNumber = 0
	for i=1,getn(tbRate) do
		nNumber = nNumber + tbRate[i].nRate
		if nRate <= nNumber then
			tbAwardTemplet:Give(tbAward[i], 1, {%EVENT_LOG_TITLE, tbRate[i].szActionLog})
			return 
		end
	end
end

function pActivity:UseMeiGuiXiangDai()
	local tbAward = %tbItemAward["MeiGuiXiangDai"]
	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, ""})
end

