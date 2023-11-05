-- 江南区 罗宵山 路人_雷部狼主.lua （消灭采花贼任务）
-- By: Dan_Deng(2004-05-28)

function main(sel)
	Uworld43 = GetTask(43)
	if (Uworld43 == 10) then
		Talk(6,"U43_10","Lang Ch�! Ch綾 ngi c� bi誸 chuy謓 m玹 thanh ni猲 tr猲 n骾, tr猲 tay thng c莔 phi課 qu箃, th輈h ng﹎ th� nh璶g l筰 l祄 t芻 ","у ng鑓! L祄 g� c�!","Ta k輓h ngi v鑞 c� ti課g trong v� l﹎. N鉯 chuy謓 ng th� l� ","ng c� h� d鋋 ta! Khi ta l╪ l鉩 trong giang h� th� ngi c遪 ch璦 sinh ra","Ta bi誸 r籲g t猲  g莕 y thng hay giao du v韎 Th竔 Hoa t芻, gian d﹎ ph� n�! Ngi t鑤 nh蕋 n猲 n鉯 ra ch� tr� 萵 c馻 h緉, n誹 kh玭g c騨g s� b� li猲 l魕","C� cho l� ngi  bi誸 h誸 s� t譶h 甶! R錳 sao h�? Цnh th緉g 頲 ta r錳 m韎 n鉯!Ha! Ha! Ha! Ha! Ha!")
	elseif (Uworld43 == 30) then						-- 打完狂狼，来拿钥匙
		Talk(4,"U43_30","Xin th� l鏸! T筰 h� c遪 ch璦 xu鑞g Di猰 La nh璶g m� m thu閏 h� c馻 ng礽 th� u xu鑞g s玭g N筰 H� h誸 r錳","H鮩! Ti觰 t� mu鑞 l祄 anh h飊g? Anh h飊g kh玭g ph秈 ai mu鑞 l� 頲 u!","ng n鉯 nh秏 n鱝! N誹 kh玭g th� ngi c騨g s� c飊g 甶 h頿 m苩 v韎 m  t� kia","Ti觰 t�! Xem nh� ng璷i c� b秐 l躰h! N誹 nh� ta giao ch譨 kh鉧 n祔 cho ngi th� ngi c� tha m筺g cho ta kh玭g?")
	elseif (Uworld43 >= 40) and (Uworld43 < 100) and (HaveItem(381) == 0) then				-- 或之后的任一步骤中钥匙丢失
		AddEventItem(381)
		Msg2Player("Ti誴 t鬰 nh薾 頲 L玦 thc ")
		Talk(1,"","H筺g ti觰 t鑤 nh� ngi th� xem c� th� l祄 頲 c竔 g�. Ch譨 kh鉧 產ng � y, n誹 nh� ngi c� th� ti誴 頲 ta 3 chi猽, th� s� giao cho ngi")
	elseif (Uworld43 >= 40) and (Uworld43 < 255) and (HaveItem(381) == 1) then
		Talk(1,"","Ngi  c� 頲 ch譨 kh鉧 r錳. C遪 mu鑞 h醝 ta g� n鱝?")
	elseif (Uworld43 == 20) then		-- 对话完成，打狂狼未完成
		Talk(1,"","Ngu ng鑓! N誹 ngi th緉g 頲 m th� h� c馻 ta th� m韎 c� t� c竎h u v韎 ta")
	elseif (Uworld43 >= 255) then
		Talk(1,"","Ngi匩gi th藅 s�  gi誸 thi誹 ch�?")
	else
		Talk(1,"","ng c� l秏 nh秏 n鱝! Ch璦 th蕐 b� d筺g n祔 bao gi� sao?")
	end
end;

function U43_10()
	SetTask(43,20)
	Msg2Player("Ngi  c� 頲 ch譨 kh鉧 r錳. C遪 mu鑞 h醝 ta g� n鱝? ")
end

function U43_30()
	SetTask(43,40)
	AddEventItem(381)
	Msg2Player("Х l蕐 頲 L玦 thc, tr� v� L﹎ An giao cho C玭g Sai i ca, b祅 b祅 k� ho筩h ti誴 theo ")
end
