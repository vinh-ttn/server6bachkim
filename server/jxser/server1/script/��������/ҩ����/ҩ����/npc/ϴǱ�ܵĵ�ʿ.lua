-- 洗潜能的道士.lua （药王谷，跛道人）
-- By Dan_deng(2004-01-06)
-- 变量：GetTask(92): 洗过的次数（目前最多5次）
--			GetTaskTemp(8)：暂存洗潜能价格
--			GetTaskTemp(50): 是否用宝石洗的
-- Update: Dan_Deng(2004-05-24) 名驹奔火任务 (Uworld76 = GetTask(76))
-- Update: Dan_Deng(2004-05-27) 小儿失踪任务 (Uworld42 = GetTask(42))

function main()
	Uworld92 = GetTask(92)
	Uworld76 = GetTask(76)
	Uworld42 = GetTask(42)
	if (Uworld76 == 30) then    -- 名驹奔火任务：找到跛道人，任务进行中
		if (HaveItem(393) == 1) then
			Talk(11,"W76_step","Чo trng! Ch髇g ta l筰 g苝 m苩 r錳","T譵 ta c� vi謈 g�? ","� y c� 1 b鴆 th�, ngi xem xong r錳 n鉯. ","Ah! Th� l鏸 cho b莕 o  xem thng","Th� ra l� th� c馻 l穙 Vng, ng ti誧 b莕 o 產ng vng b薾 vi謈 ri猲g, t筸 th阨 kh玭g r阨 kh醝 y 頲","V藋 th� ph秈 l祄 sao y? Ta  v� ng鵦 ch綾 ch緉 trc m苩 i l穙 gia. ","с l� l阨 h鴄 c馻 ngi! Li猲 quan g� n b莕 o! ","Чo trng n� l遪g n祇 th蕐 ch誸 kh玭g c鴘! V藋 厖� ","Ha ha! Ta ch� a v韎 ngi th玦. B莕 o y tuy kh玭g 甶 頲, nh璶g ngi c� th� 甶. Trc h誸 ngi h穣 甶 t譵 l蕐 3 v藅, ch輓h l� r╪g 竛h 甶謓, nc nhi詍 ph蘮 v� c竛h b筩h v﹏. C竎 th�  l� thu鑓 pha ch�, k誸 h頿 v韎 th莕 dc c馻 b莕 o c� th� gi秈 頲 ch鴑g m蕋 s鴆.","Ti觰 t� h祅h t萿 giang h�, nhi襲 l骳 c騨g c秏 th蕐 lao l鵦, y ch糿g ph秈 l� phng ph竝  ch鱝 tr� sao?","ng v藋! дn l骳  b莕 o s� truy襫 cho ngi h錳 th� k� thu藅 n祔, ngi l莕 n祔 xem nh� v鮝 c鴘 ngi v鮝 t� c鴘, ch� l� 3 lo筰 dc pha ch� kh玭g d� c� 頲, ph秈 nhanh ch鉵g t譵 ki誱. ","Чo trng an t﹎!")
		else
			Talk(2,"","Ngi n鉯 l穙 B祅h nh� ta gi髉 , v藋 t輓 v藅 u? 輙 nh蕋 c騨g ph秈 c� l蕐 1 b鴆 th� ch�?","g ng tr頽 tr遪 m総 nh� v藋, ta s� quay v� nh� B祅h i l穙 gia vi誸 ngay 1 b鴆 cho 玭g y. ")
   	end
	elseif (Uworld76 == 40) then
		if (HaveItem(370) == 1) and (HaveItem(371) == 1) and (HaveItem(372) == 1) then
			Talk(6,"W76_end","Чo trng! Nh鱪g th� 玭g c莕 ta u  chu萵 b� ","�.","Kh玭g ng� ngi th藅 s鵦 c� b秐 l躰h nh� v藋. Huy誸 D騨g ho祅 y,mau mau mang甶!","Ch糿g ph秈 c遪 H錳 Th� thu藅 sao?","C竔 g� h錳 th� hay kh玭g h錳 th�? Kh玭g hi觰 r�. ","Th玦 th� c騨g 頲! Чo trng kh玭g ch辵 truy襫 th� t鴆 c� l� do b蕋 ti謓, n誹 c鴘 頲 tu蕁 m�, h鋍 hay kh玭g h鋍 頲 v� c玭g th� c� quan tr鋘g g� u")
		else
			Talk(1,"","3 lo筰 dc li謚  l�: r╪g 竛h 甶謓, nc nhi詍 ph蘮 v� c竛h b筩h v﹏. Ngi ph秈 nhanh l猲, n誹 kh玭g b謓h t譶h tr莔 tr鋘g th� kh玭g li猲 quan n b莕 o y!")
		end
	elseif (Uworld76 == 50) and (HaveItem(375) == 0) then			-- 名驹奔火任务：血勇丸丢了
		SetTask(76,40)
		Talk(1,"","Huy誸 D騨g ho祅 nh r琲 r錳? V藋 ta c騨g kh玭g c� c竎h n祇 kh竎, ngi ph秈 l筰 t譵 ki誱 3 lo筰 dc li謚")
	elseif (Uworld42 == 10)  then  								-- 小儿失踪任务：去杀十名穿山
		Talk(4,"","Чo trng! Xin h醝 玭g c� bi誸 v� 竛 m蕋 t輈h tr� con � Чi L�? ","Th� gian n祔  tr緉g 甧n 甶猲 o, l遪g ngi thay i l﹗ r錳. Ngi h� t蕋 甶 lo nhi襲 chuy謓 kh玭g li猲 can? ","Ngi kh竎 l祄 g� th� m芻 ngi kh竎, ta th� c� c竎h h祅h s� ri猲g c馻 ta. Kh玭g l� nh譶 tr╩ h� ng祅 nh� ng祔 ng祔 d飊g nc m総 r鯽 m苩 l� ch輓h o sao","Kh玭g ng� v蒼 c遪 ngi c鴑g u nh� ngi. Dc Vng ng c� r蕋 nhi襲 t猲 Xuy猲 S琻 r蕋 ng gh衪. Ngi 甶 gi誸 10 t猲, n誹 c遪 m筺g quay tr� l筰 y th� ta s� nghe ngi n鉯 chuy謓. ")
		SetTask(42,20)
		AddNote("Nhi謒 v� tr� con m蕋 t輈h: Чo nh﹏ qu� c莕 b筺 n Dc Vng ng gi誸 ch誸 10 t猲 s琻 t芻 ")
		Msg2Player("Nhi謒 v� tr� con m蕋 t輈h: Чo nh﹏ qu� c莕 b筺 n Dc Vng ng gi誸 ch誸 10 t猲 s琻 t芻 ")
	elseif (Uworld42 == 30) then									-- 小儿失踪任务：完成子任务
		Talk(1,"","Chuy謓 n祔 ta c騨g kh玭g gi髉 頲 g�! Nh璶g ta c� 1 ngi b筺 bi謙 hi謚 l� V� Danh T╪g, n誹 ngi t譵 g苝 頲 l穙 ta, ch綾 ch緉 m鋓 vi謈 u r� r祅g")
		SetTask(42, 40)
		AddNote("Ti誴 nh薾 nhi謒 v�:  t譵 V� danh T╪g  h醝 tin t鴆 v� vi謈 tr� con m蕋 t輈h ")
		Msg2Player("Ti誴 nh薾 nhi謒 v�:  t譵 V� danh T╪g  h醝 tin t鴆 v� vi謈 tr� con m蕋 t輈h ")
	elseif (GetItemCountEx(353) >= 1) then				-- 洗潜能：用宝石洗
		Say("Tinh H錸g b秓 th筩h? Ta c騨g 產ng nh t譵 v礽 vi猲 y. Nh� v莥 甶,ta s� gi髉 ngi c秈 t筼 kinh m筩h  i vi猲 Tinh h錸g b秓 th筩h c馻 ngi",3,"H鋍 ch�!/tuneprop_jewel","Kh玭g h鴑g th� /no","Tinh H錸g B秓 th筩h c莕 d飊g v祇 vi謈 kh竎, d飊g ti襫  nh� ngi gi髉 ta c秈 t筼 kinh m筩h c� 頲 kh玭g? /sele3")
	elseif (GetLevel() >= 50) then			-- and ((GetCamp() == 0) or (GetCamp()== 4)) then		-- 洗潜能的基本要求：过50级，红名或白名（不再限制阵营）
		if (Uworld92 == 0) then			-- 没洗过
			Talk(1,"tuneprop_get","C秈 t筼 kinh m筩h gi髉 ngi? L� ai nhi襲 chuy謓 b秓 ngi n t譵 ta v藋?")
		elseif (Uworld92 < 5) then		-- 洗过次数未到上限
			Talk(1,"tuneprop_get"," qua m閠 l莕 ng鋞 ng祇 ban u th� m穒 m穒 kh玭g qu猲. Ta ph秈 c秐h b竜 ngi, m鏸 l莕 c秈 t筼 kinh m筩h c騨g u t鎛 th蕋 th� kh� c馻 ngi, chuy謓 n祔 kh玭g ph秈 t飝 � l筸 d鬾g 頲 u. ")
		elseif (Uworld92 >= 5) then		-- 洗过次数达到上限
			Talk(1,"","S� l莕 ta gi髉 ngi c秈 t筼 kinh m筩h  qu� nhi襲, hi謓 nay th� kh� c馻 ngi  khuy誸, n誹 ti誴 t鬰 c秈 t筼 kinh m筩h n鱝 ch綾 ch緉 s� g苝 nh鱪g nguy hi觤 kh玭g lng. Chuy謓 n祔 ta th藅 kh玭g d竚 l祄, ngi h穣 甶 t譵 cao nh﹏ kh竎 v藋!")
		else										-- 意外错误，让玩家找GM报BUG
			Talk(1,"","Ta xem ngi th莕 s綾 秏 筸, 竚 kh� y m苩, s� b� i n筺 trong nay mai. Ngi b﹜ gi� ng n猲 t譵 ta, nhanh ch鉵g 甶 t譵 <color=red>Thi猲 th莕<color> 甶!")
		end
	elseif (Uworld76 == 50) then
		Talk(1,"B� Чo nh﹏: ng祔 nay th� s� o lo筺, nh鱪g ngi c� 頲 l遪g nhi謙 huy誸 nh� ti觰 huynh  y kh玭g ph秈 l� nhi襲")			
	else
		Talk(1,"","Trong Dc Vng ng b竎h th秓 phong ph�, qu� th鵦 l� 1 n琲 t鑤. T﹜ b綾 hoang nguy猲 m� c騨g c� 頲 1 n琲 nh� v藋,  th蕐 頲 s� di謚 k� c馻 th� gian, s� tuy謙 v阨 c馻 t筼 h鉧. ")
	end
