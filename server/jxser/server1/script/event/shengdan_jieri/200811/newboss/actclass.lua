Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\lib\\pay.lua")

Include("\\script\\event\\shengdan_jieri\\200811\\taskctrl.lua")

shengdan0811_tbXiaoDaoZeiAct = tbBaseClass:new()

function shengdan0811_tbXiaoDaoZeiAct:_init()
	
	self.TSK_PLAYER_LOGIN_TIME = 601
	
	self.TSK_Version = 1909
	self.TSK_GETAWARD_STATE = 1911
	self.TSK_USE_STATE = 1912
	self.TSK_USE_EXP = 1913
	
	self.nActStartDate = 20081205
	self.nActEndDate = 20200104
	self.tbActWeek = {[6] = 1, [0] = 1}
	self.nBossAppearTime = 1200
	self.nGetAwardEndTime = 1400
	self.nMinLevelLimit = 10
	self.nMinUseLevelLimit = 50
	self.nUseLimitDaily = 4
	self.nUseExpLimit = 4e8
	self.GB_TSKG_ACTNAME = "shengdan0811_ThiefBoss"---和relay那边一起改动
	self.GB_TSK_THIEF_STATE = 1
	self.GB_TSK_THIEF_DEATH_TIME = 2
end

function shengdan0811_tbXiaoDaoZeiAct:UseXueHuaDanGao(nItemIndex)
	self:ResetTask()
	if GetLevel() < self.nMinUseLevelLimit or IsCharged() ~= 1 then
		Talk(1,"", "Ngi ch琲 ph秈 c蕄 50 tr� l猲 v�  n閜 th� m韎 c� th� tham gia.")
		return 1
	end
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "V藅 ph萴 n祔  h誸 h筺")
		return 0
	end
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	
	local nUseState = GetTask(self.TSK_USE_STATE)
	local nCurUseExp = GetTask(self.TSK_USE_EXP)
	if floor(nUseState/256) ~= nCurDate then
		nUseState = nCurDate * 256
		SetTask(self.TSK_USE_STATE, nUseState)
	end
	if mod(nUseState, 256) >= self.nUseLimitDaily then
		Talk(1,"", format("M鏸 ng祔 m鏸 ngi ch琲 ch� 頲 s� d鬾g v藅 ph萴 n祔 %d l莕.", self.nUseLimitDaily))
		return 1
	end
	if nCurUseExp >= self.nUseExpLimit then
		Talk(1,"", format("M鏸 nh﹏ v藅 s� d鬾g [B竛h Kem  B玭g Tuy誸] ch� thu 頲 t鑙 產 %d kinh nghi謒.", self.nUseExpLimit))
		return 1
	end
	local tbAward = {nExp = 15e6}
	tbAwardTemplet:GiveAwardByList(tbAward, "shengdan0811_newboss_Award")
	SetTask(self.TSK_USE_STATE, nUseState + 1)
	SetTask(self.TSK_USE_EXP, nCurUseExp + tbAward.nExp)
end


function shengdan0811_tbXiaoDaoZeiAct:IsActDay()
	return self:IsActPeriod() and self.tbActWeek[tonumber(GetLocalDate("%w"))]
end



function shengdan0811_tbXiaoDaoZeiAct:IsActPeriod ()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	return self.nActStartDate <= nDate and nDate <= self.nActEndDate 
end


function shengdan0811_tbXiaoDaoZeiAct:GetServerAwardState()
	local nTimeHM = tonumber(GetLocalDate("%H%M"));
	local nCurDate = tonumber(GetLocalDate("%y%m%d"));
	local nCurServerTime = GetCurServerTime()
	local nThiefState = gb_GetTask(self.GB_TSKG_ACTNAME, self.GB_TSK_THIEF_STATE)
	local nThiefDeathTime =  gb_GetTask(self.GB_TSKG_ACTNAME, self.GB_TSK_THIEF_DEATH_TIME)

	if nTimeHM < self.nBossAppearTime or nTimeHM >= self.nGetAwardEndTime then
		return 0,"Th阨 gian nh薾 thng v蒼 ch璦 n. Xin m阨 c竎 h� h穣 quay l筰 sau."
	end
	
	if nThiefState == 1 or tonumber(FormatTime2String("%y%m%d", nThiefDeathTime)) ~= nCurDate then
		return 0,"Hi謓 nay v蒼 ch璦 c� tin t鴆 g� v� Ti觰 Чo T芻 v� v藋 kh玭g th� nh薾 thng 頲."
	elseif nThiefState == 2 then
		return 1
	elseif nThiefState == 3 then
		return 0, "Th阨 gian nh薾 thng v蒼 ch璦 n. Xin m阨 c竎 h� h穣 quay l筰 sau."
	end
