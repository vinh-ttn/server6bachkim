--参赛流程
--1、与主入口的Npc对话，选择进入第几个战区
--2、如果符合参赛条件则进入战区内（另一张地图），并以0阵营模式进入
--3、玩家与两边的Npc对话，自由选择参与的阵营。
--4、玩家Pk死亡后将自动被仍出场外，但在本地图内
--5、当玩家死亡时，会自动向同地图的所有玩家公布当前的战况。
--6、如果可以，可以从Npc对话中了解当前的总排行
--7、比赛可以按照等级分成各种赛场
--入战区的Npc、选择阵营的Npc
Include("\\script\\missions\\csbattlelib\\csbattlehead.lua");
Include("\\script\\missions\\hsbattle\\hshead.lua");
MapTab = {};
MapCount = 1;
MapTab[1]= {212, 1577, 3288};

function main()
	--设置返回点
	SetTask(300, 2);
	SetTask(301, 2605);
	SetTask(302, 3592);
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		Say("Hi謓 gi� v蒼 ch璦 c� ai b竜 danh L玦 i n u! Ngh躠 s� c� mu鑞 th� t礽 kh玭g?",0)
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	if (GetMissionV(1) ~= 1) then 
		Say("Hi謓 gi� v蒼 ch璦 c� ai b竜 danh L玦 i n u! Ngh躠 s� c� mu鑞 th� t礽 kh玭g?",0)
		return
	end;
	
	SubWorld = OldSubWorld;

	Say("Hi謓 gi� v蒼 ch璦 c� ai b竜 danh L玦 i n u! Ch� c莕 c蕄 60 tr� l猲, ng 10000 ph� b竜 danh l� c� th� th� t礽!", 2, "Л頲, Ta mu鑞 thng th鴆 t礽 ngh� c馻 c竎 v� h祇 ki謙 蕐. /JoinHS", "Kh玭g tham gia /OnCancel");
end;

function JoinHS()
	LeaveTeam();
	if (CheckCondition() == 0) then
		Say("B筺 ch璦  ng c蕄 ho芻 kh玭g mang  ti襫 ho芻 kh玭g ph秈 l� ngi trong giang h�, kh玭g th� l猲 Hoa S琻 tuy謙 nh", 0);
		return
	end;
	
	if (PrePay(MS_SIGN_MONEY) == 1) then
		NewWorld(MapTab[1][1], MapTab[1][2], MapTab[1][3]);
		idx = SubWorldID2Idx(MapTab[1][1]);
		if (idx == -1) then 
			return
		end;
		SubWorld = idx;
		JoinCamp(4);
		return
	end;
end;


function CheckCondition()
	if ( GetLevel() >= 60 and GetCamp() ~= 0 ) then
		if (GetCash() >= MS_SIGN_MONEY) then
			return 1;
		end;
 	end;
 	return 0;
end;

function OnCancel()
end;
