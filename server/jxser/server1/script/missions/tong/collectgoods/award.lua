-- 奖励.lua (帮会招募弟子活动)
if (not __COLLG_AWARD_H__) then
	__COLLG_AWARD_H__ = 1;
Include([[\script\missions\tong\collectgoods\head.lua]]);
IncludeLib("FILESYS");

tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
1000000
};

collg_tabRate = {--小福缘 仙草露 随机PK丸 中福缘 4级玄晶 大福缘 5级玄晶 随机水晶 任务卷轴 6级玄晶 7级玄晶 8级玄晶
	{0, 0, 0, 0, 0, 0.27, 0.2755, 0.12, 0.2, 0.1, 0.03, 0.0045},	--第一名
	{0, 0, 0, 0, 0.2, 0.172, 0.2, 0.1, 0.2, 0.1, 0.025, 0.003},	--
	{0, 0, 0, 0.061, 0.2, 0.137, 0.2, 0.1, 0.2, 0.08, 0.02, 0.002},	--
	{0.04, 0.04, 0.04, 0.061, 0.17, 0.137, 0.2, 0.05, 0.18, 0.072, 0.01, 0},	--
	{0.05, 0.05, 0.06, 0.068, 0.17, 0.137, 0.2, 0.05, 0.15, 0.06, 0.005, 0},	--
	{0.059, 0.06, 0.1, 0.1, 0.12, 0.15, 0.15, 0.05, 0.15, 0.06, 0.001, 0},		--
	{0.15, 0.12, 0.14, 0.1, 0.1, 0.1, 0.1, 0.01, 0.12, 0.06, 0, 0},	--
	{0.18, 0.17, 0.14, 0.1, 0.1, 0.05, 0.1, 0.01, 0.1, 0.05, 0, 0},	--
	{0.17, 0.15, 0.1, 0.2, 0.1, 0.05, 0.1, 0.01, 0.1, 0.02, 0, 0},	--
	{0.15, 0.13, 0.16, 0.25, 0.15, 0.05, 0.1, 0.01, 0, 0, 0, 0}	--第十名
};

--物品种类
tab_goods = {
	{122, 0, "Ph骳 Duy猲 (ti觰) "},
	{71, 0, "Ti猲 Th秓 L� "},
	{"PK ho祅"},
	{123, 0, "Ph骳 Duy猲 (trung) "},
	{147, 4, "Huy襫 Tinh c蕄 4"},
	{124, 0, "Ph骳 Duy猲 (i) "},
	{147, 5, "Huy襫 Tinh c蕄 5"},
	{"Th駓 tinh"},
	{"M藅  nhi謒 v� "},
	{147, 6, "Huy襫 Tinh c蕄 6"},
	{147, 7, "Huy襫 Tinh c蕄 7"},
	{147, 8, "Huy襫 Tinh c蕄 8"},
}


function collg_about()
	Say("M閠 t ho箃 ng di詎 ra trong <color=red>15<color> ph髏. Trong  c� <color=red>5<color> ph髏 chu萵 b�. Sau khi b竜 danh tham gia, ngi ch琲 s� 頲 a n khu v鵦 chu萵 b�. Khi ho箃 ng b総 u th� trong khu v鵦 s� xu蕋 hi謓 'T骾 h祅g h鉧', ngi ch琲 ch� c莕 nh苩 c竎 'T骾 h祅g h鉧' n祔; nh璶g c莕 ph秈 c萵 th薾 nh鱪g con 's﹗ n�' ng蓇 nhi猲 xu蕋 hi謓 b竚 v祇 th﹏ ngi v� ph竧 n�.", 1, "Trang k� /collg_about_next");
end;

function collg_about_next()
	Say("N誹 nh� ngi ch琲 b� s﹗ ph竧 n� th� nh鱪g 'T骾 h祅g h鉧' s� b� r琲 ra � g莕 , ng th阨 b� cho竛g trong 30 gi﹜. Trong th阨 gian b� cho竛g s� kh玭g b� 's﹗ n�' t蕁 c玭g. Khi b� s﹗ n� b竚 v祇 th� s� c� th猰 k� n╪g 'n衜 chuy襫', c� th� d飊g k� n╪g n祔  n衜 s﹗ v祇 ngi ch琲 kh竎. Sau khi ho箃 ng k誸 th骳, '<color=yellow>T鎛g qu秐 Ho箃 ng phng<color>' s� c╪ c� v祇 b秐g x誴 h筺g s� lng 'T骾 h祅g h鉧'  ph竧 thng.", 0);
end;

