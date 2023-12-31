--峨嵋派帮助NPC
-- By: Dan_Deng(2003-11-25)

Include("\\script\\global\\map_helper.lua")
npc_name = "Kh雐 g"

function main(sel)
	UTask_gb = GetTask(8)
	player_faction = GetFaction()
	if (player_faction == "gaibang") then		-- 本门弟子
		RestoreLife()		-- 本门免费治疗
		RestoreMana()
		RestoreStamina()
		Say("Ta theo C竔 bang  50 m蕐 n╩ r錳, n誹 t輓h ra th� c騨g l� s� th骳 c馻 H� Bang Ch�. C� v蕁  g� kh玭g hi觰 th� c� h醝 ta l� 頲 r錳.",6,"T譵 hi觰 vi謈 c馻 b鎛 bang/faction","T譵 hi觰 c竎 v� trong b鎛 bang/member","T譵 hi觰 nhi謒 v� /task_get","T譵 hi觰 s� trng luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 70*256) then				-- 本门出师
		Say("Ngi xu蕋 s�  m蕐 n╩, ch糿g l� v蒼 c遪 nh� 頲 nh鱪g s� gian kh� l骳  �? Kh�! Kh�! Kh�!",6," l筰 b鎛 m玭 c� s� /faction","Th╩ l筰 huynh  ng m玭/member","Ta c遪 c� th� gi髉 g� kh玭g/task_get","T譵 hi觰 s� trng luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","Kh玭g h醝 n鱝!/nothing")
	elseif (player_faction ~= "") then			-- 非本门出师、其它门派（门派不为空即指非新手）
		Say("Hoan ngh猲h n C竔 Bang! Kh玭g bi誸 c� g� ch� gi竜?",3,"T譵 hi觰 qu� bang/faction","T譵 hi觰 c竎 v� anh h飊g/member","Kh玭g h醝 n鱝!/nothing")
	else													-- 新手
		Say("C竔 Bang lu玭 hoan ngh猲h c竎 v� ng o c� c飊g ch� hng ch鑞g Kim!",4,"T譵 hi觰 qu� bang/faction","T譵 hi觰 c竎 v� anh h飊g/member","T譵 hi觰 甶襲 ki謓 nh藀 m玭/task_get","Kh玭g h醝 n鱝!/nothing")
	end
end

----------------- 门派介绍部份 ----------------------------
function faction()
	Say("V藋 th� ngi mu鑞 nghe ta gi韎 thi謚 v� b� ph薾 n祇 c馻 b鎛 bang? ",5,"Kh雐 nguy猲 C竔 bang/F1","V� tr� a l� /F2","мa v� giang h� /F3","c s綾 m玭 ph竔/F4","Kh玭g h醝 n鱝!/nothing")
end

function F1()
	Say("L辌h s� c馻 b鎛 bang  c� t� l﹗. T� l骳 s� T鑞g  c� danh x璶g 'Thi猲 h�  nh蕋 bang' r錳. Danh ch蕁 giang h�, anh t礽 c馻 b鎛 bang nh� 'Ng鋋 h� t祅g long', th阨 n祇 c騨g c�!",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F2()
	Say("Su鑤 Йng T﹜ Nam B綾, n琲 n祇 c� ╪ m祔, n琲  c� C竔 bang!",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F3()
	Say("C竔 Bang x璶g l� 'Thi猲 h�  nh蕋 bang',  g苝 kh玭g 輙 phi襫 ph鴆 v韎 gi韎 v� l﹎ Trung Nguy猲. ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F4()
	Say("N衪 c s綾 nh蕋 c馻 C竔 Bang l�: xin ╪  s鑞g, xem nh� l� gia t礽 qu� nh蕋 v藋. Gia nh藀 C竔 bang ph秈 t� b� h誸 gia s秐, ╪ xin m� s鑞g. B雐 v� s� ph﹏ b� c馻 b鎛 bang r蕋 r閚g, cho n猲 tai m総 c騨g nhi襲, tin t鴆 c鵦 k� mau l� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

----------------- 成员介绍部份 ----------------------------
function member()
	Say("Mu鑞 nghe ta gi韎 thi謚 v� n祇 trong b鎛 bang?",11,"Bang ch� H� Nh﹏ Ng� /Mhe","Ch蕄 ph竝 trng l穙 M筺h Thng Lng/Mmeng","Chng b鎛g trng l穙 La Khu玭g Sinh/Mluo","Truy襫 c玭g trng l穙 Ng魕 Li評 g/Mwei","Chng B竧 trng l穙 X� Tam Trng/Mshe","Tri謚  ch� /Mzhao","M筺h Vi詎 T礽/Myuan","Trng T竛/Mzhang","L� T� /Mli","Vng Ng� /Mwang","Kh玭g h醝 n鱝!/nothing")
end

function Mhe()
	Say("Bang ch� H� Nh﹏ Ng�   V� tr�: C竔 Bang Qu秐g trng   T鋋 : 191,231<enter>h祇 hi謕 trng ngh躠, kh� kh竔 h琻 ngi. R蕋 xem tr鋘g ngh躠 kh�, th輈h u鑞g ru. M芻 d� thng u鑞g n say t髖 l髖 nh璶g x� l� nh鱪g s� vi謈 c馻 b鎛 bang th� l筰 v� c飊g s竛g su鑤",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mmeng()
	Say("Ch蕄 ph竝 trng l穙 M筺h Thng Lng   V� tr�: C竔 Bang Qu秐g trng   T鋋 : 194,236<enter>C玭g ch輓h nghi猰 minh, ch蕄 ph竝 nh� s琻. C� l骳 x� l� gi鑞g nh� kh玭g c� t譶h ngi. V韎 huynh  trong bang kh玭g c遪 t譶h c秏 s﹗ m. g ta v� c飊g y猽 qu� M筺h Vi詎 t礽",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mluo()
	Say("Chng B鎛g trng l穙 La Khu玭g Sinh   V� tr�: C竔 Bang Qu秐g trng   T鋋 : 190,226<enter>L� ngi trung h藆, tr莔 l苙g 輙 n鉯. M閠 l阨 n鉯 ra ch綾 nh� 甶nh ng c閠. R蕋 輙 khi xu蕋 hi謓 trong b鎛 bang.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mwei()
	Say("Truy襫 c玭g trng l穙 Ng魕 Li評 g   V� tr�: C竔 Bang Qu秐g trng   T鋋 : 191,241<enter> t輓h t譶h n鉵g n秠, c� th� kh玭g tha.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mshe()
	Say("Chng B竧 trng l穙 X� Tam Trng   V� tr�: C竔 Bang Qu秐g trng   T鋋 : 189,236<enter> l� m閠 ngi b譶h d� d� g莕, thng th輈h n鉯 chuy謓 ti誹 l﹎ v韎 m鋓 ngi. L� m閠 trong nh鱪g bang ch� 頲  t� c馻 C竔 bang y猽 th輈h.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mzhao()
	Say("Tri謚 У ch�   V� tr�: Dng Ch﹗ T� V鋘g nh B綾   T鋋 : 213,177<enter> Dng Ch﹗ l�  ch� ph﹏  th� 3 � Dng Ch﹗, t輓h t譶h c萵 th薾! Nghi猰 minh ch輓h tr鵦.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Myuan()
	Say("M筺h Vi詎 T礽   V� tr�: Khu r鮪g ngo礽 C竔 Bang <enter> l�  t� 5 t骾. L� ch竨 c馻 Ch蕄 ph竝 trng l穙 M筺h Thng Lng. L� ngi tham lam h竜 danh,  t鮪g b� c竎 v� trng l穙 gi竜 hu蕁. Nh璶g h緉 l� ngi r蕋 th玭g minh, n鉯 chuy謓 r蕋 c� h鴑g th�.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mzhang()
	Say("Trng T秐   V� tr�: Qu秐g trng   T鋋 : 48,84   Ph� tr竎h: Giao d辌h binh kh� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mli()
	Say("L� T�   V� tr�: Qu秐g trng   T鋋 : 51,85   Ph� tr竎h: Giao d辌h trang b� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mwang()
	Say("Vng Ng�   V� tr�: Qu秐g trng   T鋋 : 53,86   Ph� tr竎h: Giao d辌h Dc ph萴",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

----------------- 任务介绍部份 ----------------------------
function task_get()
	UTask_gb = GetTask(8)
	if (UTask_gb < 10*256) then	-- 未入门
		Say("ngi hi謓 t筰 ch璦 nh藀 m玭, n誹 mu鑞 nh藀 m玭, ch� c莕 t譵 頲  t� ti誴 d蒼 b鎛 m玭 � b蕋 k� th玭 m韎 n祇 l� 頲,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_enroll","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 10*256) and (UTask_gb < 20*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� mua ru,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L10","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 20*256) and (UTask_gb < 30*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� gi竜 hu蕁 M筺h Vi詎 T礽,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L20","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 30*256) and (UTask_gb < 40*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� N竜 Qu� Phong Ba,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L30","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 40*256) and (UTask_gb < 50*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� b秓 v� Trng Tu蕁,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L40","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 50*256) and (UTask_gb < 60*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� Trung Nguy猲 мa H譶h у,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L50","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 60*256) and (UTask_gb < 70*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� Xu蕋 s�,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L60","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 70*256) and (UTask_gb < 80*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� Tr飊g ph秐 s� m玭,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_return","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	else
		Say("B﹜ gi� ngi c� th� t� do h祅h t萿 giang h�, t筸 th阨 ch璦 c� nhi謒 v� m韎,  頲 ghi nh� "..UTask_gb..".",3,"T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	end
end

function T_all()
	Say("Mu鑞 t譵 hi觰 nhi謒 v� g�?",10,"Nhi謒 v� nh藀 m玭/T_enroll","Nhi謒 v� mua ru/T_L10","Nhi謒 v� gi竜 hu蕁 M筺h Vi詎 T礽/T_L20","Nhi謒 v� n竜 qu� phong ba/T_L30","Nhi謒 v� b秓 h� Trng Tu蕁/T_L40","Nhi謒 v� Trung nguy猲 a /T_L50","Nhi謒 v� xu蕋 s� /T_L60","Nhi謒 v� tr飊g ph秐 s� m玭/T_return","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Mu鑞 nh藀 m玭 h鋍 ngh�, ch� thu閏 h� H醓, ch璦 gia nh藀 ph竔 kh竎 ng th阨 ng c蕄 tr猲 10, n b蕋 k� T﹏ Th� Th玭 n祇 i tho筰 v韎 е t� b鎛 ph竔.Trc ti猲 ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau  l莕 lt ho祅 th祅h 5 Nhi謒 v� c馻 m玭 ph竔. S� h鋍 頲 v� c玭g,頲 phong Danh hi謚.Sau khi ho祅 th祅h Nhi謒 v� xu蕋 s� s� th祅h ngh� xu蕋 s�!")
end

function T_L10()
	Talk(5,"t_all","Sau khi nh藀 m玭 v� ng c蕄 c馻 ngi  l猲 n c蕄 10. ngi c� th� ti誴 nh薾 nhi謒 v� 甶 Giao d辌h ru. Th玭g qua vi謈 ho祅 th祅h nhi謒 v� n祔, ngi s� 頲 th╪g l�: Ch蕄 i  t�, 頲 h鋍 v� c玭g<color=blue> C竔 Bang B鎛g Ph竝, C竔 bang quy襫 ph竝<color>. ","Bc th� nh蕋: дn ch� c馻<color=blue> Bang ch� H� Nh﹏ Ng�<color> Ti誴 nh薾 nhi謒 v�.  mua 5 lo筰 ru n鎖 ti課g: Trung Tuy襫 < color=red>, Kim L╪g Xu﹏, B竎h hoa nng, Kinh Hoa L�, Song C﹗ Чi Kh骳. <color>. ","Bc th� hai: G苝<color=blue> Dng Ch﹗ t鰑 l莡 <color> mua 頲 4 lo筰 ru, <color> nh璶g <color=red>c遪 Trung Tuy襫 t鰑<color> th�  b� T髖 B竛 Ti猲< color>n mua trc r錳 ","Bc th� ba: T譵<color=blue> 頲 T髖 B竛 Ti猲 <color>b猲 c筺h t鰑 l莡 <color=blue>. Цp 鴑g 頲 nh鱪g y猽 c莡 c馻 h緉, <color=blue>nh薾 頲 Trung Tuy襫 T鰑 ","Bc th� t�: Tr� v� <color=blue> C竔 bang <color>, g苝<color=blue>H� Nh﹏ Ng�<color>Giao n╩ lo筰 ru<color=red>cho g 蕐 <color>Ho祅 th祅h nhi謒 v� ")
end

function T_L20()
	Talk(4,"t_all","Sau khi ho祅 th祅h nhi謒 v� Giao d辌h ru v� ng c蕄 c馻 ngi  t╪g l猲 c蕄 20. ngi  c� th� ti誴 Ti誴 nh薾 nhi謒 v� gi竜 hu蕁 M筺h Vi詎 T礽.  n ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� Ch蕄 B竧  t� 頲 h鋍 v� c玭g<color=blue>H鉧 Ki誱 Vi Di<color>. ","Bc th� nh蕋: дn <color=blue> th玭 Th� L﹎<color> t譵 g苝 m閠 v�<color=blue>  t� C竔 bang<color>, ti誴 nh薾 nhi謒 v� gi竜 hu蕁 t猲 kho竎 l竎 <color=blue>M筺h Vi詎 T礽<color>. ","Bc 2: T譵 頲 M筺h Vi詎 T礽, nh b筰 h緉.","Bc th� ba: Tr� v�<color=blue>C竔 Bang<color>, g苝<color=blue>M筺h Thng Lng<color>Ph鬰 m謓h, ho祅 th祅h nhi謒 v�. ")
end

function T_L30()
	Talk(6,"t_all","Sau khi ho祅 th祅h nhi謒 v� gi竜 hu蕁 M筺h Vi詎 T礽 v� ng c蕄 c馻 ngi  t╪g l猲 30, ngi  c� th� ti誴 Ti誴 nh薾 nhi謒 v� N竜 Qu� Phong Ba.  n ho祅 th祅h nhi謒 v� n祔, ngi 頲 th╪g l� Ch蕄 B鎛g  t�. H鋍 頲 v� c玭g<color=blue>Gi竛g Long Chng; Ф C萿 Tr薾<color>. ","Bc th� nh蕋: дn g苝<color=blue>La Khu玭g Sinh<color>, ti誴 nh薾 nhi謒 v�, thay g ta n<color=blue> Dng Ch﹗ g苝 Tri謚 У ch� <color> l蕐 quy觧 s竎h m� <color=red> g ta 產ng vi誸 d�<color>. ","Bc th� hai: дn<color=blue>Dng Ch﹗ T� V鋘g ёnh<color>g苝 頲<color=blue>Tri謚 У ch�<color>, th� ra m蕐 ng祔 nay  t� c馻 Tri謚 ch� �<color=blue>Th鬰 cng s琻 <color> g﹜ n猲 nh鱪g chuy謓 n竜 lo筺, g﹜ ra l阨 m ti誹 ","Bc th� ba:  n <color=blue> Th鬰 Cng s琻 <color>, nh b筰 m ph鬰 binh <color=blue> ngi Kim<color>, c鴘 頲  t� C竔 bang<color=blue> 產ng b� ch髇g b総<color>. ","Bc th� t�: Tr� v�<color=blue>g苝<color>Tri謚  ch�. g 蕐  vi誸 xong, <color=red>quy觧 s竎h <color>, nh� ngi 甧m v� giao cho <color=blue>La Khu玭g Sinh<color>. ","Bc th� n╩: Tr� v�<color=blue>C竔 Bang<color>, giao<color=red>quy觧 s竎h<color> cho<color=blue>La Khu玭g Sinh<color>, Ho祅 th祅h nhi謒 v� ")
end

function T_L40()
	Talk(6,"t_all","Sau khi ho祅 th祅h nhi謒 v� N竜 Qu� phong ba v� ng c蕄 c馻 ngi t╪g l猲 c蕄 40, th� ngi  c� th� ti誴 nh薾 nhi謒 v� b秓 h� Trng Tu蕁. Th玭g qua vi謈 ho祅 th祅h nhi謒 v� n祔, ngi s� 頲 th╪g l� Long u  t� 頲 h鋍 v� c玭g<color=blue>ho箃 B蕋 L璾 Th�<color>. ","Bc th� nh蕋:  t譵 Truy襫 c玭g trng l穙 <color=blue>Ng魕 T� c玭g<color>, Ti誴 nh薾 nhi謒 v�: Ti猽 di謙<color=blue>b鋘 s竧 th�<color>ngi Kim 產ng <color=blue>mai ph鬰 � La Ti猽 s琻 <color>, b秓 v� <color=blue>Trng Tu蕁<color>an to祅 ","Bc th� hai: дn <color=blue> Long Quan ng � La Ti猽 s琻 <color> t譵 th蕐 v� ti猽 di謙 b鋘 s竧 th� Kim qu鑓<color=blue>產ng mai ph鬰 � <color>, ngi nh蕋 nh ph秈 l蕐 頲 m閠 b鴆 <color=red>m藅 h祄<color>. ","Bc th� ba: Tr� v� C竔 Bang<color=blue>g苝<color>Ng魕 T� g, giao<color=red> m藅 h祄 <color> cho<color=blue>Ng魕 T� g<color>, th� ra trong b鴆 m藅 h祄   vi誸 y  t猲 nh鱪g quan trong tri襲 nh c蕌 k誸 v韎 Kim qu鑓, y猽 c莡 甧m b鴆, <color=red> m藅 h祄 <color>giao cho <color=blue>Trng Tu蕁<color>. ","Bc th� t�: дn <color=blue> m閠 l� qu竛 b� m藅 � Dng Ch﹗<color>t譵 Trng Tu蕁<color=blue> <color>, giao b鴆 m藅 h祄 cho g 蕐. ","Bc th� n╩: Tr� l筰<color=blue> C竔 Bang<color>, g苝<color=blue> Ng魕 T� c玭g<color> b竜 tin, ho祅 th祅h nhi謒 v� ")
end

function T_L50()
	Talk(10,"t_all","Sau khi ho祅 th祅h nhi謒 v� b秓 h� Trng Tu蕁 v� ng c蕄 c馻 ngi  t╪g l猲 c蕄 50, th� ngi c� th� ti誴 nh薾 nhi謒 v� B秐  Trung Nguy猲.  n ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� Чi Long u. H鋍 頲 v� c玭g<color=blue> B鎛g Ф 竎 C萿; Kh竛g Long H鱱 b鑙 <color>. ","Bc th� nh蕋: дn g苝 bang ch�<color=blue>H� Nh﹏ Ng�<color> ti誴 nh薾 nhi謒 v�. giao<color=red>b鴆 b秐  Trung Nguy猲<color>mang n<color=blue>L﹎ An<color> giao cho tri襲 nh ","Bc th� hai: Trc<color=blue>c鯽 Ho祅g Cung<color>, b� v� binh ng╪ c秐, kh玭g c� l謓h b礽 th玭g h祅h th� kh玭g th� v祇 頲 Ho祅g cung ","Bc th� ba: T譵 頲 <color=blue> Trng Tu蕁 <color>, y猽 c莡 cho mn t蕀 l謓h b礽 th玭g h祅h <color=red> v祇 Ho祅g Cung<color>. ","Bc th� t�: Tr� l筰<color=blue>trc c鯽 Ho祅g Cung<color>, sau khi i tho筰 v韎 v� binh, 甶 v祇 Ho祅g Cung, g苝 l穙 th竔 gi竚<color=blue>T祇 c玭g c玭g<color>, giao <color=red>b鴆 b秐  Trung Nguy猲 <color> cho h緉 ","Bc th� n╩: Quay l筰 <color=blue> ch� <color> Trng Tu蕁, ph竧 hi謓 ra l穙 T祇 c玭g c玭g  s韒  c﹗ k誸 v韎 Kim qu鑓. B鴆 b秐    b� g箃 l蕐 m蕋 r錳 ","Bc th� s竨: L莕 th� ba quay l筰 <color=blue> c鎛g Ho祅g cung <color>, l莕 n祔 T祇 c玭g c玭g s韒  畂竛 trc, c� 頲 l謓h b礽 th玭g h祅h v蒼 kh玭g th� v祇 頲 Ho祅g Cung. ","Bc th� b秠: ngi ph秈 h鑙 l� <color=blue> t猲 ti觰 th竔 gi竚 � c鎛g b猲 <color>, 甶 v祇 Ho祅g cung l莕 n鱝 t筰 <color=blue> m閠 m藅 o � Ng� Hoa vi猲 <color> t譵 g苝 頲 <color=blue>T祇 c玭g c玭g<color>. Sau khi nh b筰 b鋘 v� s�, 畂箃 l筰< color=red>B秐  Trung Nguy猲<color>. ","Bc th� t竚: ngi quay l筰 <color=blue> g苝 <color>Trng Tu蕁, a<color=red>b鴆 B秐  Trung Nguy猲 <color>cho g ta. ","Bc th� ch輓: Tr� v�<color=blue>C竔 Bang<color>, g苝<color=blue>H� Nh﹏ Ng�<color> b竜 tin, ho祅 th祅h nhi謒 v�. ")
end

function T_L60()
	Talk(4,"t_all","Ho祅 th祅h nhi謒 v� Trung Nguy猲 a  v� ng c蕄 tr猲 50, ngi c� th� ti誴 nh薾 nhi謒 v� xu蕋 s�. Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l祄 Ti猽 Dao Th莕 C竔, thu薾 l頸 xu蕋 s�.","Bc th� nh蕋: дn g苝 Chng B竧 trng l穙 <color=blue>X� tam Trng<color> ti誴 nh薾 nhi謒 v�, <color=blue>Tng V﹏ ng<color> t譵<color=red>9 c竔 t骾 v秈<color>. ","Bc th� hai: V祇<color=blue>Tng V﹏ ng<color>t譵 trong m閠 c竔 B秓 rng<color=blue>t譵 頲<color>, 9 c竔<color=red>t骾 v秈<color>. ","Bc th� ba: Tr� l筰<color=blue>C竔 Bang <color>, giao <color=red> 9 c竔 t骾 v秈 <color>giao cho Chng B竧 trng l穙 <color=blue>X� tam Trng, <color>, ho祅 th祅h nhi謒 v� ")
end

function T_return()
	Talk(3,"t_all","Th玭g qua Tr飊g ph秐 s� m玭, ngi 頲 th╪g l� trng l穙 9 t骾. H鋍 頲 Tuy謙 H鋍 ch輓h ph竔<color=blue>: Ti猽 di猽 c玭g v� T髖 甶謕 cu錸g v�<color>. ","Bc th� nh蕋: Sau khi ng c蕄 c馻 ngi  vt qua 60, ngi 甶 g苝 bang ch�<color=blue>H� Nh﹏ Ng�<color>, xin 頲 quay l筰 C竔 bang ","Bc th� hai: Th玭g qua ng g鉷<color=red>50000 lng b筩 tr緉g <color>, quay l筰 C竔 Bang ")
end

----------------- 结束 ---------------------------
function nothing()
end
