-------------------------------------------------------------------------
-- FileName		:	zhonglitasknpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-28 14:42:00
-- Desc			:	
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\nexttask.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")

-----------------------------------傅南冰对话--------------------------------
function funanbing()
	Uworld1002 = nt_getTask(1002)  --中立
	local name = GetName()  
	if ( Uworld1002 == 10 ) or ( Uworld1002 == 20 )then 
		nt_setTask(1002,20)
		Describe(name.."<#>: g l� "..DescLink_FuNanBin.."?<enter> Kh玭g sai.<enter>"
				..name.."<#>: Ng� Gia ph竔 ta n, � y c� th� c� b髏 t輈h c馻 玭g ta. <enter> Ngi  t鮪g gi誸 ngi ch璦? <enter>"
				..name.."<#>:......Ch璦 t鮪g.<enter> Th� ngi d鵤 v祇 c竔 g� m� v祇 L﹎ Uy猲 Nhai. Th� ti課 c� c馻 Ng� Ca ch綾 kh玭g . <enter>"
				..name.."<#>: N鉯 甶襲 ki謓 c馻 玭g xem. <enter> Gi誸 ngi! Gi誸 m閠 ngi kh� gi誸. <enter>"
				..name.."<#>: L� ai?<enter> Ninh Tng Qu﹏.<enter>"
				..name.."<#>: Ninh Tng Qu﹏ l� ai? <enter> Чi tng Nam T鑞g, th玭g ch ph秐 qu鑓, t閕 kh玭g th� tha. <enter>"
				..name.."<#>: Цng ch誸! <enter> H緉 g莕 y du ngo筺 � La Ti猽 S琻, kh玭g bi誸 bao gi� v� Doanh tr筰. ьi n h緉 v� trong qu﹏ doanh th� r蕋 kh� kh╪. Ngi ch� c� m閠 c� h閕 duy nh蕋 n祔 th玦. <enter>"
				..name.."<#>: Л頲.<enter>",1,"K誸 th骳 i tho筰/middlefinish1")
	elseif ( Uworld1002 == 40 ) or ( Uworld1002 == 50 ) then
		nt_setTask(1002,50)
		Describe(name.."<#>: H緉 ch誸 r錳. <enter>"..DescLink_FuNanBin.."<#>: Ta bi誸 r錳, ta  xem thng ngi. "
				..name.."<#>. <enter>"..name.."<#>: Kh玭g sao. <enter> Sau n祔 c� vi謈 ta s� t譵 ngi. Ngi h穣 甶 L﹎ An t譵 Li評 Nam V﹏, y s� giao nhi謒 v� cho ngi. <enter>"
				..name.."<#>: ta bi誸 r錳. <enter>",1,"K誸 th骳 i tho筰/middlefinish2")
	elseif (( Uworld1002 == 60 ) or ( Uworld1002 == 70 )) and ( GetLevel() >= 30 ) then
		Talk(1,"middletask","C� g緉g l猲")
	elseif ( Uworld1002 == 90 ) or ( Uworld1002 == 100 ) then
		nt_setTask(1002,100)
		Describe(name.."<#>: H緉 ch誸 r錳. <enter>"..DescLink_FuNanBin.."<#>: Ta  gi誸 頲 L� Thi謓 Tng. <enter>"
				..name.."<#>: H緉 kh玭g nh� ngi, cho n猲 h緉 ch誸. <enter> Л頲, y l� ph莕 thng c馻 ngi, c莔 甶. <enter>"
				..name.."<#>: C竚 琻.<enter> Ta  th蕐 r� n╪g l鵦. S琻 tr筰 c� m閠 k� ho筩h l韓, ta hy v鋘g ngi tham gia. <enter>"
				..name.."<#>:  l� k� ho筩h g�? <enter> Hi謓 v蒼 產ng thu x誴, n l骳 ta s� b竜 cho ngi. <enter>"
				..name.."<#>: Ta ch� hy v鋘g ngi kh玭g g箃 ta. <enter> C� tin g� ta s� b竜 cho ngi. <enter>"
				..name.."<#>: Л頲.<enter>",1,"K誸 th骳 i tho筰/middlefinish3") 
	elseif (( Uworld1002 == 110 ) or ( Uworld1002 == 120 )) and ( GetLevel() >= 40 ) then
		Talk(1,"middletask","C� g緉g l猲")
	elseif (( Uworld1002 == 180 ) or ( Uworld1002 == 190 )) and ( GetLevel() >= 50 ) then
		Talk(1,"middletask","C� g緉g l猲")
	elseif ( Uworld1002 == 180 ) then
		Talk(1,"no","L祄 t鑤 l緈, gi� h穣 ti誴 t鬰 luy謓 c玭g, sau n祔 s� t譵 ngi.")
	elseif ( Uworld1002 == 220 ) or ( Uworld1002 == 230 ) then
		nt_setTask(1002,230)
		Describe(DescLink_FuNanBin.."<#>: Th祅h c玭g r錳?  Ta c騨g bi誸 ngi s� th祅h c玭g.",1,"K誸 th骳 i tho筰/middlefinish7")
	elseif (( Uworld1002 == 240 ) or ( Uworld1002 == 250 )) and ( GetLevel() >= 60 ) then
		Talk(1,"middletask","C� g緉g l猲")
	elseif ( Uworld1002 == 290 ) or ( Uworld1002 == 300 ) then
		nt_setTask(1002,300)
		Describe(DescLink_FuNanBin.."<#>: Th� n祇? <enter>"
			..name.."<#>: M鋓 th� � y. <enter> T鑤 qu�! Ta c騨g bi誸 ngi nh蕋 nh s� th祅h c玭g. <enter>"
			..name.."<#>:......Long Kh� c� , c� th� thay i v薾 m謓h Thi猲 h� sao? <enter> T筰 sao l筰 h醝 v藋? <enter>"
			..name.."<#>: Ta......L遪g ta c� ch髏 nghi v蕁. <enter> Ta c騨g kh玭g bi誸. Ta ch� nghe qua 'Th藀 Long T� Th�, Thi猲 H� Kh雐 мnh, 筺 K� Ch髖 C鑤, T﹏ Ch� Xu蕋 Hi謓'. <enter> Л頲! Trong th阨 gian n祔 c� th� ta s� kh玭g t譵 ngi. Hoa S琻 ph竔 產ng c� m閠 s� v蕁  c莕 ngi gi髉 , ngi h穣 n  甶. V� nh� quay v� t譵 Long Ng� l躰h thng. <enter>",1,"K誸 th骳 i tho筰/middlefinish9")
	else
		Describe(DescLink_FuNanBin.."<#>: Giang h� hi觤 竎, mi ba huynh  gi� ch� c遪 m譶h ta.",1,"K誸 th骳 i tho筰/no")
	end
