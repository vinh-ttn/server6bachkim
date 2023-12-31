FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟
MAX_S_COUNT = 100;
MAX_J_COUNT = 100;
TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TIMER_2 = 60 * 60  * FRAME2TIME; -- 交战时间为1小时

MS_STATE = 1; --任务中记录任务状态的变量ID
--该变量指向的状态值0表示战役为打开，1表示战役报名中，2表示战役战斗进行中，3表示战役刚刚结束了

MS_SJTASKID = 20;
MS_J_DEATHCOUNT = 3; --任务中记录金玩家伤亡数量的变量ID
MS_S_DEATHCOUNT = 4; --任务中记录宋玩家伤亡数量的变量ID

MS_S_SIGHCOUNT  = 5;--任务中宋方共报名的人数
MS_J_SIGHCOUNT  = 6;--任务中金方共报名的人数
MS_KEY = 7;		--记录当前地图下任务的一个key，即一个随机生成的数定

MS_S_NPCDEATH = 8; -- 任务中记录宋战斗Npc死亡的数量的任务变量ID
MS_J_NPCDEATH = 9; -- 任务中记录金战斗Npc死亡的数量的任务变量ID

MS_NEWSVALUE = 10; --任务中存放新闻变量的地方

MS_S_SHOWKING = 11; --0 means uncondition, 1 means condition but time no come ,2 mean all condition is ok ,and have showed.
MS_J_SHOWKING = 12;
MS_FIRSTSHOW = 13; --1 means Song , 2 means Jing


SJTASKID = 230; 	--记录玩家当前任务ID
SJTASKVLAUE = 231; 	--记录玩家当前任务的值,记录所属方,宋为1，金为2
SJTASKKEY = 232; 	--记录玩家当前任务的key号
SJKILLNPC = 233; 	--记录玩家杀Npc数量
SJKILLPK = 234; 	--记录玩家PK玩家数量

MS_TOTALPK = 250;	--记录玩家打死其它玩家的总次数
MS_TOTALKO = 251;	--记录玩家在PK战役中被打死的总次数

MS_SHOWKINGCOUNT = 100; --某方Npc伤亡数量，当伤亡数量超过该值时，则主将可能出现
MS_PKCOUNT	= 50;--某方玩家伤亡数量,当数量超过该值，则主将可能出现


GO_TIME =  1800 * FRAME2TIME  / TIMER_1; -- 报名时间为半小时
SHOWKINGTIME1 = 3600 * FRAME2TIME / TIMER_1 ;
SHOWKINGTIME2 = 4200 * FRAME2TIME / TIMER_1;

MS_SIGN_MONEY = 3000; --报名费


sj_aryItems = {
	{ "Ti猲 Th秓 L� ", {6,1,71,1,0,0}, 20 },
	{ "Gia B祇 ho祅", {6,0,2,1,0,0}, 5 },
	{ "Cao Trung ho祅", {6,0,5,1,0,0}, 5 },
	{ "Cao Thi觤 ho祅", {6,0,4,1,0,0}, 5 },
	{ "Trng M謓h ho祅", {6,0,1,1,0,0}, 5 },
	{ "Phi T鑓 ho祅", {6,0,6,1,0,0}, 5 },
	{ "чc Ph遪g ho祅", {6,0,10,1,0,0}, 5 },
	{ "B╪g Ph遪g ho祅", {6,0,7,1,0,0}, 5 },
	{ "H醓 Ph遪g ho祅", {6,0,9,1,0,0}, 5 },
	{ "L玦 Ph遪g ho祅", {6,0,8,1,0,0}, 5 },
	{ "Чi L鵦 ho祅", {6,0,3,1,0,0}, 30 },
	{ "Ph竜 Hoa", {6,0,11,1,0,0}, 1 },
	{ "Mai Kh玦 Hoa V� ", {6,0,20,1,0,0}, 2 },
	{ "T﹎ T﹎ Tng 竛h ph� ", {6,1,18,1,0,0}, 5 },
		}
-------------------------------------------------------------------------
function GameOver()
idx = 0;

