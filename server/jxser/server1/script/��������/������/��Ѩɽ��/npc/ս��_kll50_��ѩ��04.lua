-- 冰穴迷宫 战斗NPC ??04（昆仑50级任务）
-- by：Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	x = 4
	if (UTask_kl >= 50*256+64) and (UTask_kl < 60*256) and (GetBit(UTask_kl,x) == 0) then		--50级任务中且未杀过此只雪怪
		i = SetBit(UTask_kl,x,1)
		if (i == 50*256+64+31) then		-- 符合出钥匙条件
			SetTask(9,50*256+127)
			AddNote("Tr猲 阯g 甶 B筺 gi誸 頲 v� s� Tuy誸 qu竔, cu鑙 c飊g t譵 頲 ch� tr� 萵 c馻 qu竔 nh﹏ ")
			Msg2Player("Tr猲 阯g 甶 B筺 gi誸 頲 v� s� Tuy誸 qu竔, cu鑙 c飊g t譵 頲 ch� tr� 萵 c馻 qu竔 nh﹏ ")
		else
			SetTask(9,i)		-- 否则就保存变量
			Msg2Player("B筺 ti課 s﹗ v祇 trong hang ng, tr猲 阯g 甶 gi誸 ch誸 m閠 con Tuy誸 qu竔 ")
		end
	end
end;
