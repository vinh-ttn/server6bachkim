-- 点苍山恶霸洞 战斗NPC ？？？01（翠烟门40级任务）
-- by：Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+20) and (HaveItem(197) == 0) and (random(0,100) < 50) then			-- 50%的机率成功
		AddEventItem(197)
		Msg2Player("L蕐 頲 ch譨 kho� уng ")
		AddNote("T譵 頲 ch譨 kho� уng ")
	end
end;