end

function sele3()
	Talk(2,"","Ngi tng gi髉 ngi kh竎 c秈 t筼 kinh m筩h l� c玭g vi謈 nh� nh祅g �? Ta ph秈 t鑞 r蕋 nhi襲 s鴆 l鵦, xong vi謈 l筰 ph秈 m蕋 th阨 gian r蕋 d礽  t躰h dng! Vi猲 Tinh H錸g b秓 th筩h c馻 ngi c� th� gi髉 ta kh玦 ph鬰 nguy猲 kh�!","N誹 kh玭g cho xem th� th玦 v藋, r� r祅g  mang ra cho ta nh譶 th蕐 r錳, v藋 m� c遪 ti誧 kh玭g d竚 甧m 1 vi猲 Tinh H錸g b秓 th筩h ra! V藋 m� c遪 mu鑞 ta gi髉 ngi c秈 t筼 kinh m筩h sao? H鮩! Th玦ng ngh� n n鱝!")
end

function W76_step()
	DelItem(393)
	SetTask(76,40)
	Msg2Player("Чo nh﹏ qu� n鉯 v韎 ngi, mu鑞 tr� b謓h n祔, ph秈 c莕 r╪g 竛h 甶謓, nc nhi詍  v� c竛h b筩h v﹏ 3 lo筰 thu鑓 pha ch� ")
	AddNote("Чo nh﹏ qu� n鉯 v韎 ngi, mu鑞 tr� b謓h n祔, ph秈 c莕 r╪g 竛h 甶謓, nc nhi詍  v� c竛h b筩h v﹏ 3 lo筰 thu鑓 pha ch� ")
