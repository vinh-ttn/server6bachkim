-------------------------------------------------------------------------
-- FileName		:	nexttask.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 21:46:30
-- Desc			:	新任务系统正派，中立主线下一个任务的触发
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")

-----------------------------------------正派主线---------------------------------
function mastertask()
	Uworld1001 = nt_getTask(1001)
	name = GetName()
	if (( Uworld1001 == 60 ) or ( Uworld1001 == 70 )) and ( GetLevel() >= 30 ) then
		nt_setTask(1001,70)
		Describe(DescLink_MoChou.."<#>: L﹗ ng祔 kh玭g g苝, ta nghe n鉯 ngi tr猲 giang h� c騨g c� ch髏 th祅h t鵸. <enter>"
				..name.."<#>: A! L� M筩 S莡 <enter>M蕐 ng祔 nay ta r蕋 b薾 甶襲 tra tung t輈h c馻 'Thi猲 Ho祅g Long Kh�', cu鑙 c飊g c騨g t譵 頲. <enter>"
				..name.."<#>: Mu鑞 ta l祄 chuy謓 g�? <enter> T輓 Tng T� � Th祅h Й g莕 y c� nhi襲 kh竎h h祅h hng, trong  c� ngi t猲 C玭g T� Ti誹. Theo s� 甶襲 tra c馻 ta,h緉 ch輓h l� C玭g t� Ti誹 n鎖 danh n╩ x璦 � Ba Th鬰. Ngi n祔 r蕋 gi祏 c� v� ph鉵g kho竛g,th� h� m玭  h琻 ng祅 ngi, n╩  頲 T� C玭g T� di phong. <enter>C� m閠 n╩, trong v遪g m閠 th竛g y  c莔 c� h誸 gia s秐, g莕 y t nhi猲 xu蕋 hi謓 �  T輓 Tng T�, nghe n鉯 l�  ni謒 kinh si猽  cho cho ngi v� qu� c�. Th竚 t� c馻 ta h錳 b竜, m蕐 n╩ nay C玭g T� Ti誹 h緉 thu th藀 Thi猲 Ho祅g Long Kh�, trong  H� Uy觧Ho祅g Kim L﹏ 產ng n籱 trong tay h緉. <enter>"
				..name.."<#>: L筰 c� chuy謓 nh� th� �? <enter>C玭g T� Ti誹 l� ngi trng ngh躠. L莕 n祔 ngi 甶 kh玭g th� d飊g s鴆 cng 衟. N誹 nh� huynh 蕐 m閠 m鵦 c� tuy謙 th� quay l筰 t譵 c竎h kh竎. <enter>",
				1, "K誸 th骳 i tho筰/taskfinish1") 
	elseif (( Uworld1001 == 130 ) or ( Uworld1001 == 140 )) and ( GetLevel() >= 40 ) then
		nt_setTask(1001,140)
		Describe(DescLink_MoChou.."<#>: Ai da! Kh玭g bi誸 n猲 n鉯 th� n祇 v韎 ngi. <enter>"
				..name.."<#>: Th� n祇 r錳 M筩 S莡 c� nng? C� g� xin c� n鉯.<enter> Зy l� ng祔 cu鑙 c飊g nh chim 璶g, l筰 b� n� l祄 m� m総. <enter>"
				..name.."<#>: L﹗ ng祔 kh玭g g苝 ngi l筰 � r� nh� th�. <enter>B猲 trong T莔 Long H閕 c� m閠 m筺g li t譶h b竜 ph鴆 t筽 c� v飊g Dng Ch﹗ do H� V� Th� ph� tr竎h. <enter>"
				..name.."<#>: Ch糿g l� h緉  x秠 ra chuy謓 g�? <enter>Kh玭g sai.<enter>G莕 y nh薾 頲 tin 'C鰑 Hi謓 Chi Ch�' trong 'Thi猲 Ho祅g Long Kh�'  xu蕋 hi謓 � Dng Ch﹗. Nh璶g H� V� Th� kh玭g b竜 l筰, ch� n鉯 kh玭g c� manh m鑙, v韎 n╪g l鵦 c馻 h緉 th藅 ng nghi ng�. <enter>"
				..name.."<#>: C� mu鑞 ta l祄 th� n祇? <enter> Dng Ch﹗, 甶襲 tra ch﹏ tng y l� L謓h b礽 c馻 ta, th蕐 L謓h b礽 nh� th蕐 ngi. <enter>",
				1,"K誸 th骳 i tho筰/taskfinish3") 
	elseif (( Uworld1001 == 200 ) or ( Uworld1001 == 210 )) and ( GetLevel() >= 50 ) then
		nt_setTask(1001,210)
		Describe(DescLink_MoQiaoEr.."<#>: Чi s� ch糿g l祅h!<enter>"
				..name.."<#>: Th� n祇 r錳? <enter> T� t� ta b� m閠 H綾 Y nh﹏ b総 甶. <enter>"
				..name.."<#>: C竔 g�! T� t� ngi sao l筰 b� ngi ta ph竧 hi謓? <enter> Ta c騨g kh玭g bi誸,b﹜ gi� trong u ta r蕋 b鑙 r鑙. Cho n猲 m韎 n t譵 i hi謕. <enter>"
				..name.."<#>: V藋 H綾 Y nh﹏  c� c 甶觤 g�? Ho芻 l� c�  l筰 d蕌 v誸 g� kh玭g.<enter> H緉 cao to tr玭g r蕋 khi誴, ch� m閠 chi猽  kh鑞g ch� 頲 M筩 t�. L骳 ta ch箉 n ch� c遪 th蕐 c竔 b鉵g 竜 甧n m� th玦. <enter>"
				..name.."<#>: T� l骳 n祇 tr猲 giang h� l筰 xu蕋 hi謓 1 m cao th� v藋? Chuy謓 n祔 qu� nhi猲 kh玭g n gi秐, c� th� li猲 quan n Thi猲 Ho祅g Long Kh�. <enter> ng v藋! Ta v閕 qu� qu猲 cho ngi bi誸 Ho祅g Kim L﹏ v� C鰑 Hi謓 Chi Ch� u  m蕋 t輈h. <enter>"..name..": Vi謈 n祔 qu� t ng閠, kh玭g ch髏 manh m鑙, nh蕋 th阨 kh玭g bi誸 u tra t� u.C� nh� l筰 xem, T� t� c� trc khi b� b総 甶 c� n鉯 qua g� kh玭g.<enter> ng r錳,T� t� t鮪g n鉯,n誹 nh� t� m蕋 t輈h, th� n L﹎ An t譵  M筺h Ph祄. <enter>"
				..name.."<#>: C� manh m鑙 n祔 qu� l� r蕋 t鑤. C� ch� � y, ta s� 甶 t譵 h緉. <enter> Л頲.<enter>",
				1,"K誸 th骳 i tho筰/taskfinish5")
	elseif (( Uworld1001 == 270 ) or ( Uworld1001 == 280 )) and ( GetLevel() >= 60 ) then
		nt_setTask(1001,280)
		Describe(DescLink_MengFan.."<#>: Ta  th竚 th輓h 頲 tung t輈h c馻 S莡 nhi.<enter>"
				..name.."<#>: � u?<enter>l� 1 n琲 kh玭g th� n祇 tin 頲.<enter>"
				..name.."<#>:......<enter>M藅 o Nha M玭 Tng Dng!<enter>"
				..name.."<#>: C竔 g�? � ch� Quan ph� �? Ch糿g l� Tri襲 nh c騨g c� li猲 quan.<enter>Vi謈 n祔 ta c騨g kh玭g bi誸. Ta bi誸 頲 tung t輈h c馻 Long Kh� xu蕋 hi謓 b猲 h� B� Dng, ph秈 qua b猲  xem m韎 頲. Ngi h穣 n Tng Dng t飝 c� h祅h ng!<enter>"
				..name.."<#>:M筺h Чi th骳 玭g y猲 t﹎! Ta s� c� c竎h.<enter> Th� ngi 甶 u?<enter>",
				1,"K誸 th骳 i tho筰/taskfinish9")
	end 
