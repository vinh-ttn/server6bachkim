--西南北区 竹丝洞二层to竹丝洞三层
--Trap ID：西南北区 9
-- Update: Dan_Deng(2003-08-13)

function main(sel)
	UTask_tm = GetTask(2)
	if (UTask_tm >= 60*256+60) and (GetFaction() == "tangmen") then		-- 过了这一步的本门弟子可以自由练级
		SetFightState(1)
		NewWorld(28, 1551, 3192)
	elseif ((UTask_tm == 60*256+40) and (HaveItem(100) == 1)) then			--任务中并且有钥匙
		DelItem(100)
		SetFightState(1)
		NewWorld(28, 1551, 3192)
		SetTask(2, 60*256+60)
	else
		Talk(1,"","Kh玭g c� ch譨 kh鉧, b筺 kh玭g th� v祇 T莕g 3 Tr骳 T� ng.")
	end
end;
