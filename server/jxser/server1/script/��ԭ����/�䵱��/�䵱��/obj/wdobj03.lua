--description: 武当派出师任务 武当山宝箱3
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","B秓 rng: <color=Red>Th� tng<color> trong <color=Red>Nha m玭 Tng Dng<color> c� ng祔 ch� bi誸 u鑞g ru, 鴆 hi誴 b� t竛h, l穙 b� t竛h o竛 gi薾, <color=Red>b筼 ch輓h<color> l莕 n祔, l祄 sao di謙 頲?")
			Msg2Player("L� b颽 tr猲 b秓 rng � Th竔 T� nham vi誸:  c秐h c竜 ch� tng Tng Dng, gi髉 d﹏ tr� 竎. ")
			SetTask(17, SetByte(GetTask(17),3,2))
			AddNote("L� b颽 tr猲 b秓 rng � Th竔 T� nham vi誸:  c秐h c竜 ch� tng Tng Dng, gi髉 d﹏ tr� 竎. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 5) then
			Talk(1,"","B� t竛h Tng Dng v蒼 s鑞g 頲 di <color=Red>ch輓h s竎h t祅 b筼<color> c馻 <color=Red>Th� tng<color>.....")
			Msg2Player("Nh﹏ d﹏ � th祅h Tng Dng v蒼 trong c秐h d莡 s玦 l鯽 b醤g... ")
		elseif (UTask_wd60sub == 5) then
			AddEventItem(71)
			Talk(1,"","X鉧 b� <color=Red>ch輓h s竎h t祅 b筼<color> c馻 Tng Dng, m� B秓 rng, l蕐 頲 1 quy觧 <color=Red>'Th竔 Thanh Ch﹏ Kinh'<color>.")
			Msg2Player("Di謙 xong b筼 quy襫 � th祅h Tng Dng, c� 頲 1 b� Th竔 Thanh Ch﹏ Kinh. ")
			SetTask(17, SetByte(GetTask(17),3,10))
			AddNote("M� B秓 rng c� 頲 b� Th竔 Thanh Ch﹏ Kinh ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(71) == 0) then
				AddEventItem(71)
			else
				Talk(1,"","B秓 rng  r鏽g")
			end
		end
	else
		Talk(1,"","Ch璦 nh薾 nhi謒 v�! B筺 kh玭g th� m� B秓 rng n祔!")
	end
end;
