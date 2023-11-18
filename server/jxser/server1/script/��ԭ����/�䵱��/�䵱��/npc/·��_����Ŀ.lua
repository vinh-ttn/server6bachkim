-- 中原南区\武当派\武当派\npc\路人_李天目.lua
-- by xiaoyang(2004\4\15) 武当90级任务

Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
Uworld129 = GetTask(129)
Uworld31 = GetByte(GetTask(31),1)
	if (Uworld129 < 10) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~="wudang") and (Uworld31 ==127) then
		Talk(2,"Uworld129_interchange","L� o trng tu鎖 tr� t礽 cao! T筰 h� ngng m�  l﹗! Xin 頲 th豱h gi竜!","N誹 n鉯 n si m� v� h鋍, c� V� ng n祔 kh玭g ai h琻 s�  Chu V﹏ Tuy襫. Ngi h穣 甶 t譵huynh 蕐 甶!")
   elseif (Uworld129 == 20)then
   	Talk(9,"Uworld129_interchange2"," L� i hi謕! T筰 h� mu鑞 l猲 n骾 h鋍 v�. S� huynh Chu V﹏ Tuy襫 b秓 t玦 n t譵 玭g.","Чi hi謕 ta kh玭g d竚 nh薾!","V藋 �? Sao T筰 h� kh玭g c秏 th蕐 v藋?","H玬 nay g苝 nhau, xem nh� l� c� duy猲 ph薾 v藋!","T筰 h� mu鑞 th豱h gi竜 L� huynh quan 甶觤 v� n閕 ngo筰 gia?","N閕 t鴆 ngo筰 l鵦 ph秈 tng h頿, l鵦 do kh� sinh, kh� nh﹏ l鵦 d騨g, ph鑙 h頿 l蒼 nhau. X衪 t� m鬰 ch c馻 ngi h鋍 v� m� n鉯, v蒼 l� l蕐 kh� l祄 ch�. Luy謓 kh� ch� luy謓 t﹎, t﹎ t辬h t綾 sinh, v� d鬰 t綾 cng","Л頲 nghe nh鱪g l阨 , 総 h糿 ph秈 m蕋 10 n╩ n s竎h!","C竎 h� tu鎖 tr� t礽 cao, h� t蕋 ph秈 khi猰 t鑞 nh� v藋!","Th藅 s� Chu huynh qu� xem tr鋘g t筰 h�! T筰 h� s� c� g緉g!")
	elseif (Uworld129 == 40)then
		Talk(10,"Uworld129_interchange3","Chu huynh b蕋 ng� nh薾 頲 th� nh�,  xu鑞g n骾 r錳! Ta n  b竜 l筰 cho ngi.","Th� nh�? Ngi  t鮪g xem qua n閕 dung ch璦?","Чi kh竔 s� huynh n鉯 cha m� � nh� r蕋 nh�, n猲 l藀 t鴆 xu鑞g n骾 1 chuy課.","H醤g r錳! ","Sao?","Trc y Chu s� huynh t� nh� l猲 n骾,  r蕋 l﹗ kh玭g li猲 h� ngi nh�. L骳 T鑞g Kim giao binh, thi猲 h� i l鋋n, nh﹏ d﹏ l莔 than. S� ph�  ph竔 ngi 甶襲 tra, nh璶g kh玭g c� tin t鴆 c馻 cha m� s� huynh. L� th�  c� th� l� gi�.","V藋 th� n祇 m韎 l� t鑤!","May nh� C竎 h� th玭g b竜 k辮 th阨, b﹜ gi� v蒼 c遪 k辮. Ngi h穣 n Ph鬰 Ng璾 s琻, ﹎ th莔 b秓 v� Chu s� huynh.","T筰 h�  nghe danh V� ng t� l﹗,c� th� c� c� h閕 gi髉  th藅 l� vinh h筺h!","Theo l阨 trong th� n鉯 nh� Chu huynh � c筺h Thi猲 T﹎ ng.")
	elseif (Uworld129 == 60) and (GetFaction() ~= "wudang") then
		Talk(6,"Uworld129_finish","Huynh qu� th藅 kh玭g h� danh! ng l� ﹎ m璾 c馻 Thi猲 Nh蒼 gi竜.","Xem ra qu﹏ Kim  b総 u ng th�. Chu s� huynh ta kh玭g bi誸 th� n祇 r錳?","B� thng kh玭g nh�, nh璶g t輓h m筺g  頲 b秓 to祅. E r籲g ph秈 ngh� ng琲 m閠 th阨 gian!","Thi猲 M鬰 kh玭g bi誸 c竚 琻 i ﹏ c馻 huynh i v韎 V� ng? Ta t苙g huynh m閠 cu鑞 V� ng m藅 t辌h.","V筺 l莕 kh玭g n猲! H祅h hi謕 trng ngh躠 l� b鎛 ph薾 c馻 t玦.")
	else
		Talk(1,"","Kh玭g c莡 g� h琻! Ch� hy v鋘g V� ng tai qua n筺 kh醝!")
	end
