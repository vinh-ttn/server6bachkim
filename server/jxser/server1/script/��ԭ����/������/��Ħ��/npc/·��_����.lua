-- 少林 路人NPC 达摩院玄悲 20级任务
-- by：Dan_Deng(2003-08-01)
-- update by: xiaoyang(2004\4\15) 少林派90级任务 

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	Uworld122 = GetTask(122)
	if(GetSeries() == 0) and (GetFaction() == "shaolin") then
		if(UTask_sl == 20*256+128) then		--20级任务进行中
			L20_prise()
		elseif((UTask_sl == 20*256) and (GetLevel() >= 20)) then		--20级任务
			Talk(2,"L20_get","G莕 y c� 5 t猲  t� n t� t B�, Ph骳 Ki課, do Phng Trng Nam Thi誹 L﹎  c�, nh璶g do 5 t猲 n祔  g﹜ n竜 lo筺 Thi誹 l﹎, Phng Trng b� tay, hy v鋘g b鎛 t� c� th� gi竜 h鉧 b鋘 ch髇g, nh璶g b鋘 ch髇g qu� ng� ngc c鴑g u, kh玭g th蘭 nghe l阨 khuy猲 r╪. Th藅 產u u qu�!","5 t猲 ng� ngc  b﹜ gi� � u?")
		else
			Talk(1,"","Ngi xu蕋 gia ch� tr鋘g minh t﹎ ki誸 t輓h!")
		end
	elseif(Uworld122 == 10) then
		Talk(5,"Uworld122_find","Huy襫 Bi i s�! Tr猲 阯g l猲 Hoa S琻 ta th蕐 c� r蕋 nhi襲  t� Thi誹 L﹎ nh nhau ch� t�, kh玭g bi誸 l� v� chuy謓 g�?","Thi誹 L﹎ mu鑞 ch鋘 ngi th輈h h頿 trong c竎  t� ngi th輈h h頿  tu luy謓 72 tuy謙 ngh� t筰 T祅g Kinh C竎. Nh鱪g k� gi醝 giang u t� Чt Ma Vi謓 c馻 ta v� La H竛 Л阯g c馻 Huy襫 Nan. е t� c馻 La H竛 Л阯g kh玭g gi鑞g c馻 Чt Ma Vi謓,lu玭 tranh gi祅h a v�, i kh竔 c﹗ chuy謓 l� nh� v藋.","Чt Ma La H竛 u t� Thi誹 L﹎, h� c� g� ph秈 tranh gi祅h, ai h鋍 m� ch糿g 頲!","е t� c馻 ta si猽 ph祄 xu蕋 ch髇g, ch鋘 ai nhng ai?","Ch糿g ph秈 La H竛 Л阯g c騨g thu閏 Thi誹 L﹎ sao?")
   elseif(Uworld122 >=20) and (Uworld122 < 30)then
   	Talk(1,""," t譵 Huy襫 Nan 甶... ")
   elseif(Uworld122 == 30)then
   	Talk(5,"Uworld122_alow","Чi s�! Huy襫 Nan 產� s� kh玭g nghe ta khuy猲 gi秈. Ta 甶 qua Hoa S琻 th蕐 r蕋 nhi襲 cao th� c馻 Kim qu鑓 mai ph鬰, e r籲g c� ﹎ m璾 g� .","Ngi th蕐 th藅 ch�?","Tuy謙 kh玭g n鉯 d鑙! ","厖Ngi h穣 甶 n鉯 c竎  t� Чt ma Vi謓 ng nh nhau n鱝. Зy l� l謓h b礽 c馻 ta. N誹 th藅 s� l� qu﹏ Kim, hy v鋘g c� th� gi髉 ti觰 t� di謙 ch髇g.","T筰 h� xin tu﹏ l謓h.")
	elseif (Uworld122 == 50) and (HaveItem(392) == 0) then
   	Talk(1,"","Th� ch�   qu猲 m蕋 l謓h b礽 n琲 l穙 n筽 y, kh玭g c� n� e  t� Thi誹 L﹎ kh玭g tin")
   	AddEventItem(392)
   	Msg2Player("Nh薾 l筰 l謓h Thi誹 L﹎ t╪g ch髇g ")
   elseif(Uworld122 >= 50) and (Uworld122 <= 60) then
   	Talk(1,"","C� th� th藅 s� ch髇g ta  sai... ")
   elseif (Uworld122 == 65) and (HaveItem(392) == 1) then
   	Talk(4,"U122_finish","M鑙 nguy hi觤 Hoa S琻  頲 h鉧 gi秈, may l� n k辮 kh玭g x秠 ra thng vong g� h誸.","B莕 t╪g  nh薾 頲 tin c馻  t�, th藅 x蕌 h� l祄 sao." ,"Чi s� ng n猲 nh� v藋, trong hi觤 nguy m� ng礽 qu� quy誸 頲 s� vi謈 ng l� b秐 s綾 anh h飊g.","Anh b筺 tr� ng tr猽 l穙 n筽 n鱝, ngi h穣 n t譵 Huy襫 Nan 甶 玭g ta c� chuy謓 mu鑞 n鉯 v韎 ngi , ha ha.!")
   else							-- 常规对话
		Talk(1,"","Chng m玭 s� huynh m蕐 n╩ nay ngh� c竎h ch鑞g Kim n  l玭g mi c騨g b筩 tr緉g lu玭.")
	end
