-- 黄河源头 路人NPC 老者（昆仑派出师任务）
-- by：Dan_Deng(2003-07-31)

function main()
	UTask_kl = GetTask(9);
	if (UTask_kl == 60*256+10) then		--出师任务中
		Talk(1,"","Ch祅g Thanh ni猲! Ngic騨g 產ng mu鑞 甶 t譵 Ng� s綾 th筩h ph秈 kh玭g? Nghe n鉯 m� cung 甶 v祇  b� 5 v� Thi猲  th阨 thi猲 c� d飊g kh鉧 tr阨 kh鉧 l筰 r錳! Mu鑞 l蕐 頲 Ng� S綾 th筩h, ngi ph秈 c� 頲 5 chi誧 'Thi猲 T醓'")
		SetTask(9,60*256+20)
		AddNote("Ph秈 l祄 theo s� ch� d蒼, 甶 v祇 s琻 ng  t譵 5 chi誧 ch譨 kh鉧, m韎 l蕐 頲 Ng� S綾 Th筩h ")
		Msg2Player("Ph秈 l祄 theo s� ch� d蒼, 甶 v祇 s琻 ng  t譵 5 chi誧 ch譨 kh鉧, m韎 l蕐 頲 Ng� S綾 Th筩h ")
	else
		Talk(1,"","Ng� S綾 th筩h b� t秐 l筩 trong nh﹏ gian,  g﹜ n猲 bi誸 bao nhi猽 tr薾 m竨 . R鑤 cu閏 l� n� mang n猲 'h鋋'hay l� 'ph骳'?")
	end
end;
