-- 文件名　：jinengmiji_90.lua
-- 创建者　：wangjingjun
-- 内容　　：各门派的秘籍， 可以学习90级技能
-- 创建时间：2011-07-12 15:59:01

Include("\\script\\dailogsys\\dailogsay.lua")
--（少林0 天王1  唐门2  五毒3   峨眉4  翠烟5   丐帮6   天忍7   武当8   昆仑9）
sbook_list =
{	-- 格式：{技能ID, 技能等级, 帮派ID, 所需级别, 技能书名称, 技能名称}
	[2959] = {	
		{318, 1, 0, 90, "Thi誹 L﹎ M藅 T辌h", "Thi誹 L﹎ Chng Ph竝 - Чt Ma ч Giang"},
		{319, 1, 0, 90, "Thi誹 L﹎ M藅 T辌h", "Thi誹 L﹎ C玭 Ph竝 - Ho祅h T秓 Thi猲 Qu﹏"},
		{321, 1, 0, 90, "Thi誹 L﹎ M藅 T辌h", "Thi誹 L﹎ Dao Ph竝 - V� Tng Tr秏"},
	},
	[2960] = {	
		{322, 1, 1, 90, "Thi猲 Vng M藅 T辌h", "Thi猲 Vng o Ph竝 - Ph� Thi猲 Tr秏"},
		{323, 1, 1, 90, "Thi猲 Vng M藅 T辌h", "Thi猲 Vng Thng Ph竝 - Truy Tinh Tr鬰 Nguy謙"},
		{325, 1, 1, 90, "Thi猲 Vng M藅 T辌h", "Thi猲 Vng Ch飝 Ph竝 - Truy Phong Quy誸"},
	},
	[2961] = {	 
		{339, 1, 2, 90, "Л阯g M玭 M藅 T辌h ", "Л阯g M玭 Phi o - Nhi誴 H錸 Nguy謙 秐h"},
		{302, 1, 2, 90, "Л阯g M玭 M藅 T辌h ", "Л阯g M玭 T� Ti詎 - B筼 V� L� Hoa"},
		{342, 1, 2, 90, "Л阯g M玭 M藅 T辌h ", "Л阯g M玭 Phi Ti猽 - C鰑 Cung Phi Tinh"},
		{351, 1, 2, 90, "Л阯g M玭 M藅 T辌h ", "Л阯g m玭 H秏 T躰h - Lo筺 Ho祅 K輈h"},
	},
	[2962] = {	 
		{353, 1, 3, 90, "Ng� чc M藅 T辌h", "Ng� чc Chng Ph竝 -  Phong Th鵦 C鑤"},
		{355, 1, 3, 90, "Ng� чc M藅 T辌h", "Ng� чc o Ph竝 - Huy觧  Tr秏"},
		{390, 1, 3, 90, "Ng� чc M藅 T辌h", "Ng� чc Nhi誴 T﹎ Thu藅 - 筺 C﹏ H� C鑤"},
	},
	[2963] = {	 
		{328, 1, 4, 90, "Nga Mi M藅 T辌h", "Nga My Ki誱 Ph竝 - Tam Nga T� Tuy誸"},
		{380, 1, 4, 90, "Nga Mi M藅 T辌h", "Nga My Chng Ph竝 - Phong Sng To竔 秐h"},
		{332, 1, 4, 90, "Nga Mi M藅 T辌h", "Nga Mi Ph� ч - Ph� ч Ch髇g Sinh"},
	},
	[2964] = {	 
		{336, 1, 5, 90, "Th髖 Y猲 M藅 T辌h", "Th髖 Y猲 Чo Ph竝 - B╪g Tung V� 秐o"},
		{337, 1, 5, 90, "Th髖 Y猲 M藅 T辌h", "Th髖 Y猲 Song o - B╪g T﹎ Ti猲 T�"},
	},
	[2965] = {	 
		{357, 1, 6, 90, "C竔 Bang M藅 T辌h", "C竔 Bang Chng Ph竝 - Phi Long T筰 Thi猲"},
		{359, 1, 6, 90, "C竔 Bang M藅 T辌h", "C竔 Bang C玭 Ph竝 - Thi猲 H� V� C萿"},
	},
	[2966] = {	 
		{361, 1, 7, 90, "Thi猲 Nh蒼 M藅 T辌h", "Thi猲 Nh蒼 M﹗ Ph竝 - V﹏ Long K輈h"},
		{362, 1, 7, 90, "Thi猲 Nh蒼 M藅 T辌h", "Thi猲 Nh蒼 o Ph竝 - Thi猲 Ngo筰 L璾 Tinh"},
		{391, 1, 7, 90, "Thi猲 Nh蒼 M藅 T辌h", "Thi猲 Nh蒼 Ch� Thu藅 - Nhi誴 H錸 Lo筺 T﹎"},
	},
	[2967] = {	 
		{365, 1, 8, 90, "V� ng M藅 T辌h ", "V� ng Chng Ph竝 - Thi猲 мa V� C鵦"},
		{368, 1, 8, 90, "V� ng M藅 T辌h ", "V� ng Ki誱 Ph竝 - Nh﹏ Ki誱 H頿 Nh蕋"},
	},
	[2968] = {	 
		{372, 1, 9, 90, "C玭 L玭 M藅 T辌h", "C玭 L玭 Ng� Phong - Ng筼 Tuy誸 Ti猽 Phong"},
		{375, 1, 9, 90, "C玭 L玭 M藅 T辌h", "C玭 L玭 Ng� L玦 - L玦 чng C鰑 Thi猲"},
		{394, 1, 9, 90, "C玭 L玭 M藅 T辌h", "C玭 L玭 Ng� T﹎ - T髖 Ti猲 T� C鑤"},
	},
}

