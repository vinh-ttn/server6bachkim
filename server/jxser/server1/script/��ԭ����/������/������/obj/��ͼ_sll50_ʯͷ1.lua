-- 地图物品 少林寺后松林 石头1 少林50级任务
-- by：Dan_Deng(2003-08-04)

function main()
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+30) and (HaveItem(28) == 0) then		--少林50级任务中
		i = GetTaskTemp(47)
		if (i == 2) then
			Talk(1,"","T秐g  d莕 頲 x� d辌h, b筺 h譶h th蕐 ph輆 di h譶h nh� c� 1 quy觧 s竎h")
			AddEventItem(28)
			AddNote("L蕐 頲 D辌h C﹏ Kinh. ")
			Msg2Player("L蕐 頲 D辌h C﹏ Kinh. ")
			SetTaskTemp(47,0)			--复位临时变量，万一再来打...
		elseif (i == 1) then
			Talk(1,"","B筺 th� d飊g s鴆 y t秐g , h議 nh� n� c� ch髏 lay chuy觧")
			SetTaskTemp(47,2)
		else
			Talk(1,"","B筺 th� d飊g s鴆 y t秐g , nh璶g n� c� n籱 tr� tr� ")
			SetTaskTemp(47,1)
		end
	else
		Talk(1,"","B筺 th� d飊g s鴆 y t秐g , nh璶g n� c� n籱 tr� tr� ")
	end
end;
