--石鼓镇 路人 阿玛&阿全 新手任务：还钱
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world23 = GetTask(23)
	if (UTask_world23 == 0) and (GetLevel() >= 3) then		-- 任务启动
		Talk(3,"W23_get","A To祅, con ng 甶, s鴆 kh醗 nh� v藋 m� 甶 u?","A M� ng c秐 con, n誹 con kh玭g 甶 h竔 n蕀 l蕐 ti襫 � u ra? Th萴 Gia s� kh玭g tha cho ch髇g ta!","X秠 ra chuy謓 g� v藋?")
	elseif (UTask_world23 == 6) then
		Talk(2,"W23_prise","Ta  gi髉 c竎 ngi tr� n� r錳!","Th藅 c秏 琻 i hi謕!")
	else				-- 非任务对话
		if (random(0,1) == 0) then
			Talk(1,"","Nh譶 th蕐 A Quy猲 nh� b猲 c筺h v鮝 xinh v鮝 hi觰 chuy謓, ta c騨g mu鑞 c� m閠 a con, nh璶g ch髇g ta hi謓 gi� r蕋 c鵦, thi誹 n� ngi ta, l祄 g� c� ti襫 nu玦 con n鎖.")
		else
			Talk(1,"","! H錳 trc s鴆 kh醗 ta t鑤 l緈, b雐 v� c� l莕 h竔 c� 蕌 t� xu鑞g nc, t�  ng� b謓h kh玭g th� n祇 ch鱝 tr� ")
		end
	end
end;

function W23_get()
	Say("Ai d�! Ch髇g ta thi誹 ti襫 Th萴 Gia trong th玭, nh璶g v� A To祅 l﹎ b謓h r蕋 l﹗, kh玭g c� ti襫 tr� n�. Th萴 gia b秓 mang nh� ch髇g ta b竛 ho芻 c莔  l蕐 ti襫 tr� 玭g.",2,"ng v閕,  ta quy誸 nh gi飉 玭g. /W23_get_yes","V鑞  thi誹 n� th� m鋓 ngi ph秈 c� g緉g h琻. /W23_get_no")
end;

function W23_get_yes()
	SetTask(23,3)
	Talk(1,"","Y猲 t﹎! Giao cho ta 甶! C竎 ngi � y ch� tin c馻 ta.")
	AddNote("Nh薾 nhi謒 v� gi髉 A M� v� A To祅 gi秈 quy誸 g竛h n苙g, 衟 Th萴 gia b� n�. ")
	Msg2Player("Nh薾 nhi謒 v� gi髉 A M� v� A To祅 gi秈 quy誸 g竛h n苙g, 衟 Th萴 gia b� n�. ")
end

function W23_get_no()
end

function W23_prise()
	Talk(1,"","Зy l� qu莕 竜 do ch輓h tay ta may, xin h穣 nh薾 l蕐!")
	SetTask(23,10)
	AddNote("N鉯 v韎 A M� v� A To祅 l�  tr� h誸 n�, nhi謒 v� ho祅 th祅h. ")
	Msg2Player("N鉯 v韎 A M� v� A To祅 l�  tr� h誸 n�, nhi謒 v� ho祅 th祅h. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(GetSex() == 0) then
		AddItem(0, 2, 2, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("Nh薾 C鎛 y ")
	else
		AddItem(0, 2, 10, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("Nh薾 C萴 Sam ")
	end
	AddRepute(7)
	Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 7 甶觤. ")
end;
