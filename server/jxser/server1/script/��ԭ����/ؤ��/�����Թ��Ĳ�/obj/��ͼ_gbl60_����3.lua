-- 丐帮秘洞 宝箱3 出师任务（四楼，两个，对应布袋4、布袋5）
-- by：Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) then
		Msg2Player("M� b秓 rng ra.")
		i = 0
		if ((HaveItem(209) == 0) and (random(0,99) < 40)) then
			AddEventItem(209)
			AddNote("B筺 l蕐 頲 4 chi誧 t骾 v秈 ")
			i = i + 1
		end
		if ((HaveItem(210) == 0) and (random(0,99) < 40)) then
			AddEventItem(210)
			AddNote("B筺 l蕐 頲 5 chi誧 t骾 v秈 ")
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
