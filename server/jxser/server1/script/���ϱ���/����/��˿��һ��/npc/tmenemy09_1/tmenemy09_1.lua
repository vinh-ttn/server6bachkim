--description: 唐门出师任务 竹丝洞第一层怪物
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 60*256+20) and (HaveItem(99) == 0) and (random(0,99) <= 40)) then		--任务中且没有钥匙二时，概率为50%
		AddEventItem(99) 
		Msg2Player("Nh薾 ch譨 kh鉧 th� 2 ")
--		SetTask(2, 64)
		AddNote("T筰 t莕g th� 1 Tr骳 T� чng, nh b筰 g� u l躰h l� m穘g, l蕐 頲 ch譨 kh鉧 v祇 t莕g th� 2. ")
	end
end;
