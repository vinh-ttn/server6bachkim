-- 五毒金蛇血潭迷宫 战斗NPC 眼镜王蟒蛇01（五毒40级任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 40*256+10) and (HaveItem(143) == 0) and (random(0,99) < 60) then		-- 在任务中，按机率打出。
		if (HaveItem(142) == 1) then
			if (random(0,99) < 60) then
				AddEventItem(143)
				DelItem(142)
				AddNote("B総 l蕐 Nh穘 K輓h vng M穘g X� ")
				Msg2Player("B筺 l筰 d飊g X� hng  kh鑞g ch� n�, v� cu鑙 c飊g c騨g  b総 頲 ")
			else
				Msg2Player("B筺 th� d飊g X� hng  b総 Nh穘 K輓h vng M穘g X�, v�  kh玭g c萵 th薾  n� ch箉 tho竧 ")
			end
		else
			Msg2Player("K辌h c c馻 Nh穘 K輓h vng M穘g X� kh玭g c� th� n祇 s竛h 頲. B筺 kh玭g c� th� X� hng  kh綾 ch� n� th� v� phng b総 頲 n� ")
		end
	end
end;
