-- 扬州会友客栈 路人NPC 张浚（丐帮40级任务）
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 40*256+20) and (HaveItem(236) == 1) then		--40级任务中
		Talk(3,"","Trng i nh﹏, ta l�  t� C竔 Bang. Ta c� m閠 b鴆 h祄 th� quan tr鋘g mu鑞 ph秈 giao 玭g. B猲 trong c� ch鴑g c� c馻 c萿 t芻 tri襲 nh c蕌 k誸 v韎 gi芻 Kim.Ngo礽 ra, Kim qu鑓 ﹎ m璾 竚 s竧 玭g khi 玭g tr猲 阯g l猲 kinh. Tuy  t� b鎛 bang  thay i nh﹏ h� th� nh鱪g t猲 s竧 th�, nh璶g kh� m� ch綾 頲 ch髇g c� ra tay n鱝 hay kh玭g? Xin i nh﹏ h穣 c� g緉g b秓 tr鋘g!","�! L筰 c� chuy謓 nh� th�!  t� qu� bang  ra tay tng tr�, b鴆 h祄 th� n祔 r蕋 quan tr鋘g. Ta nh蕋 nh s� ch th﹏ g苝 ho祅g thng. Kh玭g ph秈 ch� v� s� an nguy c馻 ta, m� ph秈 l蕐 Qu鑓 n筺 l祄 u! C竔 m筺g ta n祇 c� x� chi!","Trng i nh﹏ l� tr� c閠 qu鑓 gia! Xin h穣 b秓 tr鋘g! T筰 h� 甶 y!")
		DelItem(236)
		SetTask(8,40*256+30)
		AddNote("Giao b鴆 Th輈h s竧 m藅 h祄 cho Tr璷ng Tu蕁 ")
		Msg2Player("Giao b鴆 Th輈h s竧 m藅 h祄 cho Tr璷ng Tu蕁 ")
	else
		Talk(1,"","Qu鑓 gia l﹎ nguy, l� con d﹏ ph秈 c� tr竎h nhi謒 v韎 t nc.Y猲 t﹎! Ta nh蕋 nh s� kh玭g l祄 ngi th蕋 v鋘g!")
	end
end;
