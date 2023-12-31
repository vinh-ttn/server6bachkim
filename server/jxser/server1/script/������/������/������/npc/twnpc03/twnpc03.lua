--description: 天王帮右使杨湖　天王20级任务
--author: yuanlan	
--date: 2003/4/25
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-16)
-- by xiaoyang (2004\4\20)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tw = GetTask(3)
	Uworld121 = GetTask(121)
--	if (UTask_tw == 70*256) and (Uworld121 == 245) then		-- 白名做完90级任务后又入了天王的，直接给技能
--		Talk(1,"","杨湖：小兄弟果然英雄出众，这里有天王秘笈一部，在你手中定能发扬光大。")
--  	AddMagic("破天斩")
--		AddMagic("追风诀")
--		AddMagic("追星逐月")
--   	Msg2Player("获得天王技能破天斩、追风诀、追星逐月")
--   	SetTask(121,255)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 20*256+50) and (HaveItem(92) == 1 ) then	-- 只检测道具，若道具丢失只要重打最后一个土匪就可重新打出。
			L20_prise()
		elseif (UTask_tw == 20*256) and (GetLevel() >= 20) then
			Say("Th竚 t� h錳 b竜: g莕 y tr猲 <color=Red>V� L╪g s琻<color> xu蕋 hi謓 m閠 nh鉳 <color=Red>Th� Ph�<color>,chuy猲 gi� m筼 c竎 danh ngh躠 c馻 Thi猲 Vng bang  cp c馻 gi誸 ngi, ngi d﹏ n琲 y v� c飊g o竛 gi薾. S� vi謈 n祔 c� li猲 quan n danh d� c馻 b鎛 m玭. Ngic� ng � 甶 n  x﹎ nh藀 v祇 s祇 huy謙 b鋘 th� ph� kh玭g?", 2, "Thu閏 h� t薾 l鵦 thi h祅h /L20_get_yes", "Thu閏 h� v� c玭g th蕄 k衜, s� r籲g g竛h kh玭g 頲 tr鋘g tr竎h n祔 /L20_get_no")
		elseif (UTask_tw < 20*256) then								--尚未接20级任务
			Talk(1,"","Thi猲 Vng bang ch髇g ta danh ti課g l蓎 l鮪g, n猲 thng c� b鋘 x蕌 gi� m筼 t� b鎛 bang  l祄 vi謈 x蕌")
		elseif (UTask_tw > 20*256) and (UTask_tw < 20*256+80) then					--已经接到20级任务，尚未完成
			Talk(1,"","B鋘 th� ph�  thng xu蕋 hi謓 � <color=Red>B筩h Th駓 чng<color> t筰 <color=Red>ph輆 ng V� L╪g s琻<color>.")
		else					--已经完成20级任务，尚未出师（缺省对话）
			Talk(1,"","Thi猲 Vng Bang ch髇g ta v� l穙 b� t竛h g緉 b� v韎 nhau nh� m玦 v韎 r╪g, n猲 ngic莕 ph秈 nh� r籲g tuy謙 i kh玭g 頲 t� ti謓 d飊g v� c玭g  竝 b鴆 l穙 b� t竛h, nh� ch璦?")
		end
	elseif (Uworld121 == 20) and (HaveItem(10) == 1) then
		Talk(7,"Uworld121_yanghu","Dng H鱱 S�.","C竎 h� dng nh� c� g� kh� n鉯, ch糿g hay  x秠 ra vi謈 g�?","�!... � y c� m閠 b骾 t鉩 c馻 Tng Vi ti猲 t�, ngi h穣 nh薾 甶!"," H�! M� Tuy誸? C� ta l祄 sao?","Y猲 t﹎! H� c� nng ch� h琲 ti襲 t魕 m閠 ch髏!","Ta hi觰 r錳!","Ti猲 T� nh� ta chuy觧 l阨 cho ngi r籲g: trc th竛g 7 n誹 ngi kh玭g n Thu� Y猲 g苝 m苩 c� ta, hai ngi t� y v� sau s� ch糿g g苝 m苩 nhau n鱝 u")
	elseif(Uworld121 == 50 ) then
		Talk(8,"Uworld121_yanghu2","L祄 sao? ",". Tng Vi Ti猲 T� nh蕋 nh s� kh玭g h錳 t﹎ chuy觧 � ","Dng H�:... ","Nh璶g m� c� 蕐  b秓 ta 甶 t譵 Kh﹗ Anh, anh ta  n鉯 tng t薾 cho ta bi誸 v� k� ho筩h c馻 C玭 L玭 ph竔 ","M� Tuy誸, n祅g qu� nhi猲  v� ta m� 甶 c莡 xin t猲 gian x秓 Kh﹗ Anh, ta  ph� n祅g r錳. ","th藅 kh玭g g� c� th� b� p ch� tr鑞g  sao? ","ng n鉯 h玬 qua  c飊g nhau h竧 ca vui v�, h玬 nay ta l筰 c� u鑞g th猰 ru n錸g, u鑞g cho say s璦. Chuy謓 t鉩 xanh hay b筩 l� chuy謓 c馻 n╩ mi n╩. R髏 ki誱 ch衜 l猲 tr阨, m鋓 chuy謓 d� nh� tr� b祅 tay. ","Ngi ch琲:. ")
	else
		Talk(1,"","Nh﹏ t﹎ t筰 giang h�, ch� c� ho礽 b穙 l韓, b蕋 k� � n琲 n祇 c騨g gi� th﹏ m譶h l� thanh thi猲 b筩h nh藅, n誹 nh� trong l遪g m� c遪 ngh� g� x蕌 xa b萵 th豼 th� b蕋 k� 甶 n u c騨g b� ngi i ph� b竛g!")
	end
