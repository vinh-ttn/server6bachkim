--description: 天忍教右护法耶律辟离　天忍40级任务
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-14)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4)
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 40*256) and (GetLevel() >= 40) then		-- 40级任务启动
			Say("Theo tin b竜 v�, tr鋘g th莕 Th竔 U� c馻 Tri襲 nh <color=Red>Li謚 K�<color> v鑞 l� gi竛 甶謕 c馻 T鑞g tri襲, tuy 玭g ta  c竜 l穙 h錳 hng, nh璶g c騨g kh玭g th�  玭g ta r阨 kh醝 Kim qu鑓. Tin t鴆 cho bi誸, Li謚 K� chu萵 b� theo 阯g <color=Red>Ki誱 C竎<color> v� T� Xuy猲, ta ph竔 ngi 甶 ti猽 di謙 h緉, nh蕋 nh ph秈 bi課 Ki誱 C竎 Th鬰 Чo th祅h m� ch玭 th﹜ h緉!", 2, "Thu閏 h� tu﹏ m謓h/L40_get_yes", "Thu閏 h� e r籲g kh玭g m nhi謒 n鎖/L40_get_no")
		elseif (UTask_tr == 40*256+20) and (HaveItem(159) == 1) then
			Talk(1,"L40_prise", "Зy l� b鴆 m藅 th� thu閏 h� l蕐 頲 tr猲 ngi Li謚 K�.")
		elseif (UTask_tr >= 10*256) and (UTask_tr < 40*256) then					--尚未接40级任务
			Talk(1,"","Luy謓 binh ngh譶 ng祔, d飊g trong m閠 tr薾, ch� c莕 to祅 t﹎ to祅 � ph鬾g m謓h b鎛 gi竜, b鎛 gi竜 s� kh玭g b筩 i ngi!")
		elseif (UTask_tr > 40*256) and (UTask_tr < 50*256) then					--已经接到40级任务，尚未完成
			Talk(1,"","Tin b竜 <color=Red>Li謚 K�<color>  n <color=Red>T醓 V﹏ чng<color> � Ki誱 C竎 Th鬰 Чo, a h譶h �  r蕋 ph鴆 t筽, ngi c� th� a 輙 ti襫  <color=Red>� Уn Ch�<color> a ngi 甶, h穣 甶 nhanh 甶!")
		else							--已经完成40级任务，尚未出师
			Talk(1,"","Nh鱪g k� ph秐 b閕 b鎛 gi竜, ha ha匱a quy誸 cho b鋘 ch髇g s鑞g kh玭g Л頲!ch誸 c騨g kh玭g xong!")
		end
	elseif (UTask_tr >= 70) then							--已经出师
		Talk(1,"","Ngh� k� ch璦? Mu鑞 � l筰 y, hay Nam h� Trung Nguy猲?")
	else
		Talk(1,"","Ngi l� ai? Ch糿g l� l� gi竛 甶謕 c馻 Trung Nguy猲?")
	end
end;

function L40_get_yes()
	Talk(1,"","Tin b竜 <color=Red>Li謚 K�<color>  n <color=Red>T醓 V﹏ чng<color> � Ki誱 C竎 Th鬰 Чo, a h譶h �  r蕋 ph鴆 t筽, ngi c� th� a 輙 ti襫  <color=Red>� Уn Ch�<color> a ngi 甶, h穣 甶 nhanh 甶!")
	SetTask(4, 40*256+20)
	AddNote("T筰 t莕g th� ba Thi猲 Nh蒼 gi竜 g苝 H鱱 H� Ph竝 Gia Lu藅 T� Li, nh薾 nhi謒 v� h祅h th輈h, n T醓 V﹏ ng th輈h s竧 gian t� Li謚 K� ")
	Msg2Player("T筰 t莕g th� ba Thi猲 Nh蒼 gi竜 g苝 H鱱 H� Ph竝 Gia Lu藅 T� Li, nh薾 nhi謒 v� h祅h th輈h, n T醓 V﹏ ng th輈h s竧 gian t� Li謚 K� ")
end;

function L40_get_no()
	Talk(1,"","Chuy謓 nh� n祔 m� ngi c騨g l祄 kh玭g xong, b鎛 gi竜 nu玦 ngi  l祄 g�?")
end;

function L40_prise()
	Talk(1, "", "L祄 th藅 t鑤! L莕 n祔 ngi  l藀 c玭g l韓, ta nh蕋 nh s� n鉯 t鑤 ngi v韎 Gi竜 ch�!")
	SetRank(59)
	DelItem(159)
	SetTask(4, 50*256)
--	AddMagic(364)
--	AddMagic(146)				-- 五行阵
	add_tr(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! Л頲 phong l�: Chng K� s�! H鋍 頲 v� c玭g Bi T� Thanh Phong. ")
	AddNote("Quay l筰 Thi猲 Nh蒼 Gi竜, a b鴆 m藅 th� cho H鱱 H� Ph竝 Gia Lu藅 T� Li, ho祅 th祅h nhi謒 v� h祅h th輈h. Th╪g c蕄 Chng K� S�. ")
end;
