-- 武夷山迷宫 战斗NPC ？？01（五毒30级任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu >= 30*256+10) and (UTask_wu < 40*256) and (HaveItem(87) == 0) and (random(0,99) < 50) then
		AddEventItem(87)
		if (UTask_wu == 30*256+10) then
			AddNote("Nh薾 頲 M閏 Hng жnh ")
			Msg2Player("Nh薾 頲 M閏 Hng жnh ")
		else
			Msg2Player("Ch� l� M閏 Hng жnh gi� ")
		end
	end
end;
