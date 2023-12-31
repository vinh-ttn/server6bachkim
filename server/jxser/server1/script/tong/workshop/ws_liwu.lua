Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelHongBaoCoef = {}
aLevelHongBaoPrice = {}
aLevelPriceBag = {}		--激活子母袋的花费贡献度
--aLevelPartnerLevel = {} --激活子母袋的同伴等级需求
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\liwu_level_data.txt", "liwuLevelData")
	if b1~=1 then
		print("тc t謕 config l� v藅 t竎 phng th蕋 b筰!")
		return
	end
	local nRowCount = TabFile_GetRowCount("liwuLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("liwuLevelData", y, "LEVEL"))
		aLevelHongBaoCoef[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "OUTPUT_COEF"))
		aLevelHongBaoPrice[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PRICE"))
		aLevelPriceBag[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PRICE_BAG"))
		--aLevelPartnerLevel[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PARTNER_LEVEL"))
	end
	--TabFile_UnLoad("liwuLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
if MODEL_GAMESERVER == 1 then
IncludeLib("PARTNER")
end

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "T鎛g qu秐 L� ph萴 phng") ~= 1 then
		return 0
	end
	Say("<#>T鎛g qu秐 L� ph萴 phng: Ng祔 ng祔 t苙g i l�, th竛g th竛g c� tin vui. T誸 nay kh玭g nh薾 l�, c� ch╪g nh薾 h錸g bao!", 3, 
	"Nh薾 h錸g bao/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")", "K輈h ho箃 t骾 h祅h trang/#partner_bag".."("..nTongID..
	","..nWorkshopID..")", "Kh玭g c莕 u/cancel");
	return 1;
end

function partner_bag(nTongID, nWorkshopID)
	local nBagLevel = GetPartnerBagLevel()
	if (nBagLevel >=10 )then
		Say("<#>T鎛g qu秐 L� ph萴 phng: T骾 h祅h trang c馻 ngi  m� r閚g h誸 m鴆 r錳", 1, "Bi誸 r錳/cancel")
		return
	end	
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nBagLevel >= nLevel)then
		Say("T鎛g qu秐 L� ph萴 phng: Hi謓 t筰 t骾 h祅h trang c馻 ngi t c蕄 "..nBagLevel..". Hi謓 t筰, ng c蕄 s� d鬾g c馻 L� ph萴 phng kh玭g   n﹏g c蕄 t骾 h祅h trang.", 
			1, "L骳 kh竎 ta quay l筰 v藋./cancel")
			return
	end
	Say("T鎛g qu秐 L� ph萴 phng: Hi謓 t筰 t骾 h祅h trang c馻 ngi t c蕄 "..nBagLevel..", s� d鬾g <color=yellow>"..aLevelPriceBag[nBagLevel+1].."<color> 甶觤 c鑞g hi課  n韎 r閚g t骾 h祅h trang, c� ng � kh玭g?",2,
		"Th藅 t鑤 qu�, n韎 r閚g c祅g l韓 c祅g t鑤./#YaoBag("..nTongID..","..nWorkshopID..")", "T筸 th阨 ch璦 c莕 thi誸./cancel")
end

function YaoBag(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nToLevel = GetPartnerBagLevel()+1
	if (nToLevel > nLevel)then
		Say("T鎛g qu秐 L� ph萴 phng: Hi謓 t筰, ng c蕄 s� d鬾g c馻 L� ph萴 phng kh玭g   n﹏g c蕄 t骾 h祅h trang.", 
			1, "L骳 kh竎 ta quay l筰 v藋./cancel")
			return
	end
	if (GetContribution() < aLevelPriceBag[nToLevel])then
		Say("<#>T鎛g qu秐 L� ph萴 phng: 觤 c鑞g hi課 kh玭g , h穣 ra s鴆 v� bang h閕 .", 1, "Kh玭g  sao/cancel")
		return
	end
	AddContribution(-aLevelPriceBag[nToLevel])
	SetPartnerBagLevel(nToLevel)
	Say("<#>T鎛g qu秐 L� ph萴 phng: H穣 tin tng v祇 kh� n╪g c馻 ta, ngi xem, t骾 h祅h trang c馻 ngi "..nToLevel.." l祄 xong r錳, sau n祔 c� th� n nh薾 nhi襲 h錸g bao h琻.", 1, 
		"Qu� nhi猲 danh b蕋 h� truy襫/cancel")
	Msg2Player("T骾 h祅h trang  t c蕄 "..nToLevel..", kh玭g gian ch鴄 l韓 h琻 ")
end
----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --日常活动
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelHongBaoCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --初始化可领取红包数
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nHongbaoLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nHongbaoLeft < 100) then
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100);
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelHongBaoPrice[1])
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nTime = tonumber(GetLocalDate("%H%M"))
	if (nTime >= 1230 and nTime <= 2200) then
			local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
			_dbgMsg("S� nh藀 v祇 c遪 l筰 *100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
			if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
				Say("<#>T鎛g qu秐 L� ph萴 phng: Th藅 ng ti誧, h玬 nay l� ph萴  ph竧 xong, ng祔 mai h穣 n v藋!", 0)
				return 0;
			end
			Say("<#>T鎛g qu秐 L� ph萴 phng: C莕 s� d鬾g <color=yellow>"..aLevelHongBaoPrice[nLevel].."<color> 甶觤 c鑞g hi課  i l蕐 1 h錸g bao", 2, 
			"Л頲. /#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "Kh玭g mu鑞/cancel");
	else
		Talk(1,"","Th阨 gian nh薾 v藅 ph萴 l� t� 12h30 n 22h h籲g ng祔 !")
			return
	end
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelHongBaoPrice[nLevel]) then
		Say("<#>T鎛g qu秐 L� ph萴 phng: Th藅 ng ti誧, 甶觤 c鑞g hi課 kh玭g , kh玭g th� nh薾 i h錸g bao!", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>T鎛g qu秐 L� ph萴 phng: V藅 ph萴 n祔 ch璦 c�, h穣 i khi kh竎!", 0)
		return
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "H祅h trang ph秈 c� hai � tr鑞g.");
		return 
	end
	SetTaskTemp(196, 1)
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function USE_G_2(nTongID, nWorkshopID)
	SetTaskTemp(196, 0)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelHongBaoPrice[nLevel]) then
		return
	end
	AddContribution(-aLevelHongBaoPrice[nLevel]);
	Msg2Player("B筺 ti猽 t鑞 "..aLevelHongBaoPrice[nLevel].."甶觤 c鑞g hi課, nh薾 頲 1 c竔 bang h閕 th莕 b� h錸g bao!");
	AddItem(6, 1, 1021, 1, 0, 0, 0);
