--西北北区 快活林to沙漠迷宫
--TrapID：沙漠迷宫16

function main(sel)
	i = random(0,2)
	if (GetLevel() >= 80) then
		SetFightState(1);
		AddTermini(195);
		if (i == 0) then 
			NewWorld(224,1620,3216)
		elseif (i == 1) then 
			NewWorld(224,1594,3166)
		else
			NewWorld(224,1622,3144)
		end

	else
		Say("Sa m筩 th藅 s� r蕋 nguy hi觤! Xin h穣 quay v� r蘮 luy謓 th猰!",1,"Quay l筰 r鮪g Kho竔 Ho箃. /no")
		SetPos(1716,3144)
	end
end;

function no()
end