for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1,idx, 0);
	if (idx == 0) then 
 		break
 	end;
	if ( GetMSIdxGroup(1, idx) == 2) then --jing
		PlayerIndex = pidx;
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetRevPos(100,45)
--		SetFightState(1)
		SetFightState(0)		-- 打完仗后改为非战斗状态（by Dan_Deng）
		SetPunish(1)
		SetPKFlag(0)
		NewWorld(44, 1585,3215);
	else				--song
		PlayerIndex = pidx;
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0)
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetRevPos(78,33)
--		SetFightState(1)
		SetFightState(0)		-- 打完仗后改为非战斗状态（by Dan_Deng）
		SetPunish(1)
		SetPKFlag(0)
		NewWorld(44, 886,4499);
	end;
end;


end;
-------------------------------------------------------------------------
-------------战斗取消的话，归还玩家的报名费------------------------------
function GiveBackBonus()
idx = 0;
for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1, idx, 0);
 	if (idx == 0) then 
		break
	end;
 
 	if (pidx > 0) then
   		PlayerIndex = pidx;
   		Earn(MS_SIGN_MONEY);
 	end;
end;
end
-------------------------------------------------------------------------
function WinBonus(WinGroup, LoserGroup)
resultstr = "";
LCount = GetMissionV(LoserGroup + 4);
WCount = GetMissionV(WinGroup + 4);

TotalMoney = (LCount + WCount) * MS_SIGN_MONEY * 0.9 
Winner = GetMSPlayerCount(1, WinGroup);
if (Winner > 0) then
	Bonus = TotalMoney / Winner;
else 
	Bonus = MS_SIGN_MONEY;
end;

MaxNpc_idx = 0;
MaxPK_idx = 0;
MaxNpc_c = 0;
MaxPK_c = 0;
sj_itemcount = getn(sj_aryItems)
idx = 0;
for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1, idx, WinGroup);
 	if (idx == 0) then 
		break
	end;
 
 	if (pidx > 0) then
   		PlayerIndex = pidx;
   		Earn(Bonus + MS_SIGN_MONEY);
   		AddLeadExp(500);				-- By Dan(统率经验从1000改为500)
   		AddRepute(3);					-- By Dan(声望从20改为3)
   		Msg2Player("Ch骳 m鮪g phe b筺 gi祅h th緉g l頸! Danh v鋘g c馻 b筺 t╪g th猰 3 甶觤, kinh nghi謒 th鑞g l躰h t╪g 500 甶觤!")


		randitem = random(1, sj_itemcount);
		if (randitem > 0) then
			local szItemName = sj_aryItems[randitem][1];
			local arySelItemID =  sj_aryItems[randitem][2];
			AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 <#>"..szItemName);
		end;
		
   		
   		if (GetTask(SJKILLNPC) > MaxNpc_c) then 
   			MaxNpc_idx = pidx
			MaxNpc_c = GetTask(SJKILLNPC)
   		end;
   		
   		if (GetTask(SJKILLPK) > MaxPK_c) then 
   			MaxPK_idx = pidx;
			MaxPK_c = GetTask(SJKILLPK)
   		end;
 	end;
end;


-----------杀Npc最多的人得到一件装备
if (MaxNpc_idx > 0) then 
	PlayerIndex = MaxNpc_idx ;
	sex = GetSex();
	if (sex == 0) then --男装
	--给衣服 ,参数为0,2,0-13(0,6 男, 7,13女),8-9,0-4,70-99
		p1 = random(0,6);
		p2 = random(8,9);
		p3 = random(0,4);
		p4 = random(50,70);
		AddItem(0,2,p1,p2,p3,p4,6,6,0,0,0,0);
		resultstr = "<#> Ngi c� s� 甶觤 gi誸 ch NPC cao nh蕋 l� "..GetName().."<#>, anh ta  gi誸 頲 "..MaxNpc_c.."<#> t猲 k� ch!";
	else
	--给衣服 ,参数为0,2,0-13(0,6 男, 7,13女),8-9,0-4,70-99
		p1 = random(7,13);
		p2 = random(8,9);
		p3 = random(0,4);
		p4 = random(50,70);
		AddItem(0,2,p1,p2,p3,p4,6,6,0,0,0,0);
		resultstr = "<#> Ngi c� s� 甶觤 gi誸 ch NPC cao nh蕋 l� "..GetName().."<#>, c� ta  gi誸 頲"..MaxNpc_c.."<#> t猲 k� ch!";
	end;
	AddRepute(30)
	Msg2Player("B筺 nh薾 頲 30 甶觤 danh v鋘g v� 1 b� trang b�!");
