-- 龙门镇快活林迷宫 战斗NPC 金丝猴王 入门任务
-- by：Dan_Deng(2003-07-30)

function OnDeath()
	Uworld31 = GetByte(GetTask(31),2)
	if (Uworld31 == 10) then
		if (HaveItem(8) == 0) and (HaveItem(117) == 1) then
			DelItem(117)
			AddEventItem(8)
			Msg2Player("Kim T� H莡 b蕌 ch苩 s琻 L� H錸g kh玭g bu玭g, b筺 th鮝 c� b総 l蕐 Kim T� H莡. ")
			AddNote("B総 頲 Kim T� H莡. ")
		else
			Msg2Player("Kim T� H莡 th鮝 l骳 b筺 nh蕋 th阨 l� nh l蝞 m蕋. ")
		end
	end
end;
