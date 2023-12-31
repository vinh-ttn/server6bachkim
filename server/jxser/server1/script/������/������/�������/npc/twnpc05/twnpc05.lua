--description: 天王帮天护法路云远 天王帮40级任务
--author: yuanlan	
--date: 2003/4/26
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-25), 加入重返门派任务
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 40*256) and (GetLevel() >= 40) then
			Talk(2, "L40_get", "L� l穙 h� ph竝, nh譶 v� m苩 c馻 ngi dng nh� c� chuy謓 g� bu錸 r莡?", "е t� ta Ng� Cng Th輈h m韎 v鮝 r錳 � b猲 h� kh玭g c萵 th薾  b� r緉 X輈h Luy謓 c緉, b﹜ gi� t輓h m筺g nh� ng祅 c﹏ treo s頸 t鉩. Ch蕋 c  lang n l鬰 ph� ng� t筺g r錳, kh玭g th� l祄 g� 頲. Nghe n鉯 <color=Red>Ng� Th莕 Y<color> � <color=Red>Ba L╪g huy謓<color> c� th� c鴘 頲! Ngi....")
		elseif (UTask_tw == 40*256+50) and (HaveItem(93) == 1) and (HaveItem(94) == 1) then
			L40_prise()
		elseif (UTask_tw > 40*256+20) and (UTask_tw < 50*256) then					--已经接到40级任务，尚未完成
			Talk(1,"","Xin 頲 thu鑓 gi秈 r錳 �?")
		elseif (UTask_tw >= 50*256) then					--已经完成40级任务，尚未出师
			Talk(1,"","Ngi kh玭g nh鱪g gi醝 v� c玭g m� t﹎ t輓h l筰 c遪 r蕋 t鑤! Ta th輈h ngi!")
		else										--尚未接40级任务
			Talk(1,"","ng l� Trng Giang s鉵g sau x� s鉵g trc, nh鱪g l穙 gia nh� ch髇g ta kh玭g ph鬰 c騨g kh玭g 頲!")
		end
	elseif (UTask_tw >= 70*256) then							--已经出师
		Talk(1,"","Th阨 th� t筼 anh h飊g, ng祔 nay anh h飊g t� t�, ngi t礽 c� nhi襲, mong ngi sau nay c� th� l祄 頲 m閠 vi謈 g�  kinh thi猲 ng a,  vang danh thi猲 h� ")
	else
		Talk(1,"","B鎛 bang Nam kh竛g Tri謚 T鑞g, B綾 ch鑞g Kim binh. Dng bang ch� th﹏ l� n� nhi m� l筰 l穘h o bang ch髇g ta c� 頲 m閠 c�  l韓 nh� h玬 nay qu� th藅 l� kh玭g n gi秐!")
	end
end;

function L40_get()
	Say("Ngi c� th� n Ba L╪g huy謓 t譵 <color=Red>Ng� Th莕 y<color> xin thu鑓 gi秈 kh玭g?", 2, "Thu閏 h� ng � /L40_get_yes", "Thu閏 h� c� vi謈 kh竎 /L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","T鑤 l緈! Mau 甶 mau v�!")
	SetTask(3, 40*256+20)
	SetTask(14,0)
	AddNote("T筰 Thi猲 Vng i 甶謓 g苝 L� V﹏ Vi詎 ti誴 nh薾 <color=red>nhi謒 v� 甶 t譵 thu鑓 gi秈<color>, 甶 n Ba L╪g huy謓 t譵 Ng� Th莕 y xin thu鑓. ")
	Msg2Player("T筰 Thi猲 Vng i 甶謓 g苝 L� V﹏ Vi詎 ti誴 nh薾 nhi謒 v� 甶 t譵 thu鑓 gi秈, 甶 n Ba L╪g huy謓 t譵 Ng� Th莕 y xin thu鑓. ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","T鑤 qu�! C� nh鱪g dc li謚 n祔 th� Ng� Cng s� 頲 c鴘! Th藅 kh玭g bi誸 ph秈 c秏 琻 ngi th� n祇 y?!")
	DelItem(93)
	DelItem(94)
	SetRank(47)
	SetTask(3, 50*256)
--	AddMagic(40)
	add_tw(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Mang hai v� thu鑓 giao cho L� V﹏ Vi詎, ho祅 th祅h nhi謒 v�, 頲 phong l祄 Thu� Чo th鑞g l躰h. H鋍 頲: 筺 H錸 Th輈h ")
	AddNote("Quay v� i 甶謓 Thi猲 Vng mang hai v� thu鑓 giao cho L� V﹏ Vi詎, ho祅 th祅h nhi謒 v�. Л頲 phong l�: Thu� Чo th鑞g l躰h ")
end;
