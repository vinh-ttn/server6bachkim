function DefFun2(n1, n2)
	return 1
end
function DefFun3(n1, n2, n3)
	return 1
end
Include("\\script\\tong\\workshop\\workshop_setting.lua")
if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
IncludeLib("TONG")
Include("\\script\\tong\\contribution_entry.lua")
Include("\\script\\tong\\log.lua")
Include("\\script\\tong\\addtongnpc.lua")
if MODEL_GAMESERVER == 1 then
Include("\\script\\maps\\checkmap.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
end
function MONEYFUND_ADD_R(nTongID, nAdd)
	if (TONG_GetMoney(nTongID) + nAdd < 0)then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg;
	if (nAdd > 0) then
		szMsg = szMember.." �� ��ng g�p "..nAdd.." l��ng v�o ng�n qu� bang h�i"
	else
		szMsg = szMember.." �� r�t t� ng�n qu� bang h�i"..(-nAdd).." l��ng"
	end	
	Msg2Tong(nTongID, szMsg)
	if (abs(nAdd) >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "moneyadd", nTongID, {add = nAdd})
	end
	return 1
end
function MONEYFUND_ADD_G_1(nTongID, nAdd)
	local nCash = GetCash()
	if (nCash < nAdd)then
		Msg2Player("Kh�ng �� ng�n l��ng!")
		return 0
	end
	local nMax = 2000000000	
	if (abs(nAdd) > nMax) then
		Msg2Player("Ng�n l��ng n�p v�o qu� nhi�u!")
		return 0
	end
	if (nAdd > 0)then	
		if Pay(nAdd) ~= 1 then
			return 0
		end
	else			
		if nCash > nMax + nAdd then 
			Msg2Player("Kh�ng th� r�t ng�n l��ng! S� ng�n l��ng trong h�nh trang s� v��t m�c cho ph�p!")
			return 0
		end
	end
	return 1
end
function MONEYFUND_ADD_G_2(nTongID, nAdd)
	if (nAdd < 0)then
		Earn(-nAdd)
	end
	return 1
end
function MONEYFUND2BUILDFUND_R(nTongID, nOffer)
	if (TONG_GetMoney(nTongID) < nOffer)then
		return 0
	end
	local nCurFund = TONG_GetWeekBuildFund(nTongID)
	local nAdd = floor(nOffer/COEF_CONTRIB_TO_VALUE)
	if (nCurFund +  nAdd > tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID)))then
		return 0
	end
	if (TONG_ApplyAddMoney(nTongID, -nOffer) == 1 and TONG_ApplyAddBuildFund(nTongID, nAdd) == 1)then
------------------------------------------------------------------------------------------------------------
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_AntiHackMoney,-(nOffer*10000));
------------------------------------------------------------------------------------------------------------
		TONG_ApplyAddWeekBuildFund(nTongID, nAdd)
		local szMember = TONGM_GetName(nTongID, ExecutorId);
		local szMsg = szMember.." l�m cho"..nOffer.."Ng�n s�ch bang chuy�n "..nAdd.." v�n l��ng v�o ng�n s�ch ki�n thi�t"
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEYFUND2BF, nAdd)
		TONG_ApplyAddEventRecord(nTongID, szMsg);	
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "moneyfund2buildfund", nTongID, {money = nOffer, buildfund = nAdd})
		return 1
	end
	return 0
end
function MONEYFUND2BUILDFUND_G_1(nTongID, nOffer)
	if (TONG_GetMoney(nTongID) < nOffer)then
		Msg2Player("Ng�n s�ch bang h�i kh�ng ��")
		return 0
	end
	if (nOffer < 10000)then
		Msg2Player("Chuy�n kho�n t�i thi�u l� 1 v�n l��ng!")
		return 0
	end
	local nCurFund = TONG_GetWeekBuildFund(nTongID)
	if (nCurFund + nOffer/COEF_CONTRIB_TO_VALUE > tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID)))then
		Msg2Player("Kh�ng th� chuy�n ng�n, v� s� l�m ng�n s�ch ki�n thi�t bang v��t qu� gi�i h�n tu�n!")
		return 0
	end
	return 1
end
MONEYFUND2BUILDFUND_G_2 = DefFun2
function BUILDFUND2WARFUND_R(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) >= nOffer)then
		if (TONG_ApplyAddBuildFund(nTongID, -nOffer) == 1 and TONG_ApplyAddWarBuildFund(nTongID, nOffer) == 1) then
			local szMember = TONGM_GetName(nTongID, ExecutorId);
			local szMsg = szMember.." l�m cho"..nOffer.." v�n ng�n s�ch ki�n thi�t chuy�n sang ng�n s�ch chi�n b�."
			TONG_ApplyAddTaskValue(nTongID, TONGTSK_BF2WF, nOffer)	
			TONG_ApplyAddEventRecord(nTongID, szMsg);	
			Msg2Tong(nTongID, szMsg);
			cTongLog:WriteInfTB("FUND", "buildfund2warfund", nTongID, {buildfund2warfund = nOffer})
			return 1
		end		
	end
	return 0
end
function BUILDFUND2WARFUND_G_1(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) <  nOffer)then
		Msg2Player("Ng�n s�ch ki�n thi�t bang kh�ng ��!")
		return 0
	end
	return 1
end
BUILDFUND2WARFUND_G_2 = DefFun2
function MONEY2BUILDFUND_R(nTongID, nOffer)
	local nTotalBuildfundAdd = floor(nOffer / 10000)
	local nBuildfundAdd = 0
	local nStoredAdd = 0
	local nCurBuildFund = TONG_GetWeekBuildFund(nTongID)
	local nWeekBuildUpper = tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
	if (nCurBuildFund >= nWeekBuildUpper)then
		nStoredAdd = nTotalBuildfundAdd
		nBuildfundAdd = 0
	elseif (nCurBuildFund + nTotalBuildfundAdd >= nWeekBuildUpper)then
		nStoredAdd = nTotalBuildfundAdd -  (nWeekBuildUpper - nCurBuildFund)
		nBuildfundAdd = nTotalBuildfundAdd - nStoredAdd
	else
		nStoredAdd = 0
		nBuildfundAdd = nTotalBuildfundAdd
	end
	if (nBuildfundAdd > 0)then
		TONG_ApplyAddBuildFund(nTongID, nBuildfundAdd)
		TONG_ApplyAddWeekBuildFund(nTongID, nBuildfundAdd)
	end
	if (nStoredAdd > 0)then
		TONG_ApplyAddStoredBuildFund(nTongID, nStoredAdd)
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg = szMember.." �� ��ng g�p "..(nOffer / 10000).." v�n l��ng v�o ng�n s�ch ki�n thi�t bang"
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEY2BF, nTotalBuildfundAdd)
	if (nOffer >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "money2buildfund", nTongID, {money = nOffer, buildfund = nBuildfundAdd, storebuildfund = nStoredAdd})
	return 1