end

function W76_end()                                   -- 名驹奔火任务结束
	Talk(1,"","Kh玭g ng� l筰 c� ngi nhi謙 huy誸 o ngh躠 nh� ngi, truy襫 l筰 cho nh� ngi c騨g kh玭g ph秐 l筰 s� o! ")
	DelItem(370)                  -- 失去闪电之牙
	DelItem(371)                  -- 失去丹泽之水
	DelItem(372)                  -- 失去白云之翼
	AddEventItem(375)                  -- 得到血勇丸
	AddMagic(396)          -- 学会“春风雨露”
	SetTask(76,50)
	Msg2Player("Лa c竎 thu鑓 pha ch�  cho o nh﹏ qu�, l蕐 頲 Huy誸 D騨g Кn, ng th阨 h鋍 頲 k� n╪g  Xu﹏ Phong V� L� ")
	AddNote{"B� Чo nh﹏ c秏 k輈h l遪g nhi謙 huy誸 c馻 b筺,  truy襫 th� cho b筺 Huy誸 D騨g ho祅 v� 'V� l� Tr飊g sinh', h穣 mau 甶 c鴘 tr� B玭 H醓 甶! "}
end

function tuneprop_get()				-- 接任务
	pay_money = {20,40,60,80,100}		-- 定义价格，实际使用时要*10000
	i = (GetTask(92) + 1)
	SetTaskTemp(8,pay_money[i]*10000)
	SetTaskTemp(50,0)
	Say("Th祅h th藅, s� ti襫 輙 醝 n祔  k輓h l穙 Чo trng m韎 頲. "..GetTaskTemp(8).."с kh玭g ph秈 l� con s� nh�, ta ph秈 甶 ki誱 m韎 頲. ",2,"Coi nh� ngi c騨g c� t蕀 l遪g , th玦 頲, ngi mu鑞 tr� kh醝 ph莕 n祇? /tuneprop_go","S鴆 m筺h /no")
