-- 丐帮秘洞 宝箱1 出师任务（一楼，一个，对应布袋1、布袋2）
-- by：Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(203) == 1) then
		Msg2Player("B筺 th� d飊gch譨 kh鉧m� chi誧 rng ")
		DelItem(203)
		i = 0
		if ((HaveItem(211) == 0) and (random(0,99) < 60)) then
			AddEventItem(211)
			AddNote("L蕐 頲 chi誧 t骾 th� nh蕋 ")
			i = i + 1
		end
		if ((HaveItem(201) == 0) and (random(0,99) < 60)) then
			AddEventItem(201)
			AddNote("L蕐 頲 chi誧 t骾 th� hai ")
			i = i + 1
		end
		if (i == 2) then
			Msg2Player("B筺 l蕐 頲 2 chi誧 t骾 v秈 ")			
		elseif (i == 1) then
			Msg2Player("B筺 l蕐 頲 m閠 chi誧 t骾 v秈 ")			
		else
			Msg2Player("B筺 th蕋 v鋘g v� chi誧 rng n祔 tr鑞g r鏽g.")
		end
	else
		Talk(1,"","B秓 rng n祔  kh鉧 r錳")
	end
end;
