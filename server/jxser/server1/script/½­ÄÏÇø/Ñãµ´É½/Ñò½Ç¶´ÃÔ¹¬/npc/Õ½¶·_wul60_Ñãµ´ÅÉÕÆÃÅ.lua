-- 雁荡山羊角洞迷宫 战斗NPC 大BOSS01（五毒出师任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 60*256+20) and (HaveItem(222) == 0) and (random(0,99) < 50) then
		AddEventItem(222)
		AddNote("B筺 nh b筰 頲 t猲 u l躰h c馻 Nh筺 Хng ph竔, l蕐 l筰 T� чc Chu cho Ng� чc Gi竜 ")
		Msg2Player("B筺 nh b筰 頲 t猲 u l躰h c馻 Nh筺 Хng ph竔, l蕐 l筰 T� чc Chu cho Ng� чc Gi竜 ")
	end
end;
