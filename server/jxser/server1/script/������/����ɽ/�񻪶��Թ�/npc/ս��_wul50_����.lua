-- 武夷山玉华洞迷宫 战斗NPC 流寇01（五毒50级任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 50*256+10) then
		SetTask(10,50*256+20)
		AddNote("L筰 甶 l猲 n骾 La Ti猽  nh b筰 b鋘 cng o, l蕐 l筰 Ng鋍 San H� ")
		Msg2Player("B総 頲 t猲 u l躰h, m韎 bi誸 頲 l� Ng鋍 San H�  b� b鋘 cng o V� Di s琻 cp 甶, ch髇g v� b鋘 cp � La Ti猽 c� quan h� v韎 nhau ")
	end
end;
