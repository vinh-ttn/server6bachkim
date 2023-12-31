/*
if not AMULET then
	Include ("\\script\\item\\hecheng\\amulet.lua")
end

if not PENDANT then
	Include ("\\script\\item\\hecheng\\pendant.lua")
end

if not RING then
	Include ("\\script\\item\\hecheng\\ring.lua")
end
if not SHOSHI then
	SHOUSHI = 1
end
*/

--========类定义====================================--
--类名：Convert
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	负责计算鸡年神秘礼物升级关系的价值量和用鸡年神秘
--礼物兑换奖品的价值量。以及选择奖品。
--
--成员变量：
--	__gifttabfile：神秘礼物价值量tabfile
--	__bonustabfile：奖品的tabfile
--	__giftWorth：神秘礼物升级的价值量表
--	__bonusWorth：奖品的价值量表
--成员函数：
--	:loadSettings()：载入价值量设定文件。
--	:convert(worth)：用worth换取奖品
--
--用例：
--
--
--
--==================================================--

if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not MEM_HEAD then
	Include ("\\script\\lib\\mem.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
end

if not WORTHANALYSE_HEAD then
	Include ("\\script\\item\\hecheng\\worthanalyse.lua")
end

Convert = {
--========函数定义==================================--
--函数原形：:loadSettings()
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	载入配置文件并进行价值量的计算。该函数首先载入
--settings/event/chinesenewyear/giftlvlup.txt和
--settings/event/chinesenewyear/bounslist.txt文件，
--然后根据这两份文件分别计算神秘礼物升级的价值量表和
--神秘礼物兑换奖品的价值量表。
--参数：
--	无
--返回值：
--	无
--用例：
--
--
--
--==================================================--
	loadSettings = function(self)
		self.__gifttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/giftslvlup.txt","GIFT")
		self.__ringtabfile = new(KTabFile,"/settings/event/juanzhouhecheng/ringlist.txt","RING")
		self.__amulettabfile = new(KTabFile,"/settings/event/juanzhouhecheng/amuletlist.txt","AMULET")
		self.__pendanttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/pendantlist.txt","PENDANT")
		self.__pendantWorth = new(WorthAnalyse,80)
		self.__amuletWorth = new(WorthAnalyse,80)
		self.__ringWorth = new(WorthAnalyse,80)
		return
	end,
	
	
--========函数定义==================================--
--函数原形：:convert(worth)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	由价值量worth计算出玩家将要的到的奖励编号。
--参数：
--	worth：神秘礼物的价值量之和。
--返回值：
--	如果成功，则返回所得到奖励的索引，否则为nil
--用例：
--
--==================================================--
	convertring = function(self,worth,mark)
		for i=1,self.__ringtabfile:getRow() do
			if (tonumber(self.__ringtabfile:getCell("Ng� H祅h",i)) == mark or tonumber(self.__ringtabfile:getCell("Ng� H祅h",i)) == 9) then
				self.__ringWorth:addWorth(i, tonumber(self.__ringtabfile:getCell("Worth",i)), tonumber(self.__ringtabfile:getCell("mID",i)))
			else
				self.__ringWorth:addWorth(i, 0, tonumber(self.__ringtabfile:getCell("mID",i)))
			end
		end
		self.__ringWorth:makeBaseP()
		self.__ringWorth:makeWorthP(worth)
		return self.__ringWorth:getFromWorth()
	end,
	convertpendant = function(self,worth, mark)
		for i=1,self.__pendanttabfile:getRow() do
			if (tonumber(self.__pendanttabfile:getCell("Ng� H祅h",i)) == mark or tonumber(self.__pendanttabfile:getCell("Ng� H祅h",i)) == 9) then
				self.__pendantWorth:addWorth(i, tonumber(self.__pendanttabfile:getCell("Worth",i)), tonumber(self.__pendanttabfile:getCell("mID",i)))
			else
				self.__pendantWorth:addWorth(i, 0, tonumber(self.__pendanttabfile:getCell("mID",i)))
			end
		end
		self.__pendantWorth:makeBaseP()
		self.__pendantWorth:makeWorthP(worth)
		return self.__pendantWorth:getFromWorth()
	end,
	convertamulet = function(self,worth, mark)		
		for i=1,self.__amulettabfile:getRow() do
			if (tonumber(self.__amulettabfile:getCell("Ng� H祅h",i)) == mark or tonumber(self.__amulettabfile:getCell("Ng� H祅h",i)) == 9) then
				self.__amuletWorth:addWorth(i, tonumber(self.__amulettabfile:getCell("Worth",i)), tonumber(self.__amulettabfile:getCell("mID",i)))
			else
				self.__amuletWorth:addWorth(i, 0, tonumber(self.__amulettabfile:getCell("mID",i)))
			end
		end
		self.__amuletWorth:makeBaseP()
		self.__amuletWorth:makeWorthP(worth)
		return self.__amuletWorth:getFromWorth()
	end	 
}

--eg.
Convert:loadSettings()
ringmsg = 
	{
		"Ho祅g Ng鋍 Gi韎 Ch�",
		"C秏 L穖 Th筩h Gi韎 Ch�",
		"Ph� Dung Th筩h Gi韎 Ch�",
		"Ph� Th髖 Gi韎 Ch�",
		"Th髖 L鵸 Th筩h Gi韎 Ch�",
		"T� M蓇 L鬰 Gi韎 Ch�",
		"H秈 Lam B秓 Th筩h Gi韎 Ch�",
		"H錸g B秓 Th筩h Gi韎 Ch�",
		"Lam B秓 Th筩h Gi韎 Ch�",
		"To祅 Th筩h Gi韎 Ch�"
	}

pendantmsg = 
	{
		{"Hu﹏ Y Hng Nang","M箃 L� Hng Nang","Nh� Hng Hng Nang","Lan Hoa Hng Nang","H頿 Hoan Hng Nang","T� T� Hng Nang","Tr莔 Уn Hng Nang","Ti猲 X� Hng Nang","Gi� Nam Hng Nang","Long Ti猲 Hng Nang"},
		{"Du Di猲 Ng鋍 B閕 ","Kinh B筩h Ng鋍 B閕 ","Уo Hoa Ng鋍 B閕 ","Mai Hoa  Ng鋍 B閕 ","Ng� S綾 Ng鋍 B閕 ","Thanh Ng鋍 Ng鋍 B閕 ","B輈h Ng鋍 Ng鋍 B閕 ","M芻 Ng鋍 Ng鋍 B閕 ","Ho祅g Ng鋍 Ng鋍 B閕 ","Dng Chi B筩h Ng鋍"}
	}
	
amuletmsg = 
	{
		{"уng H筺g Li猲","Ng﹏ H筺g Li猲","Kim H筺g Li猲","B筩h Kim H筺g Li猲","Ng鋍 Ch﹗ H筺g Li猲","L鬰 T飊g Th筩h H筺g Li猲","Th駓 Tinh H筺g Li猲 ","Kh鎛g Tc Th筩h H筺g Li猲","Tr﹏ Ch﹗ H筺g Li猲","To祅 Th筩h H筺g Li猲"},
		{"L鬰 T飊g Th筩h H� Th﹏ ph� ","San H� H� Th﹏ ph� ","Mi猽 Nh穘 H� Th﹏ ph� ","H� T譶h H� Th﹏ ph� ","Th駓 Tinh H� Th﹏ ph� ","H� Ph竎h H� Th﹏ ph� ","B筩h Ph� Th髖 H� Th﹏ ph� ","H錸g Ph� Th髖 H� Th﹏ ph� ","T� Ph� Th髖 H� Th﹏ ph� ","L鬰 Ph� Th髖 H� Th﹏ ph� "}
	}

MAXGIVENUM = 20  --可以给礼物的最大上限
TF_GIFT_WORTH = 3  --giftlvl.txt中worth项的列数

TF_BONUS_WORTH = 3 
TF_BONUS_SEED = 4
TF_BONUS_P1 = 5
TF_BONUS_P2 = 6
TF_BONUS_P3 = 7
TF_BONUS_P4 = 8
TF_BONUS_P5 = 9
TF_BONUS_P6 = 10
TF_BONUS_P7 = 11
TF_BONUS_F = 12



function main()
	Talk(1, "GiveUIForThing", "H頿 th祅h nh蒼: M鏸 l莕 b� t鑙 產 v祇 <color=yellow>20<color> l� v藅 n╩ D藆 v� m閠 m鉵 <color=yellow>v� kh�<color> m祏 xanh, c� th� h頿 th祅h ra ng c蕄 tng 鴑g, trang s鴆 thu閏 t輓h ng� h祅h. Ta c祅g b� nhi襲 l� v藅 n╩ D藆 v祇 thu閏 t輓h c馻 nh蒼 c祅g cao.<enter>C竎h th鴆 i: V� kh� i nh蒼; kh╪ i ho芻 gi祔 i 產i th総; y ph鬰 ho芻 y猽 i i d﹜ chuy襫")
end

function GiveUIForThing()
	GiveItemUI("Giao di謓 h頿 th祅h trang s鴆","Thanh c玭g c� ph輆 di t v祇 nhi襲 nh蕋 20 l� v藅 n╩ d藆 v� m閠 v� kh�.", "ConvertThing", "onCancel" );
end

function ConvertThing(nCount)
	local worth = 0	--礼物价值量
	local maxCount = 0	--礼物的总数
	local wnum = 0
	local thindex = 0
	if(nCount == 0) then
		Talk(1,"GiveUIForThing","<#> C竔 g� c騨g kh玭g a, ngi mu鑞 l祄 g� y!")
		return nil
	end
	for i=1,nCount do
		itemIdx = GetGiveItemUnit( i )
		g, d, p, l, f = GetItemProp(itemIdx)
		if((g ~= 4 or (d < 508 or d > 518)) and (g ~= 0 or (d~=0 and d~=1 and d ~= 2 and d ~= 5 and d ~= 6 and d ~= 7 ))) then --错误道具  --and d~=2 and d~=5 and d~=6 and d~=7
			Talk(1,"GiveUIForThing","<#> Ngi a cho ta c竔 qu竔 g� th� n祔?")
			return nil
		end
		if(g == 0 ) then -- 武器装备
		magictype = GetItemMagicAttrib(itemIdx, 1)
			if (not magictype) then
				Talk(1, "GiveUIForThing", "<#> Ngi a ta m閠 v� kh� ph秈 c� thu閏 t輓h m祏 xanh. ")
				return
			end
		if (magictype == 0 ) then
			Talk(1, "GiveUIForThing", "<#> Ngi a ta m閠 v� kh� ph秈 c� thu閏 t輓h m祏 xanh. ")
			return
		end	
			wnum = wnum + 1
			thindex = itemIdx
		else --神秘礼物

		end
	end
	if (wnum > 1) then	--只能放一件装备
		Talk(1, "GiveUIForThing", "<#> Nhi襲 trang b� qu� sao ta l祄 k辮 y?厖")
		return nil
	end	
	if (wnum < 1) then
		Talk(1, "GiveUIForThing", "<#> V� kh� g� c騨g kh玭g t v祇 sao i trang s鴆 y?")
		return
	end
	gg, dd = GetItemProp(thindex)
	if(gg == 0 and (dd == 0 or dd == 1)) then -- 戒指
		ConvertRing(nCount)
	elseif (gg == 0 and (dd == 2 or dd == 6)) then --颈带
		ConvertAmulet(nCount)
	elseif (gg == 0 and (dd == 7 or dd == 5)) then --腰坠
		ConvertPendant(nCount)
	end
end

function onCancel()
end