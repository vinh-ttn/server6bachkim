--description: 秦陵农夫　天忍30级任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if ((UTask_tr == 30*256+20) and (HaveItem(62) == 0)) then			-- 任务状态对话
		Talk(3, "select", "H玬 qua ta l祄 vn, nh苩 頲 m閠 vi猲 ng鋍 m祏, ph竧 ra 竛h s竛g tr玭g r蕋 l� l�. Nh璶g ch糿g th� ╪ ch糿g th� m芻,v藋 d飊g v祇 vi謈 g�? Th竛g trc Vng Th蕋 c飊g th玭 c騨g o 頲 m閠 t骾 b筩, nh�  s�  th� kh玭g bi誸? H� th� o 頲 t骾 b筩 c遪 ta th� o 頲 m閠 c鬰 , th藅 xui x蝟!", " (Ch糿g l� l� l� V﹏ M閚g T�?!) Чi th骳! Ta mu鑞 mua vi猲  n祔! Th骳 b竛 kh玭g?", "Ta kh玭g nghe l莔 ch�, th藅 s� ngi mu鑞 mua �? (G苝 may r錳, ng l� m閠 th籲g ng鑓!) . Л頲 頲! Ch� c莕 ngi a ta 100 lng th� vi猲  n祔 l� c馻 ngi")
	elseif (UTask_tr >=30*256+20) then								--执行完30级任务
		Talk(1,"","Ngi c遪 mu鑞 mua n鱝 kh玭g? L莕 sau ta o 頲 s� b竛 r� h琻 cho!")
	else						-- 缺省对话
		Talk(1,"","C� i l祄 ru閚g, bi誸 n khi n祇 m韎 o 頲 ch﹗ b竨  ph竧 t礽 y!")
	end
end;

function select()
	if (GetCash() >= 100) then
		Pay(100)
		AddEventItem(62)
		Msg2Player("Л頲 B秓 Th筩h V﹏ M閚g T� ")
		AddNote("Trong khu r鮪g ngo礽 T莕 L╪g a, g苝 m閠 ngi n玭g d﹏, mua 頲 B秓 Th筩h V﹏ M閚g T�. ")
	else
		Talk(1,"","Khi n祇  ti襫, l筰 n t譵 ta nh�!")
	end
end;
