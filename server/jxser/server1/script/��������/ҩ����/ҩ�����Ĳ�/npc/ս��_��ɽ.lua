-- 西北北区 药王谷 药王洞四层 战斗_穿山.lua  （小儿失踪任务）
-- By: Dan_Deng(2004-05-27)

function OnDeath(sel)
	Uworld42 = GetTask(42)
	if (Uworld42 >= 20) and (Uworld42 < 29) then
		SetTask(42,Uworld42 + 1)
		Msg2Player("Gi誸 ch誸 1 t猲 Xuy猲 s琻. ")
	elseif (Uworld42 == 30) or (Uworld42 == 29) then
		SetTask(42,30)
		Msg2Player("Х gi誸 ch誸 10 t猲 Xuy猲 s琻, c� th� b竜 cho l穙 o nh﹏ qu�. ")
	end
end
