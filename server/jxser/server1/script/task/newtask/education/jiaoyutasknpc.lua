-- 新任务系统
-- BY:XIAOYANG(2004-11-29)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
-----------------------------------新手村武师-----------------------------
function education_wushi()
	Uworld1000 = nt_getTask(1000)      -- 新任务系统
	Uworld1065 = nt_getTask(1065)      -- 记录鲜肉数量的变量
	local name = GetName()  
	if ( Uworld1000 == 10 ) and ( Uworld1065 >= 3 ) then   
		Talk(1,"Uworld1000_end1",name.."<#>:  S� ph�! Long th� l躰h b秓 ta n t譵 玭g. Зy l� th辴 ti c馻 玭g.")
	elseif (( Uworld1000 == 20 ) or ( Uworld1000 == 30 )) then  
		Talk(1,"Uworld1000_end1",name.."<#>:  S� ph�! Long th� l躰h b秓 ta n t譵 玭g. Зy l� th辴 ti c馻 玭g.")
	elseif (( Uworld1000 == 10 ) or ( Uworld1000 == 20 ) or ( Uworld1000 == 30 )) and ( Uworld1065 < 3 ) then 
		Talk(1,"","A! Th辴 ti c騨g kh玭g ! B籲g h鱱! Ngi kh玭g c� th祅h � ch髏 n祇. H穣 甶 l蕐 3 mi課g th辴 ti v�.")
	elseif ( Uworld1000 == 180 ) and ( Uworld1065 < 5 ) then
		Talk(1,"","Sao? L筰 qu猲 a th辴 ti cho ta, l蕐  5 mi課g r錳 quay l筰.")
	elseif ( Uworld1000 == 180) or ( Uworld1000 == 190 ) then
		if ( Uworld1000 == 180 and Uworld1065 >= 5 ) then
			Uworld1065 = Uworld1065 - 5
			nt_setTask(1065,Uworld1065)
		elseif ( Uworld1000 == 180 ) then
			Talk(1,"no","Sao? L筰 qu猲 a th辴 ti cho ta, l蕐  5 mi課g r錳 quay l筰.")
		end
			nt_setTask(1000,190) --环节10start
			Talk(10,"Uworld1000_good4",
			name.."<#>:  S� ph�.","Ta kh玭g d竚 nh薾, ta v� ngi kh玭g ph﹏ l韓 nh�. Sao? L筰 甧m th辴 ti n! Ha ha!",name.."<#>:  Long Ng� th藅 s� khi課 ngi t鴆 gi薾.","� �! Th辴 ngon! Th辴 ngon.",name.."<#>:  S� ph�! Con 產ng n鉯 chuy謓 v韎 ngi m� ","Ha ha...Long u Nhi l� ngi th糿g th緉, th藅 ra y v� t鑤 cho ngi m� th玦. Kh玭g gi竜 hu蕁 ngi nghi猰 kh綾 sau n祔 ra giang h� ch誸 kh玭g k辮 bi誸 v� sao ch誸!",name.."<#>:  Nh璶g m� 玭g 蕐 n鉯 n苙g qu�.","V� s�: B筺 tr�, m鋓 chuy謓 n猲 nh辬, ch� c� quy誸 t﹎ luy謓 t藀 nh� kim cang b蕋 ho筰 m韎 c� th� l祄 n猲 i s�.",name.."<#>:  A! Th� ra l� th�.","V� s�: � trong th玭 l﹗ r錳 ch綾 ngi c騨g bu錸. C� mu鑞 k誸 giao v礽 v� b籲g h鱱 kh玭g?",name.."<#>:  Mu鑞 ch�!","H穣 蕁 [F6] m� giao di謓 h秓 h鱱, 蕁 n髏 ph輆 di  t譵 ki誱, ho芻 c� th� ch鋘 t猲 ngi ch琲 xung quanh... Ho芻 c� th� 蕁 [Ctrl] + chu閠 ph秈 tr猲 ngu阨 c馻 i phng, ch鋘: h秓 h鱱")
	else 
		Talk(1,"","Nam b綾 u c� nh鱪g phong t鬰 ri猲g, b筺 ph秈 h鋍 nhi襲 m韎 c� th� t錸 t筰!")
	end
