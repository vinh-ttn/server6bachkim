-- 战斗_金国秘使.lua
-- By: Dan_Deng(2004-04-13)

function OnDeath()
	Uworld50 = GetTask(50)
	if ((Uworld50 == 32) or (Uworld50 == 40)) and (HaveItem(383) == 0) then			-- 两个人都打败了，可以得到手谕
		SetTask(50,40)
		AddEventItem(383)
		Msg2Player("Цnh b筰 B筩h Doanh Doanh ")
		Talk(2,"","B筩h c� nng! Зy ch輓h l� l阨 th� c馻 c� ph秈 kh玭g?","C竔 t猲 nh� r鏸 th輈h lo chuy謓 c馻 ngi kh竎, Чi Kim qu鑓 s� kh玭g tha cho ngi")
	elseif (Uworld50 == 30) then
		SetTask(50,31)
		Talk(1,"","B筩h ti觰 th�! Mau ch箉!")
	end
end
