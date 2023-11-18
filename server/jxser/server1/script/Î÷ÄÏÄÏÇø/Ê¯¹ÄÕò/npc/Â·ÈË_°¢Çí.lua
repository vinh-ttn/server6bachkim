--石鼓镇 路人 阿琼 新手任务：阿琼的戒指
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world24 = GetTask(24)
	if (UTask_world24 == 0) and (GetLevel() >= 5) then		-- 任务启动
		Say("Chi誧 nh蒼 c馻 ta t譵 kh玭g th蕐, nh蕋 nh l� con linh mi猽 tha 甶 r錳. ",2,"Gi髉 c� ta t譵. /W24_get_yes","Gi� v� nh� kh玭g nghe/W24_get_no")
	elseif (UTask_world24 == 5) and (HaveItem(234) == 1) then		-- 任务完成
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
		if (GetSex() == 0) then
			W24_rank = "<#> T蕀 b颽 h� th﹏ n祔 ta gi� c騨g ch糿g 輈h g�, h穣 c莔 l蕐 coi nh� l� t� l�."
			AddItem(0, 4, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("Л頲 mi課g l謓h ph� h� th﹏ L鬰 C玭g Th筩h. ")
		else
			W24_rank = "<#> S頸 d﹜ chuy襫 n祔 m芻 d� r蕋 p nh璶g l� c馻 m閠 k� ng gh衪 t苙g cho ta, b﹜ gi� ta a l筰 cho ngi."
			AddItem(0, 4, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("Л頲 m閠 d﹜ chuy襫 уng. ")
		end
		Talk(1,"","<#> 竔 ch�! Зy ch糿g ph秈 l� chi誧 nh蒼 c馻 ta sao? Th藅 c秏 琻 ngi  t譵 n� gi髉 ta!"..W24_rank)
		SetTask(24,10)
		DelItem(234)
		AddRepute(7)
		AddNote("Giao nh蒼 cho A Kinh. Ho祅 th祅h nhi謒 v� ")
		Msg2Player("Giao nh蒼 cho A Kinh. Ho祅 th祅h nhi謒 v� ")
		Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 7 甶觤. ")
	else				-- 非任务对话
		Talk(1,"","Th玭 ta con g竔 u kh衞 tay, thng c総 gi蕐 k輓h th莕 b竔 ph藅, ta th輈h nh蕋 l� chi誧 nh蒼 n祔, l祄 r蕋 tinh x秓.")
	end
end;

function W24_get_yes()
	SetTask(24,5)
	Talk(1,"","ng lo! Ta s� 甶 t譵 l筰 cho mu閕!")
	AddNote("Nh薾 nhi謒 v�: Gi髉 A Kinh t譵 chi誧 nh蒼 b� nh m蕋. ")
	Msg2Player("Nh薾 nhi謒 v�: Gi髉 A Kinh t譵 chi誧 nh蒼 b� nh m蕋. ")
end

function W24_get_no()
end
