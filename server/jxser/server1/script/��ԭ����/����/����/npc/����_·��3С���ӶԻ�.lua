-- Ti�u ��ng T� � T��ng D��ng - Editor by AloneScript (Linh Em)

Include("\\script\\lib\\alonelib.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>Ta �� �n ch�o v�i khoai h�n m�t tu�n r�i. Gi� m� �n ���c m�t b�a c�m no n� nh�?"..Note("tieudangtu_tuongduong")
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--�����Ի���
	tbDailog:Show()
end

