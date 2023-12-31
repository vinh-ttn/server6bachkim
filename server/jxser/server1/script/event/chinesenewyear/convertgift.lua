--========文件定义==================================--
--文件名：convertgift.lua
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-2-1
--功能叙述：
--	春节活动，用鸡年神秘礼物换取礼物。本活动分两步，
--第一步，可以把数量的鸡年神秘礼物升级。第二步，用鸡
--年神秘礼物换取奖品。
--
--游戏脚本·剑侠情缘网络版
--金山软件股份有限公司，copyright 1992-2005
--==================================================--

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
--	:giftLevelup(worth)：神秘礼物升级
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
	Include ("\\script\\class\\worthanalyse.lua")
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
		self.__gifttabfile = new(KTabFile,"/settings/event/chinesenewyear/giftslvlup.txt","GIFT")
		self.__bonustabfile = new(KTabFile,"/settings/event/chinesenewyear/bonuslist.txt","BONUS")
		self.__crystaltabfile = new(KTabFile,"/settings/event/chinesenewyear/crystal.txt","CRYSTAL")
		self.__giftWorth = new(WorthAnalyse,80)
		self.__bonusWorth = new(WorthAnalyse,60)
		for i=1,self.__gifttabfile:getRow() do
			self.__giftWorth:addWorth(i,tonumber(self.__gifttabfile:getCell("Worth",i)))
		end
		for i=1,self.__bonustabfile:getRow() do
			self.__bonusWorth:addWorth(i,tonumber(self.__bonustabfile:getCell("Worth",i)))
		end
		self.__giftWorth:makeBaseP()
		self.__bonusWorth:makeBaseP()
		return
	end,
	
--========函数定义==================================--
--函数原形：:giftLevelup(worth)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	由价值量worth选出将要升级得到的神秘礼物的索引号。
--参数：
--	worth：价值量，这里是从玩家提交的神秘礼物算出来的
--价值量总和。
--返回值：
--	成功则返回将要升级得到的神秘礼物索引，否则为nil
--用例：
--
--
--
--==================================================--
	giftLevelup =function(self,worth)
		self.__giftWorth:makeWorthP(worth)
		return self.__giftWorth:getFromWorth()
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
	convert = function(self,worth)
		self.__bonusWorth:makeWorthP(worth)
		return self.__bonusWorth:getFromWorth()
	end,
	 
}

TID_CLONECRYSTAL = 503
MAX_CRYSTAL_WORTH = 50000000 --大于5000万，涉嫌刷水晶
GOLD_LASTDATE = tonumber(date("%d"))  --上一次发高价值量奖品的日子，只记录日期
GOLD_WORTH = 0  --已发奖品的价值量,除以100000保存
MAXWORTHPERDAY = 100000 --5件价值最高的黄金装备
GOLD_PRICE_LIMIT = 10000000	--高于10000000的奖励算宝物。

MAXGIVENUM = 20  --可以给礼物的最大上限
TF_GIFT_WORTH = 3  --giftlvl.txt中worth项的列数
TF_GIFT_P1 = 4
TF_GIFT_P2 = 5
TF_GIFT_P3 = 6
TF_GIFT_P4 = 7
TF_GIFT_CRYPTIC = 8

TF_BONUS_TYPE = 2
TF_BONUS_TYPENAME = 3
TF_BONUS_NAME = 4
TF_BONUS_WORTH = 5
TF_BONUS_P1 = 6
TF_BONUS_P2 = 7
TF_BONUS_P3 = 8
TF_BONUS_P4 = 9
TF_BONUS_MESSAGE = 18
TF_BONUS_ANNOUNCE = 19

TF_CRYSTAL_WORTH = 2

