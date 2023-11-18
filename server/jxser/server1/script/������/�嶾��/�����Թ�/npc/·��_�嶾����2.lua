-- 五毒 路人NPC 五毒弟子2 入门任务（完成）
-- by：Dan_Deng(2003-08-05)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) then		-- 入门任务完成
		if (HaveItem(227) == 1) and (HaveItem(223) == 1) and (HaveItem(224) == 1) and (HaveItem(225) == 1) and (HaveItem(226) == 1) then
			enroll_prise()
		else
			Talk(1,"","Th阨 gian luy謓 c玭g v蒼 ch璦 , t筰 sao ngi l筰 ra y?")
		end
	else							-- 常规对话
		Talk(1,"","Trong ng Ng� чc r蕋 nguy hi觤, ngi ch� c� 甶 l筰 lung tung ")
	end
end;

function enroll_prise()
	Talk(1,"","N╩ Kh鎛g tc v�  gom . Hay l緈! V藋 l� ngi  ch輓h th鴆 tr� th祅h  t� k� danh c馻 b鎛 m玭 r錳")
	DelItem(227)
	DelItem(223)
	DelItem(224)
	DelItem(225)
	DelItem(226)
	i = ReturnRepute(25,29,5)		-- 缺省声望，最大无损耗等级，每级递减
	AddRepute(i)
	Uworld37 = SetByte(GetTask(37),2,127)
	SetTask(37,Uworld37)
	AddNote("Ho祅 th祅h nhi謒 v� luy謓 c玭g � Ng� чc ng, Ch輓h th鴆 tr� th祅h <color=red>K� Danh  t�<color> c馻 b鎛 m玭. ")
	Msg2Player("Ho祅 th祅h nhi謒 v� luy謓 c玭g � Ng� чc ng, Ch輓h th鴆 tr� th祅h K� Danh  t� c馻 b鎛 m玭. ")
end;
