--by 廖志山 [2006-09-12]
--2006中秋活动:用10个五彩灯笼到礼官处领奖
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

if (not __H_ITEM_LIGUAN__) then
	__H_ITEM_LIGUAN__ = 1;

Include([[\script\event\mid_autumn06\head.lua]]);

tab_lg_award = {
	{	"V� L﹎ M藅 T辌h",	125,	6,	1,	26, 1},
	{	"T葃 T駓 Kinh",	125,	6,	1,	22, 1},
	{	"ng鵤 c蕄 80",	250,	0,	10,	2,	4},
	{	"s竎h k� n╪g m玭 ph竔",	400,	-1},
	{	"Ti猲 Th秓 L� v� Ph骳 Duy猲 L�",	4550,	-1},
	{	"b竛h trung thu B竧 Tr﹏ Ph骳 Nguy謙",	4550,	6,	1,	126, 1},
};

tab_sbook_list =
{	-- 格式：{技能ID, 技能书名称}
	{27, "'T� Ti詎 thu藅. B筼 V� L� Hoa' "},
	{28, "'H穖 T躰h thu藅. Lo筺 Ho祅 K輈h' "},
	{33, "Th竔 C鵦 Quy襫 Ph�- Quy觧 3 "},
	{34, "'Th竔 C鵦 Ki誱 Ph�. Quy觧 2' "},
	{35, "'V﹏ Long K輈h. M﹗ ph竝' "},
	{36, "'L璾 Tinh. o ph竝' "},
	{37, "'Thi猲 Vng Ch飝 Ph竝. Quy觧 1' "},
	{38, "Thi猲 Vng Thng ph竝- Quy觧 2 "},
	{39, "Thi猲 Vng o ph竝 - Quy觧 3 "},
	{40, "'Th髖 Y猲 o ph竝' "},
	{41, "'Th髖 Y猲 Song 產o' "},
	{42, "'Di謙 Ki誱 M藅 T辌h' "},
	{43, "'Nga Mi Ph藅 Quang Chng M藅 T辌h' "},
	{45, "'Phi o thu藅. Nhi誴 H錸 Nguy謙 秐h' "},
	{46, "'Phi Ti猽 thu藅. C鰑 Cung Phi Tinh' "},
	{47, "'Ng� чc Chng Ph竝. Quy觧 1' "},
	{48, "'Ng� чc o ph竝. Quy觧 2' "},
	{49, "'Ng� чc Nhi誴 T﹎ thu藅. Quy觧 3' "},
	{50, "'Ng� Phong thu藅' "},
	{51, "'Ng� L玦 thu藅' "},
	{52, "'Ng� T﹎ thu藅' "},
	{53, "Nhi誴 H錸 - Trc Ch� "},
	{54, "'C竔 Bang Chng Ph竝' "},
	{55, "C竔 Bang C玭 Ph竝 "},
	{56, "'Thi誹 L﹎ Quy襫 Ph竝. Quy觧 1' "},
	{57, "'Thi誹 L﹎ C玭 ph竝. Quy觧 2' "},
	{58, "'Thi誹 L﹎ o ph竝. Quy觧 3' "},
	{59, "'Ph� ч M藅 T辌h' "},
}

--礼官换奖品入口
function au06_lg_award()
	if (au06_is_inperiod() == 0) then --
		Say("Ho箃 ng  k誸 th骳.", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("Ch� c� ngi ch琲 n筽 th� m韎 c� th� tham gia ho箃 ng Trung thu", 0);
		return
	end;
	
	local tab_Content = {
		"Л頲 th玦! Ta i 10 L錸g n k衞 qu﹏ c bi謙 l蕐 qu� c馻 玭g!/au06_shangjialingpai",
		"Ch� n th╩ 玭g ch髏 th玦!/oncancel"
	};
	Say("Trung thu vui v�! Ngi c� mu鑞 i 10 L錸g n k衞 qu﹏ c bi謙 l蕐 qu� c馻 ta kh玭g?", getn(tab_Content), tab_Content);
end;

function au06_shangjialingpai()
	if (CalcEquiproomItemCount(6, 1, 1234, -1) < 10) then
		Say("T譵  <color=yellow>10 L錸g n k衞 qu﹏ c bi謙<color> r錳 h穣 n y!", 0);
		return
	end;
	
	--扣除物品
	if (ConsumeEquiproomItem(10, 6, 1, 1234, -1) ~= 1) then
		return
	end
	
	--随即种子
	local nIndex = 6;
	local nSeed = random(1, 10000);
	local nSum = 0;
	for i = 1, getn(tab_lg_award) do
		nSum = nSum + tab_lg_award[i][2];
		if (nSeed <= nSum) then
			nIndex = i;
			break;
		end;
	end;
	
	local szName = tab_lg_award[nIndex][1];
	--给予奖励
	if (nIndex == 4) then -- 增加技能书
		local bIdx = random(1, getn(tab_sbook_list));
		AddItem(6, 1, tab_sbook_list[bIdx][1], 1, 0, 0, 0);
		szName = "quy觧"..tab_sbook_list[bIdx][2];
	elseif (nIndex == 5) then -- 增加仙草和福缘
		AddItem(6, 1, 71, 1, 0, 0, 0);
		AddItem(6, 1, 124, 1, 0, 0, 0);
	elseif (nIndex == 3) then -- 增加仙草和福缘
		AddItem(0, 10, 2, 4, random(0, 4), 0, 0);
	else
		AddItem(tab_lg_award[nIndex][3], tab_lg_award[nIndex][4], tab_lg_award[nIndex][5], tab_lg_award[nIndex][6], 0, 0, 0);
	end;
	
	--给予提示
	Say("C� l錸g n n祔 Trung Thu c祅g th猰 vui! T苙g ngi! Ch骳 trung thu vui v�!", 0);
	Msg2Player("B筺 nh薾 頲<color=yellow>"..szName.."<color>");
end

end; --//end of __H_ITEM_LIGUAN__