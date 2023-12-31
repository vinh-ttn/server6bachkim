--description: 武当派叶继美　武当10级任务
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if allbrother_0801_CheckIsDialog(12) == 1 then
		allbrother_0801_FindNpcTaskDialog(12)
		return 0;
	end
	UTask_wd = GetTask(5)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	G_TASK:OnMessage("V� ng", tbDailog, "DialogWithNpc")
	if (UTask_wd == 10*256+20) then 
		SetTask(5, 10*256+50)
		AddNote("T筰 ch� c馻 Di謕 Ti誴 M� h鋍 頲 Чo c Kinh ")
		Msg2Player("T筰 ch� c馻 Di謕 Ti誴 M� h鋍 頲 Чo c Kinh ")
		tbDailog.szTitleMsg = "<npc>筼 c Kinh籘heo nh� t� s� Чo Gi竜 L穙 T�, quy觧 u ti猲 c馻 Чo Kinh c� 37 chng, quy觧 sau c Kinh c� 44 chng"
		tbDailog:AddOptEntry("Chng 1 ", ch1)
		tbDailog:AddOptEntry("Chng 25 ", ch2)
		tbDailog:AddOptEntry("Chng 33 ", ch3)
		tbDailog:AddOptEntry("Chng 41 ", ch4)
		tbDailog:AddOptEntry("Chng 42 ", ch5)
	elseif (UTask_wd == 10*256+50) then 
		tbDailog.szTitleMsg = "<npc>N閕 dung c馻 <Чo c Kinh> b竧 i tinh th﹎, kh玭g ph秈 l� c� th� l躰h ng� trong m閠 kho秐g th阨 gian ng緉, ngi h穣 h鋍 thu閏 5 chng trc 甶."
		tbDailog:AddOptEntry("Chng 1 ", ch1)
		tbDailog:AddOptEntry("Chng 25 ", ch2)
		tbDailog:AddOptEntry("Chng 33 ", ch3)
		tbDailog:AddOptEntry("Chng 41 ", ch4)
		tbDailog:AddOptEntry("Chng 42 ", ch5)
	elseif (UTask_wd < 10*256+20) and (GetFaction() == "wudang") then								--尚未接10级任务
		tbDailog.szTitleMsg = "<npc>Kh玭g bi誸筼 c Kinh�, sao tr� th祅h  t� c馻 V� ng?"
	elseif (UTask_wd >= 20*256) and (GetFaction() == "wudang") then					--已经完成10级任务，尚未出师
		tbDailog.szTitleMsg = "<npc>H玬 nay ngi  h鋍筼 c Kinh籧h璦?"
	elseif (UTask_wd >= 70*256) then							--已经出师
		tbDailog.szTitleMsg = "<npc>Khi ta c遪 tr� nh� ngi, c騨g l� m閠 i trng phu kho� m筺h, n nay m韎 bi誸 tr阨 cao t r閚g, ngi tuy l�  t� xu蕋 s� c馻 b鎛 ph竔, nh璶g c騨gkh玭g 頲 xem thng ngi kh竎."
	else
		tbDailog.szTitleMsg = "<npc>筼 c Kinh籘heo nh� t� s� Чo Gi竜 L穙 T�, quy觧 u ti猲 c馻 Чo Kinh c� 37 chng, quy觧 sau c Kinh c� 44 chng. T蕋 c� c� h琻 5000 ch�, no璶g n閕 dung th� b竎 i tinh th﹎."
	end
	tbDailog:Show() 
end;

function ch1()
	Talk(1,"","Чo kh� o, phi thng o, danh kh� danh, phi thng danh.")
end;

function ch2()
	Talk(1,"","Nh﹏ ph竝 甶�, a ph竝 thi猲, thi猲 ph竝 o, o ph竝 t� nhi猲.")
end;

function ch3()
	Talk(1,"","Tr� nh﹏ gi� tr�, t� tr� gi� minh, th緉g nh﹏ gi� h鱱 l鵦, t� th緉g gi� cng.")
end;

function ch4()
	Talk(1,"","Чi phng v� ngung, i kh� v穘 th祅h, i ﹎ hy thanh, i tng v� h譶h.")
end;

function ch5()
	Talk(1,"","Чo sinh nh蕋, nh蕋 sinh nh�, nh� sinh tam, tam sinh v筺 v藅.")
end;