end;

-----------PK人数最多的人得到一把武器
if (MaxPK_idx > 0) then
	PlayerIndex = MaxPK_idx ;
	--p1 = random(0,5);
	--p2 = random(8,9);
	--p3 = random(0,4);
	--p4 = random(70,99);
	--AddItem(0,0,p1,p2,p3,p4,7,7,7,0,0,0);
	--Msg2Player("你获得了一把武器!");
	AddRepute(15)
	AddLeadExp(5000);				-- By Dan(统率经验从1000改为500)
	Msg2Player("Ch骳 m鮪g! Trong chi課 d辌h n祔 b筺 l� ngi c� s� PK cao nh蕋, 頲 15 甶觤 danh v鋘g, kinh nghi謒 th鑞g l躰h t╪g l猲 5000 甶觤!")
	resultstr = resultstr .."<#>. Ngi ch琲 PK cao nh蕋 l� "..GetName().."<#>, s� lng:"..MaxPK_c;
end;

return resultstr;

end;

-------------------------------------------------------------------------
function SJ_JoinJ()
LeaveTeam()
AddMSPlayer(1,2);
SetCurCamp(2);
SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);
SetPos(47584/32, 106880/32);
SetPunish(0);
--SetRevPos(100,45)
SetRevPos(44,50)
SetTempRevPos(44, 1573*32 ,3874 * 32);
SetCreateTeam(0);
SetTask(SJTASKID, MS_SJTASKID);
SetTask(SJTASKKEY, GetMissionV(MS_KEY));
SetTask(SJTASKVLAUE, 2);
str = GetName().."<#> Gia nh藀 phe Kim";
Msg2MSAll(1,str);
SetPKFlag(1)
ForbidChangePK(1);
SetDeathScript("\\script\\missions\\宋金战场pk战\\主角死亡1.lua");

--此为玩家交了报名费，正式加入队伍是提示对话

Talk(2, "", "мch qu﹏ v蒼 ch璦 xu蕋 hi謓! C竎 chi課 s� h穣 t筸 th阨 ngh� ng琲 i tin nh�!", "Sau khi ph竧 hi謓 qu﹏ T鑞g m鋓 ngi ph秈 nghe hi謚 l謓h c馻 th� l躰h! Ai l蕐 頲 th� c蕄 c馻 T鑞g qu﹏ Nguy猲 So竔 trc s� c� tr鋘g thng");
end;
-------------------------------------------------------------------------

function SJ_JoinS()
LeaveTeam()
AddMSPlayer(1,1);
SetCurCamp(1);
SetTaskTemp(200,1);
SetFightState(0);
str = GetName().."<#> Gia nh藀 phe T鑞g";
SetDeathScript("\\script\\missions\\宋金战场pk战\\主角死亡.lua");
SetLogoutRV(1);
SetCreateTeam(0);
SetPunish(0)
--SetRevPos(78,33)
SetRevPos(44,49)
SetPos(31168/32, 133472/32);
SetTempRevPos(44, 1515 * 32, 3980 * 32);
Msg2MSAll(1,str);
SetTask(SJTASKID, MS_SJTASKID);
SetTask(SJTASKKEY, GetMissionV(MS_KEY));
SetTask(SJTASKVLAUE, 1);
SetPKFlag(1)
ForbidChangePK(1);
Talk(2,"","Hoan ngh猲h tr竛g s� gia nh藀 T鑞g qu﹏! Чi qu﹏ c馻 ta v蒼 ch璦 xu蕋 ph竧! H穣 t筸 th阨 ngh� ng琲 i tin nh�!","Sau khi c� hi謚 l謓h, chi課 u l藀 t鴆 b総 u!");
end;

-------------------------------------------------------------------------
--Group表示对话的主管是哪方的，1为宋，2为金方
--State表示当前战役的状态
function CheckLastBattle(Group, State)

if (Group == 1) then 
	JoinFun = SJ_JoinS;
