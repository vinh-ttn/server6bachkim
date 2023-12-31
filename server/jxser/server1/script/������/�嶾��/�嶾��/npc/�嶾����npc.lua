-- 五毒教帮助NPC
-- By: Dan_Deng(2003-12-06)

function main(sel)
	UTask_wu = GetTask(10)
	player_faction = GetFaction()
	if (player_faction == "shaolin") then		-- 本门弟子
		RestoreLife()		-- 本门免费治疗
		RestoreMana()
		RestoreStamina()
		Say("Trong b鎛 gi竜 n祔, m鏸 ng祔 n誹 kh玭g luy謓 c玭g th� kh玭g th� s鑞g 頲. Ngi n y t譵 ta c� chuy謓 g�?",4,"T譵 hi觰 甶觧 c� b鎛 m玭/faction","T譵 hi觰 c竎 v� t玭 trng/member","T譵 hi觰 nhi謒 v� /task_get","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_wu >= 70*256) then				-- 本门出师
		Say("Ngi  xu蕋 s� t� b� gi竜 輙 ai quay tr� l筰? Ngi quay l筰 l莕 n祔 c� chuy謓 g� v藋?",4," l筰 chuy謓 n╩ x璦 b鎛 m玭/faction","Nh譶 l筰 o h鱱 n╩ x璦/member","Ta c遪 c� th� gi髉 g� kh玭g/task_get","Kh玭g h醝 n鱝!/nothing")
	elseif (player_faction ~= "") then			-- 非本门出师、其它门派（门派不为空即指非新手）
		Say("Ngi c� th� xuy猲 qua tr飊g tr飊g c v藅  v祇 頲 y, xem nh� l� k� t礽. B鎛 gi竜 t玭 tr鋘g nh鱪g ngi anh t礽. Hoan ngh猲h tham quan!",3,"T譵 hi觰 qu� ph竔/faction","T譵 hi觰 c竎 v� o trng/member","Kh玭g h醝 n鱝!/nothing")
	else													-- 新手
		Say("Ngi n  d� th竚 hay  b竔 s�? N誹 nh� kh玭g c� l� v藅 g� ra m総 th� ta kh玭g c� h鴑g th�. ",4,"T譵 hi觰 qu� ph竔/faction","T譵 hi觰 c竎 v� o trng/member","T譵 hi觰 甶襲 ki謓 nh藀 m玭/task_get","Kh玭g h醝 n鱝!/nothing")
	end
end

----------------- 门派介绍部份 ----------------------------
function faction()
	Say("V藋 th� ngi mu鑞 ta gi韎 thi謚 v� c竔 g� c馻 b鎛 m玭?",5,"Kh雐 nguy猲 m玭 ph竔/F1","V� tr� a l� /F2","мa v� giang h� /F3","c s綾 m玭 ph竔/F4","Kh玭g h醝 n鱝!/nothing")
end

function F1()
	Say("B鎛 gi竜 ch� m韎 th祅h l藀 v礽 n╩ nay nh璶g ph竧 tri觧 r蕋 m筺h. N閕 b� t� ch鴆 nghi猰 m藅. Gi竜 ch� H綾 Di謓 Lang Qu﹏ ch輓h l� ngi  s竛g l藀 n猲 Ng� чc Gi竜",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F2()
	Say("Xung quanh b鎛 gi竜 l� n╩ ng鋘 чc phong L躰h, ai mu鑞 v祇 y ph秈 qua tr飊g tr飊g th� th竎h. ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F3()
	Say("T玭 ch� c馻 Ng� чc gi竜 l� 'L頸 輈h quy誸 nh b筺 th�', c� l頸 m韎 l祄, kh玭g qu秐 b蕋 k� chuy謓 th� phi ch輓h t�. Ng� чc gi竜 c遪 c� 1 甶襲 l� 'K� c t閕 v韎 Ng� чc gi竜, s� ch誸 kh玭g to祅 th﹜'.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F4()
	Say("B鎛 gi竜 h祅h tung 萵 b�,h祅h ng kh玭g  l筰 d蕌 t輈h. g ch� qu竛 tr� b猲 阯g c騨g c� th� l� m玭  c馻 ng� c ph竔 c� th� gi誸 ngi trong nh竬 m総, h� th� v� t譶h. Th薽 ch� nh鱪g ngi ng m玭 v韎 nhau c騨g u l� ngi v� t譶h. Gi竜  v韎 nhau v蒼 c� th� h� c l蒼 nhau. Ngi b� tr髇g c s� b� xem l� b秐 l躰h k衜 c鈏",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

----------------- 成员介绍部份 ----------------------------
function member()
	Say("Mu鑞 t譵 hi觰 v� n祇 c馻 b鎛 gi竜?",10,"Gi竜 ch� H綾 Di謓 Lang Qu﹏ /M01","Kim X� Hng Ch� V﹏ B蕋 T� /M02","X輈h Y誸 Hng ch� у D� /M03","M芻 Th� Hng Ch� tang Chu /M04","Ng﹏ Thi襪 Hng Ch� B筩h Doanh Doanh /M05","Thanh Ng� Hng Ch� Thang B藅 /M06","чc Nha /M101","чc Th輈h /M102","чc T﹎ /M103","Kh玭g h醝 n鱝!/nothing")
end

function M01()
	Say("Gi竜 ch� H綾 Di謓 Lang Qu﹏      V� tr�: T鎛g tr筰      T鋋 :  220/166<enter>L� ngi l穘h m v� t譶h, l遪g d� s総 , ch璦 ai th蕐 h緉 ci. Ch� quan t﹎ nghi猲 c鴘 ch� t筼 c竎 lo筰 c dc, mu鑞 d飊g c  th鑞g tr� V� l﹎.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M02()
	Say("Kim X� Hng ch� V﹏ B蕋 T�      V� tr�: Kim X� tr筰      V� tr�:156/170<enter> C� ch� nh� nhi n�, khi h緉 nh譶 xu鑞g t ci l� n l骳 ph秈 gi誸 ngi, thi猲 h� ch� c� m閠 th� vui l� th蕐 ngi kh竎 產u n v� tr髇g c.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M03()
	Say("X輈h Y誸 Hng ch� у D�      V� tr�: X輈h Y誸 tr筰      T鋋 : 169/184<enter> l� k� tham lam h竚 l頸. Tuy襫 C� T� c馻 C玭 L玭 ph竔 d飊g ti襫 h鑙 l� nh� h緉 h� c chng m玭 C玭 L玭",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M04()
	Say("M芻 Th� Hng Ch� Tang Chu",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M05()
	Say("Ng﹏ Thi襪 Hng ch� B筩h Doanh Doanh      V� tr�: Ng﹏ Thi襪 tr筰  T鋋 : 220/209<enter> M苩 nh� hoa o, t﹎ nh� r緉 r誸, khu玭 m苩 l骳 n祇 c騨g n� m閠 n� ci l糿g l�, nh璶g ra tay r蕋 c 竎. C蕌 k誸 v韎 Chu Khuy誸 C玭 L玭 ph竔, mu鑞 m� ho芻  T� Trung Nguy猲 c馻 V� ng ph竔.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M06()
	Say("Thanh Ng� Tr筰 Ch� Thang B藅      V� tr�: Thanh Ng� tr筰      T鋋 : 200/201<enter> чc 竎 v� s�, n╩ x璦 h筰 ch誸 m� c馻 Y猲 Hi觰 Tr竔 (Th髖 Y猲 m玭) .",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M101()
	Say("чc Nha      V� tr�:      T鋋 : 182/194      Ph� tr竎h: Giao d辌h binh kh� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M102()
	Say("чc Th輈h      V� tr�:      T鋋 : 184/193      Ph� tr竎h: Giao d辌h trang b� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M103()
	Say("чc T﹎      V� tr�:      T鋋 : 187/191      Ph� tr竎h: Giao d辌h dc ph萴",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

----------------- 任务介绍部份 ----------------------------
function task_get()
	UTask_wu = GetTask(10)
	if (UTask_wu < 10*256) then	-- 未入门
		Say("Ngi hi謓 ch璦 nh藀 m玭. Mu鑞 nh藀 m玭, c� th� n b蕋 k� T﹏ Th� Th玭  t� ti誴 d蒼 c馻 b鎛 m玭.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_enroll","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_wu >= 10*256) and (UTask_wu < 20*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Nh襫 nh謓 v� T輓 Th筩h",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L10","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_wu >= 20*256) and (UTask_wu < 30*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Nh﹏ u Tr竛g.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L20","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_wu >= 30*256) and (UTask_wu < 40*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� M閏 Hng жnh.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L30","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_wu >= 40*256) and (UTask_wu < 50*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Nh穘 K輓h Vng M穘g X�.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L40","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_wu >= 50*256) and (UTask_wu < 60*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Ng鋍 San H�.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L50","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_wu >= 60*256) and (UTask_wu < 70*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� T輈h чc Chu.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L60","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_wu >= 70*256) and (UTask_wu < 80*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Tr飊g ph秐 s� m玭.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_return","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	else
		Say("Ngi c� th� t� do ra v祇 m玭 ph竔, t筸 th阨 kh玭g c� nhi謒 v� m韎.",3,"T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	end
end

function T_all()
	Say("Mu鑞 t譵 hi觰 nhi謒 v� g�?",10,"Nhi謒 v� nh藀 m玭/T_enroll","Nhi謒 v� Nh襫 Nh謓 v� T輓 Th筩h /T_L10","Nhi謒 v� Nh﹏ u Tr竛g /T_L20","Nhi謒 v� M閏 Hng жnh /T_L30","nhi謒 v� Nh穘 K輓h Vng M穘g X�  /T_L40","Nhi謒 v� Ng鋍 San H� /T_L50","Nhi謒 v� T� чc Chu  /T_L60","Nhi謒 v� tr飊g ph秐 s� m玭/T_return","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Mu鑞 nh藀 m玭 h鋍 ngh�, ch� c莕 thu閏 h� M閏 v� t n c蕄 10. дn b蕋 k� T﹏ th� th玭 n祇  g苝  t� ti誴 d蒼 c馻 b鎛 m玭 l� 頲. Sau  l莕 lt ho祅 th祅h 5 Nhi謒 v� c馻 m玭 ph竔. S� h鋍 頲 v� c玭g,頲 phong Danh hi謚. Sau khi ho祅 th祅h Nhi謒 v� xu蕋 s� s� th祅h ngh� xu蕋 s� ")
end

function T_L10()
	Talk(5,"t_all","Sau khi nh藀 m玭 v� ng c蕄  t n 10, ngi c� th� ti誴 nh薾 nhi謒 v� Nh襫 nh謓 v� T輓 th筩h. Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� 箃 H錸 T秐 Nh﹏, h鋍 頲 v� c玭g Ng� чc o ph竝,Ng� чc Chng Ph竝","Bc 1: дn M芻 Th� tr筰 g苝 Tang Chu, ti誴 nh薾 nhi謒 v�, 甶 b総 10 con Nh謓 v� mua 10 bao T輓 Th筩h cho b� ta luy謓 c玭g","Bc 2: дn Nh筺 Хng s琻 b総 10 con nh謓","Bc 3: дn Dc 甶誱 � Long Tuy襫 th玭 mua 10 bao T輓 Th筩h","Bc 4: Tr� v� M芻 Th� tr筰, giao Nh襫 nh謓 v� T輓 th筩h cho Tang Chu. Ho祅 th祅h nhi謒 v�.")
end

function T_L20()
	Talk(4,"t_all","Ho祅 th祅h nhi謒 v� Nh襫 nh謓 v� T輓 th筩h v� ng c蕄 t n 20,ngi c� th� ti誴 nh薾 nhi謒 v� Nh﹏ u tr竛g. Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� Th玦 M謓h S� Gi�, h鋍 頲 v� c玭g X輈h Di謒 th鵦 Thi猲, T筽 Nan Dc Kinh","Bc 1: дn Ng﹏ Thi襪 tr筰 g苝 B筩h Doanh Doanh, ti誴 nh薾 nhi謒 v�, 甶 gi誸 La Ti猽 Th蕋 Qu�, l蕐 v� 7 c竔 u!","Bc 2: дn La Ti猽 s琻, nh b筰 La Ti猽 Th蕋 Qu� ","Bc 3: Tr� v� Ng﹏ Thi襪 tr筰, g苝 B筩h Doanh Doanh ph鬰 m謓h, ho祅 th祅h nhi謒 v�.")
end

function T_L30()
	Talk(6,"t_all","Ho祅 th祅h nhi謒 v� Nh﹏ u tr竛g v� ng c蕄 t n 30,ngi c� th� ti誴 nh薾 nhi謒 v� M閏 Hng жnh. Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� H綾 Am Di猰 La, h鋍 頲 v� c玭g U Minh Kh� L﹗, V� H譶h чc, B竎h чc Xuy猲 T﹎, B╪g Lam Huy襫 Tinh","Bc 1: дn X輈h Y誸 tr筰 g苝 у D�, ti誴 nh薾 nhi謒 v�, 甶 tr� ph秐  l蕐 l筰 M閏 Hng жnh.","Bc 2: дn V� Di s琻, nh b筰 Ph秐 , l蕐 頲 M閏 Hng жnh.","Bc 3: Tr� v� X輈h Y誸 tr筰, у D� ph竧 h蕺n M閏 Hng жnh l� gi�, c莕 ph秈 甶 l蕐 l筰 M閏 Hng жnh th藅","Bc 4: Tr� l筰 V� Di s琻, nh b筰 ph秐  u M鬰, l蕐 頲 M閏 Hng жnh th藅!","Bc 5: Tr� l筰 X輈h Y誸 tr筰, giao M閏 Hng жnh th藅 cho у D�, ho祅 th祅h nhi謒 v�.")
end

function T_L40()
	Talk(5,"t_all","Ho祅 th祅h nhi謒 v� M閏 Hng жnh v� ng c蕄 t n 40, ngi c� th� ti誴 nh薾 nhi謒 v� Nh穘 K輓h Vng M穘g X�. Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� V� фng La S竧, h鋍 頲 v� c玭g V筺 чc Th鵦 T﹎, Xuy猲 Y Ph� Gi竝","Bc 1: дn Kim X� tr筰 g苝V﹏ B蕋 T�, ti誴 nh薾 nhi謒 v�, n Kim X� Huy誸 Tr筩h b総 cho V﹏ B蕋 T� 1 con Nh穘 K輓h Vng M穘g X�.","Bc 2: Trc khi 甶 v祇 Kim X� Huy誸 Tr筩h c莕 n Dc 甶誱 mua X� Hng","Bc 3: v祇 Kim X� Huy誸 Tr筩h, nh b筰 Nh穘 K輓h Vng M穘g X� ","Bc 4: Tr� v� Kim X� tr筰, giao Nh穘 K輓h Vng M穘g X� cho V﹏ B蕋 T�, ho祅 th祅h nhi謒 v�.")
end

function T_L50()
	Talk(6,"t_all","Ho祅 th祅h nhi謒 v� Nh穘 K輓h Vng M穘g X� v� ng c蕄 t n 50, ngi c� th� ti誴 nh薾 nhi謒 v� Ng鋍 san h�. Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� Co чc T玭 Gi�, h鋍 頲 v� c玭g Xuy猲 T﹎ чc Th輈h","Bc 1: дn Thanh Ng� tr筰 g苝 Thang B藅, ti誴 nh薾 nhi謒 v�, 甶 畂箃 l筰 Ng鋍 san h�.","Bc 2: дn V� Di s琻, v祇 Ng鋍 Hoa ng, nh b筰 L璾 Kh蕌, bi誸 頲 Ng鋍 san h�  b� mang v祇 Nghi謙 Long ng","Bc 3: Ti誴 t鬰 v祇 Nghi謙 Long ng, nh b筰 cng o, l蕐 頲 Ng鋍 san h�.","Bc 4: Tr� v� Thanh Ng� tr筰, giao Ng鋍 san h� cho Thang B藅, ho祅 th祅h nhi謒 v�.")
end

function T_L60()
	Talk(5,"t_all","Ho祅 th祅h nhi謒 v� Ng鋍 san h� v诞糿g c蕄 t n 50, ngi c� th� ti誴 nh薾 nhi謒 v� T輈h чc Chu. Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� U Minh Qu� S�, thu薾 l頸 xu蕋 s�.","Bc 1: дn T鎛g tr筰 g苝 gi竜 ch� H綾 Di謓 Lang Qu﹏, ti誴 nh薾 nhi謒 v�, 畂箃 l筰 T輈h чc Chu t� tay Nh筺 Хng ph竔","Bc 2: дn Nh筺 Хng s琻, v祇 Dng Gi竎 ng nh b筰 v� s�  t� Nh筺 Хng ph竔, cu鑙 c飊g chng m玭 c馻 ch髇g ph秈 l� di謓","Bc 3: Цnh b筰 Chng m玭 Nh筺 Хng ph篙, l蕐 l筰 T輈h чc Chu.","Bc 4: Tr� v� T鎛g tr筰, giao T輈h чc Chu cho H綾 Di謓 Lang Qu﹏, ho祅 th祅h nhi謒 v�.")
end

function T_return()
	Talk(3,"t_all","Th玭g qua tr飊g ph秐 s� m玭, ngi 頲 phong l� U Minh Qu� Vng, h鋍 頲 tuy謙 h鋍 tr蕁 ph竔 Ng� чc K� Kinh, v� c玭g Thi猲 Cng мa S竧, Chu C竝 Thanh Minh","Bc 1: Sau khi ng c蕄 t n c蕄 60, n T鎛g tr筰 g苝 gi竜 ch� H綾 Di謓 Lang Qu﹏, xin tr飊g ph秐 Ng� чc gi竜","Bc 2: T苙g cho m玭 ph竔 50000 lng, tr飊g ph秐 Ng� чc gi竜")
end

----------------- 结束 ---------------------------
function nothing()
end
