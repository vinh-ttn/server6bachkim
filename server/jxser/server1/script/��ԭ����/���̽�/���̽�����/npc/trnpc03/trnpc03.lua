--description: 天忍教日月坛主
--author: yuanlan	
--date: 2003/5/18
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4)
	Uworld51 = GetTask(51)
	if (Uworld51 == 50) then		-- 洗清冤屈任务进行中
		Talk(5,"Uworld51_55","B鋘 phng Nam gian tr�, l莕 n祔 m璾 k� ly gi竛 c馻 b鋘 ta c騨g kh玭g k衜. Ha ha, huynh  b鋘 ch髇g tng t祅  l� tuy謙 h鋍 cho ch髇g ta bi誸, Nam tri襲  h誸 nh﹏ t礽, c遪 g� ng s� n鱝?","Nghe n鉯 l莕 trc gi誸 v礽 t猲 Thi誹 L﹎ l祄 b鋘 ch髇g v� Л阯g M玭 l﹎ v祇 kh駈g ho秐g, l莕 n祔 l筰 gi誸 th猰.....鮩, C竔 Bang trc gi� v蒼 ch鑞g i b鋘 ta, l莕 n祔 s� x�  t� C竔 Bang. ng r錳, s� ph鬰 k輈h ch髇g � Ti課 C骳 ng.","Ngi l� ai? дn y l祄 g�?","T筰 h� m韎 n, t nhi猲 g苝 頲 Thi猲 h�  t� cao th� oai phong l蒻 li謙 Nh藅 Nguy謙 Уn Ch�, nh蕋 th阨 k輈h ng. L﹗ r錳 kh玭g g苝 Уn Ch�, ng祔 c祅g th蕐 oai phong.","Ha ha, ha ha, 頲 l緈.")
	elseif (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 20*256) and (GetLevel() >= 20) then
			AddNote("T筰 qu秐g trng Thi猲 Nh蒼 gi竜 g苝 Nh藅 Nguy謙 Уn ch� � H頿 T竧, tr� l阨 c﹗ h醝 c馻 玭g ta. ")
			Msg2Player("T筰 qu秐g trng Thi猲 Nh蒼 gi竜 g苝 Nh藅 Nguy謙 Уn ch� � H頿 T竧, tr� l阨 c﹗ h醝 c馻 玭g ta. ")
			Talk(8,"L20_get_test","蕐 da�..M蕋 h誸 r錳! Kh玭g c遪 m苩 m騣 n祇 n鱝.....","C� chuy謓 g� v藋?","Ta, ta b� 鴆 hi誴 r錳!","� Уn Ch� v� c玭g c竔 th�, ai d竚 鴆 hi誴 ng礽?","L筰 m閠 a tr� n鱝!","M閠 a tr�?","Ta v鮝 g苝 m閠 a tr� � khu r鮪g ph輆 Йng, t猲 ti觰 qu�  h醝 ta m閠 c﹗, nh璶g ta kh玭g c竎h n祇 tr� l阨 頲 n猲  thua n� Nh藅 Nguy謙 Song Lu﹏! Chuy謓 n祔 n誹 b� n ra ngo礽 ch綾 ch緉 s� b� ngi ci ch�. Tuy ta v� c玭g cao cng, nh璶g kh玭g th� l蕐 l筰 頲,l祄 sao c遪 c� th� nh譶 m苩 ai tr猲 giang h� n鱝?","V蕁  l� th� n祇?")
		elseif (UTask_tr == 20*256+10) then 
			L20_get_test()
		elseif (UTask_tr == 20*256+20) then 
			L20_get()
		elseif (UTask_tr == 20*256+80) and (HaveItem(58) == 1 ) then
			L20_prise()
		elseif (UTask_tr == 30*256+20) then	--接到30级任务，要直接切换到秦始皇陵
			Say("Mu鑞 ta a ngi n l╪g T莕 Th駓 Ho祅g kh玭g? Kh玭g v蕁  g�, ch� c莕 500 lng th玦!", 2, "L祄 phi襫 a ta 甶 /L30_deliver_yes", "Ta s� t� 甶! /L30_deliver_no")
		elseif (UTask_tr == 40*256+20) then	--接到40级任务，要直接切换到剑阁中原
			Say("Mu鑞 ta a ngi n l╪g T莕 Th駓 Ho祅g kh玭g? Kh玭g v蕁  g�, ch� c莕 700 lng th玦!", 2, "L祄 phi襫 a ta 甶 /L40_deliver_yes", "Ta s� t� 甶! /L40_deliver_no")
		elseif (UTask_tr >= 20*256+30) and (UTask_tr < 20*256+80) then					--已经接到20级任务，尚未完成
			Talk(1,"","T猲 ti觰 qu�  � <color=Red>c竛h r鮪g ph輆 Йng<color>, phi襫 ngi gi竜 hu蕁 n�!")
		elseif (UTask_tr >= 30*256) then					--已经完成20级任务，尚未出师
			Talk(1,"","Tuy v� c玭g ngi kh玭g b籲g ta, nh璶g n誹 gi髉 ta l蕐 l筰 頲 Nh藅 Nguy謙 Song Lu﹏, ta r蕋 c秏 k輈h!")
		else
			Talk(4, "", "Bi誸 ta l� ai kh玭g? Ta ch輓h l� Thi猲 h�  t� cao th� oai phong l蒻 li謙 � H頿 T竧!", "Thi猲 h�  t� th玦 sao?", "ng,  nh蕋 ch輓h l� Gi竜 ch�, ngo礽 Gi竜 ch�, Gia Lu藅 T� Ly v� an M閏 Du� ra, v� c玭g c馻 ta l� l頸 h筰 nh蕋! Th� n祇? Ngi c� ph鬰 kh玭g? N誹 kh玭g ph鬰 ta s� cho ngi n誱 s� l頸 h筰 c馻 Nh藅 Nguy謙 Song Lu﹏!", "Л頲 r錳! Л頲 r錳!")
		end
	elseif (GetTask(30) == 5) then		--接到禹王剑任务，要直接切换到华山
		Say("Mu鑞 ta a ngi n l╪g T莕 Th駓 Ho祅g kh玭g? Kh玭g v蕁  g�, ch� c莕 500 lng th玦!", 2, "L祄 phi襫 a ta 甶 /W30_deliver_yes", "Ta s� t� 甶! /W30_deliver_no")
	elseif (UTask_tr >= 70*256) then							--已经出师
		Talk(1,"","Ngi mu鑞 甶 �? Ta s� nh� ngi y, huhuhu�.")
	else
		Talk(4, "", "Bi誸 ta l� ai kh玭g? Ta ch輓h l� Thi猲 h�  t� cao th� oai phong l蒻 li謙 � H頿 T竧!", "Thi猲 h�  t� th玦 sao?", "ng,  nh蕋 ch輓h l� Gi竜 ch�, ngo礽 Gi竜 ch�, Gia Lu藅 T� Ly v� an M閏 Du� ra, v� c玭g c馻 ta l� l頸 h筰 nh蕋! Th� n祇? Ngi c� ph鬰 kh玭g? N誹 kh玭g ph鬰 ta s� cho ngi n誱 s� l頸 h筰 c馻 Nh藅 Nguy謙 Song Lu﹏!", "Л頲 r錳! Л頲 r錳!")
	end
