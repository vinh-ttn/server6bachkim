-- 黄河源头迷宫 宝箱 昆仑出师任务
-- by：Dan_Deng(2003-07-31)

function main()
	UTask_kl = GetTask(9)
	if (UTask_kl == 60*256+20) then
		if ((HaveItem(11) == 1) and (HaveItem(12) == 1) and (HaveItem(13) == 1) and (HaveItem(14) == 1) and (HaveItem(15) == 1)) then
			DelItem(11)
			DelItem(12)
			DelItem(13)
			DelItem(14)
			DelItem(15)
			AddEventItem(16)
			AddNote("Ph竔 l蕐 Ng� S綾 Th筩h ")
			Msg2Player("B筺 d飊g 5 chi誧 ch譨 kh鉧 treo ph輆 tr猲  m� rng l蕐 Ng� S綾 Th筩h ")
		else
			Talk("Kh玭g c� 5 chi誧 ch譨 kh鉧 kia, b筺 kh玭g th� m� 頲 rng  l蕐  ")
		end
	else
		Talk(1,"","B秓 rng n祔  kh鉧 r錳")
	end
end;
