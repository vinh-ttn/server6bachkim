-- 翠烟门禁地迷宫 路人NPC 无名老者（翠烟门出师任务）
-- by：Dan_Deng(2003-07-27)

function main()
	UTask_cy = GetTask(6)
	if ((UTask_cy == 60*256+10) and (HaveItem(237) == 1)) then				--出师任务进行中
		Talk(6,"L60_talk1","Ngi l� ai? D竚 x玭g v� 筺 Trng C鑓, mu鑞 ch誸 �?","Khoan ! L穙 b�! � y c� m閠 kh╪ t�, xin 玭g xem qua! ","Kh╪ t�?! Лa y!...............Ngi.....ngi l� ai? Kh╪ t� n祔 t� u m� c�? ","V穘 b鑙 l�  t� Th髖 Y猲, kh╪ t� n祔 l� V穘 b鑙 l蕐 trong s琻 ng. Xu﹏ Hng b� b� b秓 V穘 b鑙 n t譵 玭g!","Xu﹏ Hng b� b�? Xu﹏ Hng con ti觰 nha u   tr� th祅h 1 b� l穙? ! Ta kh玭g mu鑞 nh綾 l筰 chuy謓 n╩ x璦 n鱝!")
	elseif (UTask_cy >= 60*256+20) and (UTask_cy < 70*256) and (HaveItem(235) == 0) then		--出师任务中，书信丢了
		AddEventItem(235)
		Msg2Player("Nh薾 頲 b鴆 th� n鉯 r� t譶h h譶h c馻 玭g l穙 v� danh. ")
		AddNote("Nh薾 頲 b鴆 th� n鉯 r� t譶h h譶h c馻 玭g l穙 v� danh. ")
		Talk(1,"","Th� c騨g kh玭g c�, ngi l蕐 g�  gi秈 v﹜ Ti觰 Ch﹏?")
	elseif (UTask_cy >= 60*256+20) then				-- 老者已经认识她的其它情况
		Talk(1,"","Ngi kh玭g c莕 ph秈 khuy猲 n鱝, su鑤 i n祔 ta s� kh玭g r阨 c鑓.")
	else
		Talk(1,"","Ngi l� ai? D竚 x玭g v� 筺 Trng C鑓, mu鑞 ch誸 �?")
		Msg2Player("Nh� c秏 th蕐 s鴆 c馻 m閠 ng鋘 n骾  l猲, trc m総 c馻 b筺 m鋓 th� dng nh� u tan bi課. ")
		Msg2Player("B筺 b� 玭g l穙 v� danh trong c蕀 a gi誸 ch誸 r錳! ")
		KillPlayer()
	end
end;

function L60_talk1()
	Talk(2,"L60_talk2","N籱  Ti觰 T莕-- c騨g l� S� t� c馻 ngi, l� T� s� s竛g l藀 Th髖 Y猲 m玭, b� ngi m譶h y猽 b� r琲 n猲 產u kh� m� t� v蒼. C遪 c竔 k� ph� t譶h ph� ngh躠 ch輓h l� i ca c馻 ta. Ti觰 Ch﹏ kh玭g cam t﹎ b� b� r琲, nghe 頲 tung t輈h c馻 gia m玭 ta n猲 mu鑞 i di謓 ch蕋 v蕁 s� b閕 c c馻 i ca ta, v� t譶h ph竧 hi謓 頲 s� th藅.","Ho� ra � i ca ta v鑞 c� m閠 th� t� b� b謓h n籱 li謙 ging, do c� h玭 c trc. C遪 Ti觰 Ch﹏ sau n祔 m韎 quen bi誸, ban u huynh 蕐 mu鑞 t� h玭 nh璶g v� m閠 l莕 ngo礽 � mu鑞 m� to祅 th﹏ b� b筰 li謙. Чi ca kh玭g d竚 m� mi謓g t� h玭, nh ph秈 ph� l遪g Ti觰 Ch﹏. Ti觰 Ch﹏ sau khi bi誸 s� th藅 tuy kh玭g bi誸 h薾 i ca ta n鱝 nh璶g t�  con tim tr� th祅h b╪g gi�.")
