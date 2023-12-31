-- xingjiaoshang.lua 
-- 行脚商人脚本
-- 2005-09-07 by steve

Include("\\script\\event\\mid_autumn\\mooncake_head.lua")

-- 用[count]个[type2]物品兑换[type1]物品的对话
function exchange_talk(type1, type2, count)
	-- DEBUG
	print(format("exchange(%d,%d,%d)", type1, type2, count))

	local item1 = tbl_material[type1]
	local item2 = tbl_material[type2]
	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	if (itemcount == 0) then
		-- 材料已经兑换完了
		Say("<#> L莕 n祔 " .. item1[1] .. "<#>  i h誸 r錳! L莕 sau quay l筰 nhe1", 1, "<#> Л頲!/cancel")
	else
		local caption = "<#> фi 1 " .. item1[1] .. "<#> c莕 c� " .. count .. "<#> " .. item2[1] .. ". Ngi x竎 nh i ch�?"
		local options = {
			"<#> Л頲! C� nh� v藋 甶!/" .. format("#exchange(%d,%d,%d)", type1, type2, count),
			"<#> Kh玭g! в ta ngh� l筰 !/cancel"
		}
		Say(caption, getn(options), options)
	end
end

-- 用[count]个[type2]物品兑换[type1]物品
function exchange(type1, type2, count)
	local item1 = tbl_material[type1]
	local item2 = tbl_material[type2]
	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	if (itemcount == 0) then
		-- 材料已经兑换完了
		Talk(1, "", "<#> Th藅 ng筰 qu�! H祅g c馻 ta  b竛 h誸 r錳! Quay l筰 sau nh�!")
	else
		local exchtime = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME)	-- 本次兑换的时间
		local lasttime = GetTask(VARV_MOONCAKE_EXCHANGETIME)		-- 上次兑换的时间
		local exchcount = GetTask(VARV_MOONCAKE_EXCHANGECOUNT)		-- 已经兑换的次数
		if (exchtime ~= lasttime) then
			-- 兑换次数清零
			exchcount = 0
		end
		if (exchcount >= tbl_exchange_limitcount[type1]) then
			-- 达到了兑换次数限制
			-- DEBUG
			print(format("exchcount:%d, limitcount:%d", exchcount, tbl_exchange_limitcount[type1]))
			Talk(1, "", "<#> Th藅 ng筰 qu�! Ta  mua  c竎 v藅 li謚 r錳, sau n祔 c莕 g� ta s� gh� l筰.") 			
		elseif (CalcEquiproomItemCount(item2[2], item2[3], 1, -1) < count) then
			-- 用来兑换的物品数量不够
			Talk(1, "", "<#> Nguy猲 li謚 l祄 b竛h ngi 甧m n v蒼 ch璦  ")
		else
			SetTask(VARV_MOONCAKE_EXCHANGETIME, exchtime)
			SetTask(VARV_MOONCAKE_EXCHANGECOUNT, exchcount + 1)
			WriteLog(format("%s %s(%s): exchange mooncake material %s(%d)==>%s(1)",
				date("%y-%m-%d %H:%M"),
				GetAccount(),
				GetName(),
				item2[1],
				count,
				item1[1]))
			ConsumeEquiproomItem(count, item2[2], item2[3], 1, -1)
			AddEventItem(item1[3])
			SetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT, itemcount - 1)
			Msg2Player("<#> B筺 nh薾 頲 1 <color=yellow>" .. item1[1] .. "<color>")
		end
	end
end

-- 剩余可兑换次数
function GetLeftCount(type)
	local exchtime = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME)	-- 本次兑换的时间
	local lasttime = GetTask(VARV_MOONCAKE_EXCHANGETIME)		-- 上次兑换的时间
	local exchcount = GetTask(VARV_MOONCAKE_EXCHANGECOUNT)		-- 已经兑换的次数
	if (exchtime ~= lasttime) then
		-- 兑换次数清零
		exchcount = 0
	end
	return tbl_exchange_limitcount[type] - exchcount
end

-- 兑换对话
function ExchangeTalk()
	local material_type = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_TYPE)
	local material_name = tbl_material[material_type][1]
	local caption = "<#> Ta chu du c竎 n琲 mua 頲 kh玭g 輙 k� tr﹏ b秓 v藅, l莕 n祔 ta mang n y <color=red>" ..
		material_name .. 
		"<#> <color>, nh璶g th� ta c莕 v蒼 ch璦 mua 頲, n誹 nh� ngi c� " ..
		material_name .. 
		"<#> ch髇g ta c� th� trao i <color=red>" ..
		GetLeftCount(material_type) ..
		"<color>."
	local exchanges = GetExchangeList(material_type)
	local options = {}
	local index = 1
	while (index <= getn(exchanges)) do
		local obj_type = exchanges[index][1]
		local obj_count = exchanges[index][2]
		local obj_name = tbl_material[obj_type][1]
		local func = format("#exchange_talk(%d,%d,%d)", material_type, obj_type, obj_count)
		options[index] = "<#> Ta mu鑞 d飊g " .. obj_name .. "<#>  trao i/" .. func
		index = index + 1
	end
	options[index] = "<#> Kh玭g! в ta ngh� l筰 !/cancel"
	
	Say(caption, getn(options), options)		
end

function OnTimer()
	-- 关闭定时器
	StopGlbMSTimer(MISSION_MOONCAKE_EXCHANGE, TIMER_MOONCAKE_EXCHANGE)
	-- 设置兑换材料状态为开始
	SetGlbValue(GBL_VAR_MOONCAKE_EXCHANGING, 1)
	-- 设置本次兑换的时间，用来判断玩家的兑换次数限制
	SetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME, GetCurrentTime())
	-- 公告
	local city = GetGlbValue(GBL_VAR_MOONCAKE_CITY)
	local type = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_TYPE)
	-- DEBUG
	print(format("material type:%d", type))
	local itemname = tbl_material[type][1]
	local news = "<#> Nghe n鉯 � " ..
		tbl_cities[city] ..
		"<#> c� H祅h Cc thng nh﹏ mang theo r蕋 nhi襲 ph萴 v藅 thng h筺g" ..
		itemname ..
		"<#>, nh璶g b竛 h誸 l� 玭g ta 甶 ngay!"
	-- DEBUG
	print(news)
	AddGlobalNews(news)
	AddGlobalNews(news)
	AddGlobalNews(news)
	Msg2SubWorld(news)

	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	WriteLog(format("%s: mooncake material quota: %s(%d)",
		date("%y-%m-%d %H:%M"),
		itemname,
		itemcount))
	-- DEBUG
	print("news: " .. news)
end

function main()
	local exchanging = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGING)
	-- DEBUG
	print(format("exchanging: %d", exchanging))
	local msg = format("GetGlbValue(%d): %d", GBL_VAR_MOONCAKE_EXCHANGING, exchanging)
	print(msg)
	local mapid = GetGlbValue(GBL_VAR_MOONCAKE_CITY)
	if (mapid ~= SubWorldIdx2ID(SubWorld) or exchanging ~= 1) then
		-- 还没开始兑换月饼材料
		Talk(1, "", "<#> 莥! N╩ nay kh� l祄 ╪ qu�! B筺 h祅g c馻 ta kh玭g bi誸 sao gi� n祔 v蒼 ch璦 giao h祅g t韎!")
	else
		ExchangeTalk()
	end
end
