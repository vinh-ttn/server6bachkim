-- 点苍山 战斗NPC 土匪（翠烟门30级任务）
-- by：Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 30*256+20) and (random(0,100) < 50) then				-- 30级任务中，50%机率
		SetTask(6,30*256+30)
		AddNote("Х c鴘 ch竨 g竔 c馻 筺 Hoa N玭g t� tay t猲 th� ph� � 觤 Hng s琻. ")
		Msg2Player("Х c鴘 ch竨 g竔 c馻 筺 Hoa N玭g t� tay t猲 th� ph� � 觤 Hng s琻. ")
	end
end;
