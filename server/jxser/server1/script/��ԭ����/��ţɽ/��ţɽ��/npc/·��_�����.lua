-- 中原北区 伏牛山 伏牛山西 路人_洛九天.lua　（拳倾天下任务(野球拳任务)）
-- By: Dan_Deng(2004-05-24)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub1 = GetTask(52)
	U75_sub2 = GetTask(53)
	U75_sub3 = GetTask(54)
	U75_sub4 = GetTask(55)
	U75_sub5 = GetTask(56)
--	if (Uworld75 < 10) and (GetLevel() >= 30) and (GetCamp() == 0) and (GetReputeLevel(GetRepute()) >= 3) then		-- 任务启动
--		Talk(10,"U75_get","洛九天：拳法天，掌法地，指法心。夕日龙战于野，卫老一拳得天地灵气，劲由心生，顿时王霸之气奔涌，破巨龙于无形，拳试天下！邃改名卫天下，拳名野球。","玩家：请问尊驾刚刚念的是什么？在下为何在四书五经中从未见识。","洛九天：呵，小侠不知，此乃前代武林神话“拳豪”卫天下的自传。","玩家：在下曾听说前代武林四奇中的“一枪屠龙”龙追舞擅使杀龙枪法，不知先生所说大侠可与之功法相似？","洛九天：哈哈哈哈……龙氏小儿，岂可与酷月争辉。卫老当年扁舟渡海，于蓬莱大战神龙，在澎湃自然中领悟野球拳法，三招绝杀恶龙。实为古今第一人，那是何等的豪勇！龙小子枪名屠龙，恐怕连龙的影子都没见过。","玩家：没想到江湖中还有如此厉害的人物，为何从未听说？","洛九天：卫老以天下为重，又怎会在这种跳梁小丑的舞台中出现。更何况当年拳试天下后，江湖黑道心胆俱裂，惶惶不可终日。几十年的太平盛世，又怎值得卫先生再出拳。","玩家：居然有如此奇招？不知大侠可晓得此套拳谱下落。","洛九天：不才洛某，正是先师弟子，也曾习得皮毛。","玩家：啊！望先生教我！")
	if (Uworld75 == 10) and (U75_sub1 == 20) and (U75_sub2 == 20) and (U75_sub3 == 20) and (U75_sub4 == 20) and (U75_sub5 == 20) and (HaveItem(384) == 1) then			-- 任务完成
		DelItem(384)
		Talk(2,"U75_prise","H秓 ti觰 t�! Qu� nhi猲 ta kh玭g nh譶 l莔 ngi! дn y n祇! H鋍 nhanh th玦."," V� h鋍 nh蕋 o, thi猲 ngo筰 h鱱 thi猲. Ngi ph秈 kh玭g ng鮪g luy謓 t藀, b猲 c筺h c� c竔 bia th� c玭g phu c� th� th� c玭g l鵦. Ch� c莕 tung m閠 quy襫 c� th� nh v� n�, l骳  quy襫 n╪g c馻 ngi  thu閏 v祇 b薱 th莕 ti猲 c馻 thi猲 h� r錳. ")
	elseif (Uworld75 == 10) and (HaveItem(384) == 0) then			-- 任务中，信丢了
		AddEventItem(384)
		Msg2Player("L筰 nh薾 頲 b鴆 th� gi韎 thi謚 c馻 L筩 C鰑 Thi猲. ")
		Talk(1,"","C� l祄 m蕋 th� n祔, sao c� th� l祄 chuy謓 l韓 頲? Th玦 頲, cho ngi th猰 m閠 c� h閕 n鱝, ta vi誸 l筰 m閠 b鴆 th� kh竎 cho ngi, nh� ng l祄 m蕋 n鱝 nh�!")
	elseif (Uworld75 == 10) then
		Talk(1,""," Trc ti猲 ngi ph秈 vt qua n╩ s�  kh竎, ta m韎 c� th� d箉 cho ngi!")
	elseif (Uworld75 == 255) then
		Talk(1,""," D� C莡 Quy襫 ph秈 luy謓 t藀 h祅g ng祔 m韎 c� th� luy謓 th祅h t礽 頲, ngi c莕 c� l遪g nh蒼 n筰.")
	else
		Talk(1,""," Quy襫 Ph竝 Thi猲, Chng Ph竝 мa, Ch� Ph竝 T﹎. Quy襫 Ph竝....kh� nh� qu�!")
	end
