--西北北区 留仙洞三层5to留仙洞四层3
--TrapID：西北北区 35
--黄河源头迷宫 F3-F4 trap
-- by：Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q3","B筺 nh譶 th蕐 m閠 c� quan, tr猲 c� kh綾 m蕐 d遪g ch�: ")
--	AddTermini(47)		--这是什么东西？
end;

function L60_q3()
	Say("Cha c馻 Thi誹 Ng� l� Th竔 B筩h Kim Tinh,玭g s鑞g trong m閠 th玭 l祅g ngh蘯 kh�,v� v藋 頲 g鋓  l� C飊g Tang th�...Thi誹 Ng�  t鮪g thi誸 l藀 vng qu鑓 chim � Йng phng,b竎h quan v╪ v� trong nc u l� chim. Trong ,chim y課 l� m閠 trong b鑞 l� quan,ngic� bi誸 chng quan c馻 n� l� l� quan n祇 kh玭g? ",4,"Xu﹏ /L60_S3_correct","H� /L60_S3_wrong","Thu/L60_S3_wrong","Йng /L60_S3_wrong")
end

function L60_S3_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(13) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(13) == 1)) then
		Msg2Player("B筺 nh蕁 v祇 p 竛 th� nh蕋, C� quan s� a b筺 n t莕g th� t�. ")
		SetFightState(1);
		NewWorld(128, 1607, 2969);
	else
		Msg2Player("B筺 蕁 lo筺 x� v祇 nh鱪g k� t�, nh璶g kh玭g th蕐 ph秐 鴑g g� ")
	end
end;

function L60_S3_wrong()
	Msg2Player("B筺 蕁 lo筺 x� v祇 nh鱪g k� t�, nh璶g kh玭g th蕐 ph秐 鴑g g� ")
end;