function LearnSkillByBook(index, list, nItemIndex, nPlayerIndex)

	if(GetLastFactionNumber() ~= list[index][3]) then							-- 不是指定门派
		Msg2Player("B筺 c莔 l蕐 "..list[index][5].."Nghi猲 c鴘 c� n鯽 ng祔, k誸 qu� c騨g kh玭g l躰h ng� 頲 g� ")
		return 1
	end
	if(GetLevel() < list[index][4]) then							-- 但未到指定级别
		Msg2Player("B筺 c莔 l蕐 "..list[index][5].."Nghi猲 c鴘 c� n鯽 ng祔, k誸 qu� l躰h ng� r蕋 輙. ")
		return 1
	end
	if(HaveMagic(list[index][1]) ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  c莔 "..list[index][5].."Nghi襫 t韎 ng蒻 lui, nh璶g c騨g kh玭g h鋍 頲 g� trong  ")
		return 1
	end
	
	-- 判断当前的物品是否为少林秘籍，是则先删除，后增加技能
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("H駓 B� Thi誹 L﹎ M藅 T辌h th蕋 b筰")
		return 
	end
	
	AddMagic(list[index][1], list[index][2])										-- 学会技能

	WriteLog(date("%H%M%S")..": T礽 kho秐:"..GetAccount()..", nh﹏ v藅:"..GetName()..", S� d鬾g: "..list[index][5].."Х h鋍 頲: "..list[index][6]);
	Msg2Player("Х h鋍 頲 k� n╪g "..list[index][6].."'. ")
	return 0
end

function selectskill(list, nItemIndex, nPlayerIndex)
	local szTitle = "Чi hi謕 mu鑞 h鋍 lo筰 k� n╪g n祇"
	local tbOpt = {}
	for index,v in list do
		tinsert(tbOpt, {v[6], LearnSkillByBook, {index, list, nItemIndex, PlayerIndex}})
	end
	tinsert(tbOpt, {"в ta suy ngh� l筰", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function main(nItemIndex)
	Genre, DetailType, Particular=GetItemProp(nItemIndex)
	selectskill(sbook_list[Particular], nItemIndex, PlayerIndex)
	return 1
end