end

-----------------------------------杂货铺老板-----------------------------
function zboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
		if ( Uworld1000 == 120 ) or ( Uworld1000 == 130 ) then
			nt_setTask(1000,130) --环节7start
			Describe(DescLink_ZaHuoPu.."<#>:  B筺 tr� t譵 ta c� vi謈 g�?<enter>"
			..name.."<#>:  Long th� l躰h b秓 ta n g苝 玭g.<enter>A! T猲 ch誸 ti謙  l筰 sai ngi n ph� ta! Ta kh玭g c� g�  d箉 ngi c�!<enter>"
			..name.."<#>:  Sao l� v藋? <enter> M� n祔! Ngi sau n祔 h祅h t萿 giang h� c� th� s� nghe n鉯 n 'Thi猲 Ho祅g Long Kh�...<enter>"
			..name.."<#>:  Thi猲 Ho祅g Long Kh�?<enter> с l� b� 竜 gi竝 th莕 b� do T莕 Th駓 Ho祅g chi猽 t藀 th� r蘮 gi醝 c馻 7 nc l祄 n猲. Nghe n鉯 b猲 trong 萵 ch鴄 b� m藅 r蕋 l韓<enter>"
			..name.."<#>:  H�?<enter> C� th� th� ta kh玭g r�! � ng r錳! Ta c� Th� мa Ph�, sau n祔 khi ngi luy謓 c玭g m謙 m醝 c� th� s� d鬾g n�  l藀 t鴆 quay v� th祅h ho芻 th玭!<enter>"
			..name.."<#>:  C� th� n祔 th藅 t鑤! <enter> T苙g ngi 2 t蕀, n誹 kh玭g t猲 ch誸 ti謙 kia l筰 n鉯 ta 輈h k�! <enter>"
			..name.."<#>:  Ai? �! Long u l躰h h�? <enter>B筺 tr� h穣 c� g緉g nh�!",
			2,"Ta mu鑞 xem b鴆 h鋋  c馻 Thi猲 Ho祅g Long Kh� /Uworld1000_tianhuanglongqi","K誸 th骳 i tho筰/Uworld1000_high7")
		else 
			Talk(1,"","Phi猽 b箃 giang h� ch糿g b籲g � nh� s鑞g nh祅 nh� th� n祔!")
		end
end

------------------------------------药铺老板----------------------------------
function yboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 80 ) or ( Uworld1000 == 90 ) then
		nt_setTask(1000,90) --环节5start
		Talk(9,"Uworld1000_high5","Kh竎h quan c莕 g�?",name.."<#>:  Ta kh玭g c� ti襫, l� Long th� l躰h b秓  ta n t譵 玭g.","Ng� Gia b秓 ngi n �? Ta hi觰 r錳! Th藅 ra ta c騨g kh玭g c� g�  d箉, trc ti猲 t苙g ngi 1 輙 dc dc ph萴, c� l骳 h鱱 d鬾g",name.."<#>:  C秏 琻.","ng kh竎h s竜! N猲 c� g緉g! Bi誸 u sau n祔 ngi s� tr� th祅h m閠 i hi謕, c� ch�  ta nng nh�'",name.."<#>:  g kh竎h s竜 r錳.","Sau n祔 c� thng t藅, b謓h ho筺 g� c� n t譵 ta! N誹 mu鑞 mua s� lng l韓 c� th� 蕁 ph輒 [shift] v� nh蕁 chu閠 ph秈",name.."<#>:  Л頲, ta bi誸 r錳.","Ngi h穣 甶 t譵 th� r蘮 � ") 
	else 
		Talk(1,"","L骳 b� thng nh� u鑞g thu鑓, ph遪g b謓h h琻 ch鱝 b謓h.")
	end
end

