-- 文件名　：dailog.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-17 11:00:21
--报名的对话
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\racegame\\ready\\ready.lua")
function racegame_SignUp_main(nStep)
	jiefang_0804_ResetTask()
	local tbSay = {}
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc> Trong th阨 gian t� 11-06-2008 n 24:00 13-07-2008, V� l﹎ minh ch� s� t� ch鴆 Cu閏 畊a 4 m颽 � c竎 th祅h th�. 30 ngi u ti猲 ch箉 v� ch v� n鉯 chuy謓 v韎 g ch� trng 畊a s� nh薾 頲 ph莕 thng h藆 h�, ngi c� mu鑞 tham gia ho箃 ng n祔 kh玭g?",
			"Ta s� kh玭g b� qua ng祅 n╩ c� m閠 n祔!/#racegame_SignUp_main(2)",
			"T譵 hi觰 th玭g tin ho箃 ng/#racegame_SignUp_main(3)",
			"Th藅 ng筰 qu�, ta s� quay l筰 sau./OnCancel",	
		}
	elseif nStep == 2 then
		local nReadyMissionState = gb_GetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState)
		local nMissionState = gb_GetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.MissionState)
		--local nPlayerCount	= racegame_tbReadyMission:GetMSPlayerCount()
		
--		if nPlayerCount >= racegame_tbReadyMission.nPlayerCountLimit then
--			Say("这场活动人数已经达到上限，你参加下一场吧！",0)
--			return 
--		end
		
		if GetLevel() < racegame_tbReadyMission.nLevelLimit then
			Say(format("Ъng c蕄 kh玭g  %s, kh玭g th� tham gia ho箃 ng.", racegame_tbReadyMission.nLevelLimit), 0 )
			return 
		end
		
		
		if nReadyMissionState == 1 then
			
			local w = GetWorldPos()
			SetTask(jiefang_0804_TSK_MapId, w)			
			local nRandId = random(1, getn(racegame_tbReadyMission.tbWaitPos) )
			return NewWorld(racegame_tbReadyMission.nMapId, racegame_tbReadyMission.tbWaitPos[nRandId][1], racegame_tbReadyMission.tbWaitPos[nRandId][2])
		elseif (nReadyMissionState == 0 and nMissionState ~= 0) or nReadyMissionState == 3 then
			tbSay = 
			{
				"Чi hi謕  tr� m蕋 r錳, cu閏 畊a  b総 u. Th阨 gian thi u m鏸 tu莕: <enter>Th� 2 n th� 6, s竛g 10:00 n 11:00, chi襲 22:00 n 23:00<enter>Th� 7; ng祔 30 th竛g 4 v� 01 th竛g 5, r筺g s竛g 02:00 n 03:00, s竛g 10:00 n 11:00, chi襲 14:00 n 15:00, t鑙 22:00 n 23:00<enter>Ch� nh藅, s竛g 10:00 n 11:00, tr璦 14:00 n 15:00, t鑙 22:00 n 23:00.",
				"Th藅 ng筰 qu�, ta s� quay l筰 sau./OnCancel",	
			}
			tbSay[1] = "<dec><npc>"..tbSay[1]
		elseif nReadyMissionState == 0 and nMissionState == 0 then
			tbSay = 
			{
				"Cu閏 畊a v蒼 ch璦 b総 u. Th阨 gian thi u m鏸 tu莕:<enter>Th� 2 n th� 6, s竛g 10:00 n 11:00, chi襲 22:00 n 23:00<enter>Th� 7; ng祔 30 th竛g 4 v� 01 th竛g 5, r筺g s竛g 02:00 n 03:00, s竛g 10:00 n 11:00, chi襲 14:00 n 15:00, t鑙 22:00 n 23:00<enter>Ch� nh藅, s竛g 10:00 n 11:00, tr璦 14:00 n 15:00, t鑙 22:00 n 23:00.",
				"Th藅 ng筰 qu�, ta s� quay l筰 sau./OnCancel",
			}
			tbSay[1] = "<dec><npc>"..tbSay[1]
		end
	elseif nStep == 3 then
		tbSay = 
		{
			"<dec><npc>M鏸 cu閏 畊a di詎 ra trong 15 ph髏, trong  c� 1 ph髏  chu萵 b�. Sau khi b竜 danh tham gia, ngi ch琲 s� 頲 a n khu v鵦 chu萵 b�. Sau khi cu閏 tranh t礽 b総 u, c竎 tuy觧 th� ph秈 ra s鴆 ch箉 th藅 nhanh v� ch. Trong qu� tr譶h 畊a, tr猲 阯g 畊a s� xu蕋 hi謓 c竎 o c� h� tr�, s� d鬾g o c� n祔 c� th� gi髉 t╪g t鑓  ch箉 c馻 b秐 th﹏ ho芻 l祄 gi秏 t鑓  c馻 ngi kh竎. 30 ngi u ti猲 v� ch v� n鉯 chuy謓 v韎 g ch� 阯g 畊a s� nh薾 頲 ph莕 thng c� gi� tr�.",
			"Th藅 ng筰 qu�, ta s� quay l筰 sau./OnCancel",	
		}
		
	end
	CreateTaskSay(tbSay)
end



function racegame_Award_main()
	jiefang_0804_ResetTask()
	local nAwardState = GetTask(jiefang_0804_TSK_AwardState)
	local nPlayerMapId = GetTask(jiefang_0804_TSK_MapId)
	if nPlayerMapId == 0 then
		nPlayerMapId = 520
	end
	if nAwardState == 1 then
		return NewWorld(nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
	end
	local nRankCount = racegame_tbMission:GetMissionV(racegame_tbMission.tbMissionV.RANK_COUNTER)
	nRankCount = nRankCount + 1
	racegame_tbMission:SetMissionV(racegame_tbMission.tbMissionV.RANK_COUNTER, nRankCount)
	local szMsg = format("Ha ha, i hi謕 trong cu閏 畊a n祔 頲 x誴 h筺g <color=yellow>%d<color>.",  nRankCount)
	
	Msg2MSAll(racegame_tbMission.nMissionId, format("<color=yellow>%s<color> trong cu閏 畊a n祔 頲 x誴 h筺g <color=yellow>%d<color>.",GetName(),  nRankCount))
	Msg2Player(szMsg)
	if nRankCount >= 1 and nRankCount <= 10 then
		AddOwnExp(2000000)
		if random(1,100) <=50 then
			AddItem(4, 239, 1, 1, 0, 0)
			Msg2Player("Nh薾 頲 1 T� Th駓 Tinh")
		end
	elseif nRankCount >= 11 and nRankCount <= 20 then
		AddOwnExp(1000000)
	elseif nRankCount >= 21 and nRankCount <= 30 then
		AddOwnExp(500000)
	end 
	
	SetTask(jiefang_0804_TSK_AwardState, 1)
	if nRankCount >= 30 then
		racegame_tbMission:CloseGame();
	end
	
	NewWorld(nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
end

function OnCancel()
end