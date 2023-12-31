if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
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
		self.__oretabfile = new(KTabFile,"/settings/item/004/itemvalue/ore.txt","ORE")
	end	
}

MAXGIVENUM = 50  --可以给最大上限
TF_ORE_WORTH = 2

Convert:loadSettings()

--========函数定义==================================--
--函数原形：ComputeWorth(nCount)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	根据给与界面的物品，计算出其价值量。
--参数：
--	nCount：给与界面中物件的总数
--返回值：
--	成功则返回价值量，否则返回nil
--用例：
--	无
--==================================================--
function ComputeWorth(nCount)
	local worth = 0	--礼物价值量
	local maxCount = 0	--礼物的总数
	local mark = 0

	if(nCount == 0) then
		Talk(1,"GiveUIForOre","<#> C竔 g� c騨g kh玭g b� v祇, sao h頿 th祅h y?")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit(i)
		local g,d,p,lvl = GetItemProp(itemIdx)

		if (mark ~= 0) then
			if (mark ~= lvl) then

				Talk(1,"GiveUIForOre","<#> Ngi b� c竔 qu竔 g� th�? Ъng c蕄 kh玭g gi鑞g nhau g� h誸!")
				return nil
			end
		end
		mark = lvl

		if (lvl > 4) then
			Talk(1, "GiveUIForOre", "<#> Huy襫 Tinh Kho竛g Th筩h c馻 ngi b� v祇 ng c蕄 qu� cao, kh玭g n籱 trong ph筸 vi n╪g l鵦 c馻 ta.")
			return nil
		end
		if(g ~= 6 or p ~= 147) then --错误道具
			Talk(1, "GiveUIForOre", "<#> Ngi b� c竔 qu竔 g� th�? C� ph秈 Huy襫 Tinh Kho竛g Th筩h kh玭g?")
			return nil
		end
		function checkGiftCount(idx,count)  --检测神秘道具的数量
			local num = GetItemStackCount(idx)
			if(count + num > MAXGIVENUM) then -- 数量太多
				Talk(1,"GiveUIForOre","<#> Ngi b� c竔 qu竔 g� v� v藋?")
				return nil
			end
			return num
		end
		local num = checkGiftCount(itemIdx,maxCount)
		if(not num) then
			return nil
		else
			maxCount = maxCount + num
			worth = worth + num * tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl))
		end

	end

	return worth, mark
end
--========函数定义==================================--
--函数原形：GiveUIForOre()
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	打开给与界面，用于合成鸡年神秘礼物。被礼官的对话
--调用。
--参数：
--	无
--返回值：
--	无
--用例：
--	无
--==================================================--
function GiveUIForOre()
	GiveItemUI("H頿 th祅h Huy襫 Tinh Kho竛g Th筩h","m t鑙 產 50 vi猲 Huy襫 Tinh Kho竛g Th筩h c� ng c蕄 gi鑞g nhau t v祇 thanh v藅 ph萴 th� c� th� h頿 th祅h ra s� lng Huy襫 Tinh Kho竛g Th筩h c蕄 cao h琻 tng 鴑g.", "OreLevelUp", "onCancel" );
end

--========函数定义==================================--
--函数原形：OreLevelUp(nCount)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	玩家选择升级神秘物品之后，弹出给与界面，此函数为
--该给与界面点击确定按钮之后的回调函数。
--参数：
--	给与界面中道具物品的总数，该数量不计算叠加的数量。
--返回值：
--	无
--用例：
--	无
--==================================================--
function OreLevelUp(nCount)
	local worth, lvl = ComputeWorth(nCount)
	if(not worth) then return end
	--已经得到合理的价值量，删除所有物品，选择对应的特殊神秘礼物
	local num, worth2 = ConvertWorth(worth, lvl)
	local lvl2 = lvl + 1
	
	for i=1,nCount do
		RemoveItemByIndex(GetGiveItemUnit( i ))
	end
	if (num < 1) then
		Talk(1, "", "H�! L筰 th蕋 b筰 n鱝 r錳, 甧m 輙 Huy襫 Tinh Kho竛g Th筩h h頿 th祅h c蕄 cao c� v� nguy hi觤 y!")
		return
	end

	if(not num) then  --失败，没有选出任何东西
		Talk(1,"","<#> Th蕋 b筰 r錳 礹! Li猲 h� GM 甶! Ta c騨g kh玭g bi誸 gi秈 quy誸 sao n鱝!")
		print("Error: the number of ore is non.")
		return
	end
	
	AddStackItem(num, 6, 1, 147, lvl2, 1, 1, 1)
	WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
					", s� d鬾g"..worth.."Gi� tr� "..lvl.." Huy襫 Tinh Kho竛g Th筩h, h頿 th祅h ra"..
					num.."c竔"..lvl2.." Huy襫 Tinh Kho竛g Th筩h, h� th鑞g nh薾 頲"..
					worth-worth2.."Gi� tr� c遪 th鮝 l筰.")
	Talk(1, "", "B筺  h頿 th祅h ra <color=yellow>"..num.."<color> <color=yellow>"..lvl2.."<color> Huy襫 Tinh Kho竛g Th筩h ")
	Msg2Player("B筺 t 頲"..num.." vi猲 Huy襫 Tinh Kho竛g Th筩h")
	return
end

function ConvertWorth(worth, lvl)
	local lvlworth = tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl + 1))
	count = floor(worth / lvlworth)
	value = count * tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl + 1))
	if ( random( lvlworth) < (worth - value) and (worth - value) ~= 0) then
		count = count + 1
	end
	return count, value
end


function main()
	Talk(1, "GiveUIForOre", "H頿 th祅h Huy襫 Tinh Kho竛g Th筩h c蕄 cao: M鏸 l莕 b� t鑙 產 v祇 <color=yellow>50<color> vi猲 <color=yellow>ng c蕄 gi鑞g nhau<color>, th� c� th� h頿 th祅h ra Huy襫 Tinh Kho竛g Th筩h c蕄 cao h琻. Nh璶g t鑙 產 ch� h頿 th祅h ra 頲 Huy襫 Tinh Kho竛g Th筩h c蕄 <color=yellow>5<color> th玦.")
	return
end

function onCancel()
end