end

function Uworld129_interchange()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","Nh璶g ngi v鑞 kh玭g bi誸 v� c玭g, ch綾 g� Chu s�  ch辵 n鉯 chuy謓 v韎 ngi?")
	else
		SetTask(129,10)  --任务启动
		Msg2Player("L� Thi猲 M鬰  ngi t譵 Chu V﹏ Tuy襫 h鋍 h醝 v� ngh�. ")
		AddNote("L� Thi猲 M鬰  ngi t譵 Chu V﹏ Tuy襫 h鋍 h醝 v� ngh�. ")
	end
end

function Uworld129_interchange2()
	SetTask(129,30)  --设置任务变量30
	Msg2Player("L� Thi猲 M鬰  ngi khuy猲 Chu V﹏ Tuy襫 kh玭g qu� say m� v� o. ")
	AddNote("L� Thi猲 M鬰  ngi khuy猲 Chu V﹏ Tuy襫 kh玭g qu� say m� v� o. ")
end

function Uworld129_interchange3()
	SetTask(129,50)  --设置任务变量50
	Msg2Player("Nh薾 l阨 L� Thi猲 M鬰 甶 T﹜ 竚 Trung Ph鬰 Ng璾 s琻 b秓 v� Chu V﹏ Tuy襫. ")
	AddNote("Nh薾 l阨 L� Thi猲 M鬰 甶 T﹜ 竚 Trung Ph鬰 Ng璾 s琻 b秓 v� Chu V﹏ Tuy襫. ")
end

function Uworld129_finish()
	if (GetTask(5) >= 70*256) and (GetTask(5) ~= 75*256) then
		Talk(2,"","Ta a n� cho ngi v� hy v鋘g ngi c� th� ph竧 dng quang i, nh� th� v� l﹎ Trung nguy猲 l筰 c� th猰 1 ph莕 l鵦 lng ch鑞g Kim.",".....V藋 頲! T筰 h� xin nh薾!")
		if (HaveMagic(365) == -1) then		-- 必须没有技能的才给技能
			AddMagic(365,1)
		end
		if (HaveMagic(368) == -1) then		-- 必须没有技能的才给技能
			AddMagic(368,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("H鋍 頲 k� n╪g Thi猲 мa V� C鵦, Nh﹏ Ki誱 H頿 Nh蕋 ")
		SetTask(129,255)
	else
	   SetTask(129,245)  --获得声望的设置变量245
	end
   add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
   AddRepute(add_repute)
   Msg2Player("C鴘 Chu V﹏ Tuy襫, nhi謒 v� ho祅 th祅h. Danh v鋘g c馻 b筺 t╪g th猰 "..add_repute.."甶觤.")
   AddNote("C鴘 Chu V﹏ Tuy襫, nhi謒 v� ho祅 th祅h. Nhi謒 v� ho祅 th祅h ")
end
