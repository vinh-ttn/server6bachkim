-- 2007年新年贺卡
-- 共4张

Include("\\script\\lib\\string.lua")

--<playerbless> -- [收卡人名字]
--<name> -- [发卡人名字]
tbMessage={
	["6,1,1346"] = "Ch骳 <color=red><playerbless><color> m閠 n╩ m韎 An Khang Th辬h Vng.<color=red><name><color>",
	["6,1,1347"] = "Ch骳 <color=red><playerbless><color> n╩ m韎 V筺 S� Nh� �, l祄 ╪ ph竧 t礽.<color=red><name><color>",
	["6,1,1348"] = "Ch骳 <color=red><playerbless><color> n╩ m韎 T蕁 T礽 T蕁 L閏, V筺 S� Hanh Th玭g.<color=red><name><color>",
	["6,1,1349"] = "Ch骳 <color=red><playerbless><color> An Khang Th辬h Vng, gia quy課 m筺h kh醗, l祄 ╪ ph竧 t.<color=red><name><color>",
	}

ITEM_TASK_TEMP=26
UNIQUE_USE_TASK_TEMP=20
--保证一个祝福没出来前不能使用第二个。

function main(sel)

	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("B筺 hi謓 產ng ph竧 c﹗ ch骳! Xin vui l遪g i m閠 l竧!");
		return 1;
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
	
	Say("B筺 mu鑞 nh﹏ d辮 T誸 g鰅 n nh鱪g th﹏ h鱱 nh鱪g l阨 ch骳 t鑤 p nh蕋 kh玭g?", 2, "Mu鑞/sendWish","T筸 th阨 kh玭g/wishCancel");
	return 1;
end

function sendWish()
		QueryWiseMan("BlessPlayerOnline", "BlessPlayerOffline", 1);
end

function BlessPlayerOnline(TargetName, nSelect, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	local ItemIdx = GetTaskTemp(ITEM_TASK_TEMP);
	local ItemGenre
	local DetailType
	local ParticularType
	
	ItemGenre,DetailType,ParticularType = GetItemProp(ItemIdx)
	local szItemkey = ItemGenre..","..DetailType..","..ParticularType;
	if (ItemIdx > 0 and tbMessage[szItemkey] ~= nil) then
		if (RemoveItemByIndex(ItemIdx) == 1) then
			local szMsg
			szMsg = replace(tbMessage[szItemkey],"<playerbless>",TargetName);
			szMsg = replace(szMsg,"<name>",GetName());
			AddGlobalCountNews(szMsg,1);
		else
			Msg2Player("Kh玭g t譵 頲 th�! Xin th� l筰 1 l莕!.")
		end
	else
		Msg2Player("S� d鬾g th� th蕋 b筰, xin th� l筰 1 l莕.")
	end
	SetTaskTemp(ITEM_TASK_TEMP,0)
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function BlessPlayerOffline(TargetName, nP)
	Msg2Player("Ngi m� b筺 mu鑞 ch骳 ph骳 hi謓 kh玭g c� tr猲 m筺g! ьi l骳 sau th� l筰!.");
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function wishCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end