end
function cancel()
end

else
-----------------如果是客户端---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>Kh玭g c� bang h閕"	
	end
	local bOpen	--是否开启
	local bPause --是否暂停
	local nCurLevel --当前等级
	local nUseLevel --当前使用等级
	local nOpenFund --当前开启消耗
	local nMaintainFund --当前维护消耗
	local nPrice  --当前换取神秘红包的贡献度
	local dHongBaoCount	--当前每日神秘红包日产出数量上限
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nPrice = aLevelHongBaoPrice[nUseLevel]
			dHongBaoCount = format("%.2f", aLevelHongBaoCoef[nUseLevel] / aLevelHongBaoCoef[1])	
		else
			nPrice = "--"
			dHongBaoCount = "--"
		end
	else	--作坊未建立时只显示下一级信息
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--下级信息
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextHongBaoCount
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --升级消耗
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --下级维护消耗
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--下级开启消耗
		nNextPrice = aLevelHongBaoPrice[nUseLevel + 1] --下级换取神秘红包的贡献度
		dNextHongBaoCount = format("%.2f", aLevelHongBaoCoef[nUseLevel + 1] / aLevelHongBaoCoef[1]) --下级每日神秘红包日产出数量上限
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextHongBaoCount = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T筸 ng鮪g" elseif bOpen == 1 then state="<color=green>Khai m�" else state="<color=red>сng c鯽" end
		local szMsg = "Tr筺g th竔 t竎 phng: "..state.."<color>\n"..
			"Ъng c蕄 t竎 phng: <color=gold>"..nCurLevel.."<color>\n"..
			"Ъng c蕄 s� d鬾g hi謓 t筰: <color=gold>"..nUseLevel.."<color>\n"..
			"S秐 lng th莕 b� h錸g bao m鏸 ng祔 t╪g l猲: <color=gold>"..dHongBaoCount.."<color> l莕\n"..		
			"觤 c鑞g hi課  i l蕐 h錸g bao: <color=gold>"..nPrice.."<color>\n"..
			"Ng﹏ s竎h chi課 b� chi cho ph� b秓 tr� bang m鏸 ng祔: <color=gold>"..nMaintainFund.." v筺<color>\n"..
			"Ng﹏ s竎h ki課 thi誸 ban u: <color=gold>"..nOpenFund.." v筺<color>\n"..
			"Ng﹏ s竎h ki課 thi誸  n﹏g c蕄: <color=gold>"..nUpgradeCostFund.." v筺<color>\n"..
			"<color=green>Ъng c蕄 s� d鬾g k� ti誴 <color>\n"..
			"<color=water>S秐 lng th莕 b� h錸g bao m鏸 ng祔 t╪g l猲: <color=Violet>"..dNextHongBaoCount.."<color> l莕\n"..	
			"觤 c鑞g hi課  i l蕐 h錸g bao: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng﹏ s竎h chi課 b� chi cho ph� b秓 tr� bang m鏸 ng祔: <color=Violet>"..nNextMaintainFund.." v筺<color>\n"..
			"Ng﹏ s竎h ki課 thi誸 ban u: <color=Violet>"..nNextOpenFund.." v筺<color>\n"
		return szMsg
	else
		local szMsg = "Tr筺g th竔 t竎 phng: <color=water>Ch璦 th祅h l藀<color>\n"..
			"Ng﹏ s竎h ki課 th誸 c莕  x﹜ d鵱g: <color=gold>"..nUpgradeCostFund.." v筺<color>\n"..
			"<color=green>Ъng c蕄 k� ti誴 <color>\n"..
			"<color=water>S秐 lng th莕 b� h錸g bao m鏸 ng祔 t╪g l猲: <color=Violet>"..dNextHongBaoCount.."<color> l莕\n"..	
			"觤 c鑞g hi課  i l蕐 h錸g bao: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng﹏ s竎h chi課 b� chi cho ph� b秓 tr� bang m鏸 ng祔: <color=Violet>"..nNextMaintainFund.." v筺<color>\n"..
			"Ng﹏ s竎h ki課 thi誸 ban u: <color=Violet>"..nNextOpenFund.." v筺<color>\n"
		return szMsg
	end
end

end