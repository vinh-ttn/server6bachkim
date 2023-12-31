-- 丐帮 掌棒长老罗匡生 30级任务
-- by：Dan_Deng(2003-07-28)
-- by: xiaoyang(2004\4\22)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_gb = GetTask(8)
	Uworld128 = GetTask(128)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 30*256) and (GetLevel() >= 30) then		--30级任务
			Say("Ta ph� tr竎h c玭g v� thng ng祔 c馻 c竎 ph﹏ 阯g, m鏸 th竛g c竎  ch� u tr譶h c玭g v╪ l猲 m閠 l莕, nh璶g th竛g n祔 Tri謚 У ch� ph﹏ У th� ba ch璦 giao t韎 n鱝, ngi gi髉 ta 甶 h鑙 th骳 頲 kh玭g?",2,"уng �!/L30_get_yes","Ti誧 qu�! Ta c� vi謈 kh竎 r錳 /L30_get_no")
		elseif (UTask_gb == 30*256+40) and (HaveItem(81) == 1) then		--30级任务完成
			L30_prise()
		elseif (UTask_gb >= 30*256+10) and (UTask_gb < 400*256) then		--30级任务进行中
			Talk(1,""," qua Dng Ch﹗ ch璦 v藋? Sao Tri謚 У ch� ch璦 a c玭g v╪ t韎 n鱝?")
		else
			Talk(1,"","Kim Binh c祅g ng祔 c祅g t竜 b筼, ch髇g ta ph秈 h祅h ng g� th玦!")
		end
	elseif (Uworld128 == 20) and (HaveItem(390) == 1) then
		Talk(9,"Uworld128_danger","La trng l穙! � y c� b鴆 th� c馻 Gi韎 V� T�.",".....Xin h醝 C竎 h� l蕐 th� n祔 � u?","T筰 h� v韎 Gi韎 V� T� bi誸 nhau, � Trng Giang nguy猲 u h緉 a th� cho ta.","V藋 ch綾 kh玭g sai! Trong th� V� T� n鉯 r� ngi r蕋 ng tin v� n鉯 c� ngi mu鑞 h筰 h緉.","Sao?","Chuy謓 n祔 v� c飊g tr鋘g i, tuy謙 i kh玭g 頲 truy襫 ra ngo礽","T筰 h� hi觰 r�!","Ta kh玭g ti謓 xu蕋 u l� di謓! Ngi c� d竚 m tr竎h s� m筺g n祔 kh玭g/","V藋 ta 甶 ngay!")
	elseif (Uworld128 == 50) then
		Talk(5,"Uworld128_finish","La trng l穙! Gi韎 i ca  tho竧 hi觤."," t� b籲g h鱱! Nh璶g ta v蒼 c遪 lo l緉g m閠 chuy謓","Xin c� n鉯 ra!","Gi韎 V� T� l� hy v鋘g C竔 Bang, i phng s� kh玭g bu玭g tha. Mong ngi h穣 c� g緉g b秓 v� y.","La trng l穙 xin y猲 t﹎! ")
	elseif (Uworld128 == 20) then
		Talk(1,"","La trng l穙! Gi韎 V� T� qu� bang nh� t玦 giao b鴆 th� cho 玭g, nh璶g ta  qu猲 mang theo.")
	elseif (Uworld128 > 20) and (Uworld128 < 50)then
		Talk(1,"","Ti觰 Gi韎 l�  t� k� v鋘g c馻 c竔 bang. C� th� 甧m n ph骳 ph莕 cho ngi! ")
	else
		Talk(1,"","Kim binh c祅g l骳 c祅g manh ng, ch髇g ta c騨g ph秈 s韒 h祅h ng m韎 頲.")
	end
end;

function L30_get_yes()
	Talk(1,"","Ph﹏  th� 3 n籱 � Dng Ch﹗, ngi n  s� g苝 頲 Tri謚 У ch�.")
	SetTask(8,30*256+10)
	Msg2Player("Ti誴 nh薾 nhi謒 v�: дn Dng Ch﹗  h醝 nguy猲 nh﹏ giao d竎h s竎h tr� c馻 Tri謚  ch� ")
	AddNote("Ti誴 nh薾 nhi謒 v�: дn Dng Ch﹗  h醝 nguy猲 nh﹏ giao d竎h s竎h tr� c馻 Tri謚  ch� ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(2,"","Trng l穙! Ta  甧m v╪ th� v� r錳!","Xem ra Kim binh  th藅 s� h祅h ng! Ch髇g ta ph秈 c萵 h薾 h琻 m韎 頲. L莕 n祔 ngi l藀 頲c玭g l韓, ta phong ngi l�  t� c蕄 30")
	DelItem(81)
	SetTask(8,40*256)
	SetRank(40)
--	AddMagic(274)
--	AddMagic(124)
	add_gb(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g B筺! Х 頲 th╪g l� C竔 Bang Ch蕄 B鎛g  t�, s� 頲 h鋍Gi竛g Long Chng; Ф C萿 Tr薾. ")
	AddNote("Gi秈 quy誸 頲 s� vi謈 � Th鬰 Cng s琻, c鴘 頲  t� C竔 bang, 頲 th╪g l� Ch蕄 b鎛g  t� ")
end;

function Uworld128_danger()
	DelItem(390)
	SetTask(128,30)
	Msg2Player("La trng l穙 nh� b筺 甶 c鴘 Gi韎 V� T� ")
	AddNote("La trng l穙 nh� b筺 甶 c鴘 Gi韎 V� T� ")
end

function Uworld128_finish()
	if (GetTask(8) >= 70*256) and (GetTask(8) ~= 75*256) then
		Talk(1,"","C竔 Bang ta c� m閠 b� m藅 quy誸, ngi x鴑g ng 頲 truy襫 d箉!")
		if (HaveMagic(357) == -1) then		-- 必须没有技能的才给技能
			AddMagic(357,1)
		end
		if (HaveMagic(359) == -1) then		-- 必须没有技能的才给技能
			AddMagic(359,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("B筺 h鋍 頲 tuy謙 k� c馻 C竔 bangPhi Long T筰 Thi猲, Thi猲 H� V� C萿 ")
		SetTask(128,255)
	else
	   SetTask(128,245)  --获得声望的设置变量245
	end
   add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
   AddRepute(add_repute)
   Msg2Player("C鴘 頲 Gi韎 V� T�, ho祅 th祅h nhi謒 v�. Danh v鋘g c馻 b筺 t╪g th猰 "..add_repute.."甶觤.")
   AddNote("C鴘 頲 Gi韎 V� T�, ho祅 th祅h nhi謒 v�. ")
end