end
function MONEY2BUILDFUND_G_1(nTongID, nOffer)
	if (nOffer < 10000)then
		Msg2Player("M�i l�n quy�n g�p t�i thi�u l� 1 v�n l��ng!")
		return 0
	end
	if (GetCash() < nOffer)then
		Msg2Player("Ng�n l��ng kh�ng ��!")
		return 0
	end
	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE)then
		Msg2Player("�n s� kh�ng th� ��ng g�p!")
		return 0
	end
	local nContribution = floor(nOffer/COEF_CONTRIB_TO_VALUE)
	local nWeekTotal = GetWeeklyOffer()
	if (nWeekTotal + nContribution > MAX_WEEK_CONTRIBUTION)then
		Msg2Player("Kh�ng th� ��ng g�p, v� l�m cho �i�m c�ng hi�n t�ch l�y s� v��t qu� gi�i h�n tu�n!")
		return 0
	end
	Pay(nOffer)
	AddWeeklyOffer(nContribution)
	AddCumulateOffer(nContribution)
	if (AddContribution(nContribution) ~= 1)then
		return 0
	end
	Msg2Player("B�n ��ng g�p <color=gold>"..nOffer.."<color> l��ng v�o ng�n s�ch ki�n thi�t bang, nh�n ���c <color=green>"..nContribution.."<color> �i�m c�ng hi�n")
	return 1
end
MONEY2BUILDFUND_G_2 = DefFun2
function CONTRIBUTION2STOREOFFER_R(nTongID, nExecutor, nOffer)
	if (TONG_ContributeOffer(nTongID, nExecutor, nOffer) ~= 1) then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg = szMember.." �� ��ng g�p "..nOffer.." �i�m c�ng hi�n v�o ng�n s�ch c�ng hi�n bang"
	if (nOffer >= 100) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "contribution2storeoffer", nTongID, {contribution2storeoffer = nOffer})
	return 1
end
function CONTRIBUTION2STOREOFFER_G_1(nTongID, nExecutor, nOffer)
	if (GetContribution() < nOffer or AddContribution(-nOffer, 0) ~= 1)then
		Msg2Player("�i�m c�ng hi�n kh�ng ��!")
		return 0
	end
	return 1
end
CONTRIBUTION2STOREOFFER_G_2 = DefFun3
g_szFigure = { "To�n th� bang h�i", "Bang ch� ", "Tr��ng L�o", "��i tr��ng", "�� t� ", "�n s�" }
function STOREOFFER2CONTRIBUTION1_R(nTongID, nFigure, nOffer)
	if (TONG_IsExist(nTongID) ~= 1)then
		return 0
	end
	if (TONG_DistributeOfferToGroup(nTongID, nFigure, nOffer) == 1) then
		local szMaster = TONGM_GetName(nTongID, ExecutorId);
		local szMsg = szMaster.."Th�nh vi�n tr�n m�ng"..g_szFigure[nFigure+2].."("..nCounts.." ng��i) ���c ph�n ph�t "..nOffer.." �i�m c�ng hi�n!"
		TONG_ApplyAddEventRecord(nTongID, szMsg);
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution1", nTongID, {storeoffer2contribution = nOffer})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION1_G_1(nTongID, nFigure, nOffer)
	local nCounts = TONG_GetOnlineCount(nTongID, nFigure)
	if (TONG_GetStoredOffer(nTongID) < nCounts * nOffer)then
		Msg2Player("Ng�n s�ch c�ng hi�n kh�ng �� �� ph�t!")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION1_G_2 = DefFun3
function STOREOFFER2CONTRIBUTION2_R(nTongID, nMemberID, nOffer)
	if (TONGM_IsExist(nTongID, nMemberID) == 0)then
		return 0
	end
	if (TONG_DistributeOfferToMember(nTongID, nMemberID, nOffer) == 1) then
		local szMaster = TONGM_GetName(nTongID, ExecutorId);
		local szMember = TONGM_GetName(nTongID, nMemberID);
		local szMsg = format("%s ph�t cho %s %d �i�m c�ng hi�n d� tr�",szMaster,szMember,nOffer);
		if (nOffer > 100)then
			TONG_ApplyAddEventRecord(nTongID, szMsg);	
		end
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution2", nTongID, {storeoffer2contribution = nOffer, member = szMember})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION2_G_1(nTongID, nMemberID, nOffer)
	if (TONGM_IsExist(nTongID, nMemberID) == 0)then
		Msg2Player("Ng�n s�ch �i�m c�ng hi�n ch� c� th� ph�t cho th�nh vi�n trong bang!")
		return 0
	end
	if (TONG_GetStoredOffer(nTongID) < nOffer)then
		Msg2Player("Ng�n s�ch c�ng hi�n kh�ng ��!")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION2_G_2 = DefFun3
function MEMBER_KICK_R(nTongID, nMemberID, nFlag)
	if (TONGM_IsExist(nTongID, nMemberID) ~= 1) then
		return 0;
	end
------------------------------------------------------------------------------------------------------------
	OutputMsg("sss"..TONGM_GetName(nTongID, ExecutorId))
