-- 西南南区 翠烟门to禁地迷宫　翠烟60级任务
--Trap ID：西南南区 17
-- By: Dan_Deng(2003-09-09)

function main(sel)
	UTask_cy = GetTask(6)
	if (UTask_cy > 60*256) and (GetFaction() == "cuiyan") then
		SetFightState(1)
		NewWorld(158, 1584, 3191);
	elseif (UTask_cy <= 60*256) then
--		SetPos()
		Talk(1,"","Kh玭g 頲 x玭g v祇 c蕀 a b鎛 m玭!")
	else
--		SetPos()
		Talk(1,"","N琲 n祔 l� c蕀 a Th髖 Y猲 kh玭g 頲 x玭g v祇!")
	end
end;
