-- 学“劫富济贫”技能的乞丐
-- By: Dan_Deng(2003-08-22)
-- 给钱数第一次100，第二次200，第三次400...依此类推，估计8次(12800)之后还没学到的就没什么意义了，只能怨太命苦。

function main(sel)
	UTask_world16 = GetTask(16)
	if (UTask_world16 == 255) then			-- 任务已完成
		Talk(1,"","� hi襫 g苝 l祅h!")
	else
		i = (2 ^ UTask_world16) * 100
		Say("Ch骳 ng礽 m筺h kh醗, xin thng x鉻 k� ╪ m祔 ngh蘯 h蘮 n祔! ",2,"Cho ngi "..i.."ng﹏ lng./W53_pay","Nh鱪g k� ╪ no li bi課g, nh蕋 nh kh玭g 駈g h� /W53_no")
	end
end;

function W53_pay()
	UTask_world16 = GetTask(16)
	i = (2 ^ UTask_world16) * 100
	if (GetCash() >= i) then
		Pay(i)
		if (random(0,99) < 20) then			-- 20%机率学到“劫富济贫”技能
			Talk(3,"W53_prise"," t� l遪g t鑤, c� mu鑞 h鋍 m閠 v礽 tr� ch琲 vui kh玭g? ","Tr� g� vui? ","ng l� nh� th�. V藋. ")
		else
			SetTask(16,UTask_world16 + 1)
		end
	else
		Talk(1,"","B﹜ gi� ta kh玭g c� ti襫 l�!")
	end
end;

function W53_no()
	Talk(1,"","Ngi kh玭g c� t蕀 l遪g! B� T竧 s� kh玭g ph� h頿.")
end;

function W53_prise()
	AddNote("B� th� cho ngi ╪ m祔, h鋍 頲 k� n╪g 'Ki誴 Ph� T� B莕' ")
	Msg2Player("B� th� cho ngi ╪ m祔, h鋍 頲 k� n╪g 'Ki誴 Ph� T� B莕' ")
	if (HaveMagic(400) == -1) then		-- 必须没有技能的才给技能
		AddMagic(400,1)
	end
	SetTask(16,255)
end;