end;

function L20_get_yes()
	Talk(1,"","B鋘 th� ph�  thng xu蕋 hi謓 � <color=Red>B筩h Th駓 чng<color> t筰 <color=Red>ph輆 ng V� L╪g s琻<color>.")
	SetTask(3, 20*256+50)
	AddNote("T筰 c鯽 v祇 甶謓 Йng Thi猲 c馻 Thi猲 Vng bang g苝 Dng H� (218, 198) , nh薾 <color=red>nhi謒 v� B筩h Th駓 чng<color>, n ng B筩h Thu� n骾 V� L╪g di謙 th� ph�. ")
	Msg2Player("T筰 c鯽 v祇 甶謓 Йng Thi猲 c馻 Thi猲 Vng bang g苝 Dng H� nh薾 nhi謒 v� 甶 n ng B筩h Thu� n骾 V� L╪g di謙 th� ph� ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","Ngin th﹏ c m� x玭g v祇 s祇 huy謙 c馻 b鋘 th� ph� v� d﹏ tr� h筰, l祄 th藅 t鑤! B鎛 to� xem v韎 t� ch蕋 c馻 ngi ch� c莕 t藀 luy謓 m閠 th阨 gian ch綾 ch緉 s� tr� th祅h m閠 nh﹏ v藅 n鎖 ti課g vang danh thi猲 h�!")
	DelItem(92)
	SetRank(45)
	SetTask(3, 30*256)