------------------------------------------------------------------------------------------------------------
	local nMemberFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (nMemberFigure == 0 or nMemberFigure == 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2PlayerByName(szExecutorName, TB_TONG_FIGURE_NAME[nMemberFigure].." kh�ng th� b� tr�c xu�t!");
		return 0;
	end
	local nStoredBuildFund = TONG_GetStoredBuildFund(nTongID)
	local nBuildFund = TONG_GetBuildFund(nTongID)
	local nWarFund = TONG_GetWarBuildFund(nTongID)
	local nOffer = TONGM_GetOffer(nTongID, nMemberID)
	if (nOffer <= 0) then
		local szExcutor = TONGM_GetName(nTongID, ExecutorId);
		local szMember = TONGM_GetName(nTongID, nMemberID);
		local szMsg = szExcutor.." tr�c xu�t "..szMember.." ra kh�i bang h�i!"
		Msg2Tong(nTongID, szMsg)
		cTongLog:WriteInfTB("MEMBER", "kick", nTongID, {member = szMember})
		return 1
	end
	local nDel = (nOffer + 19) / 20
	TONGM_ApplyAddOffer(nTongID, nMemberID, -nDel)
	local nBuildDec = floor(nOffer * 0.6)
	local nWarBuildDec = floor(nOffer * 0.4)
	if (nWarFund < nWarBuildDec)then
		return 0
	end
	if (nStoredBuildFund < nBuildDec)then
		if (nBuildFund < nBuildDec - nStoredBuildFund)then
			return 0
		end
		TONG_ApplyAddStoredBuildFund(nTongID, -nStoredBuildFund)
		TONG_ApplyAddBuildFund(nTongID, nStoredBuildFund - nBuildDec)
	else
		TONG_ApplyAddStoredBuildFund(nTongID, -nBuildDec)		
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nBuildDec)
	TONG_ApplyAddWarBuildFund(nTongID, -nWarBuildDec)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nWarBuildDec)
	local szExcutor = TONGM_GetName(nTongID, ExecutorId);
	local szMember = TONGM_GetName(nTongID, nMemberID);
	local szMsg = szExcutor.." tr�c xu�t "..szMember.." tr�c xu�t kh�i bang h�i, ng�n s�ch ki�n thi�t d� tr� gi�m"..nBuildDec..
		" v�n, ng�n s�ch chi�n b� gi�m"..nWarBuildDec.." v�n!"
	Msg2Tong(nTongID, szMsg)	
	if (nStoredBuildFund < nBuildDec)then
		Msg2Tong(nTongID, "Khi tr�c xu�t ng��i ng�n s�ch ki�n thi�t d� tr� kh�ng ��, ph�n thi�u h�t s� kh�u tr� v�o ng�n s�ch ki�n thi�t!")	
	end
	cTongLog:WriteInfTB("MEMBER", "kick", nTongID, {member = szMember, builddec = nBuildDec, warbuilddec = nWarBuildDec})
	return 1
end
function MEMBER_KICK_G_1(nTongID, nMemberID, nFlag)
--------------------------------------------------------------------------------------------------------------------------
	print("Kick chay ne troi oi"..TONGM_GetName(nTongID, ExecutorId))
--------------------------------------------------------------------------------------------------------------------------
	if (TONGM_IsExist(nTongID, nMemberID) ~= 1) then
		return 0;
	end
	local nMemberFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (nMemberFigure == 0 or nMemberFigure == 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2Player(TB_TONG_FIGURE_NAME[nMemberFigure].." kh�ng th� b� tr�c xu�t!");
		return 0;
	end	
	local nKickCount = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT);	
	local nKickDate  = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE);	
	local nDate 	 = tonumber(GetLocalDate("%Y%m%d"));						
	if (nKickDate ~= nDate) then
		nKickCount = 0;
		nKickDate  = nDate;
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, 	nKickCount);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE, 	nKickDate);
	end
	
	if(nKickCount >= MAX_KICK_COUNT) then
		local szMsg = format("M�i ng�y ch� ���c gi�i t�n %d bang ch�ng!",MAX_KICK_COUNT);
		Msg2Player(szMsg);
		return 0;
	end
	
	local nStoredBuildFund = TONG_GetStoredBuildFund(nTongID)
	local nBuildFund = TONG_GetBuildFund(nTongID)
	local nWarFund = TONG_GetWarBuildFund(nTongID)
	local nOffer = TONGM_GetOffer(nTongID, nMemberID)
	if (nOffer <= 0)then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, nKickCount+1);
		return 1
	end
	local nBuildDec = floor(nOffer * 0.6)
	local nWarBuildDec = floor(nOffer * 0.4)
	if (nFlag == 1)then
------------------------------------------------------------------------------------------------------------
	print("Kick chay ne 1")
------------------------------------------------------------------------------------------------------------
		Say("<#>Tr�c xu�t th�nh vi�n s� kh�u tr� ng�n s�ch ki�n thi�t d� tr� c�a bang"..nBuildDec.." v�n (n�u ng�n s�ch ki�n thi�t d� tr� kh�ng �� s� tr� v�o ng�n s�ch ki�n thi�t) v� ng�n s�ch chi�n b�"..nWarBuildDec.." v�n, c� ��ng � kh�ng?", 
			2, "Tr�c xu�t/#KickConfirm("..nTongID..","..nMemberID..")", "H�y b� /#Cancel")
	elseif (nFlag == 2)then
------------------------------------------------------------------------------------------------------------
		print("Kick chay ne 2 ")
------------------------------------------------------------------------------------------------------------
		if (nWarFund < nWarBuildDec)then
			Msg2Player("Sau khi tr�c xu�t th�nh vi�n, ng�n s�ch chi�n b� s� kh�u tr� th�nh s� �m, t�m th�i kh�ng th� tr�c xu�t th�nh vi�n!")
			return 0
		end
		if (nStoredBuildFund < nBuildDec)then
			if (nBuildFund < nBuildDec - nStoredBuildFund)then
				Msg2Player("Sau khi tr�c xu�t th�nh vi�n, ng�n s�ch ki�n thi�t s� kh�u tr� th�nh s� �m, t�m th�i kh�ng th� tr�c xu�t th�nh vi�n!")
				return 0
			end
		end			
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, nKickCount+1);
		return 1
	end
	return 0
end
function MEMBER_KICK_G_2(nTongID, nMemberID, nFlag)
	return 1
end
------------------------------------------------------------------------------------------------------------
function KickConfirm(nTongID, nMemberID)
	if TONG_GetMemberCount(nTongID, -1) >= 2 then
	TONG_ApplyKickMember(nTongID, nMemberID, 2)
	end
