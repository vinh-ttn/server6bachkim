-- 正派支线任务脚本
-- by xiaoyang(2005\1\4)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
----------------------------------------------------------------------邹长久-----------------------------------------------------------------------
function branch_zouchangjiu()
	Uworld1058 = nt_getTask(1058)
	local name = GetName()  
	if ( Uworld1058 == 40) or ( Uworld1058 == 50 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1058,50)
			Describe(name.."<#>:C竎 h� l� Tr﹗ Trng C鰑?<enter>"
			..DescLink_ZouChangJiu.."<#>:ng! T譵 ta c� vi謈 g�?<enter>"
			..name.."<#>:Huynh xem y l� g�! <enter>L謓h b礽 c馻 Th竎 B箃 Ho礽 Xuy猲 b� m蕋.<enter>Ngi... Ngi l� ngi 頲 Th竎 B箃 Ho礽 Xuy猲 ph竔 t韎. T鑤! дn ng l骳 l緈!<enter>"
			..name.."<#>:Th� g� m� quan tr鋘g th�. <enter>Tr﹗ Trng C鰑: C竔 n祔 ngi kh醝 lo, c莔 nh鱪g quy觧 m藅 t辌h da d� n祔 c� th� l藀 t鴆 ra kh醝 th祅h, n誹 kh玭g s� kh玭g 甶 頲 u. N誹 c� th� tho竧 th﹏ 頲, c莔 nh鱪g quy觧 m藅 t辌h n祔 甶 Dng Ch﹗ t譵 Th萴 Phong. Nh譶 th蕐 v藅 n祔, h緉 t� nhi猲 s� hi觰.enter>",
			1,"K誸 th骳 i tho筰/branch_zouchangjiu1")	
		else
			Talk(1,"","Xin l鏸! Ъng c蕄 c馻 b筺 vt qu� ng c蕄 nhi謒 v� y猽 c莡, kh玭g th� ti誴 nh薾 n鱝! Th藅 ng筰 qu�! ")
		end
	else
		Describe(DescLink_ZouChangJiu.."<#>: шi ngi c� nhi襲 chuy謓 kh玭g ng�! C� nh鱪g chuy謓 ta kh玭g mu鑞 th� n� v蒼 c� n!",1,"K誸 th骳 i tho筰/no")
	end
end
---------------------------------------------------------------------沈风-----------------------------------------------------------------------
function branch_shenfeng()
	Uworld1058 = nt_getTask(1058)
	local name = GetName()  
	if ( Uworld1058 == 60) or ( Uworld1058 == 70 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1058,70)
			Describe(name.."<#>:Th萴 Phong?<enter>"
			..DescLink_ShenFeng.."<#>: Ch輓h ta.<enter>"
			..name.."<#>: Ngi xem y!<enter>G� th�? <enter>B筺 m� M藅 t辌h da d� cho Th萴 Phong xem.<enter>"
			..name.."<#>: C� ngi � Th祅h Й nh� ta n t譵 huynh <enter>C萿 t芻! Gia gia kh玭g ph秈 Th萴 Phong, ngi m綾 l鮝 r錳! N祔 Kim c萿, h玬 nay c� mu鑞 to祅 m筺g s鑞g?<enter>",
			1,"K誸 th骳 i tho筰/branch_shenfeng1")	
		else
			Talk(1,"","Xin l鏸! Ъng c蕄 c馻 b筺 vt qu� ng c蕄 nhi謒 v� y猽 c莡, kh玭g th� ti誴 nh薾 n鱝! Th藅 ng筰 qu�! ")
		end
	else
		Describe(DescLink_ShenFeng.."<#>:Ch輓h ta!",1,"K誸 th骳 i tho筰/no")
	end
end

