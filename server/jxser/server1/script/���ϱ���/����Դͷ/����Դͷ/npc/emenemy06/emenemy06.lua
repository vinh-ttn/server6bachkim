--description: 峨嵋派长江源头清和
--author: yuanlan	
--date: 2003/3/6
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1);
	if ((UTask_em == 60*256+50) and (HaveItem(24) == 0) and (random(0,99) < 20)) then		--任务中，并且没有烟玉指环，则有20%机率
		AddEventItem(24) 
--		SetTask(1, 68)
		AddNote("Цnh b筰 ph秐  Thanh H遖, l蕐 l筰 Y猲 Ng鋍 Ch� Ho祅 ")
		Msg2Player("Цnh b筰 ph秐  Thanh H遖, l蕐 l筰 Y猲 Ng鋍 Ch� Ho祅 ")
	end
end;	