end

------------------------------------郦秋水对话----------------------------------
function liqiushui()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 130 ) or ( Uworld1002 == 140 ) then
		nt_setTask(1002,140)
		Describe(DescLink_LiQiuShui.."<#>: Ngi l� ai? дn Th髖 Y猲 m玭 v韎 m鬰 ch g�? <enter>"
			..name.."<#>: Ta l� ngi trong h閕, Nam B╪g b秓 ta n t譵 c�. <enter> H�! Ta  n鉯 v韎 h�, kh玭g n猲 t譵 nh鱪g k� v� d鬾g. <enter>"
			..name.."<#>: Ta v鑞 c騨g ch糿g th輈h ng h祅h v韎 c�! <enter> A! Kh玭g ng� ngi c騨g c� t輓h c竎h. <enter>"
			..name.."<#>: Ta s� cho c� th蕐 b秐 l躰h c馻 ta! <enter> N鉯 hay l緈! Kh萿 kh� c騨g kh玭g t�. Ki誱 m玭 c� T� T� L鵦 產ng gi� 1 b秓 v藅. дn  l蕐 n� v� cho ta. <enter>"
			..name.."<#>: L� c竔 g�? <enter> 1 b� 竜 gi竝--B筩h Long T鴆. <enter>"
			..name.."<#>: g ta � u. <enter> Kinh Ho祅g ng. <enter>",1,"K誸 th骳 i tho筰/middlefinish4")
	elseif ( Uworld1002 == 160 ) or ( Uworld1002 == 170 ) then 
		nt_setTask(1002,170)
		Describe(DescLink_LiQiuShui.."<#>: B筩h Long T鴆 l� b秓 kh� trong truy襫 thuy誸. Hay qu�! <enter>"
			..name.."<#>: B秓 Kh�? Ch糿g l� y l� Thi猲 Ho祅g Long Kh�. <enter> Ngi bi誸 Thi猲 Ho祅g Long Kh�? <enter>"
			..name.."<#>: Ta nghe th� r蘮 nh綾 n. <enter> Th� r蘮? Kh玭g ng� tr猲 i n祔 ngi bi誸 chuy謓 n祔 c騨g kh玭g 輙. B籲g h鱱, ta  xem thng ngi. <enter>"
			..name.."<#>: бu v� L﹎ Uy猲 Nhai m� th玦! V� Long Kh�, c� bi誸 頲 bao nhi猽? <enter> Thi猲 Ho祅g Long Kh� v韎 b� m藅 c馻 t� ch鴆 c� li猲 quan, ta ch� c� th� n鉯 v韎 ngi b蕐 nhi猽. <enter> C竔 n祔 l� c馻 ngi, c莔 l蕐 甶. <enter>",1,"K誸 th骳 i tho筰/middlefinish5")
	elseif ( Uworld1002 == 180 ) and ( GetLevel() >= 50 ) then
		Talk(1,"","Ngi mau 甶 t譵 Ph� Nam B╪g, 玭g ta c� nhi謒 v� quan tr鋘g giao cho ngi.")
	else 
		Describe(DescLink_LiQiuShui.."<#>: Ta s鑞g l祄 ngi c馻 Th髖 Y猲 m玭, ch誸 l祄 qu� c馻 Th髖 Y猲 m玭.",1,"K誸 th骳 i tho筰/no")
	end
