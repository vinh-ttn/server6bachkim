-- 临安 路人NPC 小太监（丐帮50级任务）
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+40) then				--带着50级任务
		Talk(2,"L50_pay","Ngi l� ai?","Ta l� ngi th﹏ th輈h c馻 T祇 i nh﹏! C� ch髏 l� v藅 � c� hng mu鑞 bi誹 cho T祇 gia! Xin nh� ng礽 th玭g b竜 gi髉 cho!")
	else
		Talk(1,""," ra!  ra! ng c� 甶 t韎 甶 lui trc c鯽 Ho祅g Cung")
	end
end;

function L50_pay()
	Say("Th﹏ th輈h! Th﹏ th輈h c竔 g�? Х n y  bi誹 x衝 m� l筰 kh玭g bi誸 ti襫 l�?",2,"H鑙 l� 3000 l筺g ng﹏ lng! /L50_pay_yes","Kh玭g cho! /L50_pay_no")
end;

function L50_pay_yes()
	if (GetCash() >= 3000) then
		Pay(3000)
		Talk(1,"after_pay","Bi誸 r錳! Зy c� 3000 lng, xin bi誹 t玭 huynh u鑞g ru!")
	else
		Talk(1,"","Th藅 l� keo ki謙! Mau 甶 甶!")
	end
end;

function after_pay()
	NewWorld(177, 1569, 3169)
	Msg2Player("H鑙 l� 3000 cho Ti觰 Th竔 gi竚, h緉 s� d� d祅g  cho b筺 甶 v祇 Ng� Hoa Vi猲 ")
	Talk(1,"","Nh� v莥 c騨g t筸 頲! T祇 c玭g c玭g 產ng � trong ng� hoa vi猲. Ngi h穣 v祇 trong  m� t譵!")
end

function L50_pay_no()
end;
