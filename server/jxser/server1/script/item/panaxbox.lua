--领取特技时，开启参罐，加技能，
--提示给与参罐，并开启参罐，关闭参罐即可使灵参力保存下来。
TASKID_PANAXBOX_OPEND = 1577
TASKID_PANAXBOX_LASTIME = 1578
LINGSHENLI_TIME = 7 * 60 * 60

function main(nItemIndex)
	local nParam1 = GetItemParam(nItemIndex, 1)
	if (nParam1 == 0 and GetTask(TASKID_PANAXBOX_OPEND) == 0) then
		Say("Mu鑞 s� d鬾g Linh s﹎ l鵦?", 2, "m� /#lingshenli_want2open("..nItemIndex..")", "H駓 b� /OnCancel")
	elseif (nParam1 == 1 and GetTask(TASKID_PANAXBOX_OPEND) == 1) then
		Say("Mu鑞 l祄 h閜 linh s﹎ kh玭g?", 2, "сng/#lingshenli_want2close("..nItemIndex..")", "H駓 b� /OnCancel")
	elseif (nParam1 == 1 and GetTask(TASKID_PANAXBOX_OPEND) == 0) then
		SetTask(TASKID_PANAXBOX_OPEND, 1)
	else
		Say("Х c� 1 nh﹏ s﹎ tr╩ n╩ ph竧 huy t竎 d鬾g", 0)
	end
	return 1
end

function lingshenli_confirm(nItemIndex)
	if (RemoveItemByIndex(nItemIndex) == 1) then
		AddSkillState(735, 5, 1, LINGSHENLI_TIME * 18, 1);
		Msg2Player("Nh薾 頲 linh l鵦 c馻 nh﹏ s﹎ ng祅 n╩, gi髉 t╪g sinh l鵦 20%, n閕 l鵦 20% v� kh竛g t蕋 c� 10 甶觤 trong v遪g 7 gi�.");
	else
		print("ERROR!! ADD LINGSHENLI FAILED! NO ITEMINDEX");
	end;
end;

function OnCancel()
end

function lingshenli_want2open(nItemIndex)
	local nParam2 = GetItemParam(nItemIndex, 2)
	local nParam3 = GetItemParam(nItemIndex, 3)

	if (nParam2 == 0) then
		SetSpecItemParam(nItemIndex, 2, LINGSHENLI_TIME)
		nParam2 = LINGSHENLI_TIME
	elseif (nParam2 == -1) then
		RemoveItemByIndex(nItemIndex)
		SetTask(TASKID_PANAXBOX_OPEND, 0)
		Msg2Player("H閜 nh﹏ s﹎ n祔  m蕋 h誸 linh l鵦!")
	end
	SetSpecItemParam(nItemIndex, 3, GetGameTime())
	SetSpecItemParam(nItemIndex, 1, 1)
	SyncItem(nItemIndex)
	SetTask(TASKID_PANAXBOX_OPEND, 1)
	AddSkillState(735, 5, 1, nParam2 * 18, 1)
	local nMin, nSec = GetTimeSec2Min(nParam2)
	if (nMin <= 0) then
		Msg2Player("H閜 nh﹏ s﹎ n祔 c� th� ph竧 huy t竎 d鬾g trong "..nSec.." gi﹜.")
	else
		Msg2Player("H閜 nh﹏ s﹎ n祔 c� th� ph竧 huy t竎 d鬾g trong "..nMin.."ph髏")
	end
end

function lingshenli_want2close(nItemIndex)
	local nParam2 = GetItemParam(nItemIndex, 2)
	local nParam3 = GetItemParam(nItemIndex, 3)
	local nGameTime = GetGameTime()
	local nlast = nParam2 - (nGameTime - nParam3)
	if (nlast <= 0) then
		SetSpecItemParam(nItemIndex, 2, -1)
		RemoveItemByIndex(nItemIndex)
		Msg2Player("H閜 nh﹏ s﹎ n祔  m蕋 h誸 linh l鵦!")
		AddSkillState(735, 5, 0, 0)
	else
		SetSpecItemParam(nItemIndex, 3, GetGameTime())
		SetSpecItemParam(nItemIndex, 2, nlast)
		SetSpecItemParam(nItemIndex, 1, 0)
		SyncItem(nItemIndex)
		local nMin, nSec = GetTimeSec2Min(nlast)
		if (nMin <= 0) then
			Msg2Player("H閜 nh﹏ s﹎ n祔 v蒼 c遪 linh l鵦"..nSec.." gi﹜.")
		else
			Msg2Player("H閜 nh﹏ s﹎ n祔 v蒼 c遪 linh l鵦"..nMin.."ph髏")
		end
		AddSkillState(735, 5, 0, 0)
	end
	SetTask(TASKID_PANAXBOX_OPEND, 0)
end

function GetTimeSec2Min(nlast)
	return floor(nlast / 60), mod(nlast, 60)
end

function GetDesc(nItem)
	local nParam1 = GetItemParam(nItem, 1)
	if (nParam1 <= 0) then
		return "<color=blue>Tr筺g th竔 ng<color>"
	else
		return "<color=blue>Tr筺g th竔 m�<color>"
	end
end