end
------------------------------------------------------------------------------------------------------------
function MEMBER_RETIRE_R(nTongID, nMemberID, bRetireOrNot)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local szMemberName = TONGM_GetName(nTongID, nMemberID);
	local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
	local nFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (bRetireOrNot == 1) then
		if (nFigure ~= 2 and nFigure ~= 3) then
			local szPerson = szMemberName;
			if (ExecutorId == nMemberID) then
				szPerson = "B�n ";
			end
			Msg2PlayerByName(szExecutorName, szPerson.." ��m nhi�m ch�c v� quan tr�ng, kh�ng th� tho�i �n, ch� c� ��i tr��ng v� bang ch�ng m�i c� th� tho�i �n!");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2PlayerByName(szExecutorName, "Tr��c m�t s� ng��i tho�i �n c�a bang �� ��t gi�i h�n, kh�ng th� ti�p t�c s� d�ng thao t�c tho�i �n"..nRetiredMemberCount);
			return 0;
		end
		local szMsg = ""
		if (ExecutorId ~= nMemberID) then
			if (TONGM_GetOnline(nTongID, nMemberID) == 1 or
				nTodayDate - TONGM_GetLastOnlineDate(nTongID, nMemberID) < TONGMEMBER_RETIRE_REQUIRE_DAY) then
					Msg2PlayerByName(szExecutorName, "Ch� c� th� cho tho�i �n ��i v�i th�nh vi�n kh�ng l�n m�ng t� "..TONGMEMBER_RETIRE_REQUIRE_DAY.." ng�y tr� l�n!");
					return 0;
			end
			szMsg = szExecutorName.." vs "..szMemberName.."Ti�n h�nh thao t�c tho�i �n"
		else
			szMsg = szMemberName.."Tho�i �n kh�i bang h�i"
		end
		Msg2Tong(nTongID, szMsg);
		TONGM_ApplySetRetireDate(nTongID, nMemberID, nTodayDate);
		cTongLog:WriteInfTB("MEMBER", "retire", nTongID, {member = szMemberName})
	elseif (bRetireOrNot == 0) then
		if (nFigure ~= 4) then
			cTongLog:WriteErr("MEMBER", "unretire", nTongID, {member = szMemberName})
			return 0;
		end
		if (nTodayDate - TONGM_GetRetireDate(nTongID, nMemberID) < TONGMEMBER_UNRETIRE_REQUIRE_DAY) then
			Msg2PlayerByName(szExecutorName, "K� t� ng�y tho�i �n"..TONGMEMBER_UNRETIRE_REQUIRE_DAY.." ng�y sau ng�y tho�i �n m�i c� th� h�y b� tho�i �n!");
			return 0;
		end
		Msg2PlayerByName(szExecutorName, "H�y b� tho�i �n th�nh c�ng!");
		TONGM_ApplySetRetireDate(nTongID, nMemberID, 0);
		cTongLog:WriteInfTB("MEMBER", "unretire", nTongID, {member = szMemberName})
	end
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1;
end
function MEMBER_RETIRE_G_1(nTongID, nMemberID, bRetireOrNot)
	local nFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (bRetireOrNot == 1) then
		local szMemberName = TONGM_GetName(nTongID, nMemberID);
		if (nFigure ~= 2 and nFigure ~= 3) then
			local szPerson = szMemberName;
			if (GetTongMemberID() == nMemberID) then
				szPerson = "B�n ";
			end
			Msg2Player(szPerson.." ��m nhi�m ch�c v� quan tr�ng, kh�ng th� tho�i �n, ch� c� ��i tr��ng v� bang ch�ng m�i c� th� tho�i �n!");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2Player("Tr��c m�t s� ng��i tho�i �n c�a bang �� ��t gi�i h�n, kh�ng th� ti�p t�c s� d�ng thao t�c tho�i �n");
			return 0;
		end
	else
		if (nFigure ~= 4) then	
			return 0;
		end
	end
	return 1;
end
MEMBER_RETIRE_G_2 = DefFun3
function MEMBER_ONLINE_R(nTongID, nMemberID, bOnline)
	if (bOnline == 1) then
	else
		local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
		TONGM_ApplySetLastOnlineDate(nTongID, nMemberID, nTodayDate);
	end
	return 1;
end
MEMBER_ONLINE_G_1 = DefFun3
MEMBER_ONLINE_G_2 = DefFun3
function MEMBER_REMOVE_R(nTongID, nMemberID)
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	local szMember = TONGM_GetName(nTongID, nMemberID);
	cTongLog:WriteInfTB("MEMBER", "remove", nTongID, {member = szMember});
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1
end
MEMBER_REMOVE_G_1 = DefFun2
MEMBER_REMOVE_G_2 = DefFun2
function MEMBER_ADD_R(nTongID, nMemberID, nOfferBring)
	local nBuildAdd = floor(nOfferBring * 0.6)
	local nWarBuildAdd = floor(nOfferBring * 0.4)
	TONG_ApplyAddStoredBuildFund(nTongID, nBuildAdd)
	TONG_ApplyAddWarBuildFund(nTongID, nWarBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFADD, nBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nWarBuildAdd)
	local szMember = TONGM_GetName(nTongID, nMemberID)
	local szMsg = szMember.." gia nh�p b�n bang, ng�n s�ch ki�n thi�t d� tr� bang h�i t�ng"..nBuildAdd..
		" v�n, ng�n s�ch chi�n b� t�ng"..nWarBuildAdd.." v�n!"
	Msg2Tong(nTongID, szMsg)
	local szExecutor = TONGM_GetName(nTongID, ExecutorId);
	cTongLog:WriteInfTB("MEMBER", "add", nTongID, {member = szMember, buildadd = nBuildAdd, warbuildadd = nWarBuildAdd})
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1
end
------------------------------------------------------------------------------------------------------------
function MEMBER_ADD_G_1(nTongID, nMemberID, nOfferBring)
Msg2Player("sssssssssssss")
return 1
end

