-- Created by tsh 2004-12-09
-- 新年卡
-- 获得随机六张卡

szTitle="<#> H穣 ch鋘 c﹗ ch骳:"
Bless=
{
	"<#> Nguy謓 nh鱪g l阨 ch骳 t鑤 p nh蕋 theo gi� bay n b猲 b筺 'Ch骳 b筺 n╩ m韎 vui v�'!",
	"<#> M鮪g n╩ m韎, ch骳 b筺 s鴆 kh醗 d錳 d祇, v筺 s� nh� �.",
	"<#> Ch骳 b筺 n╩ m韎 vui v�, ph竧 t礽 ph竧 l閏, an khang thng l筩.",
	"<#> Kh玭g bi誸 n鉯 g� h琻 ngo礽 l阨 ch骳 b筺 c� 頲 m閠 n╩ m韎 vui v� tr祅 y h筺h ph骳 b猲 ngi th﹏ gia nh.",
	"<#> Ng祅 l阨 n鉯 trong l遪g kh玭g bi誸 n鉯 g� h琻 'Ch骳 b筺 n╩ m韎 vui v�'.",
	"<#> N╩ m韎 ch骳 b筺 lu玭 vui v� h筺h ph骳!",
}

ITEM_TASK_TEMP=23
UNIQUE_USE_TASK_TEMP=20
--保证一个祝福没出来前不能使用第二个。

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=140

FuncBless={}

function main(sel)
	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("B筺 hi謓 產ng ph竧 c﹗ ch骳! Xin vui l遪g i m閠 l竧!");
		return 1
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);

	local nSelectCount = getn(Bless);
	for i=1, nSelectCount do
		FuncBless[i] = Bless[i].."/PlayerSelect"
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "H駓 b� /QueryWiseManCancel"

	Say(szTitle, getn(Bless), FuncBless);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
--先不删除玩家的卡片，在实际发送了祝福时再删（临时记录下来装备编号）
	return 1;

end

function PlayerSelect(nSelect)
	QueryWiseMan("BlessPlayerOnline", "BlessPlayerOffline", nSelect);
end

function BlessPlayerOnline(TargetName, nSelect, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	local ItemIdx
	ItemIdx = GetTaskTemp(ITEM_TASK_TEMP);
	local ItemGenre
	local DetailType
	local ParticularType
	local Level
	local Series
	local Luck
	ItemGenre,DetailType,ParticularType,Level,Series,Luck = GetItemProp(ItemIdx)
	if (ItemIdx > 0 and ItemGenre == ITEM_GENRE and DetailType == ITEM_DETAIL and ParticularType == ITEM_PARTI) then
		if (RemoveItemByIndex(ItemIdx) == 1) then
			local szMsg
			szMsg = GetName().."<#> n鉯 v韎 "..TargetName.."<#> "..Bless[nSelect + 1]
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

function BlessPlayerOffline(TargetName, nSelect)
	Msg2Player("Ngi m� b筺 mu鑞 ch骳 ph骳 hi謓 kh玭g c� tr猲 m筺g! ьi l骳 sau th� l筰!.");
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function QueryWiseManCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end