--------------------------------------------------------------------刘蕴古-----------------------------------------------------------------
function branch_liuyungu()
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1013 = nt_getTask(1013)
	local name = GetName()  
	if ( Uworld1060 == 20) or ( Uworld1060 == 30 ) then
		if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
			nt_setTask(1060,30)
			Describe(
			name.."<#>:L璾 huynh! Nghe n鉯 T鑞g Tri襲 產ng m� h閕 l玦 i, khuy課 kh輈h qu莕 h飊g trong thi猲 h� luy謓 v�.<enter>"
			..DescLink_LiuYunGu.."<#>: Nam T鑞g m� tr薾 l玦 i t� v� cho nh﹏ s� v� l﹎, m鬰 ch tuy猲 dng phong tr祇 luy謓 v� nh璶g c� th� th蕐 Nam tri襲 產ng m璾 t輓h y m筺h bi猲 ph遪g, b� sung qu﹏ l鵦  ch鑞g l筰 Чi Kim ta.<enter>"
			..name.."<#>: Huynh c� m璾 k� g� ch╪g?<enter>Kh玭g! Ch� c� ngi tham d� tr薾 l玦 i m韎 c� th� gia nh藀 v祇 s祅 u, y l� chuy謓 m� ta v総 鉩 m穒 kh玭g ra. N誹 ngi厖.<enter>"
			..name.."<#>: Ta hi觰. Ta s� ch th﹏ 甶 Di詎 V� Trng tham gia m閠 tr薾 thi u, ch� c� th� nh� v藋 m韎 c� th� thu th藀 tin t鴆.<enter>",
			1,"K誸 th骳 i tho筰/branch_liuyungu2")	
		else
			Talk(1,"","Xin l鏸! Ъng c蕄 c馻 b筺 vt qu� ng c蕄 nhi謒 v� y猽 c莡, kh玭g th� ti誴 nh薾 n鱝! Th藅 ng筰 qu�! ")
		end
	elseif (( Uworld1060 == 40) or ( Uworld1060 == 50 )) and ( Uworld1013 == 20 ) then
		if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
			nt_setTask(1060,50)
			Describe(
			DescLink_LiuYunGu.."<#>: Th緉g r錳 �! H�! H�! Kh� l緈! H穣 quay v� t譵 Th竎 B箃 Tng qu﹏ k� l筰 tng t薾 t譶h h譶h tr薾 L玦 i, n猲 nh� ng  s鉻 b蕋 c� ch� nh� n祇.<enter>",
			1,"K誸 th骳 i tho筰/branch_liuyungu3")	
		else
			Talk(1,"","Xin l鏸! Ъng c蕄 c馻 b筺 vt qu� ng c蕄 nhi謒 v� y猽 c莡, kh玭g th� ti誴 nh薾 n鱝! Th藅 ng筰 qu�! ")
		end	
	elseif ( Uworld1059 == 40) or ( Uworld1059 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1059,50)
			Describe(
			name.."<#>:L璾 U萵 C�?<enter>"
			..DescLink_LiuYunGu.."<#>: Ngi l� ai! D竚 th蕋 l� v韎 b鎛 quan �?<enter>"
			..name.."<#>: ng gi� b� n鱝, ta l� ngi 頲 Th竎 B箃 Tng Qu﹏ ph竔 t韎 t譵 ngi h醝 th╩ v礽 chuy謓. <enter>Th竎 B箃? Th竎 B箃 qu竔 g� ch�? Чi T鑞g ta m蕐 v筺 chi課 tng, n祇 c� ai mang c竔 h� r� 蕐?<enter>"
			..name.."<#>: L謓h B礽 Th竎 B箃 Tng qu﹏ y, L璾 ti猲 sinh c遪 kh玭g tin sao?<enter>C萵 th薾 ki觤 tra l謓h b礽, b鏽g nhi猲 h� gi鋘g <enter>Qu� nhi猲 l� ngi c馻 Th竎 B箃 Tng Qu﹏, ngi  mu鑞 bi誸 tin g�?<enter>"
			..name.."<#>: G莕 y nghe n鉯 v礽 tin n v� Thi Nghi Sinh, Tng qu﹏ sai ta n  tra r� th鵦 h�.<enter>Thi Nghi Sinh? Ho箃 ng � Nam T鑞g c馻 g� n祔 c� ch髏 m� 竚 v�  ti誸 l� nh鱪g t譶h b竜 tuy謙 m藅 c馻 Чi Kim.<enter>"
			..name.."<#>: Th藅 c� chuy謓  sao? V藋 Taph秈 tr� v� b萴 b竜 v韎 Tng qu﹏. <enter>Tr猲 阯g ph秈 h誸 s鴆 c萵 th薾.<enter>",
			1,"K誸 th骳 i tho筰/branch_liuyungu1")	
		else
			Talk(1,"","Xin l鏸! Ъng c蕄 c馻 b筺 vt qu� ng c蕄 nhi謒 v� y猽 c莡, kh玭g th� ti誴 nh薾 n鱝! Th藅 ng筰 qu�! ")
		end
	
	else
		Describe(DescLink_LiuYunGu.."<#>: Ta? V祅g, Ng鋍, L鬭, Sa tanh, Ru ngon, ng鵤 t鑤  th� g� c騨g c�, ch� c莕 n鉯 ra, ta s� c� b竛!",1,"K誸 th骳 i tho筰/no")
	end
