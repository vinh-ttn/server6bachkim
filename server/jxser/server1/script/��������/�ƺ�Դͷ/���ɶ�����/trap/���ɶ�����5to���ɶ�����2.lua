--西北北区 留仙洞二层5to留仙洞三层2
--TrapID：西北北区 29
--黄河源头迷宫 F2-F3 trap
-- by：Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q2","B筺 nh譶 th蕐 m閠 c� quan, tr猲 c� kh綾 m蕐 d遪g ch�: ")
--	AddTermini(47)		--这是什么东西？
end;

function L60_q2()
	Say("Vi猰 д v鑞 l� th莕 Th竔 Dng, c騨g l� v� th莕 n玭g nghi謕, 玭g 蕐 b秓 m苩 tr阨 ph竧 ra 竛h s竛g, gi髉 cho ng� c鑓 sinh trng. T�  con ngi tr猲 m苩 t kh玭g ph秈 lo mi課g c琺 manh 竜, v� v藋 m鋓 ngi t玭 x璶g 玭g l� Th莕 N玭g th�. Th莕 N玭g th� c遪 l� v� th莕 v� y dc, 玭g  v� ngi ta n誱 qua h祅g tr╩ lo筰 c�, cu鑙 c飊g tr髇g c m� ch誸. Th莕 L鯽 c� m閠 c� con g竔, trong l骳 甶 ch琲 � Йng h秈 ch糿g may b� ch誸 畊鑙, t�  bi課 th祅h m閠 con chim nh�, mi謓g ng薽 h遪  c祅h c﹜ th� v祇 Йng H秈, mu鑞 l蕄 y bi觧 l韓. B筺 c� bi誸 con chim nh�  t猲 g� kh玭g?",4,"Khoa Ph� /L60_S2_wrong","Ngu C玭g /L60_S2_wrong","H藆 Ngh� /L60_S2_wrong","Tinh V� /L60_S2_correct")
end

function L60_S2_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(12) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(12) == 1)) then
		Msg2Player("B筺 nh蕁 v祇 p 竛 th� t�, C� quan s� a b筺 n t莕g th� ba. ")
		SetFightState(1);
		NewWorld(127, 1614, 3083);
	else
		Msg2Player("B筺 蕁 lo筺 x� v祇 nh鱪g k� t�, nh璶g kh玭g th蕐 ph秐 鴑g g� ")
	end
end;

function L60_S2_wrong()
	Msg2Player("B筺 蕁 lo筺 x� v祇 nh鱪g k� t�, nh璶g kh玭g th蕐 ph秐 鴑g g� ")
end;