end;

function L60_talk2()
	Talk(2,"L60_talk3","C遪 ta, v鮝 m韎 g苝 Ti觰 Ch﹏ kh玭g th� k襪 頲 l遪g m譶h. Tuy y猽 n祅g 蕐, nh璶g ta bi誸 m譶h kh玭g x鴑g ng. N祅g 蕐 v� anh trai ta m韎 l� m閠 i tr阨 nh. Ta ch� mong n祅g 蕐 h筺h ph骳 v� kh玭g mu鑞 nh譶 n祅g 產u kh�. в k誸 n鑙 anh trai c馻 ta v� Ti觰 Ch﹏, ta  l衝 b� thu鑓 c v祇 c琺 c馻 i t萿, nh璶g kh玭g ng� r籲g v� ta nh蕋 th阨 h�  m�  g﹜ n猲 t閕 l韓 t祔 nh.","Sau khi i t萿 ch誸 th� m� c� 蕐 i kh竚 t� thi, k誸 qu� m鋓 chuy謓 b筰 l�, ngi nh� c� 蕐 甶 ki謓 � quan ph�. Trong l骳 ho秐g s�  b� i ca ph竧 hi謓. Чi ca v� mu鑞 c鴘 ta n猲 l猲 quan ph� u th� nh薾 h誸 t閕 c馻 ta, ta v鑞 gi髉 anh c馻 m譶h nh璶g ngc l筰  h筰 ch誸 anh. Ta ng l� kh玭g b籲g m閠 con ch�. Sau  ta 甧m m鋓 s� th藅 n鉯 v韎 Ti觰 Ch﹏.")
end;

function L60_talk3()
	Talk(2,"L60_talk4","Th� Ti觰 Ch﹏... � kh玭g! S� t� c� h薾 玭g kh玭g?","D� cho n祅g 蕐 c� h薾 ta nh� th� n祇 甶 n鱝, ta c騨g kh玭g tr竎h n祅g 蕐 nh璶g 甶襲 l祄 cho ta 產u l遪g l� m閠 c﹗ tr竎h c� ta c騨g kh玭g c�, n祅g ch� l苙g l� th� d礽, kh玭g n鉯 v韎 ta ti課g n祇. Ta r蕋 產u kh� v�  n鉯 v韎 n祅g nh鱪g l阨 m� b蕐 l﹗ nay ta gi� trong l遪g r籲g ta y猽 n祅g 蕐, ta mu鑞 頲 ch╩ s鉩 cho n祅g su鑤 i, b雐 v� ta th藅 s� y猽 n祅g!")
end;

function L60_talk4()
	Talk(6,"L60_talk5","Kh玭g ng� sau khi nghe ta n鉯 n祅g kh玭g c� m閠 bi觰 hi謓 g�, ch� n鉯 duy nh蕋 m閠 c﹗: 'Ngi 甶 甶! Ta mu鑞 qu猲 h誸 c竎 ngi'!","Th� 玭g l穙 c� 甶 kh玭g?","Ta c遪 c� th� 甶 u 頲? Con tim ta  tr鉻 trao cho n祅g, ta c遪 c� th� 甶 u? T譵 頲 n琲 n祔, ta � l筰 y lu玭, hy v鋘g m閠 ng祔 n祅g s� tha th� cho ta! ","C� l� b� 蕐 kh玭g h� gi薾 玭g u, con tim c馻 b� 蕐  ch誸 theo i ca c馻 ngi r錳! ","Иm m ta u n b猲 c鯽 s� c馻 n祅g van xin n祅g tha l鏸, cho n m閠 ng祔 n祅g g鰅 cho ta m閠 b鴆 th�, trong th� n鉯: '50 n╩! N誹 ngi c� th� i 50 n╩ c� l� ta s� ch蕄 nh薾 ngi!'","V� l阨 h鴄 n祔 m� 玭g m穒 i � trong c鑓 n祔 cho n ng祔 h玬 nay �?")
