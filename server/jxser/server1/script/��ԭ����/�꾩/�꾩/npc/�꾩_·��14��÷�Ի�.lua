--description: 中原北区 汴京府 路人14冬梅对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),3)
		if (UTask_trsub60 == 0) then
			DelItem(130)			--处理重接任务后，玩家捡起任务道具的情况	
			Say("Th蕐 Ti觰 H秈 nh� t玦 kh玭g? Kh玭g bi誸 n� l筰 ch箉 甶 u ch琲 r錳, ngi c� th� gi髉 ta t譵 n� 頲 kh玭g?", 2, "Л頲!/L60_sub3_yes", "Ta c遪 c� vi謈 kh竎. /L60_sub3_no")
		elseif (UTask_trsub60 == 2) then
			Talk(1,"","T譵 th蕐 Ti觰 H秈 nh� t玦 ch璦?")
		elseif (UTask_trsub60 == 4) then
			Talk(2, "", "Ti觰 H秈 產ng ch琲 � qu穘g trng, l竧 n鱝 s� v�!", "C竚 琻 ngi! Ti觰 H秈 nh� ta sau n祔 l韓 l猲 ch� c莕 頲 ph﹏ n鱝 nh� ngi l� t鑤 r錳! Ta t苙g c騨g kh玭g c� g� qu� gi�, ch� c� m閠 thanh ki誱 n祔 v鑞 l� v藅 ph遪g th﹏. Th蕐 ngi c騨g l� m閠 ngi t藀 v�, xin t苙g thanh 畂秐 ki誱 n祔 cho ng")
			AddEventItem(130)
			Msg2Player("Nh薾 頲 thanh ki誱 Kh� T� ")
			SetTask(28, SetByte(GetTask(28),3,10))
			AddNote("V� n nh� c馻 Йng Mai, nh薾 頲 thanh ki誱 Kh� T� ")
		elseif (UTask_trsub60 == 10) and (HaveItem(130) == 0) then
			AddEventItem(130)
			Msg2Player("Nh薾 頲 thanh ki誱 Kh� T� ")
			Talk(1,"","Thanh ki誱 n祔 m芻 d� kh玭g qu� gi� g�, nh璶g l� m閠 ch髏 th祅h � c馻 ta, ngi ng t� ch鑙 n鱝.")
		else
			Talk(1,"","Cha Ti觰 H秈 kh玭g c� � nh�, a con n祔 l筰 kh玭g bi誸 nghe l阨! ")
		end
	else
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","Th蕐 Ti觰 H秈 nh� t玦 u kh玭g? Kh玭g bi誸 n� ch箉 甶 u ch琲 r錳!")
		elseif (i == 1) then
			Talk(1,"","Cha Ti觰 H秈 kh玭g c� � nh�, m鋓 chuy謓 u do t玦 qu竛 xuy課, v藋 m� n� l筰 kh玭g nghe l阨! ")
		else
			Talk(1,"","Th� c鬰 hi謓 gi� kh玭g t鑤! mu鑞 s鑞g qua ng祔 th藅 kh�!")
		end;
	end
end;

function L60_sub3_yes()
	Talk(1,"","Phi襫 ngi qu�! ")
	SetTask(28, SetByte(GetTask(28),3,2))
	AddNote("T譵 g苝 Йng Mai t筰 m閠 khu d﹏ c� ph輆 Йng B綾 Bi謓 Kinh, gi髉 N祅g ta t譵 Ti觰 H秈 ")
	Msg2Player("Йng Mai nh� ngi gi髉 c� 蕐 甶 t譵 Ti觰 H秈 v� ")
end;

function L60_sub3_no()
	Talk(1,"","Chao 玦! a con n祔 th藅 khi課 ngi ta ph秈 lo l緉g! ")
end;