function collg_aword()
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local nCount = GetTask(COLLG_COUNT_ONETIME);
	local nRank = GetTask(COLLG_TK_RANK);
	SetTask(COLLG_COUNT_ONETIME, 0);
	SetTask(COLLG_TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Say("T鎛g qu秐 Ho箃 ng phng: Ngi mu鑞 nh薾 thng �, h穣 mau 甶 t譵 t骾 h祅g h鉧 , n誹 kh玭g c� th� t譵 ta c騨g l� ph� th阨 gian m� th玦.", 1, "Theo c� ph蕋 tay bay ra/oncancel");
		SetTaskTemp(193, 0);
		return
	end;
	
	Say("T鎛g qu秐 Ho箃 ng phng: L祄 r蕋 t鑤, ngi t譵 頲 <color=yellow>"..nCount.."<color> t骾 h祅g h鉧, x誴 h筺g th� <color=yellow>"..nRank.."<color>, y l� ph莕 thng d祅h cho ngi, xin h穣 nh薾 l蕐.", 1, "Nh薾 l蕐 l� v藅./oncancel");
	collg_giveaward(nRank);
	SetTaskTemp(193, 0);
end;


function collg_giveaward(nRank)
	AddOwnExp(tabExp[nRank]);
	collg_goodsaward(nRank);
end;

function collg_festival_addpkwan()--加PK丸
    local itemidx = random(1, 10);
    AddItem(6, 0, itemidx, 1, 0, 0, 0);
    tab_pkwan_name = {"Trng M謓h ho祅", "Gia B祇 ho祅", "Чi L鵦 ho祅", "Cao Thi觤 ho祅", "Cao Trung ho祅", "Phi T鑓 ho祅", "B╪g Ph遪g ho祅", "L玦 Ph遪g ho祅", "H醓 Ph遪g ho祅", "чc Ph遪g ho祅"};
    Msg2Player("B筺 nh薾 頲 m閠"..tab_pkwan_name[itemidx]);
end;

function collg_goodsaward(nRank)
	local nGoodsType = collg_getgoodtype(nRank);
	
	if (nGoodsType == 3) then	--加一个PK丸
		collg_festival_addpkwan();
		return
	end;
	
	if (nGoodsType == 8) then	--随机一个水晶
		collg_givecrystal();
		return
	end;
	
	if (nGoodsType == 9) then	--加一个任务卷轴
		collg_giveTaskBook();
		return
	end;
	AddItem(6, 1, tab_goods[nGoodsType][1], tab_goods[nGoodsType][2], 0, 0, 0);
	local strsay = "B筺 nh薾 頲 m閠"..tab_goods[nGoodsType][3];
	Msg2Player(strsay);
end;

function collg_givecrystal()
	local nIdx = random(1, 3);
	local tab_Crystal = {{238, "Lam Th駓 Tinh"}, {239, "T� Th駓 Tinh"}, {240, "L鬰 Th駓 Tinh"}};
	AddItem(4, tab_Crystal[nIdx][1], 0, 0, 0, 0, 0);
	Msg2Player("B筺 nh薾 頲 <color=yellow>"..tab_Crystal[nIdx][2].."<color>.");
end;

function collg_getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	local nBase = 0;
	for i = 1, getn(collg_tabRate[nRank]) do
		nBase = nBase + collg_tabRate[nRank][i] * 100;
		if (nBase >= nSeed) then
			return i;
		end;
	end;
end;

-- 生成一个任务卷轴
function collg_giveTaskBook()
	local nRandomTaskID, nRandomItemIndex = 0, 0;
	-- 选择一个第二层的随机任务
	nRandomTaskID = TaskNo(selectNextTask());
	-- 生成一个任务卷轴
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	-- 同步物品魔法属性
	SyncItem(nRandomItemIndex);	
	Msg2Player("B筺 nh薾 頲 m閠 <color=green>quy觧 nhi謒 v�<color>!");
	WriteTaskLog("Nh薾 頲 1 m藅 t辌h nhi謒 v�, m� s� l�:"..nRandomTaskID);
	return nRandomTaskID;
end;


-- 任务系统的写入 LOG 过程
function WriteTaskLog(strMain)
	-- 如果是空值则不写入
	if strMain==nil then return end;
	WriteLog("[Ho箃 ng thu th藀 v藅 ph萴 bang h閕 n╩ 2006]"..GetLocalDate(" [%y n╩ %m th竛g %d ng祔  %H gi� %M ph髏]").." [m藅 m�:"..GetAccount().."] [nh﹏ v藅:"..GetName().."]:"..strMain);
end;

function oncancel()	--取消

end;

end; --// end of __COLLG_AWARD_H__