-- 翠烟门 翠烟门弟子2 入门任务
-- by：Dan_Deng(2003-07-25)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) then		--入门任务
		if (HaveItem(106) == 1) then
			enroll_prise()
		else
			Say("Kh玭g c� <color=Red>Hoa T譶h<color>, kh玭g th� vt qua Hoa Kh玦 tr薾. T� th藅 s� mu鑞 qua tr薾?",2,"L莕 n祔 ta kh玭g c� chu萵 b� t鑤 /U36_uncompleted","Ta ti誴 t鬰 x玭g tr薾 /no")
		end
	elseif (GetFaction() == "cuiyan") then			-- 本门弟子
		Say("S� mu閕 luy謓 c玭g trong Hoa Kh玦 tr薾? C� mu鑞 r阨 kh醝 Hoa Kh玦 tr薾 kh玭g?",2,"Л頲, 產 t� t� t� /U36_leave","Kh玭g c莕, ta c遪 ph秈 ti誴 t鬰 luy謓 c玭g /no")
	elseif (UTask_cy == 70*256) then			-- 已出师
		Talk(1,"","Th� ra l� S� t�, l﹗ qu� kh玭g g苝!")
	else
		Talk(1,"","Hoan ngh猲h n Th髖 Y猲 m玭.")
	end
end;

function enroll_prise()
	Talk(1,"U36_leave","Ch骳 m鮪g! B筺  vt qua th� th竎h c馻 B鎛 ph竔, t� b﹜ gi� ch髇g ta l� t� mu閕 t鑤! ")
	DelItem(106)			-- 情花
	i = ReturnRepute(20,29,5)		-- 缺省声望，最大无损耗等级，每级递减
	AddRepute(i)
	Uworld36 = SetByte(GetTask(36),2,127)
	SetTask(36,Uworld36)
	AddNote("Ho祅 th祅h nhi謒 v� Hoa Kh玦 tr薾, tr� th祅h <color=Red>K� Danh  t�<color> c馻 Th髖 Y猲 m玭 ")
	Msg2Player("Ho祅 th祅h nhi謒 v� Hoa Kh玦 tr薾, tr� th祅h K� Danh  t� c馻 Th髖 Y猲 m玭 ")
end;

function U36_uncompleted()
	Talk(1,"U36_leave","Hoan ngh猲h t� mu閕 x玭g tr薾 b蕋 c� l骳 n祇!")
end

function U36_leave()
--	SetPos(304,1498)
	SetPos(340,1456)
end

function no()
end
