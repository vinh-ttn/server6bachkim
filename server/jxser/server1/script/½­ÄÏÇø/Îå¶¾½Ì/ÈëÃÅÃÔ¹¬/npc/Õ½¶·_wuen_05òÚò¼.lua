-- 五毒教五毒洞 战斗NPC 蜈蚣01（五毒入门任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),2)
	if ((Uworld37 == 10) and (HaveItem(226) == 0) and (random(0,99) < 80)) then		-- 在任务中并且无任务物品
		AddEventItem(226)
		Msg2Player("B筺 nh薾 頲 Kh鎛g tc v� th� n╩ ")
		AddNote("B筺 nh薾 頲 Kh鎛g tc v� th� n╩ ")
	end
end;
