-- 少林 路人NPC 澄心（50级任务）
-- by：Dan_Deng(2003-08-04)

function main()
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+10)then		-- 50级任务进行中
		Talk(1,"","Ta bi誸 m閠 b� m藅 nh� v� Tr莕 Vi詎 s� huynh, n誹 mu鑞 bi誸 th� mau mau l祄 con g� nng cho ta ╪, ng祔 n祇 c騨g ╪ chay, th藅 ch竛 ch誸 甶 頲!")
		SetTask(7,50*256+20)
		AddNote("Tr鮪g T﹎ bi誸 頲 b� m藅 c馻 Tr鮪g Vi詎, nh璶g ph秈 h鑙 l� g� quay th� m韎 n鉯. ")
		Msg2Player("Tr鮪g T﹎ bi誸 頲 b� m藅 c馻 Tr鮪g Vi詎, nh璶g ph秈 h鑙 l� g� quay th� m韎 n鉯. ")
	elseif (UTask_sl == 50*256+20) then
		if (HaveItem(123) == 1) then
			Talk(1,"","Oh, g� nng ngon qu� 甶! Gh� tai t韎 y ta n鉯 cho nghe b� m藅: N╩ x璦 trc khi Tr譶h Vi詎 s� huynh ch誸  vi誸 b鑞 s� l猲 t l�: 4, 5, 3. Nh璶g kh玭g ai hi觰 頲 � ngh躠  l� g�!")
			Msg2Player("m g� quay cho Tr鮪g T﹎, 頲 h緉 ch�: N╩ x璦 Tr鮪g Vi詎  vi誸 ra tr猲 t ba con s�: 4, 5, 3. ")
			AddNote("m g� quay cho Tr鮪g T﹎, 頲 h緉 ch�: N╩ x璦 Tr鮪g Vi詎  vi誸 ra tr猲 t ba con s�: 4, 5, 3. ")
			DelItem(123)
			SetTask(7,50*256+30)
		else
			Talk(1,"","Ta bi誸 m閠 b� m藅 nh� v� Tr莕 Vi詎 s� huynh, n誹 mu鑞 bi誸 th� mau mau l祄 con g� nng cho ta ╪, ng祔 n祇 c騨g ╪ chay, th藅 ch竛 ch誸 甶 頲!")
		end
	else							-- 常规对话
		Talk(1,"","Phng trng nhu nhc qu�, n誹 c� ti誴 t鬰 nh� v藋 ngi Kim s�  u ci c� ch髇g ta m� 甶 .")
	end
end;
