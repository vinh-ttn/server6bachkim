--翠烟门20级任务 大曼陀罗花计时脚本
-- Update: Dan_Deng(2003-09-09)
-- Timer: 8

Include("\\Script\\Global\\TimerHead.lua")

function OnTimer()
	UTask_cy = GetTask(6)
	StopTimer()
	if (UTask_cy == 20*256+20) then		-- 中毒第一阶段到时
		PutMessage("B筺 c秏 th蕐 u 鉩 quay cu錸g, nh� v藋 xem ra c t輓h  b閏 ph竧 r錳 . ")
		Msg2Player("B筺 c秏 th蕐 u 鉩 quay cu錸g, nh� v藋 xem ra c t輓h  b閏 ph竧 r錳 . ")
		SetTask(6, 20*256+30)
		SetTimer(3 * CTime * FramePerSec, 8)						--计时器定为半小时（3个时辰）
	elseif (UTask_cy == 20*256+30) then		-- 中毒第二阶段到时
		PutMessage("B筺 c秏 th蕐 t� chi r� r阨, c� l� c t輓h  ng蕀 s﹗ v祇. ")
		Msg2Player("B筺 c秏 th蕐 t� chi r� r阨, c� l� c t輓h  ng蕀 s﹗ v祇. ")
		SetTask(6, 20*256+40)
		SetTimer(3 * CTime * FramePerSec, 8)						--计时器定为半小时（3个时辰）
	elseif (UTask_cy == 20*256+40) then		-- 中毒第三阶段到时
		PutMessage("To祅 th﹏ b総 u b蕋 ng, tay ch﹏ kh玭g c遪 ph秐 鴑g. ")
		Msg2Player("To祅 th﹏ b総 u b蕋 ng, tay ch﹏ kh玭g c遪 ph秐 鴑g. ")
		SetTask(6, 20*256+50)
		SetTimer(3 * CTime * FramePerSec, 8)						--计时器定为半小时（3个时辰）
	else							-- 第四阶段超时！毒发身亡！！
		SetTask(6, 20*256+10)
		for i=1,GetItemCount(1) do DelItem(1) end
		PutMessage("Ch蕋 c Hoa Чi Man У La  ph竧 t竛, b筺  ch誸 v� c ph竧 ")
		Msg2Player("Ch蕋 c Hoa Чi Man У La  ph竧 t竛, b筺  ch誸 v� c ph竧 ")
		SetFightState(1)
		KillPlayer()
	end
end;
