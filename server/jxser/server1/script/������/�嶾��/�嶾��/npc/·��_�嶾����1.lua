-- 五毒 路人NPC 五毒弟子1 入门任务
-- by：Dan_Deng(2003-08-05)

function main()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) then		-- 入门任务中
		if ((HaveItem(227) == 1) and (HaveItem(223) == 1) and (HaveItem(225) == 1) and (HaveItem(226) == 1) and (HaveItem(227) == 1)) then
			Talk(1,"","Oa! T筰 sao l筰 Kh鎛g tc v� t苙g cho ta v藋. Ph秈 mang n t苙g cho s� huynh � trong ng n祔 m韎 ng. ")
		else
			Talk(1,"","Th阨 gian luy謓 c玭g v蒼 ch璦 , t筰 sao ngi l筰 ra y? Xem c竔 b� d筺g  n c馻 ngi k譨. L祄 sao c� th� tr� th祅h  t� c馻 b鎛 m玭? Su鑤 i ch� c� m� m� th玦. ")
		end
	elseif (Uworld37 == 0) and (GetLevel() >= 10) and (GetFaction ~= "wudu") then		--入门任务
		Say("Mu鑞 tr� th祅h  t� k� danh c馻 b鎛 m玭, c莕 ph秈 th� luy謓 qua Ng� чc ng n祔. Ngi c� mu鑞 th� kh玭g",2,"D�! в ta th� xem! /enroll_get_yes","Kh玭g, ta ch� n tham quan. /no")
	else							-- 常规对话
		Talk(1,"","ng c� ch箉 lo筺 nh� v藋. чc tr飊g nu玦 trong ng m� c緉 th� ngi v� phng c鴘 ch鱝. ")
	end
end;

function enroll_get_yes()
	Uworld37 = SetByte(GetTask(37),2,10)
	SetTask(37,Uworld37)
	AddNote("Nh薾 nhi謒 v� n Ng� чc ng luy謓 c玭g, 甶 v祇 trong ng, b筺 s� nh薾 頲 5 s頸 l玭g mao chim Kh鎚g Tc. ")
	Msg2Player("Nh薾 nhi謒 v� n Ng� чc ng luy謓 c玭g, 甶 v祇 trong ng, b筺 s� nh薾 頲 5 s頸 l玭g mao chim Kh鎚g Tc. ")
end;

function no()
end;