------------------------------------铁匠--------------------------------------
function tboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName() 
	 	if ( Uworld1000 == 100 ) or ( Uworld1000 == 110 ) then
			nt_setTask(1000,110) --环节6start
			Talk(11,"Uworld1000_high6"," A! Ngi n r錳!",name.."<#>:  Uhm! Ch輓h t筰 h�!","Mu鑞 mua th� g�?",name.."<#>:  Ta n h醝 th╩ tin t鴆.","Ngi c馻 Ng� Gia?",name.."<#>:  ng v藋.","Ta binh kh� n祇 c騨g c�. Chi誹 theo Ng� h祅h m� ch鋘 binh kh� s� c� th� k輈h ho箃 c竎 thu閏 t輓h 萵",name.."<#>:  V藋 sao!","Ngi nh蕁 [F4]  m� h祅h trang, ti誴 theo nh蕁 [F3]  m� giao di謓 trang b�, 蕁 gi� chu閠 tr竔 k衞 thanh ki誱 v祇 ph莕 giao di謓 trang b� l� c� th� s� d鬾g",name.."<#>:  C竚 琻 玭g.","ng kh竎h s竜! B﹜ gi� 甶 t譵 ch� t筽 h鉧 甶!")
		else
			Talk(1,"","Ngi n猲 mua binh kh� ph遪g th﹏.")
		end
end    

-----------------------------------城市铁匠-----------------------------------
function education_tiejiang()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 380 ) or ( Uworld1000 == 390 ) then
		nt_setTask(1000,390) --环节20start
		Talk(12,"Uworld1000_repair","Th莕 binh t竔 xu蕋, Thi猲 h� s� c祅g h鏽 lo筺.Th阨 i lo筺 l筩 n祔 bao gi� m韎 k誸 th骳 y.",name.."<#>:  Ti猲 sinh, 玭g n鉯 g� v藋?","L� ngi c馻 Ng� Ca ph竔 n?",name.."<#>:  ng v藋.","Thi猲 Ho祅g Long Kh�  t竔 xu蕋 giang h�, kh玭g bi誸 s� m m竨 bao l﹗ n鱝.",name.."<#>:  'Thi猲 Ho祅g Long Kh�' l� c竔 g�?","Sau n祔 ngi s� r�. Ng� Ca c�  1 b� 竜 gi竝 � y, ngi l蕐 甶.",name.."<#>:  C竚 琻 玭g.","Th� n祔 c蕋 trong m藅 th蕋 l﹗ ng祔 n猲  r� s衪, l蕐 ch髏 d莡 lau n� 甶.",name.."<#>:  V藋 l祄 th� n祇?","Sau n祔 n誹 trang b� c馻 ngi b� h�, nh蕁 v祇 ch� s鯽 � di giao di謓 trang b�, sau  nh蕄 v祇 m鉵  ngi mu鑞 s鯽.",name.."<#>:  V藋 ta th� xem")
	elseif ( Uworld1000 == 400 ) or ( Uworld1000 == 410 ) then  --缺少对盔甲是否修理好的判断
		nt_setTask(1000,410) --环节21start
		Talk(9,"Uworld1000_luck1","Th� r蘮: Ph祇,  s鯽 xong r錳.",name.."<#>:  Qu� nhi猲 l� kh竎 h糿!","Ngi th蕐 thu閏 t輓h 萵 tr猲 trang b�  k輈h ho箃 ch璦?",name.."<#>:  Th蕐 r錳, th蕐 r錳...Vi謈 n祔 l� th� n祇, ta kh玭g hi觰 g� c�. Ta kh玭g t譵 th蕐 trang b� k輈h ho箃.","B雐 v� ng� h祅h c馻 trang b� n祔 tng sinh v韎 ng� h祅h c馻 ngi n猲 thu閏 t輓h 萵 th� nh蕋 c馻 trang b� s� t� ng 頲 k輈h ho箃. Kim sinh Th駓, Th駓 sinh M閏, M閏 sinh H醓, H醓 sinh Th�, Th� sinh Kim.",name.."<#>:  T鑤 qu�! Ta  hi觰 r� v� Ng� H祅h r錳.","B﹜ gi� ta s� cho ngi m閠 m鉵 qu� c bi謙.",name.."<#>:      L� g� v藋?","Ta s� cho ngi m閠 tr筺g th竔 c bi謙, m鏸 gi� 頲 10 甶觤 may m緉.")
	else 
		Talk(1,"","Ngi n猲 mua binh kh� ph遪g th﹏.")
	end
end

