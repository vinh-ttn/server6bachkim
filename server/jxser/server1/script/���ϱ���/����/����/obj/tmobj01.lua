--description: 唐门20级任务 怪石阵石屋门前小石碑
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2);
	if (UTask_tm == 20*256+20) then		-- 20级任务，第一步：打四个字
		if (HaveItem(37) == 1) and (HaveItem(38) == 1) and (HaveItem(39) == 1) and (HaveItem(40) == 1) then
			Talk(9, "", "Cho d� ngi  t譵 頲 4 ch� 'Thi謓 Nh藀 Gi� T�', t筰 sao c遪 d竚 � l筰? Ch糿g l� tr猲 i n祔 c� ngi kh玭g s� ch誸?", "Thi猲 h� kh玭g c� ai kh玭g s� ch誸, nh璶g kh玭g th� g苝 頲 ngi th﹏ ch糿g ph秈 產u kh� h琻 ch誸 sao?", "R鑤 c鬰 ngi l� ai?", "V穘 b鑙 l� е t� Л阯g M玭, n m阨 S� c� tr� v� Л阯g M玭 畂祅 t� v韎 Chng m玭 s� huynh! ", "Ta kh玭g c� huynh trng g� h誸! Ngi th﹏ c馻 ta  ch誸 h誸 r錳! N╩ x璦 l骳 ta b� 畊鎖 kh醝 S� m玭, kh玭g c� ai n鉯 gi髉 ta m閠 l阨 n祇! L骳  ta  th�, i n祔 s� kh玭g bc v祇 Л阯g M玭 n鱝 bc! ", "N誹 S� c� kh玭g c� ch髏 l璾 luy課 v韎 Л阯g M玭, t筰 sao l筰 萵 c� � Tr骳 H秈 h藆 s琻?", "Л阯g U:.....", "S� c�,  nhi襲 n╩ nay, Chng m玭 c� h鑙 ti誧  kh玭g c秐 S� ph� 畊鎖 S� c� ra kh醝 gia m玭, t筰 sao ngi kh玭g cho 玭g ta m閠 c� h閕 b� p? Hu鑞g chi huynh mu閕 t譶h th﹎ h� t蕋 ch� v� m閠 l骳 n鉵g gi薾 m� ﹏ h薾 c� i?", "Ngi kh玭g c莕 nhi襲 l阨! Л頲! Ta cho ngi m閠 c� h閕. N╩  l骳 ta r阨 kh醝 gia m玭. Nh蕋 th阨 v鴗 Kim H筺g khuy猲 c馻 cha t苙g xu鑞g Ph� Th髖 h�. N誹 ngi c� th� t譵 gi髉 ta, ta s� tha th� cho b鋘 h�! ")
   		DelItem(37)	
			DelItem(38)
			DelItem(39)
			DelItem(40)
			SetTask(2, 20*256+40)
			AddNote("Tr猲 bia  trc ph遪g Л阯g U, nh薾 nhi謒 v� 甶 h� Ph� Th髖 t譵 Kim H筺g Quy觧 ")
		else
			Talk(1,"","B筺 kh玭g c� kh萿 quy誸, kh玭g th� th玭g qua bia  n鉯 chuy謓 v韎 Л阯g U.")
			AddNote("� ph輆 trc bia  t筰 V� T﹎ C鑓 bi誸 l� ph秈 t譵 kh萿 quy誸 bia  trong c鑓 trc. ")
		end
	elseif (UTask_tm == 20*256+40) then
		if (HaveItem(41) == 1) then
			Talk(2, "", "S� c�! е t�   t譵 頲 Kim H筺g khuy猲 di Ph� Th髖 h�, S� c� c� th� suy ngh� l筰 kh玭g?", "Ngi a Kim H筺g khuy猲 cho Чi ca ta, th蕐 chi誧 v遪g n祔 s� bi誸 ta  tha th� cho huynh 蕐.")
	  		SetTask(2, 20*256+60)
	  		Msg2Player("Л阯g U l謓h cho b筺 mang Kim H筺g Quy觧 giao cho Л阯g C鮱 chng m玭. ")
  			AddNote("Л阯g U l謓h cho b筺 mang Kim H筺g Quy觧 giao cho Л阯g C鮱 chng m玭. ")
		else								--没有得到或者丢失，金项圈可以反复打
			Talk(1,"","N誹 ngi c� th� t譵 頲 cho ta chi誧 Kim H筺g khuy猲 di Ph� Th髖 h�, ta s� tha th� cho b鋘 h�! ")
		end
	elseif ((UTask_tm == 20*256+60) and (HaveItem(41) == 0)) then		-- 道具丢了
		AddEventItem(41)
		Talk(1,"","Sao ngi nhi襲 chuy謓 th�! в chi誧 v遪g l筰 y! C遪 ngi th� bi課 mau 甶!")
	elseif (UTask_tm >= 30*256) then
		Say("Ta s鑞g thanh t辬h m閠 m譶h quen r錳, kh玭g th輈h ai qu蕐 nhi評! Chuy謓 c� qua r錳, n鉯 nhi襲 v� 輈h, ngi v� 甶!", 0)
	else
		Talk(1,"","Tr猲 bia  c� vi誸: 'Thi謓 Nh藀 Gi�, s竧 v� x�'. Ch� 's竧' vi誸 b籲g m祏 m竨 r蕋 l� c bi謙. ")
	end
end;
