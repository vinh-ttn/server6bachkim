-- 雁荡山迷宫 战斗NPC 蜘蛛01（五毒10级任务、拳倾天下任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 10*256+10) then		-- 在任务中，按机率打出（取消机率）。
		AddEventItem(86)			-- 物品蜘蛛
		if (GetItemCount(86) >= 10) then
			Msg2Player("B筺  b総 頲 10 con nh謓 c ")
			AddNote("B筺  b総 頲 10 con nh謓 c ")
		else
			Msg2Player("B総 頲 m閠 con nh謓 c ")
		end
	elseif (GetTask(75) == 10) and (GetTask(52) == 10) and (random(0,99) < 75) then		-- 拳倾天下任务，按机率得到
		AddEventItem(86)
		if (GetItemCount(86) >= 7) then
			Msg2Player("Х b総 頲 7 con nh謓 c,  c� th� quay v�, ph鬾g m筺g ")
		else
			Msg2Player("B総 頲 m閠 con nh謓 c ")
		end
	end
end;