end

---------------------------------------------------------------------醉汉-------------------------------------------------------------------------
function branch_zuihan()
	Uworld1059 = nt_getTask(1059)
	local name = GetName()  
	
	if ( Uworld1059 == 80) or ( Uworld1059 == 90 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1059,90)
			Describe(
			name.."<#>:Ma men! D藋 甶!<enter>"
			..DescLink_JiuGui.."<#>: M閠 gi蔯 m閚g d礽, i ngi c� bao l﹗, в ta say 甶....厖<enter>"
			..name.."<#>: Ngi mu鑞 say, c騨g kh玭g ph秈 l� b﹜ gi�. Th竎 B箃 Tng qu﹏ 產ng c莕 ngi.<enter>Ngi n鉯 g�?!厖Qu� l� Th竎 B箃 Tng qu﹏, c� ng l� Tng qu﹏ nh� ngi t韎 kh玭g? Х 10 n╩ r錳, ta 萵 n竨 n琲 n祔 kh玭g b筺 b� th﹏ th輈h! C� l骳 ta ngh� r籲g qu� hng  t� b� ta, h鉧 ra m鋓 ngi v蒼 c遪 nh� n ta. Ngi c� g� c莕 ta gi髉 ch╪g?<enter>"
			..name.."<#>: B﹜ gi� ta mu鑞 bi誸 quy lu藅 ra v祇 c馻 Thi Nghi Sinh, ngo礽 ra ngi l祄 cho ta m閠 s� th玭g h祅h l謓h b礽.<enter>Nh鱪g th� n祔 ta  chu萵 b� t� l﹗, h穣 甶 b総 t猲 c萿 gian t� Thi Nghi Sinh 甶.<enter>",
			1,"K誸 th骳 i tho筰/branch_zuihan1")	
		else
			Talk(1,"","Xin l鏸! Ъng c蕄 c馻 b筺 vt qu� ng c蕄 nhi謒 v� y猽 c莡, kh玭g th� ti誴 nh薾 n鱝! Th藅 ng筰 qu�! ")
		end
	else
		Describe(DescLink_JiuGui.."<#>: Ai da, say r錳,  say th� kh玭g c遪 nh� g� n鱝, m譶h nh� ngi kh竎 ch璦 ch綾 ai  nh� t韎 m譶h.",1,"K誸 th骳 i tho筰/no")
	end
end

function branch_zouchangjiu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_shenfeng1()
	AddOwnExp(5000)
	nt_setTask(1058,80)
	Msg2Player("T猲 Th萴 Phong n祔 r� r祅g l� do v� s�  T鑞g Tri襲 gi� d筺g!")
	NewWorld(80,1795,3395)
	SetFightState(1)
end
	
function branch_liuyungu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_liuyungu2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(30000)
	nt_setTask(1013,10)
	nt_setTask(1060,40)
	Msg2Player("B筺 quy誸 nh ch th﹏ 甶  Di詎 V� Trng tham gia nh m閠 tr薾 pk.")
end

function branch_liuyungu3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_zuihan1()
	AddOwnExp(15000)
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	nt_setTask(1059,100)
	Msg2Player("B筺  c� th� thu薾 ti謓 甶 th輈h s竧 Thi Nghi Sinh.")
end

function no()
end

