-- 塔林迷宫 战斗NPC ？？ 30级任务
-- by：Dan_Deng(2003-08-01)

function OnDeath()
	UTask_sl = GetTask(7);
	if (UTask_sl == 30*256+10) and (random(0,99) < 50) then
		SetTask(7,30*256+20)
		Msg2Player("Th� ra k� h祅h tung b� m藅 n祔 l� tay ch﹏ c馻 ngi Kim, ng ng c馻 ch髇g  l蕐 c緋 B竧 Nh� Ba La M藅  T﹎ Kinh, ch箉 n Kim Quang ng ph輆 t﹜ B綾 Ki誱 C竎. ")
		AddNote("Ngi h祅h tung b� m藅 � Th竝 L﹎ l� tay ch﹏ c馻 ngi Kim, ng ng c馻 ch髇g  l蕐 c緋 B竧 Nh� Ba La M藅  T﹎ Kinh, ch箉 n Kim Quang ng ph輆 T﹜ B綾 Ki誱 C竎. ")
	end
end;