--eg.
Convert:loadSettings()
--randomseed(date("%S"))
--for i=1,20 do
--	r = random(20000,150000000)
--	local idx = Convert:convert(r)
--	if(idx) then
--		print(r..":"..idx.."["..Convert.__bonustabfile:getCell("Worth",idx).."]="..r..Convert.__bonustabfile:getCell("Worth",idx).."->"..Convert.__bonusWorth.__worthP[idx])
--	end
--end

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
	local crystal = 0	--水晶价值量
	local maxCount = 0	--礼物的总数
	
	if(nCount == 0) then
		Talk(1,"","<#> L� quan ci h輕 m総: 'c� g� a ta kh玭g? '","B筺 g穒 g穒 u: 'Th玦 ch誸! Ta qu猲 m蕋 r錳! '")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)
		if(g ~= 4 or d<468 or (d >486 and d < 508) or d > 518) then --错误道具
			Talk(2,"","<#> L� quan chau m祔: 'Ngi a cho ta c竔 qu竔 g� th�?' ","<#> B筺 l筰 g穒 u: 'wa! Xin a l筰 cho ta!' ")
			return nil
		end
		if(d > 467 and d < 487) then -- 水晶
			crystal = crystal + GetItemStackCount(itemIdx)*Convert.__crystaltabfile:getCell(TF_CRYSTAL_WORTH,(d-467))
		else --神秘礼物
			function checkGiftCount(idx,count)  --检测神秘道具的数量
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- 数量太多
					Talk(2,"","<#> L� quan g穒 u: Xin l鏸! Ta gi� r錳 n猲 hoa m総!' ","<#> B筺 ph鉵g th糿g 1 cc, tr髇g ngay m玭g l� quan")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				maxCount = maxCount + num
				local lvl = d - 508
				if(lvl ==0) then
					worth = worth + num * 100000
				else
					worth = worth + num * Convert.__gifttabfile:getCell(TF_GIFT_WORTH,lvl)
				end
			end
		end
	end
	if(crystal > MAX_CRYSTAL_WORTH) then --价值量大于5000w，涉嫌刷水晶
		SetTask(TID_CLONECRYSTAL,GetTask(TID_CLONECRYSTAL)+1)
		return -1
	end
	if(worth ==0) then
		Talk(1,"","<#> Xin l鏸! 輙 nh蕋 ph秈 c� 1 l� v藅 n╩ D藆!")
		return nil
	end
	return worth + crystal
end