function Uworld1000_repair() --增加双加过百衣一件
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 390 ) then
		local nItemIdx = 0;
		if ( GetSex() == 0 ) then --金
				if (GetSeries() == 0 ) then
					nItemIdx = AddItem(0,2,0,1,2,255,7);--水衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 1 ) then --木
					nItemIdx = AddItem(0,2,0,1,3,255,7);--火衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 2 ) then --水
					nItemIdx = AddItem(0,2,0,1,1,255,7);--木衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 3 ) then --火
					nItemIdx = AddItem(0,2,0,1,4,255,7);--土衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 4 ) then --土
					nItemIdx = AddItem(0,2,0,1,0,255,7);--金衣
					SetCurDurability(nItemIdx,14)
				end
			else 
				if (GetSeries() == 0 ) then --金
					nItemIdx = AddItem(0,2,9,1,2,255,7);--女水衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 1 ) then --木
					nItemIdx = AddItem(0,2,9,1,3,255,7);--女火衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 2 ) then --水
					nItemIdx = AddItem(0,2,9,1,1,255,7);--女木衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 3 ) then --火
					nItemIdx = AddItem(0,2,9,1,4,255,7);--女土衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 4 ) then --土
					nItemIdx = AddItem(0,2,9,1,0,255,7);--女金衣
					SetCurDurability(nItemIdx,14)
			end
		end
	end
	nt_setTask(1000,400) --环节20end
	Msg2Player("Th� r蘮 a b筺 竜 gi竝  s鯽 xong.")	
end

function Uworld1000_luck1()
	local name = GetName()  
	Talk(4,"Uworld1000_luck2",name.."<#>:      Ngh躠 l� g� v藋?","May m緉 l� l骳 ngi nh nhau v韎 th� d� s� c� kh� n╪g nh苩 頲 trang b� t鑤. 觤 may m緉 cao nh蕋 l� 100. Hi謓 gi� ngi 頲 m閠 gi� may m緉, h穣 c� m� t薾 d鬾g.",name.."<#>:   t�, ta bi誸 r錳."," Л頲 r錳, h穣 quay l筰 g苝 ngi  sai ngi n y, h緉 s� giao 1 b鴆 th� c馻 Ng� Ca cho ngi.")
end

function Uworld1000_luck2()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 410 ) then
	  	AddSkillState(441, 1, 1, 64800)        --增加幸运10一小时的判断
		AddOwnExp(2000)
	end
	nt_setTask(1000,420) --环节21end
	Msg2Player("B筺 nh薾 頲 1 gi� may m緉 c� th� l蕐 nh苩 頲 trang b� t鑤.")
	if  ( curCamp == 0 ) then
		Msg2Player("Th� r蘮 b秓 b筺 c� th� v� Phng Tng t譵 Ng筼 V﹏ T玭g.")
	elseif  ( curCamp == 2 ) then
		Msg2Player("Th� r蘮 b秓 b筺 c� th� 甶 Bi謓 Kinh t譵 Th竎 B箃 Ho礽 Xuy猲.")
	elseif  ( curCamp == 1 )  then
		Msg2Player("Th� r蘮 b秓 b筺 c� th� 甶 L﹎ An t譵 Li評 Nam V﹏.")
	end
end

----------------------------临安钱庄老板----------------------------------------

function education_qianzhuanglaoban()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 360 ) or ( Uworld1000 == 370 ) then
		nt_setTask(1000,370) --环节19start
		Talk(4,"Uworld1000_yinpiao","Ngi l� ngi c馻 Ng� Ca?",name.."<#>:  ng v藋."," M阨 ng錳, n╩ x璦 ch辵 琻 c馻 Ng� Ca, chuy謓 c馻 玭g ta c騨g l� chuy謓 c馻 ta.",name.."<#>:  Th藅 ra Ng� Gia b秓 ta v祇 th祅h d筼.","Ta n鉯 cho ngi bi誸 nh鱪g chuy謓 c莕 l璾 � khi h祅h t萿 giang h�.")
	end
end

