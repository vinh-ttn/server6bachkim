----------------------------------------------------------------
	--FileName:	sanwei_yaohu.lua
	--Creater:	firefox
	--Date:		2005-12-19
	--Comment:	圣诞节活动奖励——三味药壶
	--			功能：每天可使用10次，每使用一次便能获得一颗三味仙丹（服用可涨2万经验）
-----------------------------------------------------------------
Uworld0001 = 2000
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
		Talk(1, "", "B譶h Tam V� Dc m鏸 ng祔 ch� c� th� tinh luy謓"..MAX_USETIME.."vi猲 n dc.")
	else
		--AddItem()三味仙丹
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, use_time + 1))
		Msg2Player("B筺 nh薾 頲 1 vi猲 Tam V� Ti猲 Кn")
	end
	return 1
end