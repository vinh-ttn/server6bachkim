-- 随机宝箱物品（随机获得一样物品）
-- By: Yuning_liu(2005-03-21)

function main(sel)
	p=random(0,99)
	if (p < 1) then
		p = random(238,240)
		AddEventItem(p)			-- 水晶
		Msg2Player("B筺 nh薾 頲 m閠 vi猲 Th駓 Tinh. ")
	elseif (p < 2) then
		AddEventItem(353)			-- 猩红
		Msg2Player("B筺 nh薾 頲 m閠 vi猲 Tinh H錸g B秓 Th筩h. ")
	elseif (p < 33) then
		AddItem(6,1,15,1,0,0,0)		-- 披风
		Msg2Player("B筺 nh薾 頲 m閠 t蕀 竜 kho竎. ")
	elseif (p < 66) then
		AddItem(6,1,18,1,0,0,0)		-- 心心相印
		Msg2Player("B筺 nh薾 頲 m閠 c竔 T﹎ T﹎ Tng 蕁 ph�! ")
	else
		AddItem(6,0,20,1,0,0,0)		-- 玫瑰雨
		Msg2Player("B筺 nh薾 頲 m閠 c祅h hoa h錸g. ")
	end
	return 0
end