---------------------------武林盟传人-----------------------------------------------
function education_wulinmengchuanren()
Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 340 ) or ( Uworld1000 == 350 ) then 
		nt_setTask(1000,350) --环节18start
		Talk(8,"Uworld1000_goon3","Cu鑙 c飊g ngi c騨g n r錳",name.."<#>:  g bi誸 ta s� n?","T筰 h� v鑞 c� th� 畂竛 頲 s� m謓h, nh﹏ duy猲 t礽 l閏...th� sao l筰 kh玭g bi誸!",name.."<#>:  Ti猲 sinh th藅 bi誸 a.","Л頲 r錳, ta s� cho ngi bi誸 m閠 ch髏 v� ph骳 duy猲. Ph骳 duy猲 l� phng th鴆 t輈h l騳 2 gi� ch琲 th� c� th� n 7 th祅h l韓 ho芻 Уo Hoa Nguy猲 t譵 V� L﹎ Truy襫 Nh﹏ nh薾 l穘h. Sau  n Tng Dng t譵 Th莕 B� Thng Nh﹏ d飊g 甶觤 Ph骳 duy猲 i p",name.."<#> �! C� chuy謓  n鱝 sao! Ph莕 thng c� nhi襲 kh玭g?","C遪 ph秈 h醝! Y r蕋 gi祏 c�, giang h� hi誱 c�...",name.."<#>:  V藋 c� h筺 ch� g� kh玭g?");
	end
end

function Uworld1000_tianhuanglongqi()
	Describe("<link=image:\\spr\\Ui3\\新任务系统\\任务图标\\tianhuanglongqi_01.spr>Thi猲 Ho祅g Long Kh�<link>",1,"K誸 th骳/Uworld1000_high7")
end

function Uworld1000_high7()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 130 ) then
		if ( GetSex() == 0 ) then 
			AddItem(0,5,1,1,1,20)         --增加一双鞋子
		elseif ( GetSex() == 1 ) then 
			AddItem(0,5,3,1,1,20)
		end
		AddItem(5,0,0,0,0,0)         --增加两个回城符
		AddItem(5,0,0,0,0,0)
		AddOwnExp(200)
		nt_setTask(1000,140) --环节7end
		Msg2Player("B筺 nh薾 頲 2 t蕀 H錳 Th祅h Ph�.")
		Msg2Player("B筺 nh薾 頲 1 i gi祔.")
		Msg2Player("H穣 quay v� g苝 Long Ng�.")
		seteducationnpcpos()
	end
end

function Uworld1000_high5()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 90 ) then
		for i=1,3 do
			AddItem(1,0,0,2,0,0)                          --增加三瓶红药
		end
		AddOwnExp(200)
		nt_setTask(1000,100) --环节5end
		Msg2Player("B筺 nh薾 頲 3 b譶h H錸g Dc Th駓.")
		Msg2Player("H穣 quay v� i tho筰 v韎 th� r蘮.")
		seteducationnpcpos()
	end
end

function Uworld1000_high6()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 110 ) then
		AddOwnExp(200)
		nt_setTask(1000,120) --环节6end
		Msg2Player("Quay v� i tho筰 v韎 B� ch� ti謒 t筽 h鉧.")
		seteducationnpcpos()
	end
end

function Uworld1000_end1()
	local name = GetName()  
	local Uworld1065 = nt_getTask(1065)
	local Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 10 ) then
		Uworld1065 = Uworld1065-3
		nt_setTask(1065,Uworld1065)
	end
	nt_setTask(1000,30) --环节2start
	Talk(5,"Uworld1000_wuxing","L筰 l� th辴 ti? G莕 y nhi襲 ngi n h鋍 v� v藋. M謙 ch誸 甶 頲!",name.."<#>:  N� nc th� nh�, c莕 ph秈 b竜!","Th藅 kh玭g ng� ngi l筰 c� ch� kh� nh� v藋. Ta d箉 ngi b礽 h鋍 u ti猲: 蕁 ph輒 [V] l� c� th� ng錳 xu鑞g h錳 ph鬰 kh� huy誸. Sau n祔 khi phi猽 b箃 giang h�, h穣 d飊g c竎h n祔  l蕐 l筰 ch髏 h琲 s鴆 gi� 頲 m筺g s鑞g",name.."<#>:   t� s� ph�!"," Dng tng sinh, Ng� H祅h tng kh綾. B﹜ gi� ta s� d箉 ngi 1 b� Ng� H祅h quy襫 ph竝.")
