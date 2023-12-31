/*
if not PENDANT then
	PENDANT = 1
end
if not SHOSHI then
	Include ("\\script\\item\\hecheng\\shoushihecheng.lua")
end
*/

--========函数定义==================================--
--函数原形：ComputeJewelWorth(nCount)
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
function ComputePendantWorth(nCount)
	local worth = 0	--礼物价值量
	local maxCount = 0	--礼物的总数
	local wnum = 0

	if(nCount == 0) then
		Talk(1,"GiveUIForThing","<#> C竔 g� c騨g kh玭g a, ngi mu鑞 l祄 g� y!")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g, d, p, l, f = GetItemProp(itemIdx)

		if((g ~= 4 or (d < 508 or d > 518)) and (g ~= 0 or (d~= 5 and d~= 7 ))) then --错误道具  
			Talk(1,"GiveUIForThing","<#> Ngi a cho ta c竔 qu竔 g� th� n祔?")
			return nil
		end
		if(g == 0) then -- 武器
			wnum = wnum + 1

			if (wnum > 1) then	--只能放一件装备
				Talk(1,"GiveUIForThing","<#> Ngi a c竔 qu竔 g� th�?厖")
				return nil
			end
			det = d
			par = p
			lvl = l
			five = f
		else --神秘礼物
			function checkGiftCount(idx,count)  --检测神秘道具的数量
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- 数量太多
					Talk(1,"GiveUIForThing","<#> у ngi cho nhi襲 qu�, nh譶 kh玭g r� g� h誸!")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)

			if(not num) then
				return nil
			else
				maxCount = maxCount + num
				local ll = d - 508
				if(ll ==0) then
					worth = worth + num * 100000
				else
					worth = worth + num * Convert.__gifttabfile:getCell(TF_GIFT_WORTH,ll)
				end
			end
		end
	end
	if(worth ==0) then
		Talk(1,"GiveUIForThing","<#> Xin l鏸! 輙 nh蕋 c莕 m閠 L� v藅 n╩ D藆.")
		return nil
	end
	if (wnum == 0) then
		Talk(1,"GiveUIForThing","<#> Xin l鏸 c莕 m閠 c竔 n鉵 (ho芻 i gi祔) ")
		return nil
	end

	return worth, det, par, lvl, five
end

--========函数定义==================================--
--函数原形：ConvertBonus(nCount)
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	用鸡年神秘礼物兑换奖品。此函数被给与界面的确定按钮
--回调。
--参数：
--	nCount：给与界面中的物品总数
--返回值：
--	无
--用例：
--	无
--==================================================--
function ConvertPendant(nCount)
	local worth, d, p, lvl, five = ComputePendantWorth(nCount)
	local tt = 0
	if(not worth) then return end
	--已经得到合理的价值量，删除所有物品，选择对应的奖励
	local idx = Convert:convertpendant(worth, five)
	if(not idx) then --失败，没有选出任何东西
		Talk(1,"GiveUIForThing","<#> Th蕋 b筰 r錳! Hu hu!")
		return
	end

		for i=1,nCount do  --扣除所有道具
			RemoveItemByIndex(GetGiveItemUnit(i))
		end
		return PayPendant(idx, d, p, lvl, five)
end

--========函数定义==================================--
--函数原形：PayPendant(bonusIdx)
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	给玩家发放settings/event/chinesenewyear/bonuslist.txt
--中第bonusIdx项的奖品
--参数：
--	bonusIdx：奖品项编号，在tabfile中的行数-1
--返回值：
--	无
--用例：
--	无
--==================================================--
function PayPendant(bonusIdx, det, par, level, five)
	if (det == 5) then
		if (par == 0 or par == 1) then
			par = 1
		else
			par = 0
		end
	else
		if (par >= 0 and par <= 6) then
			par = 1
		else
			par = 0
		end
	end

	local num = tonumber(Convert.__pendanttabfile:getCell(TF_BONUS_SEED, bonusIdx))
	local _nSeed = SetRandSeed(num)
	AddItem(0, 9, par, level, five,
						Convert.__pendanttabfile:getCell(TF_BONUS_P1,bonusIdx),
						Convert.__pendanttabfile:getCell(TF_BONUS_P2,bonusIdx),
						Convert.__pendanttabfile:getCell(TF_BONUS_P3,bonusIdx),
						Convert.__pendanttabfile:getCell(TF_BONUS_P4,bonusIdx),
						Convert.__pendanttabfile:getCell(TF_BONUS_P5,bonusIdx),
						Convert.__pendanttabfile:getCell(TF_BONUS_P6,bonusIdx),
						Convert.__pendanttabfile:getCell(TF_BONUS_P7,bonusIdx))
	SetRandSeed(_nSeed)
	WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
			", i 頲"..pendantmsg[par + 1][level]..", gi� tr� l�:"..
			Convert.__pendanttabfile:getCell(TF_BONUS_WORTH,bonusIdx))
	Talk(1, "", "B筺 h頿 th祅h 頲 1 "..pendantmsg[par + 1][level])
	Msg2Player("B筺 nh薾 頲 1 "..pendantmsg[par + 1][level])
	return
end