end

function tuneprop_jewel()
	SetTaskTemp(50,1)			-- 使用宝石
	SetTaskTemp(8,0)			-- 免费
	tuneprop_go()
end

function tuneprop_go()
	pay_money = GetTaskTemp(8)
	if (GetCash() >= pay_money) then
		Say("Th﹏ ph竝 ",5,"S鴆 m筺h/tune_str","Th﹏ ph竝/tune_dex","Vi謈 n祔. ta c遪 ph秈 v� suy ngh� l筰 /tune_vit","N閕 c玭g/tune_eng","S鴆 l鵦 c馻 ngi  n m鴆 cao nh蕋 r錳, v蒼 c遪 ch璦 v鮝 � sao? Th� th� qu� th鵦 ta c騨g h誸 c竎h.  /no")
	else
		Talk(1,"","Th藅 ra kh玭g c� ti襫 c騨g kh玭g sao, d� sao ngi v蒼 l� m閠 h秓 h竛!")
	end
end

function tune_str()
	base_str = {35,20,25,30,20}			-- 五行人物的天生力量，洗潜能时不允许低于此值
	i = GetSeries() + 1
	if (GetStrg(1) < base_str[i] + 5) then		-- 洗完后力量会低于天生力量，不允许洗
		Talk(1,"","S鴆 l鵦 c馻 ngi  n m鴆 cao nh蕋 r錳, ngi v蒼 c遪 ch璦 v鮝 � sao? Th� th� qu� th鵦 ta c騨g h誸 c竎h!")
	else											-- 开始洗潜能，完成后自动踢下线
		AddStrg(-5)
		check_jewel()			-- 检查是否需要消耗宝石，或是扣钱计洗潜能次数
		Say("Л頲 r錳! Theo � ngi v藋! Ta m謙 ch誸 甶 頲! в ta ngh� ng琲 m閠 l竧 nh�!",1," t� /no")
	end
end

function tune_dex()
	base_dex = {25,35,25,20,15}
	i = GetSeries() + 1
	if (GetDex(1) < base_dex[i] + 5) then		-- 洗完后身法会低于天生身法，不允许洗
		Talk(1,"","S鴆 l鵦 c馻 ngi  n m鴆 cao nh蕋 r錳, ngi v蒼 c遪 ch璦 v鮝 � sao? Th� th� qu� th鵦 ta c騨g h誸 c竎h!")
	else											-- 开始洗潜能，完成后自动踢下线
		AddDex(-5)
		check_jewel()			-- 检查是否需要消耗宝石，或是扣钱计洗潜能次数
		Say("Л頲 r錳! Theo � ngi v藋! Ta m謙 ch誸 甶 頲! в ta ngh� ng琲 m閠 l竧 nh�!",1," t� /no")
	end
end

function tune_vit()
	base_vit = {25,20,25,30,25}
	i = GetSeries() + 1
	if (GetVit(1) < base_vit[i] + 5) then		-- 洗完后外功会低于天生，不允许洗
		Talk(1,"","S鴆 l鵦 c馻 ngi  n m鴆 cao nh蕋 r錳, ngi v蒼 c遪 ch璦 v鮝 � sao? Th� th� qu� th鵦 ta c騨g h誸 c竎h!")
	else											-- 开始洗潜能，完成后自动踢下线
		AddVit(-5)
		check_jewel()			-- 检查是否需要消耗宝石，或是扣钱计洗潜能次数
		Say("Л頲 r錳! Theo � ngi v藋! Ta m謙 ch誸 甶 頲! в ta ngh� ng琲 m閠 l竧 nh�!",1," t� /no")
	end
end

function tune_eng()
	base_eng = {15,25,25,20,40}
	i = GetSeries() + 1
	if (GetEng(1) < base_eng[i] + 5) then		-- 洗完后内功会低于天生，不允许洗
		Talk(1,"","S鴆 l鵦 c馻 ngi  n m鴆 cao nh蕋 r錳, ngi v蒼 c遪 ch璦 v鮝 � sao? Th� th� qu� th鵦 ta c騨g h誸 c竎h!")
	else											-- 开始洗潜能，完成后自动踢下线
		AddEng(-5)
		check_jewel()			-- 检查是否需要消耗宝石，或是扣钱计洗潜能次数
		Say("Л頲 r錳! Theo � ngi v藋! Ta m謙 ch誸 甶 頲! в ta ngh� ng琲 m閠 l竧 nh�!",1," t� /no")
	end
end

function check_jewel()
	if (GetTaskTemp(50) == 1) then			-- 是宝石洗的
		DelItemEx(353)
	else
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
	end
	SetTaskTemp(50,0)			-- 复位临时变量
	SetTaskTemp(8,0)
	return
end

function no()
end
