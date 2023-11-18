-- 大理　路人　段思成
-- by：Dan_Deng(2003-09-16)
-- update by xiaoyang(2004\4\22) 翠烟90级任务

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(14) == 1 then
		allbrother_0801_FindNpcTaskDialog(14)
		return 0;
	end
	Uworld126 = GetTask(126)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld126 < 10) and (GetLevel() >= 90) and (Uworld36 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="cuiyan") then
		Talk(6,"Uworld126_get","H�.....","C玭g t� v� sao ph秈 th� ng緉 th� d礽 nh� v藋?","Tu鎖 tr� ph秈 nu玦 ch� l韓, y nh� B筩h h筩, Thu Th駓 qua r錳.","Ch糿g l� � trung nh﹏ c馻 C竎 h�  m蕋.","N祅g s鑞g m� tim nh�  ch誸.","Ch� c莕 ngi th祅h t﹎, chuy謓 g� c騨g th祅h. C竎 h� c� g� kh� kh╪, xin c� n鉯 ra.")
	elseif (Uworld126 == 10) and (HaveItem(391) == 0) then
		AddEventItem(391)
		Msg2Player("Nh薾 l筰 th� c馻 祅 T� Th祅h ")
		if (GetSex() == 0) then
			Talk(1,"","Mu鑞 g苝 m� nh﹏ c騨g kh玭g c莕 ph秈 g蕄 nh� th�? Th� c遪 ch璦 c莔 m�.")
		else
			Talk(1,"","C� nng 蕐 qu猲 mang th� v�.")
		end
	elseif (Uworld126 == 40) then
		SetTask(126,45)
		Talk(8,"Uworld126_jump","Kh玭g c莕 n鉯 n鱝!","祅 c玭g t�! Ngi  cho L� Thu Th駓 cu閏 s鑞g gi祏 sang ph� qu� t薾 hng kh玭g h誸, lo筰 n b� d� d籲 nh� th� c� th� t譵 th猰 10 hay 100 ngi kh竎 n鱝, sao l筰 chu鑓 kh� v祇 th﹏.","Ngi n鉯 nh� th� n祇 c騨g v� d鬾g, xin c竎 h� h穣 mau r阨 kh醝 y 甶.","祅 T� Th祅h! Ngi ru m阨 kh玭g u鑞g m� u鑞g ru ph箃, l穙 kh玭g c遪 nh蒼 n筰 n鱝, n誹 ngi v蒼 kh玭g tr� l阨, th� h穣  m筺g l筰 y.","H�! ","Hay cho t猲 ti觰 t� nh� ngi! ","A.....","祅 c玭g t�!")
	elseif (Uworld126 == 45) then			-- 没打完的
		Talk(1,"Uworld126_jump","H�! Ngi tho竧 kh醝 tay H遖 Thng th� c騨g kh玭g tho竧 kh醝 mi誹 n祔! Xem chi猽!")
	elseif (Uworld126 == 50) then
		Talk(8,"Uworld126_set","祅 c玭g t� ngi kh玭g ph秈 l� i th� c馻 玭g ta!","May nh� C竎 h� n k辮 th阨, t筰 h� c遪  n鎖.","цi phu琻g t� u n?","Kh玭g r� n鱝! C� l� l� k� th� c馻 Thu Thu� trong giang h�.",".....C� r錳! Ta s� n鑙 d鑙 v韎 L� c� nng l� ngi b� tr鋘g thng.","V藋 h譶h nh� l� kh玭g hay l緈.","H筺h ph骳 c� i, l� n祇 kh� kh╪ n祔 kh玭g th� vt qua.","祅 T� Th祅h:.....Л頲! C竎 h� mu鑞 th� n祇 c騨g 頲 祅 m� xin nghe theo.")
	elseif (Uworld126 == 70) then
		Talk(3,"U126_70","Th� n祇! L� c� nng c� n th╩ huynh kh玭g?","C� 蕐 c� gh� th╩, ch髇g ta n鉯 chuy謓 r蕋 vui, ngi  gi髉 ta nhi襲 r錳, xin c秏 琻!","H� t蕋 ph秈 b薾 t﹎, ch� c莕 2 ngi h筺h ph骳, chuy謓 nh� n祔 c� ng l� g�.")
	elseif (Uworld126 > 10) and (Uworld126 < 50)then
		Talk(1,"","Trc y l� do ta sai! Th藅 kh玭g bi誸 l蕐 g� c秏 琻 ngi!...")
	else
		Talk(2,"","Чi L� ch髇g ta v� T鑞g qu鑓, m鏸 n╩ u c鑞g n筽 cho Thi猲 tri襲 tr﹗, l鬭 l�, ng鵤, x� hng, b� v祅g.","B鋘 ngi Kim tham lam t� c飊g, c� c鑞g cho h� c� i c騨g ch璦 l祄 v鮝 l遪g h�!")
   end
end;

function Uworld126_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		if (GetSex() == 0) then
			Talk(1,"","H秓 � c馻 Huynh i, T� Th祅h xin ghi nh�!")
		else
			Talk(1,"","H秓 � c馻 Huynh i, T� Th祅h xin ghi nh�!")
		end
	else
		Say("Th藅 kh玭g d竚 gi蕌! N╩ x璦 T筰 h�  ph� c� ta, nay ngh� l筰 h鑙 h薾  mu閚. Ta c� m閠 b鴆 th�, hy v鋘g C竎 h� c� th� t薾 tay giao cho Th髖 Y猲 m玭 H秈 Л阯g S� Gi� L� Thu Th駓?",2,"Vi謈 n祔 c� kh� g�! /Uworld126_yes","T筰 h� v蒼 c遪 c� vi謈, c竎 h� h穣 甶 t譵 ngi kh竎 甶! /Uworld126_no")
	end
end

function Uworld126_yes()
	AddEventItem(391)
	SetTask(126,10)
	Msg2Player("Nh薾 頲 th� c馻 祅 T� Th祅h, n Thu� Y猲 M玭 H秈 Thng S� Gi� L� Thu Thu� ")
	AddNote("Nh薾 頲 th� c馻 祅 T� Th祅h, n Thu� Y猲 M玭 H秈 Thng S� Gi� L� Thu Thu� ")
end

function Uworld126_no()
end

function Uworld126_jump()
	SetFightState(1)
	NewWorld(230,1613,3175)
end

function Uworld126_set()
	SetTask(126,60)
	Msg2Player("L藀 m璾 l鮝 Thu Th駓 n th╩ 祅 T� Th祅h ")
	AddNote("L藀 m璾 l鮝 Thu Th駓 n th╩ 祅 T� Th祅h ")
end

function U126_70()
	Talk(1,"","ng r錳! Thu Th駓 n鉯 Do穘 Chng m玭 mu鑞 g苝 ngi, kh玭g bi誸 l� chuy謓 g�?")
	SetTask(126,80)
	Msg2Player("Nghe 頲 祅 v� L� n鉯 chuy謓 v韎 nhau, th� r蕋 vui. Ngi h穣 甶 xem th� Do穘 H祄 Y猲 c� vi謈 g� m� t譵 ngi ")
end