end;

function L60_talk5()
	Talk(3,"L60_talk6","Kh玭g sai! Ta � trong n祔 ng祔 ch� m i ch� hy v鋘g m閠 ng祔 n祅g ch蕄 nh薾 ta, n nay, n nay ta v蒼 c遪 mong i n祅g! Tuy l� Xu﹏ Hng k猽 ta n, n祅g l� a ho祅 th﹏ th輈h c馻 Ti觰 Ch﹏, nh� v藋 c� th� n鉯 Ti觰 Ch﹏  tha th� cho ta! Ngi.... ngi h穣 l藀 t鴆 d総 ta 甶 g苝 n祅g! ","L穙 b�! g  nhi襲 n╩ r錳 kh玭g ra kh醝 c鑓 n猲 kh玭g bi襱 b猲 ngo礽 th藅 s�  thay i, Ti觰 Ch﹏ m� 玭g n鉯 ch輓h l� s� t� c馻 s� m玭, ngi  kh玭g c遪 n鱝! ","Ngi n鉯 c竔 g�? L祄 sao c� th� ch�? T筰 sao n祅g l筰 匱a kh� s� i n祅g bao nhi猽 n╩, m� n祅g kh玭g g苝 ta m閠 l莕 m�  ra 甶, ta kh玭g bao gi� 頲 g苝 n祅g n鱝 r錳, hu hu.....")
end;

function L60_talk6()
	Talk(2,"L60_talk7","L穙 b�! Chuy謓  qua r錳 xin ng qu� 產u bu錸, c� i s� t�  l魕 v� t譶h. Ra 甶 kh玭g ph秈 l� m閠 c竎h gi秈 tho竧 hay sao? Sinh ly t� bi謙 kh玭g ph秈 l� chuy謓 m� ch髇g ta c� th� nh 頲. Ch� c莕 t譶h c秏 m� 玭g d祅h cho s� t� kh玭g h� thay i, th� ngi m穒 m穒 v蒼 � trong l遪g 玭g, m穒 m穒 kh玭g r阨 nhau.","Х nhi襲 n╩ tr玦 qua gi鑞g nh� l� m閠 gi蔯 m�, ta v蒼 lu玭 mong g苝 m苩 n祅g, n h玬 nay bi誸 頲 n祅g  ch誸, tr竔 l筰 ta nh� tr髏 頲 g竛h n苙g trong l遪g! ")
end;

function L60_talk7()
	Talk(4,"L60_talk8","Ch� ng ti誧! Ngi kh竎 kh玭g bi誸 s� th藅, c遪 cho r籲g S� t� l� m閠 ngi l筺h l飊g v� t譶h! ","M鋓 ngi  hi觰 l莔 Ti觰 Ch﹏ r錳, n誹 nh� n祅g ta l� m閠 ngi tuy謙 t譶h th� ta c騨g s� kh玭g � n琲 y. Ngi i ch� bi誸 m閠 m� kh玭g bi誸 hai,  n i kh玭g ng l祄 h筰 cho ngi t鑤. Ta � y v蒼 c遪 l璾 gi� nh鱪g b鴆 th� m� khi  Ti觰 Ch﹏  vi誸 cho ta, ngi 甧m nh鱪g b鴆 th� n祔 giao cho Chng m玭, m鋓 ngi xem xong th� s� r� ch﹏ tng s� vi謈! ","Th� th� t鑤 qu�! Sau n祔 l穙 c� d� nh g� kh玭g?","Ti觰 Ch﹏  ch誸 r錳, c� i n祔 ta s� kh玭g r阨 kh醝 c鑓!")
end;

function L60_talk8()
	SetTask(6,60*256+20)
	DelItem(237)
	AddEventItem(235)
	Talk(1,"","N誹  nh� th� l穙 b� xin b秓 tr鋘g, v穘 b鑙 xin c竜 t�! ")
end;
