--description: 武陵山 白水洞敌人3　天王20级任务
--author: yuanlan	
--date: 2003/4/25
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3)
	if (UTask_tw == 20*256+50) then
		UTask_twtmp20 = SetBit(GetTaskTemp(10),3,1)
		SetTaskTemp(10,UTask_twtmp20)
		if (UTask_twtmp20 == 7) then		-- bin: 100 + 010 + 001
			Msg2Player("Цnh b筰 th� ph�, d﹏ ch髇g trong th玭 ph� c薾 t苙g m閠 l� c� g蕀  t� 琻. ")
			AddEventItem(92) 
--			SetTask(3, 28)
			AddNote("T筰 B筩h Th駓 ng V� L╪g s琻, nh b筰 3 t猲 c莔 u b╪g th� ph� m筼 nh薾 Thi猲 Vng bang, 頲 d﹏ ch髇g ph� c薾 t苙g m閠 l� c� g蕀. ")
		end
	end
end;
