--参赛流程
--1、与主入口的Npc对话，选择进入第几个战区
--2、如果符合参赛条件则进入战区内（另一张地图），并以0阵营模式进入
--3、玩家与两边的Npc对话，自由选择参与的阵营。
--4、玩家Pk死亡后将自动被仍出场外，但在本地图内
--5、当玩家死亡时，会自动向同地图的所有玩家公布当前的战况。
--6、如果可以，可以从Npc对话中了解当前的总排行
--7、比赛可以按照等级分成各种赛场
--入战区的Npc、选择阵营的Npc
Include("\\script\\missions\\citywar_arena\\head.lua");
MapTab = {};
MapTab[1]= {213, 1633, 3292};
MapTab[2]= {214, 1633, 3292};
MapTab[3]= {215, 1633, 3292};
MapTab[4]= {216, 1633, 3292};
MapTab[5]= {217, 1633, 3292};
MapTab[6]= {218, 1633, 3292};
MapTab[7]= {219, 1633, 3292};
MapTab[8]= {220, 1633, 3292};
MapCount = getn(MapTab);

function main()
	--设置返回点
	M,X,Y = GetWorldPos();
	SetTask(300, M);
	SetTask(301, X);
	SetTask(302, Y);
	Say("Ngi mu鑞 v祇 u trng khi猽 chi課 �?", 9, "u trng 1 /EnterBattle", "u trng 2 /EnterBattle", "u trng 3 /EnterBattle", "u trng 4 /EnterBattle", "u trng 5 /EnterBattle", "u trng 6 /EnterBattle", "u trng 7 /EnterBattle", "u trng 8 /EnterBattle","Kh玭g 甶 n鱝/OnCancel");
end;

function EnterBattle(nBattleId)
	SetFightState(0)
	NewWorld(MapTab[nBattleId + 1][1], MapTab[nBattleId + 1][2], MapTab[nBattleId + 1][3]);
end;

function OnHelp()
	Talk(8, "",	"L玦 i bang h閕 l� n琲 h鋍 h醝 v� ngh� gi鱝 c竎 bang h閕 tr猲 giang h�! Зy s� l� n琲 thi u c玭g b籲g",	"Mu鑞 tham gia L玦 i bang h閕, trc h誸 ph秈 g苝 ta  xin ph衟! Ngi xin ph衟 ph秈 l� bang ch� c馻 bang h閕 thi u!",	"Sau khi t� i, i trng 2 b猲 s� n b竜 danh. Bang ch� hai b猲  m鏸 ngi ph秈 t cc thi u 1000 v筺 lng. ",	"Sau khi t cc xong, xin ph衟 thi u  ho祅 th祅h. Trong l骳 c� 2 bang h閕 kh竎 產ng thi u, kh玭g cho ph衟 b竜 danh",	"Xin ph衟 th祅h c玭g xong, th祅h vi猲 c馻 hai bang h閕 c�10 ph髏 gia nh藀 u trng. Sau  thi u s� ch輓h th鴆 b総 u!" ,"Th緉g b筰 ph� thu閏 v祇 甶觤 t輈h l騳 thi u c馻 hai b猲. M鏸 th祅h vi猲 bang h閕 l祄 tr鋘g thng i phng s� 頲 3 甶觤, i phng b� tr� 1 甶觤", 	"K誸 th骳 thi u, bang h閕 n祇 t輈h l騳 甶觤 cao h琻 s� gi祅h th緉g l頸!",	"Ngo礽 ra, trong l骳 thi u m閠 b猲 n祇 kh玭g c遪 th祅h vi猲 n祇 � l筰 u trng th� th緉g l頸 s� thu閏 v� b猲 kia. ","Bang h閕 chi課 th緉g c� th� thu h錳 1000 v筺 lng  ng, ngo礽 ra c遪 頲 800 v筺 lng ti襫 thng v� 12.000 甶觤 kinh nghi謒 bang h閕. Bang h閕 thua cu閏 s� kh玭g l蕐 l筰 頲 ti襫  ng, m� c遪 b� tr� 14.000 甶觤 kinh nghi謒 bang h閕");
end;

function OnCancel()

end;