end;

function L20_get()
	Say("H�  甶 Ph鬰 Ng璾 s琻 T﹜. M蕐 ngi n祔 � c� v礽 chi猽  kh玭g xem ngi Trung Nguy猲 trong m総 h�.",2,"в ta 甶 gi竜 hu蕁 b鋘 ch髇g. /L20_get_yes","E r籲g ta kh玭g l祄 頲 /L20_get_no")
end;

function L20_get_yes()
	Talk(1, "", "H� t� xa n c騨g xem nh� l� kh竎h, ngi ra tay ph秈 d� ch鮪g .")
	SetTask(7,20*256+64)
--	SetTaskTemp(42,0)			-- 创建临时变量（TaskTemp的ID号为42）（取消临时变量）
	AddNote("Thay Чt Ma Vi謓 th� t鋋 Huy襫 Bi i s� gi竜 hu蕁 n╩ g� ng� ngc. ")
	Msg2Player("Thay Чt Ma Vi謓 th� t鋋 Huy襫 Bi i s� gi竜 hu蕁 n╩ g� ng� ngc. ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(2,"","S� th骳! Ta  thu ph鬰 5 t猲 man r� kia, t� nay v� sau h� kh玭g d竚 g﹜ s� n鱝 u!","Ng� Ph藅 t� bi! Thi謓 tai thi謓 tai!")
	SetTask(7,30*256)
	SetRank(3)
--	AddMagic(15)
	add_sl(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("Thu ph鬰 頲 n╩ g� ng� ngc, th╪g c蕄 H� T� Kim Cang. ")
	Msg2Player("Ch骳 m鮪g b筺! B筺  th╪g c蕄 H� T� Kim Cang c馻 Thi誹 L﹎ t�! H鋍 頲 v� c玭g B蕋 чng Minh Vng. ")
end;

function Uworld122_find()
	Talk(1,"","Huy襫 Bi:... Ngi h穣 甶 t譵 Huy襫 Nan 甶. ")
	SetTask(122,20)  --设置任务变量20
	Msg2Player("Huy襫 Bi 髉 髉 m� m� kh玭g p, b秓 b筺 甶 t譵 Huy襫 Nan h醝 cho r�. ")
	AddNote("Huy襫 Bi 髉 髉 m� m� kh玭g p, b秓 b筺 甶 t譵 Huy襫 Nan h醝 cho r�. ")
end

function Uworld122_alow()
	AddEventItem(392)
	Msg2Player("L蕐 頲 Thi誹 L﹎ t╪g ch髇g l謓h. ")
	SetTask(122,50)  --设置任务变量50
	Msg2Player("Цp 鴑g Huy襫 Bi, n Hoa s琻 c鴘 c竎  t� Thi誹 L﹎, gi誸 tng l躰h Kim qu鑓. ")
	AddNote("Цp 鴑g Huy襫 Bi, n Hoa s琻 c鴘 c竎  t� Thi誹 L﹎, gi誸 tng l躰h Kim qu鑓. ")
end

function U122_finish()
	DelItem(392)
	Msg2Player("Giao l筰 Thi誹 L﹎ t╪g ch髇g l謓h. ")
	SetTask(122,70)
	Msg2Player("H遖 gi秈 v韎 Huy襫 Bi, 甶 t譵 Huy襫 Nan. ")
	AddNote("H遖 gi秈 v韎 Huy襫 Bi, 甶 t譵 Huy襫 Nan. ")
end
