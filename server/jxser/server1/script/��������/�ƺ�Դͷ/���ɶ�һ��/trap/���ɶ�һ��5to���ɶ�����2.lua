--西北北区 留仙洞一层5to留仙洞二层2
--TrapID：西北北区 23
-- by：Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q1","B筺 nh譶 th蕐 m閠 c� quan, tr猲 c� kh綾 m蕐 d遪g ch�: ")
--	AddTermini(47)		--这是什么东西？
end;

function L60_q1()
	Say("Trong truy襫 thuy誸 Ph鬰 Hy l� con trai th莕 S蕀,玭g ta  l蕐 頲 c竔 chu玭g l鯽 t� trong l鯽 s蕀 t� nhi猲 m� 甧m cho nh﹏ gian, sau th阨 Ph鬰 Hy, l筰 c� c竔 khoan...c竎h th鴆 l蕐 l鯽 n祔 do ai ph竧 minh ra v藋? ",4,"M筩 M蓇 /L60_S1_wrong","T魕 Nh﹏ /L60_S1_correct","N� Oa /L60_S1_wrong","Vng M蓇 /L60_S1_wrong")
end

function L60_S1_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(11) == 1))) then
		Msg2Player("B筺 nh譶 th蕐 m閠 C� quan, b猲 tr猲 c� kh綾 m蕐 d遪g ch�: ")
		SetFightState(1);
		NewWorld(126,1483,3039)
	else
		Msg2Player("B筺 蕁 lo筺 x� v祇 nh鱪g k� t�, nh璶g kh玭g th蕐 ph秐 鴑g g� ")
	end
end;

function L60_S1_wrong()
	Msg2Player("B筺 蕁 lo筺 x� v祇 nh鱪g k� t�, nh璶g kh玭g th蕐 ph秐 鴑g g� ")
end;
