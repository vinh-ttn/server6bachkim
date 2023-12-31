--description: 天王帮前殿 王佐　天王10级任务
--author: yuanlan	
--date: 2003/4/24
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3);
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 10*256) and (GetLevel() >= 10) then
			Say("Ngi m韎 gia nh藀 b鎛 bang? Mu鑞 tr� th祅h Th� V� trng, c莕 ph秈 n <color=Red>Thi猲 Vng o S琻 ng<color> l蕐 v� <color=Red>3 vi猲 K� Huy誸 Th筩h<color>. Ngi c� gan l祄 kh玭g?", 2, "Л琻g nhi猲 d竚. /L10_get_yes", "T筰 h� mu鑞 t藀 luy謓 th猰 m閠 th阨 gian n鱝 /L10_get_no")
		elseif (UTask_tw == 10*256+20) and (GetItemCount(91) >= 3 ) then				--鸡血石数目至少为3
			L10_prise()
		elseif (UTask_tw > 10*256) and (UTask_tw < 10*256+50) then					--已经接到10级任务，尚未完成
			Talk(1,"","дn <color=Red>Thi猲 Vng o S琻 ng<color> l蕐 v� <color=Red>3 vi猲 K� Huy誸 Th筩h<color> r錳 h絥g t輓h!")
		else					--已经完成10级任务，尚未出师（缺省对话）
			Talk(1,"","Huynh  b鎛 m玭 u l� nh鱪g huynh  c� ho礽 b穙 l韓, l穙 phu gh衪 nh蕋 l� nh鱪g lo筰 tr閙 g� s� ch� ")
		end
	elseif (UTask_tw >= 70*256) then							--已经出师
		Talk(1,"","Nam t� h竛 i trng phu,  ra h祅h t萿 giang h� c莕 ph秈 nh thi猲 l藀 a, n誹 nh� ngi l祄 chuy謓 g� tr竔 v韎 o ngh躠 giang h� l穙 phu nh蕋 nh s� kh玭g tha cho ngi u")
	else
		Talk(1,"","L穙 phu xem bang ch� gi鑞g nh� con g竔 ru閠 c馻 m譶h, b蕋 lu薾 x秠 ra chuy謓 g� l穙 phu c騨g u d鑓 h誸 l鵦  b秓 v� c� ta")
	end
end;

function L10_get_yes()
	Talk(1,"","R蕋 t鑤! V藋 m韎 l� nam t� h竛! дn <color=Red>Thi猲 Vng o S琻 ng<color> l蕐 v� <color=Red>3 vi猲 K� Huy誸 Th筩h<color> r錳 h絥g t輓h!")
	SetTask(3, 10*256+20)
	AddNote("T筰 ti襫 甶謓 Thi猲 Vng bang (201, 198) g苝 Vng H鵸, ti誴 nh薾 <color=red>nhi謒 v� K� Huy誸 Th筩h<color>, 甶 n Фo s琻 чng t譵 3 vi猲 K� Huy誸 Th筩h ")
	Msg2Player("T筰 ti襫 甶謓 Thi猲 Vng bang g苝 Vng H鵸, ti誴 nh薾 nhi謒 v� K� Huy誸 Th筩h 甶 n Фo s琻 ng t譵 3 vi猲 K� Huy誸 Th筩h. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","L祄 r蕋 t鑤! L穙 phu s� phong cho ngi l祄 Th� V� trng! Sau n祔 c� r蕋 nhi襲 th� th竎h 產ng ch�, ngi c莕 ph秈 ti誴 t鬰 c� g緉g")
	for i = 1, (GetItemCount(91)) do DelItem(91) end
	SetTask(3, 20*256)
	SetRank(44)
	add_tw(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
--	AddMagic(26)
--	AddMagic(23)
--	AddMagic(24)
	Msg2Player("Ch骳 m鮪g B筺! Х 頲 phong l祄 trng th�. H鋍 頲: Thi猲 Vng Ch飝 Ph竝, Thi猲 Vng Thng Ph竝, Thi猲 Vng o Ph竝. ")
	AddNote("Quay l筰 ti襫 甶謓, mang 3 vi猲 K� Huy誸 Th筩h giao cho Vng H鵸, ho祅 th祅h nhi謒 v� K� Huy誸 Th筩h, 頲 phong l祄 Trng th� v�. ")
end;
