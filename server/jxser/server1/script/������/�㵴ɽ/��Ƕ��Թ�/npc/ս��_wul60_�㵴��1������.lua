-- 雁荡山羊角洞迷宫 战斗NPC 1代弟子（五毒出师任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if ((UTask_wu == 60*256+10) and (HaveItem(222) == 0)) then		-- 在任务中，尚未得到任务物品
		i = GetTaskTemp(48) + random(0,2)			-- 计数器随机加0到2，加到5即可打大BOSS
		if (i >= 5) then
			SetTask(10,60*256+20)
			SetTaskTemp(48,0)
			AddNote("Chng m玭 c馻 Nh筺 Хng ph竔  xu蕋 hi謓 ")
			Msg2Player("Sau khi ngi gi誸 v� s� t猲, chng m玭 Nh筺 Хng ph竔 cu鑙 c飊g  xu蕋 hi謓 ")
		else
			SetTaskTemp(48,i)
			Msg2Player("B筺 gi誸 頲 m閠 t猲  t� c馻 Nh筺 Хng ph竔 ")
		end
	end
end;