function MEMBER_ADD_G_2(nTongID, nMemberID, nOfferBring)
Msg2Player(format("Ch�t cmmd %d %d ",nTongID,nMemberID))
return 1
end
------------------------------------------------------------------------------------------------------------
function MEMBER_SETFIGURE_R(nTongID, nMemberID, nFigure)
	if (nFigure == TONG_ELDER)then
		if TONG_GetMemberCount(nTongID, TONG_ELDER) >= MAX_ELDER_COUNT then
			if ExecutorId and ExecutorId ~= 0 then 
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "S� l��ng tr��ng l�o �� ��t gi�i h�n!");
			end	
			return 0
		end
	elseif (nFigure == TONG_MANAGER)then
		if TONG_GetMemberCount(nTongID, TONG_MANAGER) >= MAX_MANAGER_COUNT then
			if ExecutorId and ExecutorId ~= 0 then 
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "S� l��ng ��i tr��ng �� ��t gi�i h�n!");
			end					
			return 0	
		end
	end
	local szMember = TONGM_GetName(nTongID, nMemberID);
	cTongLog:WriteInfTB("MEMBER", "setfigure", nTongID, {member = szMember, figure = nFigure});
	return 1
end
MEMBER_SETFIGURE_G_1 = DefFun3
MEMBER_SETFIGURE_G_2 = DefFun3
function MAP_SET_R(nTongID, nMapID)
	if (TONG_GetTongMap(nTongID) ~= 0)then
		return 0
	end
	local szMsg = "�� c� khu v�c bang h�i chung, nh�p v�o n�t <V�o b�n bang> �� �i v�o khu v�c n�y!"
	Msg2Tong(nTongID, szMsg)		
	TONG_ApplyAddHistoryRecord(nTongID, szMsg);	
	TONG_ApplyAddEventRecord(nTongID, szMsg);	
	cTongLog:WriteInfTB("MAP", "set", nTongID, {mapid = nMapID});
	return 1
end
MAP_SET_G_1	= DefFun2
MAP_SET_G_2	= DefFun2

function GenParam(aInfo)
	local i = aInfo[1]
	aInfo[1] = i+1
	local mapcopy = aDynMapCopy[i]
	return aDynMapCopyName[mapcopy]..aInfo[2]..mapcopy..")"
end
function EnterMap(nTongID, nMapCopy)
	if (GetFightState() ~= 0)then
		Msg2Player("Ch� c� th� �i v�o t� khu v�c phi chi�n ��u!")
		return
	end
	local pos = GetMapEnterPos(nMapCopy)
	NewWorld(nMapCopy, pos.x, pos.y)
end
function CreatMap(nTongID, nMapCopy)
	TONG_ApplyCreatMap(nTongID, nMapCopy)
end
function BrowseMap(nTongID)
	local aInfo = {1, "/#EnterMap("..nTongID..","}		
	Say("<#>H�y ch�n b�n �� mu�n xem", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"Kh�ng xem n�a!/#Cancel")
end
function SelectMap(nTongID)
	local aInfo = {1, "/#CreatMap("..nTongID..","}		
	Say("<#>Qu� bang mu�n x�y d�ng bang � ��u?", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"C�n suy x�t l�i/#Cancel")
end
MAP_CREAT_R		= DefFun2
function MAP_CREAT_G_1(nTongID, nMapCopy)
	local nTongMap = TONG_GetTongMap(nTongID) 
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongMap > DYNMAP_ID_BASE) then
		Say("<#> Qu� bang �� c� khu v�c ri�ng!", 0)
		return 0
	elseif (nMapCopy == 0 and nTongLevel < 2) then
		if(nTongMap > 0)then
			Say("<#>Bang h�i �� c� khu v�c chung, khi ��ng c�p ki�n thi�t ��t ��n 2 th� c� th� x�y d�ng khu v�c ho�t ��ng ri�ng!", 0)
			return 0
		else
			local nrand = mod(nTongID, 4) + 1
			local aNum = {
				gb_GetTask("TONG_PUBLIC_MAP", 1),
				gb_GetTask("TONG_PUBLIC_MAP", 2),
				gb_GetTask("TONG_PUBLIC_MAP", 3),
				gb_GetTask("TONG_PUBLIC_MAP", 4),
				}
			Say("<#>Hi�n ��ng c�p ki�n thi�t d��i c�p 2, ch� c� th� d�ng khu v�c chung, h�y ch�n 1 khu v�c chung (n�n d�ng khu v�c c� �t bang h�i):  ", 6,
			"L�a ch�n ng�u nhi�n/#PublicMap("..nTongID..","..nrand..")", 
			"Khu v�c chung 1 (�� c� "..aNum[1].." bang h�i)/#PublicMap("..nTongID..",1)", 
			"Khu v�c chung 2 (�� c� "..aNum[2].." bang h�i)/#PublicMap("..nTongID..",2)",
			"Khu v�c chung 3 (�� c� "..aNum[3].." bang h�i)/#PublicMap("..nTongID..",3)", 
			"Khu v�c chung 4 (�� c� "..aNum[4].." bang h�i)/#PublicMap("..nTongID..",4)",
			"H�y b� /#Cancel"
			)
			return 0
		end
	end
	if (nMapCopy == 0) then
		Say("<#>Bang h�i hi�n t�i c� th� s� h�u khu v�c ri�ng, c� mu�n th�nh l�p kh�ng?", 2, "V�o xem th�/#BrowseMap("..nTongID..")", 
			"T�o b�n ��/#SelectMap("..nTongID..")")
		return 0
	end
	return 1
end
MAP_CREAT_G_2	= DefFun2

function PublicMap(nTongID, nSelect)
	gb_AppendTask("TONG_PUBLIC_MAP", nSelect, 1)
	TONG_ApplySetTongMap(nTongID, aPublicMap[nSelect])
end
function MAP_CREATED_R(nTongID, dwMapID, nMapCopy)
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE and nMapCopy > 0)then
		local mapname = aDynMapCopyName[nMapCopy]
		if (mapname == nil)then
			mapname = "Kh�ng bi�t n�i n�o"
		end
		local szMsg = "Xin ch�c m�ng, qu� bang �� s� h�u khu v�c ho�t ��ng ri�ng, bang ch�ng c� th� ch�n <�i v�o b�n bang> �� b��c v�o!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddHistoryRecord(nTongID, szMsg);
		TONG_ApplyAddEventRecord(nTongID, szMsg);	
		cTongLog:WriteInfTB("MAP", "create", nTongID, {mapid = dwMapID, mapname = mapname})
	end
	return 1
