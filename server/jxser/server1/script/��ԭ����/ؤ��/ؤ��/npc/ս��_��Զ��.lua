-- 丐帮 战斗NPC 孟远才 20级任务
-- by：Dan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 20*256+10) then			--带着20级任务
		Talk(2,"","Ta thay m苩 anh em trong bang gi竜 hu蕁 ngi. Mu鑞 ngi ph秈 thng xuy猲 n誱 頲 m飅 v� c馻 s� gi竜 hu蕁, n誹 nh� ngi v蒼 c遪 ti誴 t鬰 l祄 c祅, ta s� kh玭g quan t﹎ n chuy謓 ngi l� th﹏ th輈h c馻 ai, nh kh玭g thng ti誧!","Ta s� r錳! Sau n祔 kh玭g d竚 n鱝!")
		SetTask(8,20*256+20)
		AddNote("Х gi竜 hu蕁 cho M筺h Vi詎 T礽 m閠 tr薾 nh� i ")
		Msg2Player("Х gi竜 hu蕁 cho M筺h Vi詎 T礽 m閠 tr薾 nh� i ")
	end
end;
