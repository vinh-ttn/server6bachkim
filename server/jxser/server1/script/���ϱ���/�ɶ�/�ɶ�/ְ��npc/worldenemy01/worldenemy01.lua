--description: 成都野外野猪 世界任务
--author: yuanlan	
--date: 2003/4/1

function OnDeath()
	Uworld11 = GetTask(11)
	if (Uworld11 < 255) and (Uworld11 >= 1) and (random(0,99) < 10) then		-- 任务中，10%几率
		if (Uworld11 < 10) then					-- 到达十只后不再计数
			Uworld11 = Uworld11 + 1
			SetTask(11,Uworld11)
			Msg2Player("Ta  gi誸 ch誸 1 con heo r鮪g chuy猲 qu蕐 nhi評 d﹏ l祅g, trc m総 t鎛g c閚g  gi誸 ch誸 "..(Uworld11 - 1).."Con ")
		else
			SetTask(11,100)
			Msg2Player("Ta  gi誸 ch誸 10 con heo r鮪g, c� th� tr� v� ph鬰 m謓h 頲 r錳 ")
		end
	end
end;