end;

function U75_get()
	Say(" B� quy襫 ph竝 n祔 kh玭g th� c飊g luy謓 t藀 v韎 c竎 chi猽 n閕 c玭g kh竎. N誹 ngi mu鑞 gia nh藀 v祇 c竎 m玭 ph竔 kh竎, th� kh玭g th� h鋍 頲. Ngi  c﹏ nh綾 k� ch璦?",2,"Ta  ngh� k� r錳, h穣 cho ta h鋍 D� C莡 Quy襫. /U75_get_yes","в ta suy ngh� l筰!/no")
end

function U75_get_yes()
	Talk(5,"U75_go","T筰 mu鑞 h鋍 D� C莡 Quy襫, kh玭g mu鑞 nh藀 ph竔 kh竎."," Ha ha! ng l� Thi猲 t� k� t礽! Ta th蕐 g﹏ c鑤 ngi r蕋 kh醗, th藅 hi誱 c� tr猲 ch鑞 giang h�. Nh璶g t蕋 ph秈 nh� n c竎 huynh  kh竎 m韎 c� th� d箉 ngi 頲."," t� S� ph�! ","� y ta c� m閠 b鴆 th�, ngi 甧m n Th祅h Й, Чi L�, Phng Tng, Bi謓 Kinh t譵 Phng Th輈h, Hoa N玭g, Th竔 i th骳, Ph� Nam B╪g v� Trng Tu蕁. N╩ ngi n祔 c� v� u  ng � cho ngi luy謓 t藀 k� n╪g n祔. ","V﹏g! S� b�.")
end

function U75_go()
	Talk(1,""," Л阯g 甶 r蕋 hi觤 tr� kh� kh╪, ngi n猲 chu萵 b� k�. T� x璦 n nay nh鱪g ngi l祄 n猲 nghi謕 l韓, ch璦 ai l� ch璦 t鮪g n誱 qua 產u kh�. ")
	AddEventItem(384)				-- 洛九天介绍信
	SetTask(75,10)
	SetTask(52,0)					-- 子变量初始化
	SetTask(53,0)
	SetTask(54,0)
	SetTask(55,0)
	SetTask(56,0)
	AddNote("Nh薾 nhi謒 v� Quy襫 Khuynh Thi猲 H�: C莔 th� gi韎 thi謚 c馻 L筩 C駏 Thi猲, 甶 Th祅h Й t譵 phng Th輈h, Чi L� t譵 Hoa N玭g, Phng Tng t譵 Th竔 i th骳, Bi謓 Kinh t譵 Ph� Nam B╪g, L﹎ An t譵 Trng Tu蕁, c莡 h鋍 D� C莡 Quy襫. ")
	Msg2Player("Nh薾 nhi謒 v� Quy襫 Khuynh Thi猲 H�: C莔 th� gi韎 thi謚 c馻 L筩 C駏 Thi猲, 甶 Th祅h Й t譵 phng Th輈h, Чi L� t譵 Hoa N玭g, Phng Tng t譵 Th竔 i th骳, Bi謓 Kinh t譵 Ph� Nam B╪g, L﹎ An t譵 Trng Tu蕁, c莡 h鋍 D� C莡 Quy襫. ")
end

function U75_prise()
	Talk(1,"","е t� xin nh薾 l阨 ch� d箉.")
	DelItem(384)
	SetTask(75,255)
	AddRepute(30)
	if (HaveMagic(395) == -1) then		-- 必须没有技能的才给技能
		AddMagic(395)
	end
	AddNote("Nhi謒 v� Quy襫 Khuynh Thi猲 H�: Nhi謒 v� ho祅 th祅h, h鋍 頲 k� n╪g D� C莡 Quy襫, danh v鋘g c馻 b筺 t╪g th猰 30 甶觤. ")
	Msg2Player("Nhi謒 v� Quy襫 Khuynh Thi猲 H�: Nhi謒 v� ho祅 th祅h, h鋍 頲 k� n╪g D� C莡 Quy襫, danh v鋘g c馻 b筺 t╪g th猰 30 甶觤. ")
end

function no()
end
