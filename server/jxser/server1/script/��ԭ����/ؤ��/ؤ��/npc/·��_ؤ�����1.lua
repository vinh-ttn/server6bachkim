-- 丐帮 路人NPC 丐帮弟子1 20级任务
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 20*256) and (GetLevel() >= 20) and (GetFaction() == "gaibang") then		--20级任务
		Say("C竔 t猲 M筺h Vi詎 T礽  v鑞 cho m譶h l� con ch竨 c馻 Trng l穙 C竔 Bang. Ng祔 thng hay ng玭g ngh猲h kho竎 l竎 v韎 huynh  trong bang. H緉 bi誸 r� m譶h sai, nh璶g v蒼 c� ch蕄. K誸 qu� l� b� nh cho m閠 tr薾, th藅 l� ng i! ",2,"D箉 d� ngh辌h t� /L20_get_yes","Ch輓h nh﹏ h祅h o /L20_get_no")
	elseif (UTask == 20*256+10) then
		Talk(1,"","Ngi nh蕋 nh ph秈 c萵 th薾! C竔 t猲 M筺h Vi詎 T礽 � th骳 th骳 h緉 l� Trng l穙 C竔 Bang m韎 d竚 b総 n箃 ngi nh� th�!")
	else
		Talk(1,"","M筺h Vi詎 T礽 thng b総 n箃  t� c蕄 th蕄, th藅 l� t錳 t�! ")
	end
end;

function L20_get_yes()
	Talk(3,"after_get","L� n祇 nh� v藋! M筺h Vi詎 T礽 hi謓 產ng � u?","H譶h nh� � ph輆 T﹜ r鮪g, ngi nh� ng g﹜ chuy謓 v韎 h緉, n誹 c t閕 v韎 M筺h trng l穙 th� phi襫 ph鴆 l緈! "," Ngi y猲 t﹎! Ta nh蕋 nh s� 'gi髉 h緉' th蕐 l筰 ch輓h o! ")
end;

function after_get()
	SetTask(8,20*256+10)
	AddNote("Nh薾 nhi謒 v� c蕄 20: Gi竜 hu蕁 M筺h Vi詎 T礽 ")
	Msg2Player("Nh薾 nhi謒 v� c蕄 20: Gi竜 hu蕁 M筺h Vi詎 T礽 ")
end

function L20_get_no()
	Talk(2,"","Huynh ! Nh蒼 nh鬰 ch髏 甶! Nh� v藋 ch糿g t鑤 h琻 sao?","莥! ")
end;
