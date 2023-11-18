--接任务的Npc
--·参与的玩家等级必须大于40级；
--·宋方的玩家必须要到衡山独孤剑处报名；
--·金方的玩家必须要到汴京衙门口金国武将处报名；
--·报名时需要交纳一定的金钱；
-- Update by Dan_Deng(2003-10-23) 通过对话切换到战场外的，需要更改战斗状态为1

Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");


function main()


local State = GetMissionV(1) 

--未开始
if (State == 0 ) then 
	Say("Чi qu﹏ c馻 ta v蒼 ch璦 xu蕋 ph竧! H穣 t筸 th阨 ngh� ng琲 i tin nh�!",0);
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

--异常情况直接退出
if (State > 2) then
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

local GroupV = GetTask(SJTASKVLAUE);
result = 0;
--如果该玩家是已经报名过的，断线重连进来的，则扔进去
result = CheckLastBattle(2, State)
if (result == 1) then
	return
end

if (result == 2) then
	--此句话是敌方玩家与对方的报名Npc的对话
	--比如 你们这些宋国的草民!我们大金国将士们各各善战智勇,铁骑纵横......等，有得是眼色看
	Say("Kim qu鑓 ch髇g ta, ai c騨g l� d騨g s� thi謓 chi課, tri襲 nh th鑙 n竧 T鑞g qu鑓 c竎 ngi sao x鴑g l� i th�!",0)
end

--报名时期
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
 		if ( nGroup == 2 ) then 
 		--此句话是本方已报名的玩家与报名Npc的对话
    		Say("Th� ch誸 c騨g trung th祅h v韎 Чi Kim!  n祇! H靑 c竎 d騨g s� Kim qu鑓!",0)
  		else
    		Say("Kim qu鑓 ch髇g ta, ai c騨g l� d騨g s� thi謓 chi課, tri襲 nh th鑙 n竧 T鑞g qu鑓 c竎 ngi sao x鴑g l� i th�!",0);
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,2) >= MAX_J_COUNT) then
		Say("Qu﹏ l鵦 c馻 ta hi謓 gi�  d� s鴆 ti猽 di謙 T鑞g qu﹏. Tr竛g s� xin i tr薾 sau nh�!", 0)
	return
	end;
	
	--比如,目前宋国国力不振，宋国百姓生灵涂炭，我们大金国。。。。
	Say("T鑞g tri襲  n l骳 b筰 vong! C竎 ngi c� mu鑞 c飊g ch髇g ta hng vinh hoa ph� qu� kh玭g? Ch� c莕 ng c蕄 tr猲 40, 駈g h� 3000 lng l� c� th� x玭g pha gi誸 ch!",2, "Ta tham gia. /Yes", "в ta suy ngh� l筰!/No");
end;

--交战时期
if (State == 2) then 
	--此为在战斗正式打响之后，其它未报名玩家与报名Npc的对话
	Say("Ti襫 phng 產ng di詎 ra chi課 tranh, c竎 v� hng th﹏ xin t譵 n琲 kh竎 l竛h n筺 ",0);
	return 
end;

end;

function Yes()
if (GetMissionV(1) ~= 1) then
	return
end
if (GetLevel() >= 40) then 
  if (Pay(MS_SIGN_MONEY) == 1) then
  Msg2Player("Hoan ngh猲h b筺 gia nh藀! C竎 d騨g s� Kim qu鑓! H穣 ti課 v祇 chi課 trng! ");
  V = GetMissionV(6);
  SetMissionV(6, V + 1);
  SJ_JoinJ();
  SetTask(SJKILLNPC,0);
  SetTask(SJKILLPK,0);
  --CheckGoFight()
  return 
  end;
end;

Say("B筺 ch璦  40 c蕄 ho芻 kh玭g mang  ti襫",0);
end;

function No()
Say("Mau v� suy ngh� 甶! Th阨 gian c遪 l筰 kh玭g nhi襲 u!",0);
end;