--========函数定义==================================--
--函数原形：GiftLevelUp(nCount)
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
function GiftLevelUp(nCount)
	local worth = ComputeWorth(nCount)
	if(not worth) then return end
	--已经得到合理的价值量，删除所有物品，选择对应的特殊神秘礼物
	for i=1,nCount do
		RemoveItemByIndex(GetGiveItemUnit( i ))
	end
	if(worth < 0) then
		--涉嫌刷水晶，扣掉所有物品，并记录日志
		WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
					"Trong l骳 h頿 th祅h l� V藅 n╩ D藆, ph竧 hi謓 ra  s� d鬾g Th駓 Tinh vt qu� 5000 v筺. Ki課 ngh� n猲 kh鉧 ngay Account n祔")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
					"Х s� d鬾g"..GetTask(TID_CLONECRYSTAL).."l莕, Th駓 Tinh n祔 c� nhi襲 kh� n╪g l� phi ph竝. Xin GM h穣 ch� �!")
		end
		--说句神么话呢？迷惑一下
		Say("<#> L� quan th蕋 v鋘g n鉯: '! Th蕋 b筰 r錳! Ngi c� mu鑞 th� l筰 kh玭g?' ",2,"Л頲! Ta mu鑞 th� l筰!/GiveUIForGift","Th玦 甶! ng l鮝 ta n鱝!/onCancel")
		return
	end
	local idx = Convert:giftLevelup(worth)
	if(not idx) then  --失败，没有选出任何东西
		Talk(1,"","<#> L� quan l綾 l綾 u: sao l筰 c� th� th蕋 b筰 nh�?")
		return
	end
	if(idx == 1) then
		Say("<#> L� quan th蕋 v鋘g n鉯: '! Th蕋 b筰 r錳! Ngi c� mu鑞 th� l筰 kh玭g?' ",2,"Л頲! Ta mu鑞 th� l筰!/GiveUIForGift","Th玦 甶! ng l鮝 ta n鱝!/onCancel")
		return
	end
	AddItem(Convert.__gifttabfile:getCell(TF_GIFT_P1,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P2,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P3,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P4,idx),
					0,0,0,0,0,0,0,0)
	WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
					", s� d鬾g"..worth.."я s� Th莕 b� l� v藅, h頿 th祅h"..
					Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx).."Gi� tr� lng th莕 b� l� v藅, h� th鑞g nh薾 頲 "..
					tostring(worth-Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx)).."Gi� tr� c遪 th鮝 l筰.")
	Say("<#> H頿 th祅h 1 l� v藅 n╩ D藆 ti襪 ch蕋 th莕 b�:"..Convert.__gifttabfile:getCell(TF_GIFT_CRYPTIC,idx).."Ngi  v鮝 � ch璦?",
			2,
			"Ch璦 v鮝 �! Ta mu鑞 ti誴 t鬰 l莕 n鱝/GiveUIForGift","C騨g t祄 t筸! Ta 甶 y!/onCancel")
	return
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
function ConvertBonus(nCount)
	if(GOLD_LASTDATE ~= date("%d")) then --新的一天开始了
		GOLD_LASTDATE = date("%d")
		GOLD_WORTH = 0
	end
	local worth = ComputeWorth(nCount)
	if(not worth) then return end
	--已经得到合理的价值量，删除所有物品，选择对应的奖励
	if(worth < 0) then
		--涉嫌刷水晶，扣掉所有物品，并记录日志
		for i=1,nCount do
			RemoveItemByIndex(GetGiveItemUnit(i))
		end
		WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
					"Trong l骳 nh薾 qu� t苙g n╩ m韎, ph竧 hi謓 ra  s� d鬾g Th駓 Tinh vu顃 qu� 5000 v筺. Ki課 ngh� n猲 kh鉧 ngay Account n祔")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
					"Х s� d鬾g"..GetTask(TID_CLONECRYSTAL).."l莕, Th駓 Tinh n祔 c� nhi襲 kh� n╪g l� phi ph竝. Xin GM h穣 ch� �!")
		end
		--说句神么话呢？迷惑一下
		Talk(1,"","<#> Ch骳 m鮪g ngi tr髇g s� c c, nh璶g kh玭g l蕐 頲 g� ")
		return
	end
	local idx = Convert:convert(worth)
	if(not idx) then --失败，没有选出任何东西
		Talk(1,"","<#> L� quan l綾 l綾 u: sao l筰 c� th� th蕋 b筰 nh�?")
		return
	end
		
	local bonusWorth = tonumber(Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx))
	if(bonusWorth > GOLD_PRICE_LIMIT) then  --开始关注
		if((bonusWorth/100000 + GOLD_WORTH) > MAXWORTHPERDAY) then --如此贵重的物品不能发，达到每天发高级奖励的上限
			Talk(1,"","<#> Qu� t苙g h玬 nay  ph竧 h誸 r錳! Mai h穣 tr� l筰 nh�!")
			return
		else
			GOLD_WORTH = GOLD_WORTH + bonusWorth/100000
		end
	end
	for i=1,nCount do  --扣除所有道具
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
					", s� d鬾g"..worth.." s� Th莕 b� l� v藅, i 頲"..
					Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx).."S� qu� thng n╩ m韎, h� th鑞g nh薾 頲"..
					tostring(worth-Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx)).."Gi� tr� c遪 th鮝 l筰.")
	return PayBonus(idx)
end

--========函数定义==================================--
--函数原形：PayBonus(bonusIdx)
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
function PayBonus(bonusIdx)
	local _type = tonumber(Convert.__bonustabfile:getCell(TF_BONUS_TYPE,bonusIdx))
	if(not _type) then return end --error.
	local msg = Convert.__bonustabfile:getCell(TF_BONUS_MESSAGE,bonusIdx)
	msg = replace(msg,"<name>",Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx))
	Msg2Player(msg)
	if(_type == 1) then --黄金装备
		AddGoldItem(0,Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx))
	elseif(_type == 2) then --普通道具
		AddItem(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P2,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P3,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P4,bonusIdx),0,0,0,0,0,0,0,0)
	elseif(_type == 3) then --临时状态
		AddSkillState(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P2,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P3,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P4,bonusIdx))
	elseif(_type == 4) then --经验值
		AddOwnExp(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx))
	else --莫名其妙
		print("pay bonus error.")
	end
	WriteLog(date("%H%M%S")..": T礽 kho秐"..GetAccount()..", nh﹏ v藅"..GetName()..
			", i 頲"..Convert.__bonustabfile:getCell(TF_BONUS_TYPENAME,bonusIdx).."--"..
			Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx)..", gi� tr� l�:"..
			Convert.__bonustabfile:getCell(TF_BONUS_WORTH,bonusIdx))
	local announce = Convert.__bonustabfile:getCell(TF_BONUS_ANNOUNCE,bonusIdx)
	if(strlen(announce)>0) then
		announce = replace(announce,"<name>",Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx))
		announce = replace(announce,"<player>",GetName())
		AddGlobalNews(announce)
	end
	return
