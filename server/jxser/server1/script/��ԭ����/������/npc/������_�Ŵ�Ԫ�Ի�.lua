--description: 新手村_张大元
--author: wangzg	
--date: 2003/7/22
--update 2003/7/28 yuanlan

function main()
	UTask_world44=GetTask(72)
	if (UTask_world44==2) then
		Talk(8,"","Huynh c� ph秈 l� Trng Чi Nguy猲 kh玭g?"," L� ta y, c� chuy謓 g� kh玭g?","Doanh Doanh c� nng nh� ta a cho huynh chi誧 kh╪ tay n祔, nh� ta n鉯 l筰, canh ba m nay, ch� c�, kh玭g g苝 kh玭g v�.","C竔 g�? Trng Чi Nguy猲! Anh v蒼 c遪 giao du v韎 � th� may 蕐 �?"," L祄 g� c�? Ta u c� chuy謓 g� v韎 c� 蕐, nng t� h穣 tin ta.","Nh璶g....."," N祔, ngi ng t飝 ti謓 vu c竜 ngi t鑤 ch�!",".....�.")
		SetTask(72,4)
		Msg2Player("Kh玭g ng� ch� v� m閠 chi誧 kh╪ tay g蕀 m� b� m緉g ch鰅, quay l筰 n鉯 v韎 Doanh Doanh. ")
		AddNote("T譵 th蕐 Trng Чi Nguy猲, chuy觧 l筰 l阨 c馻 Doanh Doanh, kh玭g ng� anh ta l� ngi  c� v�, kh玭g a 頲 chi誧 kh╪ tay uy猲 ng, m� c遪 b� ch鰅. ")		
	elseif (UTask_world44==4)  then
		Talk(1,"","ng t飝 ti謓 vu c竜 ngi t鑤 ch�!")
	else
		Talk(1,"","L祄 ngi th藅 kh玭g d�, l祄 n 玭g c祅g kh玭g d�, l祄 ngi n 玭g o hoa l筰 c祅g kh� h琻.")
	end
end
