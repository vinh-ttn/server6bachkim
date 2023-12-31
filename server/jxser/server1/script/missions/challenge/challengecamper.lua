--CheckCondition() 需要该函数用于检查是否符合加入条件

Include("\\script\\missions\\challenge\\challengehead.lua");

function main()

	V = GetMissionV(MS_STATE);
	
	--如果报名阶段的话，通知剩余时间
	--如果战斗阶段的话，通知战斗剩余时间
	if (V == 1) then 
		V1 = GetMissionV(MS_NEWSVALUE);
		RestTime = (GO_TIME - V1) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		str = "<#> Trng u 產ng trong giai 畂筺 b竜 danh, th阨 gian b竜 danh c遪 l筰:"..RestMin.."<#> ph髏 "..RestSec.."<#> gi﹜ ";
		Msg2Player(str);
	elseif(V == 2) then
		gametime = (floor(GetMSRestTime(MISSIONID,11) / 18));
		RestMin, RestSec = GetMinAndSec(gametime);
		str = "<#> Trng u 產ng trong giai 畂筺 chi課 u, th阨 gian chi課 u c遪 l筰:"..RestMin.."<#> ph髏 "..RestSec.."<#> gi﹜ ";
		Msg2Player(str);
	end
	
	--扩展点6的值如果为1，表示该角色属于战区管理员。可以向Npc拿入场道具
	if (GetExtPoint(6) == 1 or GetCamp() == 6 ) then 
		Say("Huynh l� ngi qu秐 l� chi課 trng � y? Ta c� th� gi髉 g� kh玭g?", 7 ,  "C莔 l蕐 v� kh� c馻 phe v祅g /GetYellow", "C莔 l蕐 v� kh� c馻 phe t輒 /GetPurple" , "C莔 l蕐 v� kh� c馻 ngi b猲 c筺h /GetWhite", "B� h誸 t蕋 c� v� kh� trong ngi ra /ClearItems", "V祇 u trng /GoWarCenter", "R阨 kh醝 u trng /LeaveCenter",  "в ta ngh� l筰 xem /OnCancel");
		return
	end;
	
	--报名阶段	
	if (V == 1) then
		HaveCamp1 = HaveItem(350);--黄方
		HaveCamp2 = HaveItem(347);--紫方
		HaveCamp3 = HaveItem(348);--记者
		
		--如果没有任何的入场道具的话
		if (HaveCamp1 == 0 and HaveCamp2 == 0 and HaveCamp3 == 0) then 
			Say("B筺 kh玭g c� b蕋 c� 'Anh h飊g l謓h b礽' n祇, kh玭g th� v祇 trong!", 0)
			return
		end;
		if (GetTeamSize() == 0)  then
			Say("B筺 ch璦 l藀 i ng�, ch璦 th� v祇 trong!",0);
			return
		end;
		
		str1 = "<#> чi c馻 ngi c�"..GetTeamSize().."<#> ngi! Ngi mu鑞 gia nh藀 phe n祇?";
		Say(str1 ,4, "ta mu鑞 gia nh藀 v祇 phe v祅g /JoinYellow", "ta mu鑞 gia nh藀 v祇 phe t輒 /JoinPurple", "ta mu鑞 v祇  tham quan /JoinWhite", "в ta ngh� l筰 xem /OnCancle");
	
	elseif (V == 2) then --开战阶段
		HaveCamp3 = HaveItem(348);
		if (HaveCamp3 == 1) then
			Say("B筺 hi謓 產ng c� Di謕 L鬰 Anh H飊g l謓h. Mu鑞 v祇 tham chi課 hay ra kh醝 y?", 3, "дn trung t﹎ c馻 u trng /GoWarCenter", "R阨 kh醝 khu v鵦 u trng /LeaveWar", "в ta ngh� l筰 xem /OnCancel");
		end;
	elseif (V == 0) then
		Say("Th阨 gian b竜 danh tr薾 khi猽 chi課 l祅 n祔 v莕 ch璦 n! ",0);
	end;
	
end;

function ClearItems()
	ClearItem(347);
	ClearItem(348);
	ClearItem(350);
end;