end

function shengdan0811_tbXiaoDaoZeiAct:GetPlayerAwardState()
	self:ResetTask()
	local nPlayerLoginTime = GetTask(self.TSK_PLAYER_LOGIN_TIME)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	
	
	local nThiefDeathTime =  gb_GetTask(self.GB_TSKG_ACTNAME, self.GB_TSK_THIEF_DEATH_TIME)

	if nPlayerLoginTime >= nThiefDeathTime then
		return 0,"C竎 h� kh玭g c� m苩 t筰 trc th阨 甶觤 Ti觰 Чo T芻 b� ti猽 di謙 v� v藋 kh玭g th� nh薾 thng 頲."
	end
	
	if GetLevel() < self.nMinLevelLimit then
		return 0, format("Ъng c蕄 di %d kh玭g th� nh薾 頲 thng.", self.nMinLevelLimit)
	end
	
	local nGetAwardState = GetTask(self.TSK_GETAWARD_STATE)		
	
	
	if floor(nGetAwardState/256) ~= nCurDate then
		nGetAwardState = nCurDate * 256
		SetTask(self.TSK_GETAWARD_STATE, nGetAwardState)
	end
	
	if mod(nGetAwardState, 256) >= 1 then
		return 0, "H玬 nay i hi謕  nh薾 thng r錳!"
	end
	
	return 1
end

function shengdan0811_tbXiaoDaoZeiAct:ResetTask()
	shengdan0811_ResetTask()
end


function shengdan0811_tbXiaoDaoZeiAct:SetBossDeathFlag()
	local nTimeHM = tonumber(GetLocalDate("%H%M"))
	if nTimeHM <= 1400 then
		LG_ApplyDoScript(RELAYTASK_LEAGUEID, self.GB_TSKG_ACTNAME, "", "\\script\\event\\shengdan\\200811\\setbossdeath.lua", "shengdan0811_tbXiaoDaoZeiAct_SetBossDeathFlag", "", "", "")
		--gb_SetTask(self.GB_TSKG_ACTNAME, self.GB_TSK_THIEF_STATE, 2)
		--gb_SetTask(self.GB_TSKG_ACTNAME, self.GB_TSK_THIEF_DEATH_TIME, GetCurServerTime())
	end
end

function shengdan0811_tbXiaoDaoZeiAct:LiGuanDailog()
	self:ResetTask()
	if not self:IsActDay() then
		return Talk(1,"", "Kh玭g thu閏 trong th阨 gian ho箃 ng.")
	end
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nState, szMsg = self:GetServerAwardState()
	
	if nState ~= 1 then
		return Talk(1,"",szMsg)
	end
	nState, szMsg = self:GetPlayerAwardState()
	
	if nState ~= 1 then
		return Talk(1,"",szMsg)
	end
	
	local tbItem = {szName="B竛h Kem B玭g Tuy誸", tbProp={6, 1, 1839, 1, 0, 0}}
	
	tbItem.nExpiredTime = 60 * 24 - tonumber(GetLocalDate("%H")) * 60 - tonumber(GetLocalDate("%M"))
	
	
	
	
	
	
	tbAwardTemplet:GiveAwardByList(tbItem, "shengdan0811_newboss_Award")
	SetTask(self.TSK_GETAWARD_STATE, GetTask(self.TSK_GETAWARD_STATE) + 1)
end
shengdan0811_tbXiaoDaoZeiAct:_init()