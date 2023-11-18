----------------------------------------------------------------
	--FileName:	juebi_xiancao.lua
	--Creater:	firefox
	--Date:		2005-12-19
	--Comment:	圣诞节活动奖励——绝壁仙草
	--			功能：每天可使用10次，每使用一次便能获得一片仙草叶（服用可获得10分钟经验双倍）
-----------------------------------------------------------------
Uworld0001 = 2002
MAX_USETIME = 10
--第一字节为本日使用次数
--第二字节为最后使用的日期
function main()
	use_day = GetByte(GetTask(Uworld0001), 2)
	
	nDay = tonumber(date("%d"))
	if (use_day ~= nDay) then
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, 0))
	end
	use_time = GetByte(GetTask(Uworld0001), 1)
	if (use_time >= MAX_USETIME) then
		Talk(1, "", "Ti猲 Th秓 Di謕 tr猲 v竎h   b� b筺 h竔 s筩h, nh ph秈 i ng祔 mai th玦!")
	else
		--AddItem()仙草叶
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, use_time + 1))
		Msg2Player("B筺 nh薾 頲 1 phi課 Ti猲 Th秓 Di謕")
	end
	return 1
end