end

------------------------------------寒江独钓叟-------------------------------------
function hanjiangdudiaosou()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 200 ) or ( Uworld1002 == 210 ) then
		nt_setTask(1002,210)
		Describe(DescLink_HanJiangDuDiaoSou.."<#>: Nh蕋 c竛 nh蕋 l筽 nhi謒 b譶h sinh, nh蕋 giang y猲 ba nh蕋 giang s莡. <enter>"
			..name.."<#>: H祅 L穙 ti襫 b鑙! V穘 b鑙 v蕁 an ngi! <enter> T譵 ta c� vi謈 g�? <enter>"
			..name.."<#>: Dng Bang ch� b秓 ta n h醝 玭g v礽 chuy謓. <enter>  Chuy謓 g�?<enter>"
			..name.."<#>:N╩ x璦 B秓 kh� Long 筺 m蕋 t輈h t筰 Thi猲 Vng Bang, ngi bi誸 tung t輈h c馻 n� kh玭g. <enter>  Chuy謓 n祔  l﹗ r錳, tr� nh� c馻 ta ng祔 c祅g k衜, nh鱪g chuy謓 x璦 kia ta  kh玭g c遪 nh� n鱝.<enter>"
			..name.."<#>:L穙 Ti襫 B鑙! Bang ch�  s韒 甶襲 tra bi誸 玭g 產ng gi� n�! Ta kh玭g mu鑞 l祄 玭g t鎛 thng. <enter> Ha! Ha! Ti課g n v� ngi qu� kh玭g sai. Long 筺 產ng � trong tay ta, xem ngi b秐 l躰h ra sao!<enter>"
			..name.."<#>: Xin 玭g h穣 giao ra. <enter> Nh� n╩ x璦 Chung Dng Nh� Vng tung ho祅h giang чng ёnh h�, binh h飊g tng m筺h, nh thay i th� o t祅 kh鑓 n祔. Nh璶g n cu鑙 c飊g c騨g th蕋 b筰? C� nh鱪g chuy謓 l� � tr阨, � tr阨 kh玭g th� thay i! <enter>"
			..name.."<#>:L穙 Ti襫 B鑙! Chuy謓 sau n祔  sau n祔 h穣 n鉯. B﹜ gi� 玭g giao Long 筺 ra, ta c� th� b秓 m t輓h m筺g c馻 玭g.<enter> Ha ha ha! Ta s鑞g kh玭g bao l﹗ n鱝, c竔 m筺g gi� n祔 th� c� ng g�? <enter>"
			..name.."<#>: g�.!<enter> Mu鑞 Long 筺 th� h穣 n y M� cung чng ёnh h�, ta s� i � !",
			1, "K誸 th骳 i tho筰/middlefinish6")
	elseif ( Uworld1002 >= 220 ) then
		Describe(name.."<#>: H祅 l穙 ti襫 b鑙 xin b秓 tr鋘g, ta v� s� thay 玭g n鉯. <enter>"..DescLink_HanJiangDuDiaoSou.."<#>: Kh玭g c莕 u! B筺 tr� h穣 nh� l蕐: ng祔 n祇 Long Kh� c�  b�, thi猲 h� s� i lo筺. <enter>"
			..name.."<#>: T筰 h� nh� r錳. ", 1, "K誸 th骳 i tho筰/no")
	else
		Describe(DescLink_HanJiangDuDiaoSou.."<#>:  чc c﹗ h祅 giang, t﹎ nh� ch輓h th駓, ung dung t� t筰!",1,"K誸 th骳 i tho筰/no")
	end
end

