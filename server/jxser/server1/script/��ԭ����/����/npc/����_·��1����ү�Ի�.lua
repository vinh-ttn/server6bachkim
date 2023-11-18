-- 扬州 路人NPC 柳大爷（丐帮入门任务）
-- by：Dan_Deng(2003-07-28)

function main()
	Uworld30 = GetByte(GetTask(30),2)
	if (Uworld30 == 10) and (HaveItem(72) == 0) then		--入门任务中并且没有该物品
		Say("Ph秈 khen th� n祇 y?",4,"T礽 ph骳 /prise_1","Con ch竨. /prise_2","c玭g danh /prise_3","R阨 kh醝/prise_exit")
	else					--在普通对话中给一点点任务提示。
		i = random(0,2)
		if (i == 0) then
			Talk(1,""," S鑞g tr猲 i, c莕 ph秈 c� l遪g t� t﹎!")
		elseif (i == 1) then
			Talk(1,"","Ha!Ha! Kh玭g sai! Kh玭g sai! Ta b譶h sinh m芻 d� kham kh�,nh璶g b﹜ gi� th� kh� t薾 cam lai,con ch竨 l筰 r蕋 hi誹 thu薾. Ta  c� th� t� h祇 v韎 t� t玭g c馻 m譶h r錳!")
		else
			Talk(1,"","C� i ta ch� 甧o 畊鎖 m閠 gi蔯 m閚g n祔 th玦! Ha! Ha! Xem ra ta l� ngi h筺h ph骳 nh蕋 tr猲 i")
		end
	end
end;

function prise_1()
	Talk(2,"","L穙 gia n祔, v鮝 nh譶  bi誸 ngi gi祏 c�, gia t礽 v筺 quan!","Kh玭g sai kh玭g sai! Tuy ta ╪ m芻 kh玭g thi誹, nh璶g gia c秐h ch� b譶h thng, 甶襲 vui nh蕋 l� con ch竨 r蕋 hi誹 thu薾")
end;

function prise_2()
	Talk(4,"","L穙 gia, v鮝 nh譶 ta  bi誸 玭g l� ngi gi祏 c�, nh蕋 nh l� d遪g d鈏 danh gia","Ha!Ha! Kh玭g sai! Kh玭g sai! Ta b譶h sinh m芻 d� kham kh�, nh璶g b﹜ gi� th� kh� t薾 cam lai,con ch竨 l筰 r蕋 hi誹 thu薾. Ta  c� th� t� h祇 v韎 t� t玭g c馻 m譶h r錳!","L穙 gia! c� th� cho ta 1 s頸 r﹗ c馻 玭g kh玭g?","Th籲g nh� n祔 th藅 l� k� qu竔! Mu鑞 xin m閠 s頸 r﹗ c馻 ta  l祄 g�? Nh璶g m� d� sao th� ngi c騨g c� duy猲 v韎 ta ! Л頲! Ta t苙g ngi m閠 s頸 r﹗!")
	AddEventItem(72)
	Msg2Player("C� s頸 r﹗ t� ch� l穙 gi�. ")
	AddNote("B筺 c� m閠 s頸 r﹗ ")
end;

function prise_3()
	Talk(2,"","V� l穙 gia n祔 v鮝 nh譶  bi誸 h鋍 th鴆 uy猲 th﹎! Th阨 trai tr�  h鋍 qu� cao trung r錳!","Ta v鑞 kh玭g m祅g ch� ngh躠, trc gi� ch璦  m総 n c玭g danh, ngi khen qu� l祄 ta ng筰!")
end;

function prise_exit()
end;
