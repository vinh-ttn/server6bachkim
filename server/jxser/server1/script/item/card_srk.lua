-- Created by tsh 2004-12-09
-- 生日卡
-- 获得随机六张卡

szTitle="<#> H穣 ch鋘 c﹗ ch骳:"
Bless=
{
	"<#> M閠 ng祔 m韎 l筰 b総 u, ch骳 b筺 n╩ m韎 y th祅h c玭g 'Ch骳 sinh nh藅 vui v�'.",
	"<#> Nguy謓 ch骳 b筺 trong m sinh nh藅 lu玭 vui v�, h筺h ph骳 b猲 nh鱪g ngi b筺 y猽 qu� nh蕋.",
	"<#> D﹏g t苙g b筺 nh鱪g a hoa xinh p nh蕋 trong ng祔 sinh nh藅.",
	"<#> T苙g b筺 m鉵 qu� v� ch骳 b筺 sinh nh藅 vui v�, lu玭 t th祅h c玭g trong con 阯g h鋍 t藀.",
	"<#> Nguy謓 nh鱪g 甶襲 t鑤 l祅h, may m緉 nh蕋 n v韎 b筺 'Ch骳 sinh nh藅 vui v�'.",
	"<#> B蕋 ch顃 nh� ra ng祔 sinh nh藅 c馻 b筺, kh玭g bi誸 n鉯 g� h琻 ngo礽 l阨 ch骳 ch﹏ t譶h nh蕋 trong ng祔 sinh nh藅 c馻 b筺.",
}

ITEM_TASK_TEMP=27
UNIQUE_USE_TASK_TEMP=20
--保证一个祝福没出来前不能使用第二个。

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=137

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