end
MAP_CREATED_G_1 = DefFun2
function MAP_CREATED_G_2(nTongID, nMapID, nMapCopy)
	nMapIdx = SubWorldID2Idx(nMapID)
	if nMapIdx < 0 or nMapCopy <= 0 then
		return 
	end
	SetWorldName(nMapIdx, TONG_GetName(nTongID).." - l�nh ��a")
	SetMapType(nMapIdx, 1);
	SetMapParam(nMapIdx, 0, nTongID);
	add_one_citytong_npc(nMapIdx, nMapCopy);
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID)
	local npcid
	while(nWorkshopID ~= 0)do
		local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		if (nUseLevel > 0)then
			npcid = add_one_building(nMapIdx, nMapCopy, TWS_GetType(nTongID, nWorkshopID), nUseLevel)
			TWS_SetBuildingNpc(nTongID, nWorkshopID, npcid)
		end	
		nWorkshopID = TWS_GetNextWorkshop(nTongID, nWorkshopID)
	end
	local nCurLevel = TONG_GetBuildLevel(nTongID)
		if (nCurLevel == 4) then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C�t bi�u t��ng bang h�i")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C�t bi�u t��ng bang h�i")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		elseif (nCurLevel == 5) then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C�t bi�u t��ng bang h�i")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C�t bi�u t��ng th�nh th")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], 0)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\city_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			local nCitySTID = tong_GetCityStuntID(nTongID)
			if (nStuntID ~= 0 and nCitySTID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nCitySTID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	return 1
end
function RELEASE_G()
	local nTongID = TONG_GetFirstTong()
	while nTongID ~= 0 do
		local nCurValue = TONG_GetTaskTemp(nTongID, TONG_FUNDTEMP)
		TongFundAdd(nTongID,  nCurValue)
		TONG_SetTaskTemp(nTongID, TONG_FUNDTEMP, 0)
		nTongID = TONG_GetNextTong(nTongID)
	end
	return 1
end
function ENTER_TONG_MAP_G(nTongID)
	if (GetLevel() < 10) then
		Msg2Player("Ng��i ch�i c�p 10 tr� l�n m�i c� th� b��c v�o l�nh ��a bang h�i!");
		return 0;
	end
	local dwSelfMapID = SubWorldIdx2ID(SubWorld);
	if (GetFightState() == 1 or (IsCityMap(dwSelfMapID) ~= 1 and IsFreshmanMap(dwSelfMapID) ~= 1 and IsTongMap(dwSelfMapID) ~= 1)) then
		Msg2Player("Ch� c� th� �i v�o l�nh ��a bang h�i t� nh�ng khu v�c phi chi�n ��u!");
		return 0;
	end
	local szTongName = TONG_GetName(nTongID);
	if (szTongName == nil or szTongName == "") then
		Msg2Player("Bang h�i n�y kh�ng t�n t�i, kh�ng th� v�o khu v�c bang!");
		return 0;
	end
	local _,SelfTong = GetTongName()
	local dwTargetMapID = TONG_GetTongMap(nTongID);
	if (dwTargetMapID <= 0) then
		Msg2Player(szTongName.." Kh�ng c� khu v�c bang h�i, kh�ng th� �i v�o!");
	 	return 0;
	end
	if (dwTargetMapID == dwSelfMapID) then
		Msg2Player("B�n �ang ��ng t�i khu v�c n�y r�i!");
		return 0;
	end
	local nMapCopy = TONG_GetTongMapTemplate(nTongID)
	local pos = GetMapEnterPos(nMapCopy)
	NewWorld(dwTargetMapID, pos.x, pos.y);	
end
function CONFIGURE_TONG_MAP_G(nTongID)
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE) then
		Msg2Player("Bang h�i c� khu v�c ri�ng m�i c� th� s� d�ng ch�c n�ng n�y!")
		return 0		
	end
	local ban = TONG_GetTongMapBan(nTongID)
	local szBan = {[0]="Thi�t l�p c�m ��a/#SetTongMapBan("..nTongID..",1)",
				 [1]="H�y b� c�m ��a/#SetTongMapBan("..nTongID..",0)"}
	local szState = {[0]="<color=green>Cho ph�p<color>",
				[1]="<color=red>Ng�n c�m<color>"}
	if (ban ~= 0)then
		ban = 1
	end	
	local szMsg = "C� th� l�a ch�n cho ph�p hay ng�n c�m th�nh vi�n bang h�i kh�c th�m nh�p, t�nh tr�ng hi�n t�i l�:"
	Say(szMsg..szState[ban], 2, szBan[ban], "H�y b�/#Cancel")
	return 1
end
function SetTongMapBan(nTongID, bOpen)
	TONG_ApplySetTongMapBan(nTongID, bOpen)
	local szExcutor = GetName();
	local szState = {[0]="Cho ph�p",
				[1]="Ng�n c�m"}	
	local szMsg = szExcutor.." Thay ��i t�nh tr�ng khu v�c th�nh: "..szState[bOpen]
	Msg2Player("Thi�t l�p th�nh c�ng!")
	TONG_ApplyAddEventRecord(nTongID, szMsg);
end
MAP_BAN_R = DefFun2
MAP_BAN_G_1 = DefFun2
function MAP_BAN_G_2(nTongID, bBan)
	local nMap = TONG_GetTongMap(nTongID)
	if (nMap <= DYNMAP_ID_BASE)then
		return 1
	end
	nMap = SubWorldID2Idx(nMap)
	if(bBan == 1 and nMap >= 0)then
		local nMapCopy = SubWorldIdx2MapCopy(nMap)
		local nPlayer = GetFirstPlayerAtSW(nMap)
		while(nPlayer > 0)do
			PlayerIndex = nPlayer
			local _,b = GetTongName()
			if (b ~= nTongID)then
				SetFightState(0)
				local pos = GetMapEnterPos(nMapCopy)
				SetPos(pos.x, pos.y)
				Msg2Player("Khu v�c n�y �� ���c thi�p l�p c�m ��a, kh�ng th� b��c v�o!")
			end
			nPlayer = GetNextPlayerAtSW(nMap)
		end
	end
	return 1
