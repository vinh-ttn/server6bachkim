-- 翠烟帮助NPC
-- By: Dan_Deng(2003-11-21)

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "Ng筼 Mai"
	
function main(sel)
	UTask_cy = GetTask(6)
	player_faction = GetFaction()
	if (player_faction == "cuiyan") then		-- 本门弟子
		RestoreLife()		-- 本门免费治疗
		RestoreMana()
		RestoreStamina()
		Say(" Ta v鮝 ra i  b� v鴗 b�, may nh� Chng m玭 c鴘 gi髉. 18 n╩ nay l韓 l猲 t筰 y, t鮪g ng鋘 c﹜ c鋘g c� u quen thu閏.",7,"цi tho筰 v韎 Long Ng� /Uworld1000_word","T譵 hi觰 甶觧 c� b鎛 m玭/faction","T譵 hi觰 c竎 v� t� mu閕/member","T譵 hi觰 nhi謒 v� /task_get","T譵 hi觰 s� trng luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_cy >= 70*256) then				-- 本门出师
		if (UTask_cy == 80*256) and (GetTask(1) == 70*256) and (HaveMagic(93) == -1) then		-- 修正翠烟重返门派后的一个BUG，技能标记为未学“慈航普渡”
			Talk(1,""," T﹎ tr筺g c馻 t� c� ch髏 h鏽 lo筺, ng lo l緉g n鱝, b﹜ gi�  t鑤 r錳!")
		else
			Say(" S� t� kh� th� tr� v�, l莕 n祔 n th╩ t� mu閕 ta c� chuy謓 g� kh玭g?",6," l筰 chuy謓 n╩ x璦 b鎛 m玭/faction"," l筰 c竎 t� mu閕 n╩ x璦/member","Ta c遪 c� th� gi髉 g� kh玭g/task_get","T譵 hi觰 s� trng luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","Kh玭g h醝 n鱝!/nothing")
		end
	elseif (player_faction ~= "") then			-- 非本门出师、其它门派（门派不为空即指非新手）
		Say(" Xin h醝 ngi n Th髖 Y猲 m玭  th╩ th﹏ hay th╩ b筺? C� g� kh玭g bi誸 c� h醝 Ti觰 mu閕.",3,"T譵 hi觰 qu� ph竔/faction","T譵 hi觰 c竎 t� mu閕 Th髖 Y猲/member","Kh玭g h醝 n鱝!/nothing")
	else													-- 新手
		Say(" T� n th╩ vi課g hay l� b竔 s�? C� g� kh玭g hi觰 c� h醝 mu閕.",4,"T譵 hi觰 qu� ph竔/faction","T譵 hi觰 c竎 t� mu閕 Th髖 Y猲/member","T譵 hi觰 甶襲 ki謓 nh藀 m玭/task_get","Kh玭g h醝 n鱝!/nothing")
	end
end

----------------- 门派介绍部份 ----------------------------
function faction()
	Say(" Th� T� mu鑞 mu閕 gi韎 thi謚 g� v� b鎛 m玭?",5,"Kh雐 nguy猲 m玭 ph竔/F1","V� tr� a l� /F2","мa v� giang h� /F3","c s綾 m玭 ph竔/F4","Kh玭g h醝 n鱝!/nothing")
end

function F1()
	Say(" T� s� s竛g l藀 m玭 ph竔 do b� n 玭g ph� b筩, n猲 萵 c� � bi猲 gi韎 V﹏ Nam, m閠 h玬 tr猲 阯g 甶 g苝 m蕐 c� g竔 c騨g b� h蕋 h駃 ru錸g b�, nh� n ng祔 x璦, sinh l遪g tr綾 萵 n猲 mang v� nu玦 dng v� truy襫 d箉 v� c玭g. Thu� Y猲 c馻 ch髇g ta c騨g t�  m� 頲 s竛g l藀.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F2()
	Say(" N琲 y n籱 b猲 b� Nh� H秈 Thng S琻 Чi L� phong c秐h h鱱 t譶h.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F3()
	Say(" B鎛 ph竔 v� Л阯g M玭 頲 g鋓 l� 'V� L﹎ Nh� M玭', d鵤 v祇 s� th莕 b� m� danh ng giang h�, l� gi蔯 m閚g v鮝 p v鮝 m� h� c馻 c竎 trang nam t�. цi v韎 ngi ngo礽 m� n鉯 th� kh玭g ai c� th� n鉯 r� m玭 ph竔 Thu� Y猲 m玭 ch髇g ta l� thi猲 阯g hay a ng鬰.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F4()
	Say(" Do  t� c馻 b鎛 ph竔 ai c騨g l� nh鱪g tuy謙 s綾 giai nh﹏, n猲 khi課 cho c竎 nam t� u rung ng ngay c� trong m� v蒼 c遪 th蘭 mu鑞. Cho n猲 s� t� s竛g l藀 m玭 ph竔  a ra m閠 quy t綾. V�  tr竛h cho c竎  t� c馻 Thu� y猲 m玭 kh玭g b� n 玭g l鮝 g箃 v� ru錸g b�, ph祄 l� nam t� mu鑞 v祇 Thu� Y猲 m玭 th� ph秈 c� v� c玭g tuy謙 th� v� ph秈 giao ra m閠 v藅 qu� hi誱, ng th阨 i i kh玭g 頲 r阨 kh醝 Thu� Y猲 M玭.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

----------------- 成员介绍部份 ----------------------------
function member()
	Say(" Th� T� mu鑞 t譵 hi觰 v� v� t� mu閕 n祇?",11,"Chng m玭 Do穘 H祄 Y猲/Myun","H秈 Л阯g S� Gi� L� Thu Th駓/Mli","Th駓Ti猲 S� Gi� Y猲 Hi觰 Tr竔/Myan","Tng Vi S� Gi� H� M� Tuy誸 /Mhe","L� Hoa S� Gi� Chung Linh T� /Mzhong","Xu﹏ Hng b� b� /Mchun","Nhc Lan/Mruo","Phong Tr骳/Mfeng","Ti誹 C骳/Mxiao","Ng筼 Mai/Mao","Kh玭g h醝 n鱝!/nothing")
end

function Myun()
	Say("Chng m玭 Do穘 H祄 Y猲   V� tr�: Th髖 Y猲 l莡   T鋋 : 35,75<enter> Do穘 Chng m玭 l韓 l猲 t筰 Thu� Y猲 m玭, sau n祔 quen bi誸 v韎 Л阯g m玭 Л阯g Nh蕋 Tr莕, tr秈 qua nhi襲 gian kh� cu鑙 c飊g s鑞g 頲 v韎 nhau. Hi謓 t筰 Thu� Y猲 Л阯g m玭 頲 ngi i ca thng.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")

end

function Mli()
	Say("H秈 Л阯g S� Gi� L� Thu Th駓<enter> L� s� t� t輓h c竎h cao ng筼, r蕋 gh衪 n 玭g, n猲 m閠 m鵦 ph秐 i chng m玭 k誸 th﹏ c飊g v韎 Л阯g Nh蕋 Tr莕.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Myan()
	Say("Th駓 Ti猲 S� gi� Y猲 Hi觰 Tr竔, V� tr�: Th� Ng鋍 S秐h, To� : 43, 90<enter>t� khi Y猲 s� t� c遪 nh� m蓇 th﹏ b� ph� th﹏ ru錸g b�, c閚g th猰 b� b謓h hi觤 ngh蘯, b� ngi ta l╪g nh鬰 m� ch誸, t筼 ra m閠 v誸 thng s﹗ m trong l遪g t� 蕐. Cho n猲 tuy b� ngo礽 y觰 甶謚, nh璶g n閕 t﹎ r蕋 ki猲 cng. ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mhe()
	Say("Tng Vi S� Gi� H� M� Tuy誸. V� tr� t筰 s秐h B竎h Hoa. T鋋 : 52, 85<enter> H� t� t� d辵 d祅g linh ho箃, t蕋 c� c竎 t� mu閕 ch髇g ta ai c騨g u th輈h t� 蕐, nh璶g t猲 Dng H� � Thi猲 Vng bang v� th� nh� n� nc g�  m� kh玭g ng� ng祅g n H� t� t�. Th藅 ng thng. ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mzhong()
	Say("L� Hoa S� Gi� Chung Linh T�<enter>Chung mu閕 mu閕 nh� tu鎖 nh蕋, nh璶g l� ngi c� ti襫  nh蕋. Do cha m� c馻 mu閕 蕐 b� gi芻 Kim s竧 h筰, ngi th﹏ b� l璾 l筩 cho n猲 r蕋 c╩ th� gi芻 Kim, chuy猲 t﹎ luy謓 t藀 v� thu藅  i ng祔 b竜 th� cho cha m�.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mchun()
	Say("Xu﹏ Hng b� b�   V� tr�: H藆 hoa vi謓   T鋋 : 40,74<enter> Xu﹏ Hng b� b� l� a ho祅 c馻 chng m玭 l藀 ph竔, b� ta i x� v韎 ch髇g ta v� c飊g nh� nh苙 v� th﹏ thi誸.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mruo()
	Say("Nhc Lan  V� tr�: Qu穘g trng   T鋋 : 48,84  Ph� tr竎h: Giao d辌h binh kh� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mfeng()
	Say("Phong Tr骳   V� tr�: Qu穘g trng   T鋋 : 51,85   Ph� tr竎h: Giao d辌h trang b� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mxiao()
	Say("Ti誹 Уo   V� tr�: Qu穘g trng   T鋋 : 53,86   Ph� tr竎h: Giao d辌h dc ph萴",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mao()
	Say("Ng筼 Mai    y ch輓h l� ta! ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

----------------- 任务介绍部份 ----------------------------
function task_get()
	UTask_cy = GetTask(6)
	if (UTask_cy < 10*256) then	-- 未入门
		Say("<#> Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Чi M筺 У La hoa, hi謓 "..UTask_cy.."<#>.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_enroll","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_cy >= 10*256) and (UTask_cy < 20*256) then
		Say("<#> Nhi謒 v� c馻 ngi hi謓 gi� l� nhi謒 v� Th髖 V� Tr﹎, hi謓 "..UTask_cy.."<#>.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L10","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_cy >= 20*256) and (UTask_cy < 30*256) then
		Say("<#> Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Чi M筺 У La hoa, hi謓 "..UTask_cy.."<#>.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L20","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_cy >= 30*256) and (UTask_cy < 40*256) then
		Say("<#> Nhi謒 v� hi謓 gi� c馻 ngi l� V� � Ngh� Thng. Hi謓  "..UTask_cy.."<#>.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L30","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_cy >= 40*256) and (UTask_cy < 50*256) then
		Say("<#> Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Di謙 竎 B� 觤 Thng S琻, hi謓 "..UTask_cy.."<#>.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L40","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_cy >= 50*256) and (UTask_cy < 60*256) then
		Say("<#> Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� B総 tr閙 Thi猲 T莔 Th竝, hi謓 "..UTask_cy.."<#>.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L50","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_cy >= 60*256) and (UTask_cy < 70*256) then
		Say("<#> Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� B� m藅 M� cung c蕀 a, hi謓 "..UTask_cy.."<#>.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L60","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_cy >= 70*256) and (UTask_cy < 80*256) then
		Say("<#> Ngi hi謓 產ng ti誴 nh薾 l� nhi謒 v� Tr飊g ph秐 s� m玭, hi謓 "..UTask_cy.."<#>.",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_return","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	else
		Say("<#> Ngi b﹜ gi� c� th� t� do ra v祇 m玭 ph竔, t筸 th阨 kh玭g c� nhi謒 v� m韎, hi謓 "..UTask_cy.."<#>.",3,"T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	end
end

function T_all()
	Say(" Th� T� mu鑞 t譵 hi觰 nhi謒 v� n祇?",10,"Nhi謒 v� nh藀 m玭/T_enroll","Nhi謒 v� Th髖 V� tr﹎/T_L10","Nhi謒 v� Чi M筺 У La hoa/T_L20","Nhi謒 v� V� Y Ngh� Thng/T_L30","Nhi謒 v� 觤 Thng s琻 di謙 tr� 竎 B� /T_L40","Nhi謒 v� b総 cp � Thi猲 T莔 Th竝/T_L50","Nhi謒 v� m� cung c蕀 a/T_L60","Nhi謒 v� tr飊g ph秐 s� m玭/T_return","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Mu鑞 nh藀 m玭 h鋍 v�, ch� c莕 thu閏 t輓h h� Th駓, ch璦 nh藀 ph竔 kh竎 v� ng c蕄 tr猲 10, n b蕋 k� T﹏ Th� Th玭 i tho筰 v韎 Hoa s� c馻 b鎛 m玭. Sau  l莕 lt ho祅 th祅h 5 Nhi謒 v� c馻 m玭 ph竔. S� h鋍 頲 v� c玭g,頲 phong Danh hi謚.Sau khi ho祅 th祅h Nhi謒 v� xu蕋 s� s� th祅h ngh� xu蕋 s�.")
end

function T_L10()
	Talk(4,"t_all","Sau khi nh藀 m玭, ng th阨 ng c蕄 t tr猲 c蕄 10, b筺 c� th� ti誴 nh薾 nhi謒 v� Th髖 V� Tr﹎. Vt qua nhi謒 v� n祔 b筺 頲 th╪g l祄 Tam Ph萴 Hoa S�, h鋍 頲 <color=blue>Th髖 Y猲 o ph竝 v� Th髖 Y猲 song 產o<color>. ","Bc 1: T筰 <color=blue>l莡 Th髖 Y猲<color> t譵 g苝 <color=blue>chng m玭 Do穘 H祄 Y猲<color> Ti誴 nh薾 nhi謒 v� n <color=blue>c竛h r鮪g ph輆 ng nam<color> t譵 c﹜ <color=red> Th髖 V� tr﹎<color> b� m蕋. ","Bc 2: Trong khu r鮪g ph輆 ng nam nh b筰 <color=blue>H醓 h�<color> nh苩 v� c﹜ <color=red> Th髖 V� tr﹎<color> ","Bc 3: V� n <color=blue>l莡 Th髖 Y猲<color> ph鬰 m謓h v韎 chng m玭 <color=blue>Do穘 H祄 Y猲<color>, giao <color=red> Th髖 V� tr﹎<color> nhi謒 v� ho祅 th祅h ")
end

function T_L20()
	Talk(4,"t_all","Sau khi ho祅 th祅h nhi謒 v� Th髖 Y猲 tr﹎ v� ng c蕄 tr猲 20, b筺 c� th� nh薾 nhi謒 v� Чi Man У La Hoa. Vt qua nhi謒 v� n祔 b筺 s� 頲 phong l�: <color=blue>Nh� Ph萴 Hoa S�<color>, h鋍 頲 <color=red>B╪g T﹎ Tr竔 秐h<color> ","Bc 1: Trong <color=blue>Th� Ng鋍 s秐h<color>, g苝 <color=blue>Y猲 Hi觰 Tr竔<color> nh薾 nhi謒 v� 甶 n <color=blue>v竎h n骾 ph輆 t﹜ b綾<color> h竔 <color=red>10 b玭g hoa Чi Man У La<color> ","Bc 2: Khi h竔 hoa Man У La � v竎h n骾 t﹜ b綾 th� c莕 ph秈 c萵 th薾 <color=blue>trc khi c t輓h ph竧 t竛<color> ph秈 quay v� <color=blue>Th� Ng鋍 s秐h<color> gi秈 c n誹 kh玭g ch蕋 c s� ph竧 t竛 to祅 th﹏ ","Bc 3: H竔 頲 10 a Чi M筺 У La hoa, v� Th� Ng鋍 s秐h ph鬰 m謓h, ho祅 th祅h nhi謒 v�.")
end

function T_L30()
	Talk(7,"t_all","Sau khi ho祅 th祅h nhi謒 v� Чi Man У La Hoa v� ng c蕄 t tr猲 30, b筺 c� th� ti誴 nh薾 nhi謒 v� V� Y Ngh� Thng. Vt qua nhi謒 v� n祔 b筺 s� 頲 phong l�: Nh蕋 Ph萴 Hoa S� v� s� 頲 h鋍 <color=blue>V� Ф L� Hoa, Ph� V﹏ T秐 Tuy誸<color>. ","Bc 1: T筰 <color=blue>甶謓 B竎h Hoa<color>, g苝 <color=blue>H� M� Tuy誸<color> nh薾 nhi謒 v� 甶 n <color=blue>祅 l穙 n玭g<color> trong <color=blue> th祅h Чi L�<color> t譵 h醝 b� quy誸 tr錸g <color=blue> V� Y Ngh� Thng<color> ","Bc 2: дn th祅h Чi L� t譵 n 祅 l穙 n玭g ph竧 hi謓 玭g 蕐 產u bu錸 v� a ch竨 g竔 b� b鋘 th� ph� tr猲 <color=blue>觤 Thng S琻<color> b総 甶, b蘮 甶 c鴘 <color=blue>ch竨 g竔 <color> 玭g 蕐 trc. ","Bc 3: дn <color=blue>ng th� ph� � 觤 Thng s琻<color>, nh b筰 <color=blue>t猲 th� l躰h th� ph�<color>, c鴘 tho竧 a ch竨 c馻 祅 l穙 n玭g. ","Bc 4: Л頲 bi誸 c竎h tr錸g V� Y Ngh� Thng c莕 ph秈 c� <color=blue>c� Ng﹏ Tuy誸<color> s鑞g trong <color=blue>Nh� H秈<color>, <color=red>B輈h Thng Phng 謕<color> s鑞g c筺h <color=blue>H� 甶謕 Tuy襫<color>, v� <color=red>con giun t <color> � g莕 <color=blue>V﹏ N玭g nh<color>. ","Bc 5: дn Nh� H秈 t譵 <color=blue>thuy襫 gia<color> mua <color=red>c� Ng﹏ Tuy誸<color>, n b� H� 謕 Tuy襫 l蕐 頲 B輈h Thng Phng 謕, v� o l蕐 giun t  g莕 N玭g V﹏ nh ","Bc 6: V� n <color=blue>B竎h Hoa 謓<color> l蕐 b� quy誸 tr錸g c蕐 V� Y Ngh� Thng, n鉯 v韎 <color=blue>H� M� Tuy誸<color>, ng th阨 l蕐 c� Ng﹏ Tuy誸, B輈h Thng Phng 謕 v� giun t  giao cho c� 蕐, nhi謒 v� ho祅 th祅h. ")
end

function T_L40()
	Talk(5,"t_all","Ho祅 th祅h nhi謒 v� ng th阨 ng c蕄 t 40, b筺 c� th� nh薾 nhi謒 v� tr� 竎 b� 觤 Thng S琻. Vt qua nhi謒 v� n祔 b筺 s� tr� th祅h Hoa Ti猲 s� gi�, 頲 h鋍 <color=blue>H祅 B╪g H� Th﹏<color> ","Bc 1: G苝 <color=blue>Y猲 Hi觰 Tr竔<color> � <color=blue>Thi猲 謓<color>, nh薾 nhi謒 v� di謙 tr� <color=blue>竎 b�<color> cng 畂箃 thi誹 n� kh衪 ti課g trong <color=blue>th祅h Чi L�<color> ","Bc 2: дn th祅h Чi L�, t譵 <color=blue>t猲 竎 b�<color>, ph竧 hi謓 ra m閠 <color=blue>l鑙 甶 b� m藅 xu鑞g l遪g t<color> � g鉩 vn.  v祇 m藅 o nh b筰 <color=blue>tr� th� c馻 h緉<color>, gi秈 c鴘 nh鱪g thi誹 n� trong m藅 o, ng th阨 bi誸 t猲 竎 b�  b総 v礽 c� kh竎 l猲 <color=blue>觤 Thng S琻 <color> r錳. ","Bc 3: дn <color=blue>觤 Thng s琻 ng<color>, nh b筰 <color=blue>tr� th�, h� vi謓, b秓 ti猽 c馻 t猲 竎 b�<color>, l蕐 畊頲 <color=red>3 ch譨 kh鉧 m� c鯽<color>, c鴘 頲 nh鱪g <color=blue> thi誹 n�<color> b� nh鑤 trong ph遪g t鑙. ","Bc 4: V� n <color=blue>Thi猲 謓 Nga Mi<color>, g苝 Y猲 Hi觰 Tr竔 ph鬰 m謓h, nhi謒 v� ho祅 th祅h. ")
end

function T_L50()
	Talk(5,"t_all","Sau khi ho祅 th祅h nhi謒 v� 觤 Thng s琻 di謙 竎 b� v� ng c蕄 t tr猲 50, b筺 c� th� nh薾 nhi謒 v� Thi猲 T莔 Th竝. Vt qua nhi謒 v� n祔 b筺 s� tr� th祅h Hoa Tinh, h鋍 頲 <color=blue>Tuy誸 秐h <color> ","Bc 1: G苝 <color=blue>chng m玭 Do穘 H祄 Y猲<color> � <color=blue>Th髖 Y猲 L莡<color>, ti誴 nh薾 nhi謒 v�, tr� gi髉 S飊g Th竛h t� b総 <color=blue> o t芻<color>  l蕐 tr閙 <color=red>V� уng Quan <color> ","Bc 2: дn <color=blue>S飊g Th竛h t�<color> i th鋋i <color=blue>H� Vi猲 phng trng<color>, 頲 bi誸 b鋘 cp  ch箉 v祇 trong <color=blue>Thi猲 T莔 Th竝<color>. ","Bc 3:  v祇 Thi猲 T莔 Th竝, m鏸 t莕g l莡 u b竛h b筰 b鋘 o t芻, 畂箃 l筰 <color=red>V� уng Quan <color>. ","Bc 4: V� n <color=blue>Th髖 Y猲 l莡<color>, g苝 Do穘 H祄 Y猲 ph鬰 m謓h, nhi謒 v� ho祅 th祅h. ")
end

function T_L60()
	Talk(6,"t_all","Sau khi ho祅 th祅h nhi謒 v� Thi猲 T莔 Th竝 v� ng c蕄 t n 50, ngi c� th� ti誴 nh薾 nhi謒 v� C蕀 a m� cung. Ho祅 th祅h nhi謒 v� n祔, ngi 畊頲 phong l祄 Hoa Ti猲, thu薾 l頸 xu蕋 s�.","Bc 1: G苝 <color=blue>Xu﹏ Hng b� b�<color> � <color=blue>H藆 Hoa Vi猲<color>, ti誴 nh薾 nhi謒 v�, n <color=blue>C蕀 мa<color> t譵 ra s� th藅 v� l阨 truy襫 m玭 quy. ","Bc 2: u ti猲 � <color=blue>c蕀 a m� cung<color> t譵 頲 m閠 chi誧 <color=red>kh╪ l鬭<color>, sau  v祇 n v飊g c蕀 a cu鑙 c飊g l� <color=blue>筺 Trng C鑓<color> ","Bc 3: i tho筰 v韎 m閠 <color=blue>玭g l穙 v� danh<color> trong 筺 Trng C鑓, nghe 玭g 蕐 n鉯 v� nh鱪g chuy謓 c馻 v� s� t� l藀 ph竔, v� c� 頲 <color=red>b鴆 th�<color> ghi ch衟 m鋓 vi謈 ","Bc 4: Sau khi tr� l筰 <color=blue>H藆 Hoa Vi猲<color>, n鉯 cho Xu﹏ Hng b� b� nghe nh鱪g 甶襲 m譶h  t譵 ra. ","Bc 5: дn l莡 <color=blue>Th髖 Y猲<color> mang <color=red>th�<color> giao cho <color=blue>chng m玭<color>, nhi謒 v� ho祅 th祅h ")
end

function T_return()
	Talk(3,"t_all","Sau khi th祅h t礽 xu鑞g n骾, ng th阨 ng c蕄  t tr猲 60, b筺 c� th� tr飊g ph秐 s� m玭. S� 頲 th╪g l祄 Hoa Th莕, h鋍 頲 tuy謙 h鋍 tr蕁 ph竔 <color=blue>M鬰 D� L璾 Tinh, B輈h H秈 Tri襲 Sinh, v� B╪g C鑤 Tuy誸 T﹎ <color> ","Bc 1: Sau khi t ng c蕄 qu� c蕄 60, g苝 <color=blue>Do穘 H祄 Y猲<color> t筰 <color=blue> Ph遪g ch輓h<color>, c莡 xin b� cho quay v� Th髖 Y猲 ","Bc 2: Giao n筽 <color=red>50000 lng b筩<color>, tr� v� Th髖 Y猲 m玭 ")
end

----------------- 结束 ---------------------------
function nothing()
end
