-- 丐帮秘洞 宝箱2 出师任务（二楼，两个，对应布袋3）
-- by：Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) then
		if (HaveItem(208) == 0) and (random(0,99) < 50) then
			Msg2Player("B筺 m� chi誧 rng  ra, l蕐 頲 m閠 c竔 t骾 v秈 ")
			AddEventItem(208)
			AddNote("L蕐 頲 chi誧 t骾 th� ba ")
		else
			Msg2Player("Chi誧 rng n祔 kh玭g c� g� ")
		end
	else
		Talk(1,"","B秓 rng n祔  kh鉧 r錳")
	end
end;
