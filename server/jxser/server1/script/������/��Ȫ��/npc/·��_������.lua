-- 龙泉村　路人　戚允真
-- by：Dan_Deng(2003-09-16)
-- 五毒教90级任务
-- update by xiaoyang(2004\4\13)

Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	Uworld124 = GetTask(124)
	Uworld37 = GetByte(GetTask(37),2)
	if(Uworld124 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (Uworld37 == 127) and (GetFaction() ~= "wudu") then
		Talk(6,"Uworld_wuget","T筰 Long Tuy襫 th玭, b筺 g苝 頲 Uy Du蒼 Ch﹏ph竧 hi謓 ra 甶謓 m筼 c馻 h緉 r蕋 k� qu竔. Da tr猲 m苩 c馻 h緉 xanh x竚, nh╪ nh髆 l筰 trong th藅 g韒 ghi誧. Nh璶g h譶h nh� v蒼 l� v� bi thng, c飊g kh� ","V� i ca n祔! Ph秈 ch╪g 產ng c� chuy謓 kh玭g vui?","Kh�! Kh�! B籲g h鱱 h穣 mau 甶 甶! Kh�! Kh�!","Ta nh譶 th蕐 da m苩 c馻 ngi t竔 xanh, to祅 th﹏ co r髆, ph秈 ch╪g  b� tr髇g c?","Х b� ngi nh薾 ra nh� v藋 r錳 th� ta c騨g kh玭g c遪 g� ph秈 gi蕌. T筰 h� b� tr髇g c  dng Ti誹 c馻  Lang c dc. B﹜ gi� c� 3 gi� th� l筰 ph竧 t竛 m閠 l莕, ci n to祅 th﹏ bi課 d筺g, nam n� b蕋 ph﹏, h譶h d筺g qu竔 th�, s骳 v藅 c騨g kh玭g d竚 n g莕. Ci n khi th﹏ kh� kh鑓 l筰, s鑞g kh玭g b籲g ch誸 ","R鑤 cu閏 l� ai  d飊g th� k辌h c n祔  h筰 ngi?")
	elseif(Uworld124 == 40) and (HaveItem(387) == 1) then
		Talk(5,"Uworld_wufinish","Uy Huynh thu鑓 gi秈 � y, h穣 mau u鑞g 甶!","Oa! Х tho秈 m竔 nhi襲!  t� i hi謕 c鴘 m筺g. Uy m� n祔 l祄 tr﹗ l祄 ng鵤 c騨g kh� m� b竜 p! ","Di謙 tr� b鋘 竎,l� b鎛 ph薾 c馻 nh鱪g ngi h祅h t萿 giang h�. Kh玭g c莕 ph秈 l璾 t﹎! ","Ng祔 nay nh﹏ t﹎ th竎 lo筺. Nh鱪g ngi hi謕 ngh躠 nh� huynh l筰 c祅g hi誱 th蕐. Kh玭g gi蕌 g� huynh, ta ch輓h l�  t� c馻 Ng� чc gi竜, ti誴 tay cho b鋘 竎. Cu鑙 c飊g l筰 b� t猲 V﹏ L穙 t芻 bi課 ta th祅h m閠 c玭g c�  cho h緉 th� c. Nh﹏ sinh b竎h kh� ta u  n誱 qua h誸 ","Ngi t鑤 h錳 t﹎ v蒼 ch璦 mu閚, mong ngi sao n祔 s� d飊g l遪g t� bi m� i nh﹏ s� th� ","Чi hi謕 y猲 t﹎! Tr穒 qua chuy謓 n祔, ta nh蕋 nh s� kh玭g 竎 t﹎ h筰 ngi n鱝 ")
	elseif(Uworld124 > 10) and (Uworld124 < 40) then
		Talk(1,"","Kh� kh� kh� kh�. ")
	else
		Talk(1,"","Ngi c� nghe n鉯 n chuy謓 b鴆 'a  s琻 h� x� t綾' g�  kh玭g? C� th藅 l� c� b鴆 a   kh玭g? N誹 nh� c� 頲 n� trong tay r錳 th� vinh hoa ph� qu� hng c� m蕐 i c騨g kh玭g h誸 ")
	end
end

function Uworld_wuget()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","Kh� kh�!. xem c竔 tng 甶 kh玭g c秐 頲 gi� c馻 ngi, n鉯 ra chuy謓 n祔 c� h鱱 輈h g� u, hay l� th玦 v藋. Kh� kh�... ")
	else
		Say("Ng� чc gi竜, V﹏ B蕋 T�...",2,"Ngi i y, ta s� d箉 cho ngi bi誸 th� n祇 l� ch輓h o /Uworld_wduok","V﹏ B蕋 T� c� i d飊g c, ta kh玭g mu鑞 g﹜ t韎 h緉  ch誸, ngi t� gi� m譶h  /Uworld_wduno")
	end
end

function Uworld_wduok()
	SetTask(124,10)
	Msg2Player("Цp 鴑g Uy Du蒼 Ch﹏, 甶 t譵 V﹏ B蕋 T�  l蕐 thu鑓 gi秈 c  Dng Ti誹 ")
	AddNote("Цp 鴑g Uy Du蒼 Ch﹏, 甶 t譵 V﹏ B蕋 T�  l蕐 thu鑓 gi秈 c  Dng Ti誹 ")
end

function Uworld_wduno()
end

function Uworld_wufinish()
	DelItem(387)
	if (GetTask(10) >= 70*256) and (GetTask(10) ~= 75*256) then				-- 是五毒出师的，可以学到技能
		Talk(2,"","� y c� m閠 quy觧 'M藅 dc Kinh 'c馻 Ng� чc gi竜, xin t苙g cho i hi謕, xin ch� ch鑙 t� ","V藋 th� ta c騨g kh玭g kh竎h s竜! Ta s� nghi猲 c鴘 quy觧 m藅 kinh n祔,  c� th� gi秈 c鴘 cho thi猲 h� ")
		if (HaveMagic(353) == -1) then		-- 必须没有技能的才给技能
			AddMagic(353,1)
		end
		if (HaveMagic(355) == -1) then		-- 必须没有技能的才给技能
			AddMagic(355,1)
		end
		if (HaveMagic(390) == -1) then		-- 必须没有技能的才给技能
			AddMagic(390)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("Luy謓 頲 k� n╪g:  Dng Th鵦 C鑤, Huy襫  Tr秏, 筺 C﹏ H� C鑤 ")
		SetTask(124,255)
	else
		SetTask(124,245)								--获得声望的设置变量245
	end
   add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
   AddRepute(add_repute)
   Msg2Player("m 頲 thu鑓 gi秈 v� cho Uy Du蒼 Ch﹏, ho祅 th祅h nhi謒 v�, danh v鋘g c馻 b筺 t╪g th猰 "..add_repute.."甶觤.")
   AddNote("m 頲 thu鑓 gi秈 v� cho Uy Du蒼 Ch﹏, ho祅 th祅h nhi謒 v� ")
end