end
function CITY_OCCUPY_R(nOwner, nPreOwner, nCityMap)
	TONG_ApplySetOccupyCityDay(nOwner, TONG_GetDay(nOwner));
	if (nPreOwner == 0)then
		return 1
	end
	TONG_ApplySetOccupyCityDay(nPreOwner, 0);
	if (TONG_GetBuildLevel(nPreOwner) >= 5) then
		TONG_ApplyDegrade(nPreOwner)
		local szMsg="Bang h�i b� m�t th�nh, ��ng c�p ki�n thi�t bang gi�m xu�ng c�p 4"
		Msg2Tong(nPreOwner, szMsg)
		TONG_ApplyAddEventRecord(nPreOwner, szMsg);	
	end
	cTongLog:WriteInfTB("TONG", "occupy_city", nOwner, {preowner = nPreOwner, city = nCityMap});
	return 1
end
function CONFIGURE_TONG_STUNT_G()
	local _, nTongID = GetTongName()
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	if (nStuntID == 0) then
		Describe("H�y l�a ch�n k� n�ng ��c bi�t cho bang: ", 8,
					TB_STUNTID_INFO[1].name.."/StuntConfirm",
					TB_STUNTID_INFO[2].name.."/StuntConfirm",
					TB_STUNTID_INFO[3].name.."/StuntConfirm",
					TB_STUNTID_INFO[4].name.."/StuntConfirm",
					TB_STUNTID_INFO[5].name.."/StuntConfirm",
					TB_STUNTID_INFO[6].name.."/StuntConfirm",
					TB_STUNTID_INFO[7].name.."/StuntConfirm",
					"Ch� ��i thi�t l�p/Cancel"		)
	else
		local szMsg = "K� n�ng hi�n t�i c�a bang h�i l�: "..
						"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
						"<enter>Quy�n ti�p nh�n k� n�ng: "..
						"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
						"<enter>Chi ph� b�o tr� ��c k�:"..
						"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v�n ti�n chi�n b�".."<color>"..
						"<enter>T�c d�ng c�a k� n�ng ��c bi�t:"..
						"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>"
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		Describe(szMsg, 3, "Thay ��i k� n�ng/#CHANGE_STUNT_G_1("..nTongID..")", "B�o tr� k� n�ng m� (t�m ng�ng)/#PAUSED_STUNT_G_1("..nTongID..")", "R�i kh�i/OnCancel")
	end
end
function PAUSED_STUNT_G_1(nTongID)
	local nPause = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE)
	local nswitch = 0
	local szMsg = ""
	if (nPause < 0 and nPause >= 4) then
		nPause = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, nPause)
	end
	szMsg = "Tr�ng th�i k� n�ng hi�n t�i c�a bang l�:  "..TB_STUNT_PAUSESTATE[nPause][1].."<enter>���c ��a v�o b�o tr� h�ng tu�n: "..TB_STUNT_PAUSESTATE[nPause][2]
	nswitch = TB_STUNT_PAUSESTATE[nPause][3]
	Describe(szMsg.."<enter>Ng��i ��ng � ch�?", 2, "M�(��ng)/#Paused_Stunt_Sure("..nTongID..","..nswitch..")", "H�y b�/Cancel")
	return 1
end
function Paused_Stunt_Sure(nTongID, nSwitch)
	TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, nSwitch)
	if (nSwitch == 1 or nSwitch == 3) then
		Msg2Player("Tr�ng th�i k� n�ng c�a bang tu�n sau s� ��i th�nh:  "..TB_STUNT_PAUSESTATE[nSwitch][2])
	else
		Msg2Player("Tr�ng th�i k� n�ng c�a bang tu�n sau s� ��i th�nh:  "..TB_STUNT_PAUSESTATE[nSwitch][2])
	end
end
function StuntConfirm(nSel)
	local nStuntID = nSel + 1
	local szMsg = "K� n�ng ���c ch�n hi�n t�i l�:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>Quy�n ti�p nh�n k� n�ng: "..
					"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>Chi ph� b�o tr� ��c k�:"..
					"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v�n ti�n chi�n  b�<color>"..
					"<enter>T�c d�ng c�a k� n�ng ��c bi�t:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>"
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "��ng � ch�n/#StuntSureConfirm("..nStuntID..")", "Tr� v�/CONFIGURE_TONG_STUNT_G", "R�i kh�i/OnCancel")
end
function getStuntHelp(nStuntID, nRight, nCycle, nMaxMem)
	local szMsg = ""
	if (nRight == 1) then
		szMsg = "<enter>K� n�ng hi�n t�i s� k�o d�i trong m�t tu�n, trong kho�ng th�i gian n�y ch� c� th� nh�n "..nMaxMem.." l�n."
	else
		szMsg = "<enter>K� n�ng hi�n t�i s� k�o d�i trong m�t tu�n, trong kho�ng th�i gian n�y ch� c� th� nh�n 1 l�n k� n�ng, ch� cho ph�p "..nMaxMem.." ng��i nh�n."
	end
	return szMsg
end
function CHANGE_STUNT_G_1(nTongID)
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	local nSwith = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_SWICTH)
	if (nStuntID ~= 0) then	
		local szMsg = "K� n�ng hi�n t�i c�a bang h�i l�: "..TB_STUNTID_INFO[nStuntID].name
		if (nSwith ~= 0 and nSwith ~= nStuntID) then
			szMsg = szMsg .."<enter>K� n�ng mu�n thay ��i l�: "..TB_STUNTID_INFO[nSwith].name
		else
			szMsg = szMsg .."<enter>K� n�ng mu�n thay ��i l� : [kh�ng c�]"
		end
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		szMsg = szMsg.."<enter>Mu�i thay ��i sang k� n�ng n�o?"
		
		Describe(szMsg, 8,
					TB_STUNTID_INFO[1].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[2].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[3].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[4].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[5].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[6].name.."/ChangeStuntConfirm",
					TB_STUNTID_INFO[7].name.."/ChangeStuntConfirm",
					"Ch� ��i thi�t l�p/Cancel"		)
	end
	return 1
