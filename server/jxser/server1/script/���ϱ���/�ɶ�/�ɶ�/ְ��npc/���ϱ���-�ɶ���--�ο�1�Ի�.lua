-- 西南北区 成都府 嫖客1对话.lua　（方适：拳倾天下任务）
-- By: Dan_Deng(2004-05-24)

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub1 = GetTask(52)
	if (Uworld75 == 10) and (U75_sub1 < 10)then		-- 任务中，接取子任务
		 if (HaveItem(384) == 1) then
			SetTask(52,10)
			AddNote("Nhi謒 v� Quy襫 khuynh thi猲 h�:  Nh筺 Хng S琻 b総 b秠 con nh謓 gi飉 Phng Th輈h ")
			Msg2Player("Nhi謒 v� Quy襫 khuynh thi猲 h�:  Nh筺 Хng S琻 b総 b秠 con nh謓 gi飉 Phng Th輈h ")
			Talk(1,""," Чi s� huynh  cho ph衟 th� ph秈 l祄 m韎 頲! Ta mu鑞 ti謓 y th� ngi.  Nh筺 Хng s琻 thay ta b総 b秠 con nh謓.")
		 else
		 	Talk(1,"","Ngay c� phong th� c遪 kh玭g c� th� l祄 sao m� ta tin ngi h�?")
		end
	elseif (Uworld75 == 10) and (U75_sub1 == 10) then		-- 子任务完成判断
		if (GetItemCount(86) >= 7) then
			for i = 1,7 do DelItem(86) end
			Talk(1,"","Зy ng l� con nh謓 m� ta c莕. Hay qu� hay qu�! Ta c� s� ngi  g苝 v蕁  g� r錳!")
			SetTask(52,20)
			AddNote("Nhi謒 v� quy襫 khuynh thi猲 h�: Nhi謒 v� b総 7 con nhi謓  ho祅 th祅h. ")
			Msg2Player("Nhi謒 v� quy襫 khuynh thi猲 h�: Nhi謒 v� b総 7 con nhi謓  ho祅 th祅h. ")
		else
			Talk(1,"","Vi謈 m� ta giao cho ngi c� kh� kh玭g?")
		end
	else
		Talk(1,"","Th蕐 ngi c騨g l� m閠 ngi th輈h luy謓 ch�, h玬 n祇 r秐h r鏸 thi th� m閠 b鱝 nh�!")
	end
end;
