--西北北区 龙门镇to莫高窟
--TrapID：

function main(sel)
	if (GetLevel() >= 5) then
		SetFightState(1);
		NewWorld(340,1853,3446);
		AddTermini(225);
	else
		Talk(1,"","Ph輆 trc nguy hi觤! Xin h穣 quay v� r蘮 luy謓 th猰!")
	end
end;