function ClearItem(ItemId)

Count = GetItemCount(ItemId);
if (Count >= 1) then
	for i = 1, Count do 
		DelItem(ItemId)
	end;
end;

end;


function JoinYellow()
	if (HaveItem(350) >= 1) then
		CheckAndJoinCamp(1)		
	else
		Say("B筺 kh玭g c� 竚 Ho祅g Anh H飊g l謓h, kh玭g th� v祇 trong!",0);
	end;
end;

function JoinPurple()
	if (HaveItem(347) >= 1) then
		CheckAndJoinCamp(2)		
	else
		Say("B筺 kh玭g c� Huy誸 H錸g Anh H飊g l謓h, kh玭g th� v祇 trong!",0);
	end;
end;

function JoinWhite()
	if (HaveItem(348) >= 1) then 
		CheckAndJoinCamp(6)
	else
		Say("B筺 kh玭g c� Di謕 L鬰 Anh H飊g l謓h, kh玭g th� v祇 trong!", 0);
	end;
end;


function GetYellow()
	AddEventItem(350);
end;

function GetPurple()
	AddEventItem(347);
end;

function GetWhite()
	AddEventItem(348);
end;


function OnCancel()

end;

function GoWarCenter()
	AddMSPlayer(MISSIONID, 6);
	SetCurCamp(0)
	NewWorld(CS_CampPos2[1], CS_CampPos2[2], CS_CampPos2[3]);
end;

function LeaveCenter()
	LeaveGame(0)	
	SetCurCamp(GetCamp())
end;


function CheckAndJoinCamp(Camp)
	
	if (IsCaptain() == 0) then
		Say("B筺 ch璦 l藀 i ng� ho芻 kh玭g ph秈 l� i trng, kh玭g th� v祇 trong! ",0);
		return
	else
		bHaveJoin = GetMissionV(MS_S_JOINED + Camp - 1);
		if (bHaveJoin == 1) then 
			Say("Hi謓  c� 1 i kh竎 s� d鬾g Anh H飊g l謓h c飊g m祏 v祇 tham chi課 r錳 ", 0);
		return
		end;
	end;
				
	Size = GetTeamSize();
	if (Size > MAX_MEMBER_COUNT) then
		Say("Nh﹏ s� trong t� c馻 b筺 vt h琻 h筺 nh, xin 甶襲 ch豱h l筰 r錳 m韎 v祇 thi u!" , 0);
		return
	else
		OldPlayer = PlayerIndex;
		W,X,Y = GetWorldPos();
		Size = GetTeamSize();
		
		for i = 1, Size do 
			PIdx = GetTeamMember(i);
			if (PIdx > 0) then 
				PlayerIndex = PIdx;
				W1,X,Y = GetWorldPos();
				if (W1 ~= W) then 
					PlayerIndex = OldPlayer
					Say("T� c馻 b筺 hi謓 c� 1 ngi kh玭g � trong khu v鵦 chu萵 b�, xin 甶襲 ch豱h l筰 r錳 m韎 v祇 thi u!",0);
					return
				end;
			end
		end;
		
		PlayerIndex = OldPlayer;
		
		if (Camp == 1) then 
			DelItem(350);
		elseif (Camp == 2) then 
			DelItem(347)
		else
			DelItem(348)
		end

		JoinCampInTeam(Camp);
	end;
	
end;

function JoinCampInTeam(Camp)
	OldPlayer = PlayerIndex;
	local TeamTab = {};
	Size = GetTeamSize();
	Joined = 0;
	for i = 1, Size do 
		TeamTab[i] = GetTeamMember(i);
	end;
	for i = 1, Size do
		PlayerIndex = TeamTab[i];		
		if (Camp ~= 6 and GetLevel() < 30) then 
			Msg2MSAll(MISSIONID, GetName().."<#> ch璦 h琻 c蕄 30, kh玭g th� tham gia!");
		else
			Joined = Joined + 1;
			JoinCamp(Camp)
		end;
	end;
	if (Joined >= 1) then
		SetMissionV(MS_S_JOINED + Camp - 1, 1);	
	end;

	PlayerIndex = OldPlayer;
	
end;
