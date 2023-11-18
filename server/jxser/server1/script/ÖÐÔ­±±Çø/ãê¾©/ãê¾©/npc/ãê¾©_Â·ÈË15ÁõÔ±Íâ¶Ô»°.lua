--中原北区 汴京府 路人15刘员外对话
--by xiaoyang  (2004\4\12)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld127 = GetTask(127)
	Uworld30 = GetByte(GetTask(30),1)
	if (Uworld127 < 10) and (GetLevel() >= 90) and (Uworld30 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="tianren" ) then   --符合任务条件
		Talk (14,"Uworld127_step1","蕐!. ","L穙 vi猲 ngo筰! Ngi l祄 sao v藋? ","M閠 l阨 kh� n鉯 h誸! Ngi h穣 mau ch鉵g r阨 kh醝 y, n誹 kh玭g c騨g s� b� li猲 l魕 ","R鑤 cu閏  x秠 ra chuy謓 g�? C� n鉯 ra xem ta c� th� gi髉 g� 頲 kh玭g? T筰 h� b蕋 t礽, ch� c� ch髏 s鴆 l鵦 th玦 ","C竎 h� l� ngi trong giang h�? ","M竨  trong giang h�, u c� ph莕 c馻 ta ","V藋 th� qu� t鑤 r錳! Kh玭g bi誸 l� ngi  t鮪g nghe qua t猲 Th蕋 c玭g ch骯 Ho祅 Nhan Tuy誸 Y c馻 Чi Kim ch璦? ","Ho祅 Nhan c玭g ch骯 lanh l頸 th玭g minh, dung nhan tuy謙 th�, l� con g竔 m� Ho祅g Thng y猽 nh蕋 ","Kh玭g sai! Con trai c馻 l穙 phu hi謓 產ng l祄 c玭g sai trong ph� c馻 c玭g ch骯 ","Nh� v藋 th� qu� t鑤 r錳? g c遪 g� ph秈 lo bu錸? ","Цng lo l� c� c玭g ch骯 n祔 v鑞 頲 c璶g chi襲 qu� ng. G莕 y nghe n鉯 c玭g ch骯 mu鑞 b総 con i 甶猽  h祅g tr╩ tu鎖 � L璾 m玭 quan s琻, d� n�  c緉 tr鋘g thng nhi襲 ngi, n Khuy觧 t� c騨g v藋. ","B� tr鋘g thng? V藋 vi謈 甶襲 tr� th� n祇 r錳? ","L穙 phu ch� c� m閠 輙 gia s秐, Khuy觧 T� l筰 b� tr鋘g thng nh� v莥. Nh璶g trong v遪g 1 th竛g kh玭g b総 頲 con linh 甶猽  th� c� nh� s� b� ch衜 u ","A! nghi猰 tr鋘g v藋 sao " )
	elseif (Uworld127 == 10) and (HaveItem(374) == 0) then
		AddEventItem(374)
		Msg2Player("L筰 nh薾 頲 l謓h b礽 � ph� c玭g ch骯 ")
		Talk(1,"","Th蕐 ngi c騨g t祄 t筸, l謓h b礽 y l蕐 甶!")
	elseif (Uworld127 == 100) or (Uworld127 == 110) then                                                             --任务完成
		Talk(4,"U127_finish","Cu鑙 c飊g ngi c騨g quay l筰!"," L璾 ti猲 sinh! Chuy謓 c馻 L謓h lang kh玭g c� g� ph秈 lo l緉g ","M芻 d� ta  r蕋 tin tng ngi, nh璶g th藅 s� c騨g kh玭g tin l� ngi c� th� b総 頲 Linh 甶猽! N誹 nh� b総 頲, th� i ﹏ c馻 ngi i v韎 L璾 gia, ta d� cho n ch誸 c騨g kh玭g th� qu猲!"," ng qu� kh竎h s竜! T筰 h� xin c竜 t�.")
	elseif (Uworld127 > 10)and (Uworld127 < 100) then                                            --任务进行中
		Talk(1,"","Sinh m筺g c馻 c� gia nh ta n籱 trong tay ngi, ngi nh蕋 nh ph秈 th祅h c玭g!")
	elseif (Uworld127 >= 245) then                                                                 --任务完成后
		Talk(1,"","M阨 ﹏ nh﹏ v祇 nh� ng錳, tr猲 giang h� s鑞g ch誸 kh� lng! Xin h穣 b秓 tr鋘g th﹏ th�!")
	else    
		Talk(1,"","Ai s鑞g tr猲 i u nh� nhau, ch� c莕 vui v� s鑞g qua ng祔 l� 頲.")
	end
end;

function Uworld127_step1()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","莥! N鉯 ra c騨g ch� l祄 tr� ci cho thi誹 hi謕 m� th玦")
	else
		Say("Th阨 h筺  h誸 r錳! B﹜ gi� bi誸 ph秈 l祄 sao y!",2,"H鮩! M鋓 ngi kh玭g c莕 lo l緉g! Ta 產ng i th� xem c� c玭g ch骯 h� n n祔 l頸 h筰 th� n祇?! /U127_get","Th� l鵦 c馻 c玭g ch骯 r蕋 m筺h, t筰 h� s� kh玭g 琻g n鎖 /no")  --任务启动
	end
end

function U127_get()
	Talk(3,"","C玭g ch骯 l� ngi c 竎 h竜 th緉g! T鑤 nh蕋 ngi kh玭g n猲 d輓h v祇","g y猲 t﹎! Ta nh蕋 nh s� b譶h an tr� v�!","T鑤 l緈! Зy l� l謓h b礽 nh藀 cung, ta � y ch� tin vui c馻 ngi.")
	AddEventItem(374)
	SetTask(127,10)
	Msg2Player("Ti誴 nh薾 nhi謒 v�:  t譵 Ho祅g Nhan Tuy誸 Y,  l蕐 l筰 s� c玭g b籲g cho L璾 vi猲 ngo筰 ")
	AddNote("Ti誴 nh薾 nhi謒 v�:  t譵 Ho祅g Nhan Tuy誸 Y,  l蕐 l筰 s� c玭g b籲g cho L璾 vi猲 ngo筰 ")
end

function no()
end

function U127_finish()
	if(GetTask(127) == 110) then
      SetTask(127,255)
   else
      SetTask(127,245)				  --获得声望的设置变量245
	end
	   add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
	   AddRepute(add_repute)
	   Msg2Player("Ho祅 th祅h nhi謒 v�, tr� v� L璾 gia, danh v鋘g t╪g l猲 "..add_repute.."甶觤.")
	   AddNote("Quay l筰 ch� L璾 vi猲 ngo筰, ho祅 th祅h nhi謒 v�. ")
end