end;

function L20_get_test()
	Say("C� m閠 con tr﹗ � hng B綾, trc ti猲 quay v� ph輆 ph秈 3 v遪g, r錳 quay ra ph輆 sau 3 v遪g, sau  l筰 quay v� ph輆 ph秈, v藋 l骳 n祔 畊玦 c馻 n� � hng n祇?", 5, "Hng ng /L20_get_fail", "Hng nam /L20_get_fail", "Hng t﹜ /L20_get_fail", "Hng B綾 /L20_get_fail", "Hng xu鑞g t /L20_get_pre")
end;

function L20_get_fail()
	SetTask(4, 20*256+10)
	Talk(1,"","V藋 l� ngi c騨g kh玭g bi誸 �, th藅 l� ng鑓!")
end;

function L20_get_pre()
	SetTask(4,20*256+20)
	Talk(2, "L20_get", "Ha ha ha, c﹗  n祔 th藅 n gi秐! B蕋 k� c竔 u hng v� hng n祇, th� c竔 畊玦 c騨g hng xu鑞g t th玦!", "! Ngi th藅 th玭g minh! V藋 ngi gi髉 ta 甶 gi竜 hu蕁 t猲 nh鉩 蕐, l蕐 <color=Red>Nh藅 Nguy謙 Song Lu﹏<color> gi髉 ta.")
end;

