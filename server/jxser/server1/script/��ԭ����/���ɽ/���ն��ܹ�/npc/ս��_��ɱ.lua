-- 战斗_绝杀.lua  （世界任务：洗清冤屈）
-- By: Dan_Deng(2004-04-15)

function OnDeath()
	Uworld51 = GetTask(51)
	if (Uworld51 == 60) then		-- 任务中，是打的第一个小BOSS
		SetTask(51,61)
		Talk(1,"","Huynh  Tuy謙 Tr秏 ta s� b竜 th� cho ngi!")
	elseif (HaveItem(377) == 0) and ((Uworld51 == 62) or (Uworld51 == 70) or (Uworld51 == 80)) then		-- 任务中，可以得秘笈
		Talk(1,"","Цng gh衪!")
		SetTask(51,70)
		AddEventItem(377)		-- "唐门秘笈"
		Msg2Player("B筺 gi誸 ch誸 Kim qu鑓 th輈h kh竎h, ph竧 hi謓 trong ngi h緉 quy觧 Л阯g m玭 m藅 c蕄 ")
	end
end
