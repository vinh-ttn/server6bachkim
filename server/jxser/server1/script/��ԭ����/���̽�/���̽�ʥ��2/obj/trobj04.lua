--description: 天忍教圣洞二层宝箱 天忍教出师任务
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+70) then
		if (HaveItem(132) == 1) then
			Talk(1,"","B秓 rng  r鏽g")
		elseif (HaveItem(102) == 1) then
			DelItem(102)
			AddEventItem(132)
--			SetTask(4, 68)
			AddNote("M� rng b竨, l蕐 頲 Thi猲 Nh蒼 th竛h th瓧梥竎h da d�. ")
			Msg2Player("M� rng b竨, l蕐 頲 m閠 quy觧 s竎h da d�. ")
		else
			Talk(1,"","Kh玭g c� ch譨 kh鉧, kh玭g m� 頲 rng.")
		end
	else
		Talk(1,"","Kh玭g c� ch譨 kh鉧, kh玭g m� 頲 rng.")
	end
end;