end

function Uworld1000_wuxing()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 30 ) then
		AddOwnExp(350)	
		if ( GetSeries() == 0 ) then
			AddMagic(445)   --金
		elseif ( GetSeries() == 1 ) then
			AddMagic(446) 	--木
		elseif ( GetSeries() == 2 ) then	
			AddMagic(447) 	--水
		elseif ( GetSeries() == 3 ) then
			AddMagic(448) 	--火
		elseif ( GetSeries() == 4 ) then
			AddMagic(449) 	--土
		end
	end
		nt_setTask(1000,40) --环节2end
		seteducationnpcpos()
		Msg2Player("B筺 h鋍 頲 Ng� H祅h quy襫 ph竝.")
		Talk(2,"","B� v� c玭g n祔 ch�  h� th﹏, luy謓 t藀 r蕋 ch薽! Ch� c莕 ngi hi觰 頲 nguy猲 l� 'Sinh kh綾' th� hi謚 qu� kh綾 ch� k� ch s� t╪g g蕄 b閕: Kim kh綾 M閏, M閏 kh綾 Th�, Th� kh綾 Th駓, Th駓 kh綾 H醓, H醓 kh綾 Kim","V� h鋍 l蕐 chuy猲 c莕 luy謓 t藀 l� ch輓h... Ai da! Mi謓g l筰 kh竧 r錳! Th玦 ngi h穣 quay v� t譵 Long u 甶!")
end

function Uworld1000_good4()
	local name = GetName()  
	Talk(9,"Uworld1000_changewuxing",name.."<#>:  �, h鉧 ra l筰 ti謓 l頸 nh� v藋.","Ngi c� th� th� xem r錳 h穣 n t譵 ta.",name.."<#>:  Ta  th� xong.","N誹 ngi mu鑞 ti課 th猰 m閠 bc, c飊g b筺 b� k誸 th祅h huynh  chi giao th� c� th� n Nam Nh筩 tr蕁 t� mi誹, t譵 T躰h цc thi襫 s�!",name.."<#> Л頲! Ta nh� r錳","Tr猲 n蝟 阯g b玭 t萿 Giang h�, c� nhi襲 b籲g h鱱 t鴆 l� c� nhi襲 s� tr� gi髉","Л頲 r錳, ta t苙g ngi 1 b秓 ki誱 c� thu閏 t輓h 萵! v� c� 1 s頸 d﹜ chuy襫 c� thu閏 t輓h, trang b� ch髇g, ngi s� th蕐 頲 hi謚 nghi謒 c馻 Ng� H祅h: thu閏 t輓h 萵 tr猲 ki誱 c馻 ngi s� 頲 k輈h ho箃",name.."<#>:  Qu� nhi猲 l� huy襫 di謚!","Sau n祔 mu鑞 k輈h ho箃 trang b�, 蕁 [F4], th蕐 � di xem � di d遪g m祏 v祅g c馻 d遪g trang b� s� bi誸 thu閏 t輓h c馻 trang b�. B﹜ gi� ngi v� 甶, c� g� kh玭g hi觰 蕁 [F1] ra xem, v� phng di謓 nhi謒 v� th� nh蕁 [F11]")
end

function Uworld1000_changewuxing()
	local name = GetName()  
	Talk(2,"Uworld1000_high9","V� c玭g l莕 trc d箉 ngi ch� th� xem s� nh蒼 n筰 c馻 ngi. B﹜ gi� ta s� d箉 ngi v� c玭g ch輓h t玭g","Ch� c莕 d鵤 theo b� v� c玭g n祔, ch╩ ch� luy謓 t藀. Ng祔 tr� th祅h cao th� s� kh玭g c遪 xa.")
end

