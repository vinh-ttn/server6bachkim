-- 龙门镇 战斗 野猪 新手任务：野猪肉
-- By：Dan_Deng(2003-09-17)

function OnDeath()
	UTask_world27 = GetTask(27)
	if (UTask_world27 == 5) and (random(0,99) < 80) then
		AddEventItem(228)
		if (GetItemCount(228) >= 3) then
			Msg2Player("Khi n祇 ngi l蕐 頲 3 mi課g th辴 heo r鮪g th� m韎 c� th� 甶 ti誴 ")
			AddNote("Khi n祇 ngi l蕐 頲 3 mi課g th辴 heo r鮪g th� m韎 c� th� 甶 ti誴 ")
		else
			Msg2Player("Gi誸 頲 m閠 con heo r鮪g th� b筺 l蕐 頲 m閠 mi課g th辴 ")
		end
	end
end;
