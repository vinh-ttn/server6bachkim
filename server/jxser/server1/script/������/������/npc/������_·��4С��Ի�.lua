--两湖区 巴陵县 路人4小渔对话
--巴陵县新手任务：小渔的爹爹
--suyu
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world18 = GetTask(46);
	if (UTask_world18 == 0) then		-- 任务启动
		Say("Hu!!hu! B� ch竨 h玬 qua 甶 nh c� g苝 ph秈 m璦 l韓, b﹜ gi� l﹎ b謓h r錳, b﹜ gi� c遪 l猲 c琻 s鑤 n鱝. B� kh玭g kh醝 b謓h, kh玭g th� 甶 nh c�, ch髇g ch竨 bi誸 ╪ c竔 g�? C�/ch� c� th� gi髉 ch竨 n c莡 c鴘 Ng� th莕 y kh玭g? g 蕐 l� m閠 ngi t鑤, ch綾 ch緉 s� gi髉!",2,"Gi髉 /yes","Kh玭g gi髉 /no")
	elseif(UTask_world18 == 1) then		-- 任务完成
		if(HaveItem(180) == 1) then
			Talk(1,"","�! Зy l� thu鑓 T� B� ho祅 �?Nh� v藋 b謓h t譶h c馻 b� ch竨 nh蕋 nh s� kh醝. C�/ch� th藅 l� m閠 ngi t鑤, C�/ch� h穣 nh薾 l蕐 i gi祔 n祔, c馻 m� ch竨 l祄 y. ")
			DelItem(180)
			SetTask(46, 2)
			AddNote("Лa T� B� ho祅 c馻 Ti觰 Ng�, ho祅 th祅h nhi謒 v�. ")
			Msg2Player("Лa T� B� ho祅 c馻 Ti觰 Ng�, ho祅 th祅h nhi謒 v�. ")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
			if(GetSex() == 0) then
				AddItem(0, 5, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("L蕐 頲 i gi祔 c� ")
			else
				AddItem(0, 5, 2, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("L蕐 頲 i gi祔 th猽. ")
			end
			AddRepute(5)		-- 加声望6点
			Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 5 甶觤")
		else
			SetTask(46, 1)
			Talk(1,"","C�/ch� v蒼 ch璦 t譵 頲 thu鑓 T� B� ho祅 �?B謓h t譶h c馻 b� ch竨 bi誸 t輓h sao b﹜ gi�, huhuhu厖")
		end
	else							-- 非任务状态
		if (random(0,1) == 0) then
			Talk(1,"","B� ch竨 l� ng� d﹏ tr猲 чng ёnh h�,m鏸 ng祔 u ph秈 ra h� nh c�, n誹 h玬 n祇 g苝 s鉵g to gi� l韓, c� khi n m蕐 ng祔 li襫 kh玭g th� v� nh�. ")
		else
			Talk(1,"","Ch竨 r蕋 lo cho b�, n誹 ch竨 l� con trai th� t鑤 qu�, l骳  ch竨 s� gi髉 b� nh c�. ")
		end
	end
end;

function yes()
	Talk(1,"","Ch竨 nh� l骳 trc c� nghe i phu n鉯 u鑞g thu鑓 T� B� ho祅 s� h誸 s鑤, nh璶g nh� ch髇g ch竨 ngh蘯 qu� kh玭g th� mua 頲. ")
	SetTask(46, 1)
	Msg2Player("Ti誴 nh薾 nhi謒 v�: B� c馻 Ti觰 Ng� b� b謓h, gi髉 玭g 蕐 mua T� B� ho祅  ch鱝 b謓h. ")
	AddNote("Ti誴 nh薾 nhi謒 v�: B� c馻 Ti觰 Ng� b� b謓h, gi髉 玭g 蕐 mua T� B� ho祅  ch鱝 b謓h. ")
end;

function no()
	Talk(1,"","Ch竨 ph秈 � y ti誴 t鬰 ch� nh鱪g ngi h秓 t﹎. ")
end;
