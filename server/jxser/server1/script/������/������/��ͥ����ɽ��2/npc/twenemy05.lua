--description: 天王帮 洞庭湖底第2层水怪　天王50级任务
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3);
	if (UTask_tw == 50*256+20) and (HaveItem(95) == 0) and (random(0,99) < 33) then
		AddEventItem(95)
		Msg2Player("Цnh b筰 th駓 qu竔, l蕐 頲  ng� s綾 tng tr璶g cho h筺h ph骳, b譶h an. ")
--		SetTask(3, 55)
		AddNote("T譵 th蕐 Th駓 qu竔 � t莕g s琻 ng, nh b筰 n� l蕐 頲  Ng� S綾 ")
	end
end;