end

--========函数定义==================================--
--函数原形：GiveUIForGift()
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
function GiveUIForGift()
	GiveItemUI("H頿 th祅h L� v藅 n╩ D藆 ","h穣 a ta 20 l� v藅 n╩ D藆 v� 1 B╪g Tinh, Ta s� gi髉 ngi n﹏g c蕄 l� v藅!", "GiftLevelUp", "onCancel" );
end

--========函数定义==================================--
--函数原形：GiveUIForBonus()
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	打开给与界面，用于兑换新春奖励。被礼官的对话调用。
--参数：
--	无
--返回值：
--	无
--用例：
--	无
--==================================================--
function GiveUIForBonus()
	GiveItemUI("Trao i l� v藅 n╩ m韎","h穣 a ta 20 l� v藅 n╩ D藆 v� 1 B╪g Tinh,  i qu� thng n╩ m韎.", "ConvertBonus", "onCancel" );
end

--========函数定义==================================--
--函数原形：EventHappyNewYear()
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	新春活动的礼官对话子界面。
--参数：
--	无
--返回值：
--	无
--用例：
--	无
--==================================================--
function EventHappyNewYear()
	local buttons = {
		"Ta mu鑞 nh薾 qu� t苙g n╩ m韎/GiveUIForBonus",
		"Ta mu鑞 n﹏g c蕄 l� v藅 n╩ D藆/GiveUIForGift",
		"T譵 hi觰 ho箃 ng l莕 n祔/AboutNewYearEvent",
		"To祅 g箃 tr� con. Ta ch糿g quan t﹎!/onCancel"
	}
	local talk = "<#> Hoan ngh猲h tham gia ho箃 ng <color=red>qu� thng n╩ m韎<color>.Trong th阨 gian ho箃 ng, b筺 nh qu竔 s� t飝 c� nh薾 頲 <color=yellow>L� v藅 n╩ D藆<color>. Khi c�  s� lng <color=yellow>L� v藅 n╩ D藆<color>, c� th� mang 甶 i qu� thng n╩ m韎"
	Say(talk,getn(buttons),buttons)
	return
end

--========函数定义==================================--
--函数原形：AboutNewYearEvent()
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	点击了解本次活动之后，出现的对话内容。
--参数：
--	无
--返回值：
--	无
--用例：
--	无
--==================================================--
function AboutNewYearEvent()
	Talk(2,"",
		"<#> Hoan ngh猲h tham gia ho箃 ng 'qu� thng n╩ m韎'. Trong th阨 gian ho箃 ng, b筺 nh qu竔 s� t飝 c� nh薾 頲 L� v藅 n╩ D藆, Khi c�  s� lng, c� th� mang n <color=red>Dng Ch﹗- L� quan<color>i qu� thng!","<#> Ph莕 thng l莕 n祔 r蕋 phong ph�, g錷: Trang b� Ho祅g Kim, s竎h k� n╪g, b秓 v藅, M苩 n�, n╪g l鵦, 甶觤 kinh nghi謒. Ch� c莕 t輈h l騳 1 s� lng L� v藅 n╩ D藆 nh蕋 nh, c� th� t譵 ta  i qu�. T譵 ch蕋 th莕 b� c馻 L� v藅 n╩ D藆 th� gi� tr� ph莕 thng c祅g cao")
	return
end
