--description: 西南北区成都府镖局老板 
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Say("M閠 ki誱 d鋍 ngang tr阨 t! Ch璦 c� ai i th�! Ngi n c� vi謈 g�?",3,"Ta n l祄 nhi謒 v� ph� tuy課/branch_branchlengqiang","Ta n l祄 nhi謒 v� c蕄 40 c馻 Nga My Ph竔/emei_fourtytask","Kh玭g c� g�! Ngng m� n猲 n xem th玦!/no")
end;

function branch_branchlengqiang()
Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 >= 60 and Uworld1055 <= 120 ) then
			branch_lengqiang()
	else
		Talk(1,"","Ai c騨g tng ngh� B秓 ti猽 l� sung sng! Th藅 s� m鏸 l莕 ra 甶 u kh玭g d竚 h裯 trc ng祔 v�!")
	end
end

function emei_fourtytask()
	UTask_em = GetTask(1);
	if (UTask_em == 40*256+40) then 							--峨嵋派40级任务
		Talk(6, "", "Nghe n鉯 qu� Ti猽 C鬰 c� m閠 b鴆 'ph� dung c萴 k� 'c馻 T鑞g Huy T玭g, ta mu鑞 mua, xin h醝 bao nhi猽 ti襫?", "Kh萿 kh� l韓 nh�! Ngi bi誸 gi� c� c馻 b鴆 tranh  kh玭g? Bao nhi猽 ti襫 c騨g kh玭g b竛 u!", "C竎 ngi v薾 chuy觧 h祅g h鉧 c莕 g� b鴆 tranh ? Th玦  cho ta 甶, c莕 甶襲 ki謓 g� c� n鉯 th糿g ra!", "Ngi r蕋 kh秐g kh竔! Л頲! N誹 c� th� t譵 ba m鉵  th� ta s� d﹏g hai tay b鴆 tranh 'Ph� Dung C萴 K� ' cho.", "Ba m鉵 g� v藋?", "<color=Red>Linh X� Hng Nang<color>,<color=Red> g T譶h H� Th﹏ ph�<color> v� <color=Red>B輈h T� Gi韎 Ch�<color>, to祅 l� nh鱪g th� mang s� may m緉 b秓 v� vi謈 l祄 ╪ c馻 ti猽 c鬰, nh璶g m� kh� t譵 l緈 !")
		SetTask(1, 40*256+50)
		SetTask(29,0)				-- 开始子任务之前先清零
		AddNote("цi tho筰 v韎 玭g ch� Ti猽 C鬰, ti誴 nh薾 nhi謒 v�, v祇 th祅h t譵 Linh X� Hng Nang, g T譶h H� Th﹏ ph� v� B輈h T� Gi韎 ch�.")
		Msg2Player("Ch� ti猽 c鬰 y猽 c莡 b筺 t譵 Linh X� Hng Nang, g T譶h H� Th﹏ ph� v� B輈h T� Gi韎 Ch�  i l蕐 'Ph� Dung C萴 K� '")
	elseif ((UTask_em == 40*256+60) and (HaveItem(21) == 0)) then		-- 道具丢失的处理
		AddEventItem(21)
		Talk(1,"","Ta m韎 v鮝 甧m tranh ra, ngi ch箉 甶 u v藋? May m� ta gi� l阨 h鴄!")
	elseif (UTask_em == 40*256+50) then	-- 峨嵋派40级任务中
		if (HaveItem(166)== 1  and  HaveItem(167)== 1  and  HaveItem(168)== 1) then
			Talk(1,"","Ngi trong giang h� ch� t輓 甶 u, ban u ta ch� mu鑞 ngi th蕐 kh�  n秐 l遪g, kh玭g ng� ngi  t譵  ba m鉵. T鑤! Ta giao 'Ph� Dung C萴 K� ' cho ngi y!")
			DelItem(166)
			DelItem(167)
			DelItem(168) 
			AddEventItem(21)
			Msg2Player("Л頲 'Ph� Dung C萴 K� '.")
			SetTask(1, 40*256+60)
			SetTask(29,0)
			AddNote("giao Linh X� Hng Nang, g T譶h H� Th﹏ ph� v� B輈h T� Gi韎 Ch� i l蕐 'Ph� Dung C萴 K� у' c馻 玭g ch� ti猽 c鬰.")
		else									--没有做完三个任务
			Talk(1,"","T譵  <color=Red>Linh X� Hng Nang<color>, <color=Red>g T譶h H� Th﹏ ph� <color> v� <color=Red>B輈h T� Gi韎 Ch�<color> 甶 m韎 t輓h ti誴.")
		end
	else
		Talk(1,"","Ti猽 s� c馻 ti猽 c鬰 ch髇g ta ai c騨g v� ngh� cao cng, n t h祅g nh薾 頲 n誹 ai d竚 ngang nhi猲 n cp th� kh玭g bi誸 lng s鴆 t� n祇!")
	end
end

function no()
end
