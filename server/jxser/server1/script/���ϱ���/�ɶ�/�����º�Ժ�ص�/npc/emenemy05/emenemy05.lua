--description: 峨嵋派 信相寺后院地道敌人
--author: yuanlan	
--date: 2003/3/6
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1);
	if (UTask_em == 50*256+60) and (HaveItem(23) == 1) and (random(0,99) < 30) then							--救出慈海方丈的概率是30%
		Msg2Player("Цnh b筰 t猲 Ph秐 T╪g u m鬰, c鴘 tho竧 phng trng T� H秈, giao Kim tuy課 t� tng Kim Cang kinh cho 玭g ta. ")
		DelItem(23)
		SetTask(1, 50*256+80)
		AddNote("Цnh b筰 t猲 Ph秐 T╪g u m鬰, c鴘 tho竧 phng trng T� H秈, giao Kim tuy課 t� tng Kim Cang kinh cho 玭g ta. ")
	end
end;	