--	AddMagic(33)
	add_tw(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! Х ho祅 th祅h nhi謒 v� ng B筩h Thu� 頲 phong l祄 Th� Tr筰 H秐 Tng, s� 頲 h鋍 v� c玭g T躰h T﹎ Quy誸 c馻 Thi猲 Vng bang ")
	AddNote("Tr� l筰 o Thi猲 Vng mang C萴 K� giao cho Dng H� ho祅 th祅h nhi謒 v� ng B筩h Thu�, 頲 phong l祄 Th� Tr筰 H穘 Tng ")
end;

function Uworld121_yanghu()
	Talk(6,"","M� Tuy誸! N祅g h� t蕋 ph秈 nh� v藋 ch�!","H� Ti猲 T� l� ti猲 n� kh� m� t譵 頲 � nh﹏ gian! Dng H鱱 S�! Ngi c� m� gi� l蕐 nh�, h穣 qu猲 h誸 nh鱪g sai l莔  qua","N誹 sinh ra trong th阨 th竔 b譶h, th� ta u c莕 c竔 h� danh Thi猲 Vng H鱱 s� n祔 l祄 g� ch�? Ch� c莕 c飊g c� 蕐 s鑞g an b譶h � чng ёnh h�. Nh璶g ng ti誧 ng祔 nay thi猲 h� l莔 thanh, c秐h m竨 ch秠 li猲 mi猲, ta l祄 sao c� th� b� m芻  t� trong bang m� kh玭g lo 頲 ch�?",".....�.","G莕 y nghe tin truy襫 r籲g ph竔 C玭 L玭 c� �  ti課 qu﹏ v� ph輆 Nam. T筰 чng ёnh h�  ph竧 hi謓 ra tung t輈h c馻  t� ph竔 C玭 L玭, e r籲g trc ti猲 b鋘 h� s� m璾  h穖 h筰 Thi猲 vng bang ch髇g ta, s� t錸 vong c馻 b鎛 bang 產ng g苝 nguy hi觤, t筰 h� kh玭g th� n秓 ng ngo礽 cu閏 頲, s� vi謈  n nc n祔 ta s� t� m譶h Y猲 Thu� y猲  n鉯 r� cho c� 蕐 bi誸","C騨g ch� c遪 c竎h n祔 th玦!")
	SetTask(121,30) --设置任务变量30
	DelItem(10)
	Msg2Player("Tham v鋘g l韓 c馻 C玭 L玭 ph竔 l� mu鑞 ti課 c玭g Thi猲 Bang ph竔, Dng H� kh玭g th� r阨 kh醝 ")
	AddNote("Dng H� kh玭g c� c竎h n祇 g苝 m苩 H� M� Tuy誸, nh� ngi khuy猲 c� 蕐 d飉 ")
end

function Uworld121_yanghu2()
   if(GetTask(3) >= 70*256) and (GetTask(3) ~= 75*256) then			-- 是天王弟子或出师弟子
		Talk(2,"","Th藅 v蕋 v� cho ngi n鉯 cho t筰 h� bi誸 k� ho筩h x﹎ chi誱 c馻 ph竔 C玭 L玭! Зy c� m閠 quy觧 m藅 t辌h c馻 Thi猲 Vng bang! Xin h穣 nh薾 l蕐!","Ta nh蕋 nh s� chuy猲 c莕 r蘮 luy謓 v� ngh�! C飊g v韎 Dng H鱱 S� b秓 v� giang s琻 T鑞g tri襲!")
		if (HaveMagic(322) == -1) then		-- 必须没有技能的才给技能
			AddMagic(322,1)
		end
		if (HaveMagic(323) == -1) then		-- 必须没有技能的才给技能
			AddMagic(323,1)
		end
		if (HaveMagic(325) == -1) then		-- 必须没有技能的才给技能
			AddMagic(325,1)
   	end
   	Msg2Player("H鋍 頲 k� thu藅 Ph� Thi猲 Tr秏, Truy Tinh Tr鬰 Nguy謙, Truy Phong Quy誸 c馻 Thi猲 Vng bang ")
   	SetTask(121,255)
	else
		SetTask(121,245)
	end
	add_repute = ReturnRepute(30,95,4)			-- 声望奖励：最大30点，从100级起每级递减4%
	AddRepute(add_repute)
	Msg2Player("Nhi謒 v� ho祅 th祅h, danh v鋘g c馻 b筺 頲 t╪g l猲 "..add_repute.."甶觤.")
	AddNote("Nhi謒 v� Bi Luy課 M� Tuy誸: N鉯 cho Dng H� bi誸 k� ho筩h x﹎ chi誱 c馻 C玭 L玭 ph竔 nh璶g v蒼 kh玭g c� c竎h n祇 h祅 g緉 l筰 quan h� gi鱝 H� M� Tuy誸 v� Dng H�, nhi謒 v� ho祅 th祅h. ")
end