function L20_get()
	Say("Xem nh� ta c莡 xin ngi y, ngi c� gi髉 kh玭g?", 2, "Л頲,  ta th� /L20_get_yes", "Ta c遪 c� vi謈 kh竎. /L20_get_no")
end;

function L20_get_yes()
	Talk(1,"","T鑤 qu�! T猲 nh鉩  � <color=Red>c竛h r鮪g ph輆 Йng<color>, h穣 thay ta gi竜 hu蕁 n�!")
	SetTask(4, 20*256+30)
	AddNote("Nh薾 nhi謒 v� 'a tr� th玭g minh': T譵 a tr� l蕐 l筰 c苝 Nh藅 Nguy謙 Song Lu﹏ cho � H頿 T竧. ")
	Msg2Player("Nh薾 nhi謒 v� 'a tr� th玭g minh': T譵 a tr� l蕐 l筰 c苝 Nh藅 Nguy謙 Song Lu﹏ cho � H頿 T竧. ")
end;

function L20_get_no()
	Talk(1,"","N誹 ngi kh玭g gi髉 ta, ta bi誸 t譵 ai y, huhuhu�..")
end;

function L20_prise()
	Talk(1,"","Ngi gi髉 ta l蕐 l筰 Nh藅 Nguy謙 Song Lu﹏, th藅 ng l� ﹏ nh﹏ c鴘 m筺g c馻 ta! Kh玭g, kh玭g, ngi l� ph� m蓇 t竔 sinh c馻 ta!")
	SetRank(57)
	DelItem(58)
	SetTask(4, 30*256)
--	AddMagic(137)
	add_tr(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("B筺 頲 th╪g c蕄 Thi猲 Nh蒼 T� S�! H鋍 頲 v� c玭g 秓 秐h Phi H�. ")
	AddNote("Лa c苝 Nh藅 Nguy謙 Song Lu﹏ cho Nh藅 Nguy謙 Уn ch� � H頿 T竧, ho祅 th祅h nhi謒 v� a tr� th玭g minh. Th╪g c蕄 T� S�. ")
end;

function W30_deliver_yes()		--禹王剑任务，要直接切换到华山
	if (GetCash() >= 300) then
		Pay(300)
		NewWorld(2, 2288, 4091)
	else
		Talk(1,"","Kh玭g ti襫 b筩 n祇 c� th� mua 頲 ta, Thi猲 h�  t� cao th� oai phong l蒻 li謙 Nh藅 Nguy謙 Уn Ch� � H頿 T竧.")
	end
end;

function W30_deliver_no()
	Talk(1,"","Ch髏 ti襫 th� n祔 th� mua 頲 g�?")
end;

function L30_deliver_yes()	--天忍30级任务，要直接切换到秦始皇陵
	if (GetCash() >= 500) then
		Pay(500)
		NewWorld(7, 2235, 2847)
	else
		Talk(1,"","Ai c騨g bi誸, kh玭g ti襫 b筩 n祇 c� th� mua 頲 ta, Thi猲 h�  t� cao th� oai phong l蒻 li謙 Nh藅 Nguy謙 Уn Ch� � H頿 S竧.")
	end
end;

function L30_deliver_no()
	Talk(1,"","Х nghe qua c﹗ ph� t礽 ti猽 tai ch璦? Ch髏 ti襫 th� n祔 th� mua 頲 g�? C萵 th薾 k蝟 m蕋 m筺g tr猲 阯g y!")
end;

function L40_deliver_yes()	--40级任务，要直接切换到剑阁中原
	if (GetCash() >= 700) then
		Pay(700)
		NewWorld(43, 1695, 3200)
	else
		Talk(1,"","Ai c騨g bi誸, kh玭g ti襫 b筩 n祇 c� th� mua 頲 ta, Thi猲 h�  t� cao th� oai phong l蒻 li謙 Nh藅 Nguy謙 Уn Ch� � H頿 S竧.")
	end
end;

function L40_deliver_no()
	Talk(1,""," 阯g c萵 th薾 nh�, ha ha!")
end;

----------------------- 世界任务 --------------------------
function Uworld51_55()
	SetTask(51,55)
	Msg2Player("Nghe l衝 � H頿 T竧 t� n鉯 chuy謓. Chuy謓 n祔 qu� nhi猲 l� do Thi猲 Nh蒼 gi竜 l祄. Nhanh ch鉵g quay l筰 b竜 c竜 tin t鴆. ")
end
