--description: 武当派单思南　武当50级任务
--author: yuanlan
--date: 2003/5/16
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wd = GetTask(5)
	if (GetFaction() == "wudang") and (GetSeries() == 4) then
		if (UTask_wd == 50*256) and (GetLevel() >= 50) then		-- 50级任务启动
			Say("е t� b鎛 ph竔 l蕐 ngh躠 hi謕 h祅h t萿 thi猲 h�. Th﹏ l�  t� V� ng theo l� ph秈 lu玭 l祄 甶襲 thi謓. G莕 y � <color=Red>Thi猲 T﹎ ng<color> xu蕋 hi謓 1 m o ph� ng u l� <color=Red>Thi誸 C竎<color>. Ch髇g chuy猲 cp c馻 gi誸 ngi", 2, "Vi謈 ngh躠 n猲 l祄 /L50_get_yes", "E r籲g kh� c� th� nh薾 nhi謒 v� /L50_get_no")
		elseif (UTask_wd == 50*256+80) then 			-- 50级任务完成
			Talk(2, "L50_prise", "е t�  甧m to祅 b� s� ti襫 l蕐 頲 c馻 b鋘 th� ph� a cho d﹏ ngh蘯.", "L祄 R蕋 t鑤! X鴑g ng l�  t� b鎛 ph竔! ")
		elseif (UTask_wd > 50*256) and (UTask_wd < 50*256+50) then					--50级任务第一节，尚未完成
			Talk(1,"","N琲 萵 n竨 c馻 b鋘 th� ph�  � <color=Red>Thi猲 T﹎ чng<color>, t猲 c莔 u l�<color=Red>Thi誸 C竎<color>. Nh� 甧m to祅 b� <color=Red>ng﹏ lng<color> t苙g cho d﹏ ngh蘯 � <color=Red>Tng Dng<color>. ")
		elseif (UTask_wd >= 50*256+50) and (UTask_wd < 60*256) then					--50级任务第二节，尚未完成
			AddNote("Tr� l筰 Long H� 甶謓 g苝 Кn T� Nam, bi誸 頲 ph秈 甧m to祅 b� ng﹏ lng giao cho ng t萿 ngh蘯 nh蕋 � Th祅h b綾. ")
			Msg2Player("m to祅 b� ng﹏ lng t苙g cho ng t萿 ngh蘯 nh蕋 � th祅h B綾. ")
			Talk(1,"","Nghe n鉯 trong <color=Red>Tng Dng<color> ngi ngh蘯 nh蕋 l� <color=Red>ch� d﹗ ng gia<color>, ngi 甧m <color=Red>to祅 b� ng﹏ lng<color> l蕐 頲 c馻 b鋘 th� ph� t苙g cho ch� ta.")
		else					--已经完成50级任务，尚未出师
			Talk(1,"","Ta b譶h sinh th輈h nh蕋 giao k誸 v韎 nh鱪g ngi c� t譶h c� ngh躠,i gia ra giang h�,h祅h hi謕 trng ngh躠.")
		end
	elseif (UTask_wd >= 70) then									--已经出师
		Talk(1,"","Vi謈 c馻 i ngi, c騨g ng qu� thng c秏, thi猲 h� r閚g l韓  ch�  ta dung th﹏. Hy v鋘g ngi b秓 tr鋘g! ")
	else
		Talk(1,"","Thi猲 h� lo筺 l筩, s鉯 h� h頿 qu莕, g﹜ h鋋 th� nh﹏, g﹜ ra i ho�! Ta l� ngi h鋍 v�, th蕐 c秐h nh� v藋 l祄 sao c� th� ng nh譶, l祄 sao x鴑g ng v韎 hai ch� ' hi謕 ngh躠'!")
	end
end;

function L50_get_yes()
	Talk(1,"","R蕋 t鑤! Nh璶g ng qu猲 甧m <color=Red>ng﹏ lng<color> l蕐 頲 cho l穙 b� t竛h ngh蘯 kh� trong <color=Red>Tng Dng<color>.")
	SetTask(5, 50*256+20)
	AddNote("T筰 甶謓 Long H� V� ng ph竔 g苝 Кn T� Nam, nh薾 nhi謒 v� h祅h thi謓, 甶 ng Thi猲 T﹎ Ph鬰 Ng璾 s琻 v� d﹏ tr� h筰. ")
	Msg2Player("T筰 甶謓 Long H� V� ng ph竔 g苝 Кn T� Nam, nh薾 nhi謒 v� h祅h thi謓, 甶 ng Thi猲 T﹎ Ph鬰 Ng璾 s琻 v� d﹏ tr� h筰. ")
end;

function L50_get_no()
	Talk(1,"","Tr� b筼 cho d﹏ l� tr竎h nhi謒 c馻 ngi h鋍 v�, t筰 sao ngi khc t�?")
end;

function L50_prise()
	SetRank(12)
	SetTask(5, 60*256)
--	AddMagic(157)
	add_wd(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g B筺! B筺  tr� th祅h Chng Kinh Чo Nh﹏! H鋍 頲 v� c玭g To� V鋘g V� Ng� c馻 V� ng ph竔. ")
	AddNote("V� t韎 甶謓 Long H� V� ng ph竔, ph鬰 m謓h Кn T� Nam, ho祅 th祅h nhi謒 v� Nh藅 h祅h nh蕋 thi謓. Tr� th祅h Chng Kinh Чo Nh﹏. ")
end;