end
function ChangeStuntConfirm(nSel)
	local _, nTongID = GetTongName()
	local nStuntID = nSel + 1
	local szMsg = "K� n�ng ���c ch�n hi�n t�i l�:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>Quy�n ti�p nh�n k� n�ng: "..
					"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>Chi ph� b�o tr� ��c k�:"..
					"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v�n ti�n chi�n  b�<color>"..
					"<enter>T�c d�ng c�a k� n�ng ��c bi�t:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>";
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "��ng � ch�n/#StuntSureConfirm("..nStuntID..")", "Tr� v�/#CHANGE_STUNT_G_1("..nTongID..")", "R�i kh�i/OnCancel")
end
function StuntSureConfirm(nStuntID)
	local _, nTongID = GetTongName()
	TONG_ApplySetStunt(nTongID, nStuntID)
end
function STUNT_SET_R(nTongID, nStuntID)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId)
	if (TONG_GetBuildLevel(nTongID) < 4) then
		Msg2PlayerByName(szExecutorName, "Bang h�i c�p d��i c�p 4 kh�ng th� s� d�ng k� n�ng ��c bi�t!");
		return 0
	end
	local nOldStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	if (nOldStuntID == 0) then
		local nday = TONG_GetDay(nTongID);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].maxmem)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 1)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, 3)
		Msg2Tong(nTongID, "K� n�ng ��c bi�t ���c m�, k� n�ng l� "..TB_STUNTID_INFO[nStuntID].name)
		TONG_ApplyAddEventRecord(nTongID, "K� n�ng ��c bi�t ���c m�, k� n�ng l� "..TB_STUNTID_INFO[nStuntID].name)
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_SWICTH, nStuntID)
		Msg2PlayerByName(szExecutorName, "Sau m�t tu�n th� k� n�ng s� ��i th�nh "..TB_STUNTID_INFO[nStuntID].name..".")
		return 0
	end
	cTongLog:WriteInfTB("TONG", "setstunt", nTongID, {stuntid = nStuntID});
	return 1
end
STUNT_SET_G_1	= DefFun2
function STUNT_SET_G_2(nTongID, nStuntID)
	if (nStuntID ~= 0) then
		for i = 1, getn(TONGTSK_TOTEMINDEX) do
			local nNpcIndex = TONG_GetTaskValue(nTongID, TONGTSK_TOTEMINDEX[i])
			if (nNpcIndex > 0) then
				for j=1, getn(TB_STUNTID_INFO) do
					RemoveNpcSkillState(nNpcIndex, TB_STUNTID_INFO[j].skillid)
				end
				AddNpcSkillState(nNpcIndex, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	end
end
else
MONEYFUND_ADD_C_1 = DefFun2
MONEYFUND_ADD_C_2 = DefFun2
MONEYFUND2BUILDFUND_C_1 = DefFun2
MONEYFUND2BUILDFUND_C_2 = DefFun2
MAP_CREATED_C_1 = DefFun2
MAP_CREATED_C_2 = DefFun2
MAP_CREAE_C_1	= DefFun2
MAP_CREAT_C_2	= DefFun2
MAP_SET_C_1	= DefFun2
MAP_SET_C_1	= DefFun2
CONTRIBUTION2STOREOFFER_C_1 = DefFun3
CONTRIBUTION2STOREOFFER_C_2 = DefFun3
BUILDFUND2WARFUND_C_1 = DefFun2
BUILDFUND2WARFUND_C_2 = DefFun2
MONEY2BUILDFUND_C_1 = DefFun2
MONEY2BUILDFUND_C_2 = DefFun2
STOREOFFER2CONTRIBUTION1_C_1 = DefFun3
STOREOFFER2CONTRIBUTION1_C_2 = DefFun3
STOREOFFER2CONTRIBUTION2_C_1 = DefFun3
STOREOFFER2CONTRIBUTION2_C_2 = DefFun3
MEMBER_KICK_C_1 = DefFun3
MEMBER_KICK_C_2 = DefFun3
MEMBER_RETIRE_C_1 = DefFun3
MEMBER_RETIRE_C_2 = DefFun3
MEMBER_ONLINE_C_1 = DefFun3
MEMBER_ONLINE_C_2 = DefFun3
MEMBER_ADD_C_1 = DefFun3
MEMBER_ADD_C_2 = DefFun3
MEMBER_SETFIGURE_C_1 = DefFun3
MEMBER_SETFIGURE_C_2 = DefFun3
STUNT_SET_C_1	= DefFun2
STUNT_SET_C_2	= DefFun2
aPrompt= {"C� mu�n x�y d�ng t�c ph��ng n�y kh�ng?",
"C� mu�n h�y b� t�c ph��ng n�y kh�ng?",
"C� mu�n k�ch ho�t t�c ph��ng n�y kh�ng?",
"C� mu�n ��ng c�a t�c ph��ng n�y kh�ng?",
"C� ��ng � n�ng c�p t�c ph��ng n�y kh�ng?",
"C� ��ng � �i�u ch�nh ��ng c�p s� d�ng t�c ph��ng kh�ng?",
}
function GET_WORKSHOP_PROMPT(nTongID, nWorkshopID, nOpt)
	if (nOpt == 3)then
		return "Sau khi ��ng c�a, mu�n k�ch ho�t l�i c�n "..
		wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), 
			TWS_GetUseLevel(nTongID, nWorkshopID)).." v�n ti�n ki�n thi�t, c� ��ng � ��ng c�a kh�ng?"
	end
	return aPrompt[nOpt+1]
end
end
function GET_WEEKBUILD_THRESHOLD(nTongID)
	return tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
end
function GET_WEEKLYOFFER_THRESHOLD()
	return MAX_WEEK_CONTRIBUTION
end
function GET_WORKSHOP_COUNT_THRESHOLD(nTongID)
	return tongGetMaxWorkshopNum(nTongID, TONG_GetBuildLevel(nTongID))
end	
function GET_WORKSHOP_LEVEL_THRESHOLD(nTongID)
	return tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))
end
function GET_WORKSHOP_DATA(nTongID, nWorkshopID, nFlag)
	if (nFlag == 0)then
		return wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), TWS_GetUseLevel(nTongID, nWorkshopID))
	end
	return 0
end
function Cancel()
end
