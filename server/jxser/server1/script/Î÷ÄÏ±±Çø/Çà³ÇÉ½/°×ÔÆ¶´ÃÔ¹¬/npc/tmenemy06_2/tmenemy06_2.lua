--description: 唐门30级任务 青城山白云洞绑匪2
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+30) and (HaveItem(98) == 0) and (random(0,99) < 50) then		-- 概率由33%改为50%
		AddEventItem(98)
		Msg2Player("L蕐 頲 ch譨 kh鉧 ")
		AddNote("Цnh b筰 Ph� Ti觰 u M鬰, l蕐 頲 ch譨 kh鉧 ")
	end
end;
