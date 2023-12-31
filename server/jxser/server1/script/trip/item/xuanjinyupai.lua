--玄金玉牌应该是 跨服道具
--不应该和跨服宋金有关，因此放在这里
--该文件定义的有关跨服宋金函数应转移至，\mission\battle



Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\missions\\battle\\manager.lua")
Include("\\script\\global\\judgeoffline.lua")
Include("\\script\\trip\\define.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\missions\\battle\\npc\\point2exp.lua")
function main()
	dialog_menu()
	return 1
end

function dialog_menu()
	local nTripMode = GetTripMode()
	if nTripMode ~= TRIP_MODE_CLIENT then
		return 1
	end
	local tbOpt =
	{
		{"Li猲 server", across_server},
		{"Ki觤 tra ng﹏ lng server li猲 k誸", show_across_server_money},
		{"觤 c鑞g hi課 server li猲 k誸", tbTripBattlePoint2Exp.DialogMain, {tbTripBattlePoint2Exp}},
		{"K誸 th骳 i tho筰"},
	}
	CreateNewSayEx("Huy襫 Kim Ng鋍 B礽", tbOpt)
end

function across_server()
	local tbOpt = {}
	local nCount = TripC_GetServerCount()
	for i=1, nCount do
		local szServerName = TripC_GetServerName(i)
		tinsert(tbOpt, {szServerName, sign_up, {i}})
	end
	tinsert(tbOpt, {"Tr� v�", dialog_menu})
	tinsert(tbOpt, {"K誸 th骳 i tho筰"})
	CreateNewSayEx("Ngi mu鑞 甶 t韎 n琲 n祇?", tbOpt)
end

function show_across_server_money()
	local tbOpt =
	{
		{"Tr� v�", dialog_menu},
		{"K誸 th骳 i tho筰"},
	}
	local szTitle = format("<color=yellow>%s<color>Ngi c� <color=yellow>%d<color> ng﹏ lng server li猲 k誸, <color=yellow> s� ng﹏ lng n祔 l� ngi c� th� 甧m t� server ngu錸 n server c玭g c閚g, ho祅 to祅 kh玭g ph秈 s� ng﹏ lng c馻 server c玭g c閚g. Ng﹏ lng server c玭g c閚g ngi c� th� ch th﹏ n server c玭g c閚g  ki觤 tra. <color>", GetName(), GetTask(TSK_TRIP_MONEY))
	CreateNewSayEx(szTitle, tbOpt)
end

function sign_up(nServerId)
	local _, nValue = GetRoleEquipValue()
	local szTitle = format("Tr� s� binh gi竝 hi謓 t筰 c馻 ngi l� %d, Ngi mu鑞 甶 T鑞g Kim Li猲 Server c蕄  n祇? <enter>", nValue)
	local tbOpt = {}
	for i=1, getn(BattleManagerDef) do
		local nMapId = BattleManagerDef[i][2]
		local pManager = BattleManagerList[nMapId]
		if pManager then
			if pManager.nMinEqValue and pManager.nMaxEqValue then
				szTitle = szTitle..format("%s y猽 c莡 gi� tr� binh gi竝(%d~%d)<enter>", pManager.szName, pManager.nMinEqValue, pManager.nMaxEqValue)
			elseif pManager.nMinEqValue and not pManager.nMaxEqValue then
				szTitle = szTitle..format("%s y猽 c莡 gi� tr� binh gi竝 %d tr� l猲<enter>", pManager.szName, pManager.nMinEqValue)
			elseif pManager.nMaxEqValue and not pManager.nMinEqValue then
				szTitle = szTitle..format("%s y猽 c莡 gi� tr� binh gi竝%d tr� xu鑞g<enter>", pManager.szName, pManager.nMaxEqValue)
			else
				szTitle = szTitle..format("%s kh玭g y猽 c莡 gi� tr� binh gi竝", pManager.szName)
			end
			tinsert(tbOpt, {pManager.szName, select_mamager, {nMapId, nServerId}})
		end
	end
	tinsert(tbOpt, {"K誸 th骳 i tho筰"})
	CreateNewSayEx(szTitle, tbOpt)
end

function select_mamager(nMapId, nServerId)
	local pManager = BattleManagerList[nMapId]
	if not pManager then
		return
	end
	local _, nValue = GetRoleEquipValue()
	if (not pManager.nMinEqValue or nValue >= pManager.nMinEqValue) and
		(not pManager.nMaxEqValue or nValue <= pManager.nMaxEqValue) then
		local szServerName = TripC_GetServerName(nServerId)
		local nIfCanOffLine = check_if_can_offline()
		if szServerName and nIfCanOffLine == nil then
			TripC_Apply(szServerName, 0, pManager.nMapId, 1541, 3178)
		end
	else
		return  Talk(1, "", format("Gi� tr� binh gi竝 c馻 ngi(%d)kh玭g ph� h頿 y猽 c莡", nValue))
	end
end

function get_item()
	tbAwardTemplet:Give({szName="Huy襫 Kim Ng鋍 B礽",tbProp={6,1,3035,1,0,0},}, 1, {"TRIP", "get item"})
end

--EventSys:GetType("AddNpcOption"):Reg("V� binh th祅h m玭","Ta mu鑞 nh薾 huy襫 Kim Ng鋍 B礽", get_item)