------------------------------------少林空寂--------------------------------------------
function shaolinkongji()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 260 ) or ( Uworld1002 == 270 ) then
		nt_setTask(1002,270)
		Describe(DescLink_KongJi.."<#>: A Di У Ph藅!  Th� ch� s竧 kh� qu� n苙g. <enter>"
			..name.."<#>: Su鑤 ng祔 ch� bi誸 ch衜 gi誸, 琻g nhi猲 s竧 kh� n苙g r錳! <enter> T筼 nhi襲 nghi謕 竎, Th� ch� ng祔 sau s� b� y xu鑞g a ng鬰 A T�,  kh� 秈 v� bi猲, quay u l� b�. <enter>"
			..name.."<#>: Ta kh玭g th� quay l筰 頲 n鱝. <enter> Ch� c莕 b� 頲 l� c� th� quay u. <enter>"
			..name.."<#>: Ta g箃 頲 m譶h, kh玭g g箃 頲 v筺 d﹏. <enter> B� T竧 s� ph� h� cho k� thi謓 t﹎! A Di У Ph藅! <enter>"
			..name.."<#>: Th莕 T╪g! Чo b蕋 ng b蕋 tng vi m璾, xin giao hai b� Th莕 kh� m� qu� t� 產ng gi�. <enter> H穣 ra c竛h r鮪g � h藆 s琻 Thi誹 L﹎, B莕 T╪g th� gi竜 v礽 chi猽 s� n鉯! <enter>",
			1, "K誸 th骳 i tho筰/middlefinish8")
	elseif ( Uworld1002 >= 290 ) then
		Describe(name.."<#>: Th莕 T╪g, xin c t閕. <enter>"..DescLink_KongJi.."<#>:A Di У Ph藅! Thi謓 竎 u nh s絥, � tr阨 kh� i. Th� ch� 甶 甶, tr猲 i 総 c� nh﹏ qu�. <enter>",1,"K誸 th骳 i tho筰/no")
	else
		Describe(DescLink_KongJi.."<#>: Nh﹏ qu� tr猲 i  nh s絥. A Di У Ph藅!",1,"K誸 th骳 i tho筰/no")
	end
end

--------------------------------------------------------------------------------------------

function no()
end

function middlefinish1()
	DelItem(456)
	AddOwnExp(5000)
	nt_setTask(1002,30)
	Msg2Player("Ph� Nam B╪g b秓 b筺 l猲 La Ti猽 S琻 nh b筰 Ninh Tng Qu﹏.")
end

function middlefinish2()
	AddOwnExp(5000)

	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level20();
	Msg2Player("Ph� Nam B╪g n鉯 sau n祔 s� t譵 b筺.")
	Talk(1,"middletask","C� g緉g l猲")
end

function middlefinish3()
	AddOwnExp(10000)
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level30();
	Msg2Player("Ph� Nam B╪g n鉯 L﹎ Uy猲 Nhai c� m閠 k� ho筩h l韓, sau n祔 s� t譵 b筺!")
	Talk(1,"middletask","C� g緉g l猲")
end

function middlefinish4()
	AddOwnExp(15000)
	nt_setTask(1002,150)
	Msg2Player("L� Thu Th駓 b秓 n Kinh Ho祅g ng nh b筰 T� T� L鵦.")
end

function middlefinish5()
	Uworld1002 = nt_getTask(1002)
	AddOwnExp(20000)
	
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level40();
	Msg2Player("Ph� Nam B╪g gi髉 b筺 t葃 t駓, hi謓 gi� b筺 c� th� thay i 甶觤 k� n╪g. N誹 b筺 kh玭g thu閏 Phe Trung l藀, th� s� kh玭g 頲 t葃 t駓. B筺 c� th� v� t譵 Ph� Nam B╪g.")
end

function middlefinish6()
	AddOwnExp(30000)
	nt_setTask(1002,215)
	Msg2Player("H祅 Giang чc 誹 T萿 b秓 b筺 n M� cung чng ёnh h� t譵 玭g ta!")	
end

function middlefinish7()
	AddOwnExp(40000)
	
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level50();
	Msg2Player("Ph� Nam B╪g n鉯 s� sau n祔 s� t譵 b筺.")
	Talk(1,"middletask","C� g緉g l猲")
end

function middlefinish8()
	AddOwnExp(50000)
	nt_setTask(1002,280)
	Msg2Player("Kh玭g T辌h Th莕 T╪g b秓 n H藆 s琻 Thi誹 L﹎ T� t譵 玭g ta")	
end

function middlefinish9()
	AddOwnExp(40000)
	nt_setTask(1002,310)
	ex_add_zl_level60();
	AddSkillState( 509, 1, 0, 180);
	Msg2Player("Ph� Nam B╪g n鉯 s� 甶 Hoa S琻 l祄 ch髏 chuy謓, sau n祔 c� d辮 g苝 l筰. B筺 quay v� t譵 Long Ng� ")	
end
