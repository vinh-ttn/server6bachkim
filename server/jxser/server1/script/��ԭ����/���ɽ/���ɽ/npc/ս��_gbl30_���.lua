-- 蜀冈山 战斗NPC 金兵 丐帮30级任务
-- by：Dan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 30*256+20) then			--30级任务中
		SetTask(8,30*256+30)
		AddNote("Цnh b筰 qu﹏ Kim mai ph鬰, c竎  t� C竔 Bang v鑞 m蕋 t輈h u b� qu﹏ Kim mai ph鬰 b総 甶. ")
		Msg2Player("Цnh b筰 qu﹏ Kim mai ph鬰, c竎  t� C竔 Bang v鑞 m蕋 t輈h u b� qu﹏ Kim mai ph鬰 b総 甶. ")
	end
end;