else
	JoinFun = SJ_JoinJ;
end;

local MKey = GetMissionV(MS_KEY); --当前战役的唯一Key码
local Taskid = GetTask(SJTASKID); --该战役类型的ID
local TaskV = GetTask(SJTASKVLAUE);

if (Taskid == MS_SJTASKID) then 
	local TaskKey = GetTask(SJTASKKEY)
    if (TaskKey == MKey) then 
		if (TaskV == Group) then
			JoinFun();
			if (State == 2) then
				SetFightState(1);
			end;
			Msg2Player("Hoan ngh猲h b筺 quay l筰 chi課 trng!");
		elseif (State == 2) then
			return 2 --表示非当前阵营
		else 
			return 0
		end
		return 1;
	else
--		Say("你擅离职守来到了错误的战场！",0);
		return 0;
	end;
end;
return 0;
end;
-------------------------------------------------------------------------
function CheckGoFight()
  V1 = GetMissionV(5);
  V2 = GetMissionV(6);
  if (V1 >= MAX_S_COUNT and V2 >= MAX_J_COUNT) then
  	RunMission(1);
  end;
end;
--------------------------------------------------------------------------
-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
---------------------------------------------------------------------------
------------------------检查是否可以让主将出现了--------------------------
function CheckShowKing(Group)

if (Group == 1) then 
	groupvalue1 = MS_S_NPCDEATH; --记录S方Npc死亡数量的参数Id
	groupvalue2 = MS_S_DEATHCOUNT;--记录S方玩家死亡数量的参数Id
else
	groupvalue1 = MS_J_NPCDEATH;
	groupvalue2 = MS_J_DEATHCOUNT;
end;

NpcDCount = GetMissionV(groupvalue1);

if (NpcDCount < MS_SHOWKINGCOUNT) then
	return 0;
end;

PlayerDCount = GetMissionV(groupvalue2);

if (PlayerDCount < MS_PKCOUNT) then
	return 0;
end;

if (Group == 1) then 
	SetMissionV(MS_S_SHOWKING, 1)
else
	SetMissionV(MS_J_SHOWKING, 1)
end;

return 1;

end;

function ShowTheKing(Group)

if (Group == 1) then 
	HideNpc("Tng Qu﹏ Nam T鑞g",1);
	str1 = "T譶h b竜: Hi謓 chi課 s� 產ng kh萵 c蕄, i tng  ch th﹏ n tr薾 ti襫 c chi課, th� s鑞g ch誸 n琲 tr薾 a! C� Tng s� h穣 c� g緉g nh lui ch!";
	str2 ="T譶h b竜: C竎 Tng s�! B猲 ch thng vong v� s�, Tng ch ng ng錳 kh玭g y猲! C竎 Tng s� h穣 n� l鵦, gi誸 Чi tng c馻 ch!";
	Msg2MSGroup(1,str1, 1);
	Msg2MSGroup(1,str2, 2);
	str3 = "<#> Чi chi課 T鑞g Kim th玭g b竜: Ch� tng phe T鑞g  xu蕋 hi謓 trong doanh tr筰!";
	AddGlobalCountNews(str3 , 3);
	return 0
end;

if (Group == 2) then
	HideNpc("Чi tng Kim Qu鑓",1);
	str1 = "T譶h b竜: Hi謓 chi課 s� 產ng kh萵 c蕄, i tng  ch th﹏ n tr薾 ti襫 c chi課, th� s鑞g ch誸 n琲 tr薾 a! C� Tng s� h穣 c� g緉g nh lui ch!";
	str2 = "T譶h b竜: C竎 Tng s�! B猲 ch thng vong v� s�, Tng ch ng ng錳 kh玭g y猲! C竎 Tng s� h穣 n� l鵦, gi誸 Чi tng c馻 ch!";
	Msg2MSGroup(1,str1, 2);
	Msg2MSGroup(1,str2, 1);
	str3 = "<#> Чi chi課 T鑞g Kim th玭g b竜: Ch� tng Kim qu鑓  xu蕋 hi謓 trong doanh tr筰!";
	AddGlobalCountNews(str3 , 3);
	return 0
end;

return 1;

end;
