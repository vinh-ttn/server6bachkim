-- 罗宵山迷宫 战斗NPC 色鬼01（五毒20级任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	i = GetItemCount("u ngi  ")
	if (UTask_wu == 20*256+10) and (i < 7) and (random(0,99) < 80) then		-- 在任务中，按机率打出。
		AddEventItem(85)
		if (i >= 6) then
			Msg2Player("B筺 gi誸 頲 La Ti猽 th蕋 qu�, l蕐  7 c竔 u ")
			AddNote("B筺 gi誸 頲 La Ti猽 th蕋 qu�, l蕐  7 c竔 u, giao cho B筩h Doanh Doanh ")
		else
			Msg2Player("Nh薾 頲 m閠 c竔 u ngi ")
		end
	end
end;
