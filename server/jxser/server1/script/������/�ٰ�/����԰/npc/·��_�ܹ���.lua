-- 临安 路人NPC 曹公公（丐帮50级任务）
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+20) and (HaveItem(199) == 1) then		--带着50级任务
		Talk(3,"","V� c玭g c玭g n祔! Ta mu鑞 v祇 g苝 Ho祅g thng. C� m閠 v藅 quan tr鋘g mu鑞 giao cho Ho祅g thng. "," Ho祅g thng hi謓 產ng ngh� ng琲. C� giao v藅  cho ta. Ta s� chuy觧 n cho Ho祅g thng","祬chuy謓 n祔� ","Sao h�? Kh玭g tin tng ta �? C騨g kh玭g ch辵 h醝 trc xem T祇 c玭g c玭g ta l� ngi nh� th� n祇. Ho祅g thng t� nh� n l韓 u do ta s╪ s鉩. L� n祇 ta l筰 甶 g箃 ngi sao? ","V藋 c騨g 頲!")
		AddNote("Giao b鴆 a  cho T祇 c玭g c玭g. ")
		Msg2Player("Giao b鴆 a  cho T祇 c玭g c玭g. ")
		DelItem(199)
		SetTask(8,50*256+30)
		NewWorld(176, 1627, 3206)
	else
		Talk(1,"","Ngi l� ai? Ai cho ngi 甶 v祇 y?")
	end
end;
