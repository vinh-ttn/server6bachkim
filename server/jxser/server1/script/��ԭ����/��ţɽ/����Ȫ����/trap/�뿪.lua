-- 周云泉居所 传送点 离开.lua
-- By: Dan_Deng(2004-04-08)
-- 回到伏牛山西（天心洞入口）

function main()
	if (GetSex() == 0) then
		Talk(1,"","B筺 mau ch鉵g 甶 xu鑞g n骾, ph輆 sau v蒼 vang l猲 ti課g ch鰅 m緉g c馻 L玦 Quy誸: 'Ti觰 t� th鑙! ng c� ch箉'! ")
	else
		Talk(1,"","B筺 mau ch鉵g 甶 xu鑞g n骾, ph輆 sau v蒼 vang l猲 ti課g ch鰅 m緉g c馻 L玦 Quy誸: 'Ti觰 t� th鑙! ng c� ch箉'! ")
	end
	i = random(0,99)
	if (i < 33) then
		NewWorld(41, 1951, 2989)
	elseif (i < 67) then
		NewWorld(41, 1685, 3268)
	else
		NewWorld(41, 1788, 3085)
	end
end
