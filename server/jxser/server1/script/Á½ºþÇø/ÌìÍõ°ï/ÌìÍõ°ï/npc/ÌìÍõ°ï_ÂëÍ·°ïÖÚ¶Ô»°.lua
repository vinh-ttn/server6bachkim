--两湖区 天王帮 码头帮众对话

function main(sel)
	UTask_tw = GetTask(3);
	if (UTask_tw >= 60*256+20) and (GetFaction() == "tianwang") then
		Say("Mu鑞 r阨 o 甶 u?", 3, "Ba L╪g huy謓/yes", "Thanh Loa o/yes1", "Kh玭g r阨 o /no")
	else
		Say("Mu鑞 r阨 o 甶 u?", 2, "Ba L╪g huy謓/yes", "Kh玭g r阨 o /no")
	end
end;

function yes()
	if (GetFaction() == "tianwang") then						--如果玩家是天王帮弟子，坐船不收钱
		Say("Huynh ! Ng錳 ch綾 nh�!", 2, "Л頲 r錳! /ok1","ьi , h穣 khoan 甶! /no")
	else
		Say("Kh玭g ph秈 huynh  b鎛 bang, ng錳 thuy襫 kh玭g th� mi詎 ph�.", 2, "Л頲. /ok2","ьi , h穣 khoan 甶! /no")
	end
end;

function yes1()
--	if (GetFaction() == "tianwang") then						--如果玩家是天王帮弟子，坐船不收钱
		Say("Thanh La Фo kh玭g ph秈 l� n琲 d� v祇! Ngi chu萵 b� s絥 s祅g ch璦?", 2, "Chu萵 b� xong r錳 /ok3","Chu萵 b� l筰 m閠 ch髏 /no")
--	else
--		Say("天王帮众：不是本帮兄弟，坐船可不是免费的。", 2, "好吧/ok4","等等，先不去了/no")
--	end
end;

function no()
end;

function ok1()
NewWorld(53, 1793, 3159)						--回巴陵县
SetFightState(1)							--转换为战斗状态
end;

function ok2()
if (GetCash() >= 100) then						--参考值
	Pay(100)
	NewWorld(53, 1793, 3159)					--回巴陵县
	SetFightState(1)						--转换为战斗状态
else
	Say("Kh玭g ti襫 m� i 甶 lung tung! Ngi m韎 ra giang h� �?", 0)		
end;
end;

function ok3()
NewWorld(68, 1634, 3242)						--去青螺岛
SetFightState(1)							--转换为战斗状态
end;

function ok4()
if (GetCash() >= 500) then						--参考值
	Pay(500)
	NewWorld(68, 1634, 3242)					--去青螺岛
	SetFightState(1)						--转换为战斗状态
else
	Say("Kh玭g ti襫 m� i 甶 lung tung!", 0)		
end;
end;
