-- 大理城　路人　崇圣寺虚圆方丈（翠烟门50级任务）
-- by：Dan_Deng(2003-07-27)

function main()
	UTask_cy = GetTask(6)
	if (UTask_cy == 50*256+10) then		--50级任务
		SetTask(6,50*256+32)
		Talk(4,"","Phng trng i s�! ta l�  t� Th髖 Y猲, Chng m玭 b秓 ta n gi髉 qu� t� t譵 l筰 b秓 v藅.","A Di У Ph藅! V藋 l祄 phi襫 Th� ch�! B鋘 c璷韕  tr鑞 v祇 Thi猲 T莔 Th竝.","Th竝 n祔 l� th竛h a c馻 Чi L�, cho n猲  ph遪g ngi kh竎 x﹎ nh藀 v祇 n猲 trong th竝 c� r蕋 nhi襲 ng nh﹏. Khi Th� ch� v祇 b総 t猲 tr閙 c莕 ph秈 c萵 th薾!","Чi s� y猲 t﹎! ")
	elseif (UTask_cy == 50*256+32) and (HaveItem(5) == 1) then		-- 完成
		SetTask(6,50*256+50)
		DelItem(5)
		Talk(3,"","Phng Trng Чi S�! Зy l� V� уng Quan  m� qu� t�  b� m蕋, b﹜ gi� xin 頲 ho祅 tr� l筰.","A Di У Ph藅! B秓 v藅 tr蕁 t�  t譵 l筰 頲, ng l� B� T竧 ph� h�! C秏 琻 Th� ch�! Xin chuy觧 l阨 c秏 琻 n Chng m玭 qu� ph竔.","Чi s� kh玭g n猲 kh竎h s竜!")
		Msg2Player("Giao V� уng Quan  cho H� vi猲 phng trng ")
		AddNote("Giao V� уng Quan  cho H� vi猲 phng trng ")
	elseif (UTask_cy >= 50*256+32) and (UTask_cy < 50*256+50) then		-- 任务过程中
		Talk(1,"","T蕋 c� tr玭g nh� v祇 n� th� ch� ta s� � y c kinh c莡 nguy謓 cho th� ch�.")
	elseif (UTask_cy >= 50*256+50) then						-- 任务完成以后
		Talk(1,"","Xin 產 t� Th� ch�!  c c馻 Th� ch� B鎛 t� kh玭g bi誸 l蕐 g�  c秏 k輈h.")
	else
		Talk(3,"","V� уng Quan  l� m閠 trong nh鱪g S飊g Th竛h Ng� B秓 c馻 b鎛 t�, y l� ni襪 t� h祇 c馻 S飊g Th竛h T� ","Ngi xu蕋 gia sao m� c� l遪g ki猽 ng筼 hi誹 th緉g ch�? ","L阨 gi竜 hu蕁 c馻 th� ch� th藅 khi課 b莕 t╪g ph秈 suy x衪 l筰. A Di У Ph藅, A Di У Ph藅, A Di У Ph藅. ")
	end
end;
