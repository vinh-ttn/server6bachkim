--  西北南区\剑阁西北\npc\战斗_uworld127_大雕
--  天忍90级任务大雕
--  by xiaoyang(2004\4\12)


function OnDeath()
	Uworld127 = GetTask(127)
	if ((Uworld127 == 20) or (Uworld127 ==30)) and (HaveItem(369) == 0) and (random(0,99) < 66) then
		AddEventItem(369)
		Msg2Player("B筺  b総 頲 t蕀 ph� 甶猽 th莕 ng祅 n╩ ")
		AddNote("B総 頲 t蕀 linh 甶猽 c� th� quay v� ph� c玭g ch骯 ph鬰 m謓h. ")
		SetTask(127,30)
	end
end