function Uworld1000_high9()
	Uworld1000 = nt_getTask(1000)
	local Uworld1067 = nt_getTask(1067)
	local Uworld445 = HaveMagic(445)
	local Uworld446 = HaveMagic(446)
	local Uworld447 = HaveMagic(447)
	local Uworld448 = HaveMagic(448)
	local Uworld449 = HaveMagic(449)
	if ( Uworld1000 == 190 ) then
		if ( GetSex() == 0 ) then 
			if ( GetSeries() == 0 ) then--金
				AddVerItem(4,3,0,0,0,1,3,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,1,1,1,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 1 ) then--木
				AddVerItem(4,3,0,0,0,1,2,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,1,1,0,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 2 ) then--水	
				AddVerItem(4,3,0,0,0,1,4,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,1,1,3,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 3 ) then--火
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,1,1,2,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 4 ) then--土
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,1,1,2,60,2,2,0,0,0,0) --项链  
			end
		else 
			if ( GetSeries() == 0 ) then--金
				AddVerItem(4,3,0,0,0,1,3,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,0,1,1,60,2,2,0,0,0,0) --项链  		
			elseif ( GetSeries() == 1 ) then--木
				AddVerItem(4,3,0,0,0,1,2,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,0,1,0,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 2 ) then--水	
				AddVerItem(4,3,0,0,0,1,4,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,0,1,3,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 3 ) then--火
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,0,1,2,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 4 ) then--土
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,0,1,2,60,2,2,0,0,0,0) --项链  
			end
		end
	end
	if (( Uworld445 ~= -1 ) or ( Uworld446 ~= -1 ) or ( Uworld447 ~= -1 ) or ( Uworld448 ~= -1 ) or ( Uworld449 ~= -1 )) and ( Uworld1067 <  10 ) then
		if ( Uworld445 ~= -1 ) then
			DelMagic(445)
			AddMagic(534,1)
			AddMagicPoint(Uworld445)
		elseif ( Uworld446 ~= -1 ) then
			DelMagic(446)
			AddMagic(535,1)
			AddMagicPoint(Uworld446)
		elseif ( Uworld447 ~= -1 ) then
			DelMagic(447)
			AddMagic(536,1)
			AddMagicPoint(Uworld447)
		elseif ( Uworld448 ~= -1 ) then
			DelMagic(448)
			AddMagic(537,1)
			AddMagicPoint(Uworld448)
		elseif ( Uworld449 ~= -1 ) then
			DelMagic(449)
			AddMagic(538,1)
			AddMagicPoint(Uworld449)
		end
		nt_setTask(1067,10)
	end
	AddOwnExp(800)
	nt_setTask(1000,200) 
	Msg2Player("V� s� hng d蒼 b筺 c竎h t譵 h秓 h鱱, c� th� nh蕁 F1 m� C萴 nang ra xem. B筺 c� th� quay v� g苝 Long Ng�.")
	Msg2Player("B筺 nh薾 頲 1 thanh B秓 ki誱 v� s頸 d﹜ chuy襫, c� th� d飊g d﹜ chuy襫 k輈h ho箃 ki誱.")
	Msg2Player("B筺  h鋍 頲 k� n╪g c玭g k輈h Ng� h祅h.")
	seteducationnpcpos()
end

function Uworld1000_yinpiao()
	local name = GetName()  
	Talk(1,"Uworld1000_get","Ng﹏ phi誹 c騨g tng 琻g v韎 Nguy猲 b秓, c� th� i ra gi� ch琲 ho芻 ti襫 уng. Ngi h穣 甶 t譵 th� r蘮  h醝 th猰")
end

function Uworld1000_get()
	AddOwnExp(5000)
	nt_setTask(1000,380)	--环节19end
	Msg2Player("Ch� ti襫 trang b秓 b筺 n t譵 Th� r蘮 trong th祅h")	
	seteducationnpcpos()
end


function Uworld1000_goon3()
	local name = GetName()  
	Talk(3,"Uworld1000_queding","C� ch�, n筽 th� m韎 c� th� l穘h qu�!",name.."<#>:  Ta hi觰 r錳!","Ngi t� ch蕋 th玭g minh, gi� h穣 n L﹎ An t譵 Ch� ti襫 trang (180, 191) ,g ta s� ch� 甶觤 cho ngi.T譵 Xa phu trong th祅h a ngi 甶.")
end

function Uworld1000_queding()
	AddOwnExp(5000)
	nt_setTask(1000,360) --环节18end 
	Msg2Player("V� L﹎ Truy襫 Nh﹏ b秓 b筺 t譵 Ch� ti襫 trang L﹎ An.")	
	seteducationnpcpos()
end

function no()
end