end 

function taskfinish1()
		AddOwnExp(10000)
		nt_setTask(1001,80)
		Msg2Player("M筩 S莡 b秓 b筺 甶 Th祅h Й T輓 Tng T� t譵 C玭g T� Ti誹 甶襲 tra tung t輈h c馻 Ho祅g Kim L﹏.")
end

function taskfinish3()
		AddOwnExp(15000)
		nt_setTask(1001,150)
		Msg2Player("M筩 S莡 b秓 b筺 甶 Dng Ch﹗ t譵  H� V� Th� 甶襲 tra tung t輈h c馻 C鰑 Hi謓 Chi Ch�.")
end

function taskfinish5()
		AddOwnExp(30000)
		nt_setTask(1001,220)
		Msg2Player("M筩 X秓 Nhi b秓 b筺 甶 L﹎ An t譵  M筺h Ph祄, 玭g ta bi誸 tung t輈h c馻 M筩 S莡.")
end

function taskfinish9()
		AddOwnExp(50000)
		nt_setTask(1001,290)
		Msg2Player("M筺h Ph祄 b秓 b筺 甶 M藅 o Tng Dng, M筩 S莡 b� 1 ngi th莕 b� b総 n .")
end

-------------------------------------中立主线----------------------------------------------

function middletask()
	Uworld1002 = nt_getTask(1002)
	name = GetName()
	if (( Uworld1002 == 60 ) or ( Uworld1002 == 70 )) and ( GetLevel() >= 30 ) then
		nt_setTask(1002,70)
		Describe(DescLink_FuNanBin.."<#>: Ch� m韎 m閠 th阨 gian ng緉 nh璶g b秐 l躰h c馻 b筺  t� ra vt tr閕. <enter>"..name..": C� tin t鴆 g�? <enter> Tr猲 giang h� c� 3 ngi kh玭g th� gi誸. <enter>"..name..": Ba ngi n祇? <enter>Nh筩 V� M鬰, l� V� th竛h nh﹏, d﹏ ch髇g b竔 Ph鬰, kh玭g th� gi誸 頲. <enter>V� L﹎ Minh Ch� чc C� Ki誱, m閠 ki誱 trong tay, tung ho祅h thi猲 h�. <enter>L� Thi謓 Tng, v� c玭g c竔 th�. <enter>"..name..": Hai ngi trc ta kh玭g ng n. <enter> Ta mu鑞 ngi 甶 khu蕋 ph鬰 L� Thi謓 tng. T猲 n祔 l祄 nhi襲 chuy謓 竎, c� ngi b� s� ti襫 l韓 mua m筺g h緉. <enter>"..name..": � u? L骳 n祇?<enter> Kho竔 Ho箃 L﹎, n閕 trong 10 ng祔. <enter>"..name..": Ngi ch� c� m閠 c� h閕 duy nh蕋! <enter> C遪 m筺g th� quay v� g苝 ta. <enter>",1,"K誸 th骳 i tho筰/middlegoon1")
	elseif (( Uworld1002 == 110 ) or ( Uworld1002 == 120 )) and ( GetLevel() >= 40 ) then
		nt_setTask(1002,120)
		Describe(DescLink_FuNanBin.."<#>: Th阨 c� n r錳! <enter>"..name..": Th阨 c� g�?<enter> L﹎ Uy猲 Nhai  b総 u h祅h ng. <enter>"..name..": g n鉯 r� ch髏 甶. <enter> Tin t鴆 trong L﹎ Uy猲 Nhai u l� li猲 l筩 m閠 chi襲, ta ch� bi誸  b秓 ngi 甶 Th髖 Y猲 m玭 t譵 Чi s� t� L� Thu Th駓. C� ta s� ch�  cho ngi bc ti誴 theo. <enter>"..name..": Th髖 Y猲 m玭? <enter> ng, s鴆 m筺h ch� y誹 c馻 L﹎ Uy猲 Nhai l� do tinh anh c馻 m蕐 i m玭 ph竔 t筼 th祅h, Th髖 Y猲 m玭 l� m閠 trong s� . B� m藅 n祔 tr猲 giang h� r蕋 輙 ngi bi誸. <enter>"..name..": V藋 頲! Ta 甶 t譵 c� ta. <enter>",1,"K誸 th骳 i tho筰/middlegoon2")
	elseif (( Uworld1002 == 180 ) or ( Uworld1002 == 190 )) and ( GetLevel() >= 50 ) then
		nt_setTask(1002,190)
		Describe(DescLink_FuNanBin.."<#>: Chi課 thng 'Long 筺' trong 'Thi猲 Ho祅g B竧 Kh�' t鮪g l� Tr蕁 bang chi b秓 c馻 Thi猲 Vng Bang, ng ti誧 sau  b� k� l� cp 甶. Thi猲 Vng Bang l� 1 ph莕 quan tr鋘g c馻 L﹎ Uy猲 Nhai,h琻 n鱝 Bang ch� Dng Anh l� Ch� nh﹏ c馻 L﹎ Uy猲 Nhai. G莕 y nghe n鉯 chuy謓 n祔 c� li猲 quan n H祅 Giang чc 誹 T萿. Ngi n祔 c� c鑞g hi課 r蕋 nhi襲 cho Thi猲 Vng, ch� nh﹏ c馻 h� kh玭g mu鑞 ch th﹏ ra tay! Ngi c� th� m nh薾 vi謈 n祔 kh玭g? <enter>",1,"K誸 th骳 i tho筰/middlegoon3")
	elseif (( Uworld1002 == 240 ) or ( Uworld1002 == 250 )) and ( GetLevel() >= 60 ) then
		nt_setTask(1002,250)
		Describe(DescLink_FuNanBin.."<#>: Чi s� ch糿g l祅h, theo m藅 th竚 h錳 b竜, T� ch鴆 b� m藅 Ch輓h ph竔 T莔 Long H閕 thu th藀 頲 2 Th莕 kh�, n誹  b鋘 h� c�  b� k� ho筩h c馻 ch髇g ta s� kh玭g c� ng祔 ho祅 th祅h.V� hy v鋘g c馻 b� t竛h, ngi nh蕋 nh ph秈 畂箃 l筰 Th莕 kh� b� M筩 S莡 a cho Kh玭g T辌h. H緉 產ng � trong Thi誹 L﹎ T�. H穣 t譵 h緉 畂箃 l筰 b秓 kh�. Hy v鋘g c馻 L﹎ Uy猲 Nhai n籱 trong tay ngi! <enter>",1,"K誸 th骳 i tho筰/middlegoon4")
		end 
end 

function middlegoon1()
	AddOwnExp(10000)
	nt_setTask(1002,80)
	Msg2Player("Ph� Nam B╪g b秓 b筺 甶 Kho竔 Ho箃 L﹎ nh b筰 L� Thi謓 Tng.")
end

function middlegoon2()
	AddOwnExp(15000)
	nt_setTask(1002,130)
	Msg2Player("Ph� Nam B╪g b秓 b筺 甶 Th髖 Y猲 m玭 t譵 L� Thu Th駓.")
end

function middlegoon3()
	AddOwnExp(30000)
	nt_setTask(1002,200)
	Msg2Player("Ph� Nam B╪g b秓 b筺 甶 Thi猲 Vng Bang t譵 H祅 Giang чc 誹 T萿.")
end

function middlegoon4()
	AddOwnExp(50000)
	nt_setTask(1002,260)
	Msg2Player("Ph� Nam B╪g b秓 b筺 甶 Thi誹 L﹎ T� t譵 Kh玭g T辌h Чi S�.")
end
