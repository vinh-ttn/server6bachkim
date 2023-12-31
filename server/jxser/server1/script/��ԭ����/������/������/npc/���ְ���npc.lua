-- 少林派帮助NPC
-- By: Dan_Deng(2003-12-01)

function main(sel)
	UTask_sl = GetTask(7)
	player_faction = GetFaction()
	if (player_faction == "shaolin") then		-- 本门弟子
		RestoreLife()		-- 本门免费治疗
		RestoreMana()
		RestoreStamina()
		Say("B鎛 t�  c� t� ng祅 n╩ l辌h s�, v� phng di謓 v� ngh� c� th� n t譵 Phng trng hay c竎 v� th� t鋋 m� h醝, c遪 v蕁  kh竎 c� th� n h醝 b莕 t╪g l� 頲.",4,"T譵 hi觰 甶觧 c� b鎛 m玭/faction","T譵 hi觰 c竎 v� t玭 trng/member","T譵 hi觰 nhi謒 v� /task_get","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_sl >= 70*256) then				-- 本门出师
		Say("L骳 trc ngi t� M閏 Nh﹏ H筺g n La H竛 Tr薾 trong kho秐 th阨 gian r蕋 ng緉, b﹜ gi� h藆 b鑙 ai c騨g noi gng ngi, mau 甶 xem c竎 s�  甶.",4," l筰 chuy謓 n╩ x璦 b鎛 m玭/faction","Nh譶 l筰 o h鱱 n╩ x璦/member","Ta c遪 c� th� gi髉 g� kh玭g/task_get","Kh玭g h醝 n鱝!/nothing")
	elseif (player_faction ~= "") then			-- 非本门出师、其它门派（门派不为空即指非新手）
		Say("Hoan ngh猲h n v韎 Thi誹 L﹎! C竎 v� c� th� t� t骳 du ngo筺 trong t�. C� v蕁  g� th� c� n h醝 l穙 n筽.",3,"T譵 hi觰 qu� ph竔/faction","T譵 hi觰 c竎 v� o trng/member","Kh玭g h醝 n鱝!/nothing")
	else													-- 新手
		Say("Hoan ngh猲h n v韎 Thi誹 L﹎ T�! Kh玭g bi誸 n b竔 s� hay l� Ph藅 v藋?",4,"T譵 hi觰 qu� ph竔/faction","T譵 hi觰 c竎 v� o trng/member","T譵 hi觰 甶襲 ki謓 nh藀 m玭/task_get","Kh玭g h醝 n鱝!/nothing")
	end
end

----------------- 门派介绍部份 ----------------------------
function faction()
	Say("Ngi mu鑞 bi誸 v� b� ph薾 n祇 trong Thi誹 L﹎ y?",5,"Kh雐 nguy猲 m玭 ph竔/F1","V� tr� a l� /F2","мa v� giang h� /F3","c s綾 m玭 ph竔/F4","Kh玭g h醝 n鱝!/nothing")
end

function F1()
	Say("B鎛 t� 頲 s竛g l藀 t筰 B綾 Ng魕 Hi誹 V╪ д Th竔 H遖 Th藀 C鰑 Ni猲 (C玭g nguy猲 49 n╩) . Thi猲 Tr骳 t╪g nh﹏ B箃 У t� T﹜ V鵦 n Trung Nguy猲, do Hi誹 V╪ д t筰 Thi誹 Th蕋 S琻 x﹜ d鵱g l猲 ch颽 Thi誹 L﹎  cung dng. 30 n╩ sau, Nam Thi猲 Tr骳 t╪g nh﹏ B� б Чt Ma n Thi誹 L﹎ T�, chi猽 n筽  t�, truy襫 th� Thi襫 T玭g, ch輓h v� th�  tr� th祅h Ph藅 gi竜 Thi襫 T玭g khai s琻 T� S�.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F2()
	Say("B鎛 t� n籱 t筰 T豱h H� Nam Tung S琻, Tung S琻 l� do c竎 d穣 n骾 h譶h th祅h, b猲 Йng l� Th竔 Th蕋 S琻, b猲 T﹜ l� Thi誹 Th蕋 S琻, m鏸 b猲 c� 16 nh, nh n祇 c騨g n鎖 danh, b鎛 t� t鋋 l筩 t筰 Tr骳 L﹎ Mao Th蕋, Thi誹 Th蕋 S琻 Ng� Nhu Phong H�, c� danh 'Thi誹 L﹎'.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F3()
	Say("B鎛 ph竔 t� trc gi� 頲 x璶g t鬾g l� v� l﹎  nh蕋 m玭 ph竔, 頲 xem l� Th竔 S琻 B綾 u c馻 V� L﹎ Trung Nguy猲. T╪g ch髇g trong Thi誹 L﹎ T� x璦 nay c� truy襫 th鑞g h鋍 v�, v韎 '72 tuy謙 k� c馻 Thi誹 L﹎'  vang danh thi猲 h�.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F4()
	Say("B鎛 ph竔 c� truy襫 th鑞g b竔 Ph藅 v� luy謓 v�,  t� trong m玭 v� c玭g cao si猽, l筰 c� t輓h ngh躠 hi謕. е t� b鎛 ph竔 l� nam gi韎 ph﹏ ra c�  t� xu蕋 gia v�  t� t鬰 gia hai lo筰, xu蕋 gia  t� tu luy謓 trong t�, c遪 t鬰 gia  t� ph﹏ r秈 r竎 kh緋 n琲, h祅h hi謕 trng ngh躠.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

----------------- 成员介绍部份 ----------------------------
function member()
	Say("Ngi mu鑞 bi誸 v蕁  g� c馻 b鎛 t�?",9,"Phng Trng Huy襫 Nh﹏ i s� /M01","Чt Ma 阯g u t鋋 Huy襫 Bi/M02","B祅 Nhc 阯g u t鋋 Huy襫 Gi竎/M03","T祅g Kinh c竎 u t鋋 Huy襫 T� /M04","La H竛 阯g u t鋋 Huy襫 Nan/M05","Tr鮪g M筩/M101","Tr鮪g Ti誸/M102","Tr鮪g Vi/M103","Kh玭g h醝 n鱝!/nothing")
end

function M01()
	Say("phng trng Huy襫 Nh蕋 i s�  V� tr�: phng trng Thi襫 ph遪g  T鋋 : 230,184<enter> Tr� tu� xu蕋 ch髇g, v� ngh� cao cng, khi猰 nhng  lng ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M02()
	Say("Чt Ma Л阯g u t鋋 Huy襫 Bi  V� tr�: Чt Ma Л阯g  T鋋 : 210,188<enter> L� ngi thi誸 di謓 v� t�, c玭g ch輓h nghi猰 minh, tuy c� l骳 h琲 gi竜 甶襲 nh璶g r蕋 頲 c竎  t� y猽 qu� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M03()
	Say("B祅 Nhc 阯g u t鋋 Huy襫 Gi竎  V� tr�: h� Ph鉵g sinh  T鋋 : 220,193<enter> C╩ gh衪 c竔 竎, t輓h n鉵g nh� l鯽, kh秐g kh竔 h祇 hi謕",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M04()
	Say("Ch� t鋋 T祅g Kinh c竎 Huy襫 T�       V� tr�: T祅g Kinh c竎       T鋋 : 218,190<enter> c� t礽 thao lc, th玭g bi誸 m鋓 s�, l� m閠 con m鋞 s竎h, l� ngi th輈h h遖 b譶h, gh衪 tranh u v韎 ngi kh竎, ph祄 chuy謓 g� c騨g l蕐 ch� nh蒼 l祄 u, c� l骳 h琲 c� h� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M05()
	Say("La H竛 阯g u t鋋 Huy襫 Nan  V� tr�: La H竛 Л阯g  T鋋 : 201,192<enter> Tr鋘g quan ni謒 a v� x� h閕, l� ngi cao ng筼, tranh cng h竜 th緉g, lu玭 mu鑞 c飊g Чt Ma vi謓 th� t鋋 Huy襫 Bi tranh t礽 cao th蕄. ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M101()
	Say("Tr鮪g M筩  V� tr�: Qu穘g trng  T鋋 : 211,196  Ph� tr竎h: Giao d辌h binh kh� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M102()
	Say("Tr鮪g Ti誸  V� tr�: Qu穘g trng  T鋋 : 209,194  Ph� tr竎h: Giao d辌h trang b� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function M103()
	Say("Tr鮪g Vi  V� tr�: Qu穘g trng  T鋋 : 208,195  Ph� tr竎h: Giao d辌h Dc ph萴",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

----------------- 任务介绍部份 ----------------------------
function task_get()
	UTask_sl = GetTask(7)
	if (UTask_sl < 10*256) then	-- 未入门
		Say("Ngi hi謓 ch璦 nh藀 m玭, mu鑞 nh藀 m玭 n c竎 T﹏ Th� th玭 g苝 е t� ti誴 d蒼",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_enroll","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_sl >= 10*256) and (UTask_sl < 20*256) then
		Say(" Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� M閏 Nh﹏ H筺g",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L10","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_sl >= 20*256) and (UTask_sl < 30*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Di nh﹏",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L20","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_sl >= 30*256) and (UTask_sl < 40*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Th竝 l﹎ nghi tung",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L30","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_sl >= 40*256) and (UTask_sl < 50*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� T辌h Di謙 Nh� T╪g",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L40","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_sl >= 50*256) and (UTask_sl < 60*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� D辌h C鑤 Kinh",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L50","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_sl >= 60*256) and (UTask_sl < 70*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� La H竛 Tr薾,",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L60","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_sl >= 70*256) and (UTask_sl < 80*256) then
		Say("Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Tr飊g ph秐 s� m玭",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_return","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	else
		Say("Ngi c� th� t� do ra v祇 m玭 ph竔, t筸 th阨 kh玭g c� nhi謒 v� m韎",3,"T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	end
end

function T_all()
	Say("Mu鑞 t譵 hi觰 nhi謒 v� g�?",10,"Nhi謒 v� nh藀 m玭/T_enroll","Nhi謒 v� M閏 Nh﹏ h筺g/T_L10","Nhi謒 v� Di nh﹏/T_L20","Nhi謒 v� Th竝 L﹎ nghi tung/T_L30","Nhi謒 v� T辌h Di謙 Nh� t╪g/T_L40","Nhi謒 v� D辌h C鑤 Kinh/T_L50","Nhi謒 v� La H竛 tr薾/T_L60","Nhi謒 v� tr飊g ph秐 s� m玭/T_return","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Mu鑞 nh藀 m玭 h鋍 ngh�, ch� c莕 thu閏 h� Kim v� t c蕄 10. дn i tho筰 v韎  t� ti誴 d蒼 Thi誹 l﹎ t筰 c竎 T﹏ th� th玭 l� 頲. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h nhi謒 v� c馻 m玭 ph竔. S� h鋍 頲 v� c玭g, 頲 phong Danh hi謚. Sau khi ho祅 th祅h nhi謒 v� xu蕋 s� l� c� th� xu蕋 s�.")
end

function T_L10()
	Talk(4,"t_all","Sau khi nh藀 m玭 v� t n c蕄 10, c� th� ti誴 nh薾 nhi謒 v� M閏 Nh﹏ h筺g. Ho祅 th祅h nhi謒 v� n祔, ngi s� 頲 phong l� H� Vi謓 V� T╪g, h鋍 頲 v� c玭g Thi誹 L﹎ Quy襫 ph竝, Thi誹 L﹎ C玭 ph竝, Thi誹 L﹎ o ph竝.","Bc 1: дn Thi襫 ph遪g g苝 phng trng, ti誴 nh薾 nhi謒 v� M閏 Nh﹏ h筺g, 甶 l蕐 Kim Li猲 hoa.","Bc 2:  v祇 h蝝 M閏 nh﹏, nh b筰 M閏 nh﹏, s� c� 30% c� h閕 l蕐 頲 Kim Li猲 hoa.","Bc 3: Tr� l筰 Thi襫 ph遪g giao Kim Li猲 hoa cho Huy襫 Nh﹏ phng trng, ho祅 th祅h nhi謒 v�.")
end

function T_L20()
	Talk(4,"t_all","Sau khi ho祅 th祅h nhi謒 v� M閏 nh﹏ h筺g v� t n c蕄 20, ngi c� th� ti誴 nh薾 nhi謒 v� Man Di. Ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� H� Tr� Kim Cang, h鋍 頲 v� c玭g B蕋 чng Minh Vng","Bc 1: дn Чt Ma Л阯g g苝 Huy襫 Bi, ti誴 nh薾 nhi謒 v�, n Ph鬰 Ng璾 s琻 T﹜ gi竜 hu蕁 5 t猲 Man Di.","Bc 2: дn Ph鬰 Ng璾 s琻 T﹜, l莕 lt nh b筰 5 t猲 Man Di.","Bc 3: Tr� l筰 Чt Ma Л阯g, g苝 Huy襫 Bi ph鬰 m謓h, ho祅 th祅h nhi謒 v�.")
end

function T_L30()
	Talk(5,"t_all","Sau khi ho祅 th祅h nhi謒 v� Man Di v� t n tr猲 c蕄 30, ngi c� th� ti誴 nh薾 nhi謒 v� Th竝 L﹎ Nghi Tung. Ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� H� ph竝 La H竛, h鋍 頲 v� c玭g La H竛 Tr薾","Bc 1: дn h� Ph鉵g sinh g苝 Huy襫 Gi竎, ti誴 nh薾 nhi謒 v�, n Th竝 L﹎ nh b筰 nh鱪g k� c� h祅h tung m� 竚.","Bc 2: дn Th竝 L﹎, nh b筰 b鋘 ch髇g, ph竧 hi謓 b鋘 ch髇g ch輓h l� gi竛 甶謕 c馻 Kim Qu鑓, ng ng b鋘 ch髇g  nh c緋 'B竧 Nh� T﹎ Kinh', ch箉 n Kim Quang чng.","Bc 3: дn Kim Quang чng, nh b筰 gi竛 甶謕 Kim Qu鑓, 畂箃 l筰 'B竧 Nh� T﹎ Kinh'.","Bc 4: Quay l筰 h� Ph鉵g sinh, giao 'B竧 Nh� T﹎ Kinh' cho Huy襫 Gi竎, ho祅 th祅h nhi謒 v�.")
end

function T_L40()
	Talk(6,"t_all","Sau khi ho祅 th祅h nhi謒 v� Th竝 L﹎ Nghi Tung v� t tr猲 c蕄 40, ngi c� th� ti誴 nh薾 nhi謒 v� T辌h Di謙 Nh� T╪g. Ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� Truy襫 Kinh La H竛, h鋍 頲 v� c玭g S� T� H鑞g","Bc 1: дn Phng Trng Thi襫 Ph遪g g苝 Huy襫 Nh﹏ Phng Trng, ti誴 nh薾 nhi謒 v�, t譵 T辌h Di謙 nh� th莕 t╪g th豱h gi竜 chuy謓 thi猲 h� c鬰 th�.","Bc 2: дn M藅 Th蕋 ph輆 sau n骾, tr� l阨 ch輓h x竎 c﹗ h醝  v祇 m藅 th蕋.","Bc 3: Цnh b筰 b鋘 ngi ng trong m藅 th蕋, c� th� m� c鯽 s� bi誸 頲 kh萿 quy誸  n鉯 chuy謓 v韎 Nh� T╪g.","Bc 4: дn ph輆 trc c鯽 s� nh� cu鑙 M藅 Th蕋, c ch輓h x竎 kh萿 quy誸, th豱h gi竜 thi猲 h� c鬰 th� t� Nh� T╪g.","Bc 5: Quay l筰 Phng Trng Thi襫 Ph遪g, truy襫 t ch輓h x竎 甶襲 Nh� T╪g  n鉯 cho Huy襫 Nh﹏ phng trng nghe, ho祅 th祅h nhi謒 v�. N誹 qu猲, c� th� 甶 th豱h gi竜 l筰.")
end

function T_L50()
	Talk(6,"t_all","Sau khi ho祅 th祅h nhi謒 v� T辌h Di謙 Nh� T╪g v� t tr猲 c蕄 50, ngi c� th� ti誴 nh薾 nhi謒 v� D辌h C鑤 Kinh. Ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� Ph鬰 Ma Thi猲 Vng, h鋍 頲 v� c玭g Ma Ha V� Lng, Long Tr秓 H� Tr秓, Ho祅h T秓 L鬰 H頿","Bc 1: дn T祅g Kinh C竎 g苝 Huy襫 T�, ti誴 nh薾 nhi謒 v�, t譵 Tr鮪g Vi詎 li襲 m筺g l蕐 l筰 'D辌h C鑤 Kinh' trong T祅g Kinh C竎.","Bc 2: дn khu luy謓 v� i tho筰 v韎 Ti觰 h遖 thng Tr鮪g T﹎, bi誸 頲 c� th� d飊g m閠 con g� quay  Tr鮪g t﹎ n鉯 ra b� m藅 c馻 Tr鮪g Vi詎.","Bc 3: дn T鰑 l莡 � Bi謓 Kinh mua m閠 con g� quay, sau  quay l筰 t譵 Tr鮪g T﹎ bi誸 頲 b� m藅.","Bc 4: C╪ c� l阨 n鉯 c馻 Tr鮪g T﹎, n t譵 di t秐g  to trong r鮪g t飊g sau n骾 l蕐 頲 'D辌h C鑤 Kinh'.","Bc 5: Quay l筰 T祅g Kinh C竎, giao 'D辌h C鑤 Kinh' cho Huy襫 T�, ho祅 th祅h nhi謒 v�.")
end

function T_L60()
	Talk(4,"t_all","Sau khi ho祅 th祅h nhi謒 v� D辌h C鑤 Kinh v� t tr猲 c蕄 50, ngi c� th� nh薾 nhi謒 v� La H竛 tr薾. Ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� V� Lng Th輈h T玭, thu薾 l頸 xu蕋 s�.","Bc 1: дn La H竛 Л阯g g苝 Huy襫 Nan, ti誴 nh薾 nhi謒 v�, v祇 La H竛 Tr薾 l蕐 b鑞 t輓 v藅: tr祅g h箃, thi襫 trng, M閏 ng� v� b竧 nh� s�.","Bc 2: V祇 La H竛 Tr薾, nh b筰 qu竔 v藅 l蕐 頲 b鑞 t輓 v藅.","Bc 3: Quay l筰 La H竛 Л阯g, giao t輓 v藅 cho Huy襫 Nan, ho祅 th祅h nhi謒 v�.")
end

function T_return()
	Talk(3,"t_all","Sau khi ho祅 th祅h nhi謒 v� Tr飊g ph秐 s� m玭, ngi 頲 phong l� H� Ph竝 Trng L穙, h鋍 頲 v� c玭g tr蕁 ph竔 D辌h C﹏ Kinh, Nh� Lai Thi猲 Di謕","Bc 1: Sau khi t c蕄 60 tr� l猲, n Phng Trng Thi襫 Ph遪g g苝 Huy襫 Nh﹏ Phng Trng, xin tr飊g ph秐 Thi誹 L﹎ ph竔.","Bc 2: Giao n閜 50000 lng b筩, tr飊g ph秐 Thi誹 L﹎ ph竔.")
end

----------------- 结束 ---------------------------
function nothing()
end
