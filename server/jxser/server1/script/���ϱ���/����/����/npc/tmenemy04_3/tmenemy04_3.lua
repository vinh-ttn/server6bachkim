--description: 唐门怪石阵敌人3 20级任务
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if ((UTask_tm == 20*256+20) and (HaveItem(39) == 0)) then		--没有怪石阵丝帕三
		AddEventItem(39)
		Msg2Player("C� 頲 t蕀 kh╪ l鬭, tr猲 ghi ch� Gi� ")
		AddNote("C� 頲 t蕀 kh╪ l鬭, tr猲 ghi ch� Gi� ")
	end
end;
