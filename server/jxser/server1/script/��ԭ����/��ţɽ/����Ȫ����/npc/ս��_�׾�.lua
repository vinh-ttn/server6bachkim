--中原南区\伏牛山\周云泉居所\战斗_雷决.lua
--by xiaoyang (2004\4\20)

function OnDeath()
Uworld129 = GetTask(129)
	if (Uworld129 == 55) then
		SetTask(129,60)
		Talk(1,"",".....Kh玭g ng� ngi l筰 l頸 h筰 nh� v藋! L玦 Quy誸 ta ch糿g qua ch� l� m閠  t� y誹 k衜 c馻 Thi猲 Nh蒼 gi竜. S� c� ngi b竜 th� cho ta! V� l﹎ Trung Nguy猲 s� b� di謙 vong....")
		Msg2Player("Цnh b筰 L玦 Quy誸, c鴘 頲 Chu V﹏ Tuy襫  b� thng. ")
		i = random(0,99)
		if (i < 33) then
			NewWorld(41, 1951, 2989)
		elseif (i < 67) then
			NewWorld(41, 1685, 3268)
		else
			NewWorld(41, 1788, 3085)
		end
   end
end
