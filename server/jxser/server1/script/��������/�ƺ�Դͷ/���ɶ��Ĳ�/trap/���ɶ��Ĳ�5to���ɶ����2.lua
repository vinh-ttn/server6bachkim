--西北北区 留仙洞四层5to留仙洞五层2
--TrapID：西北北区 39
-- by：Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q4","B筺 nh譶 th蕐 m閠 c� quan, tr猲 c� kh綾 m蕐 d遪g ch�: ")
--	AddTermini(47)		--这是什么东西？
end;

function L60_q4()
	Say("V� tr� l骳 khai s�, t tr阨 c竎h nhau kh玭g xa, lo礽 ngi c� th� bc qua nh鱪g b薱 thang  l猲 Thi猲 nh. Ng鋍 Ho祅g cho r籲g: ngi ph祄 v� thi猲 th莕 g莕 g騣 v韎 nhau nh� v藋 th藅 l� h鏽 n, b蘮 l謓h c竎 thi猲 th莕 l祄 cho tr阨 t c竎h xa nhau. Ngic� hi觰 頲 � ngh躠 huy襫 b� c馻 nh鱪g c﹗ th祅h ng� ph輆 di kh玭g?",4,"Tr阨 hoang, t gi� /L60_S4_wrong","t tr阨 ph﹏ i /L60_S4_correct","Tr阨 Nam, t B綾 /L60_S4_wrong","Tr阨 cao, t d莥 /L60_S4_wrong")
end

function L60_S4_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(14) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(14) == 1)) then
		Msg2Player("B筺 h穣 蕁 v祇 p 竛 th� 2 ngay trc m苩, c� quan s� kh雐 ng a ngi l猲 t莕g th� 5 ")
		SetFightState(1);
		NewWorld(129, 1597, 3212);
	else
		Msg2Player("B筺 蕁 lo筺 x� v祇 nh鱪g k� t�, nh璶g kh玭g th蕐 ph秐 鴑g g� ")
	end
end;

function L60_S4_wrong()
	Msg2Player("B筺 蕁 lo筺 x� v祇 nh鱪g k� t�, nh璶g kh玭g th蕐 ph秐 鴑g g� ")
end;
