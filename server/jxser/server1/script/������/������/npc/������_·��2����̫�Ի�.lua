--两湖区 巴陵县 路人2古老太对话
--巴陵县新手任务：古老太的宝贝
--suyu
-- Update: Dan_Deng(2003-08-09)

function main(sel)
	UTask_world19 = GetTask(47);
	if ((UTask_world19 == 0) and (GetLevel() >= 6)) then		-- 任务启动
		Say("Con trai l穙 甶 nh c� 3 ng祔 kh玭g th蕐 v�. L穙 gi� r錳, kh玭g th� 甶 t譵 頲. Ch竨 c� th� gi髉 l穙 ra h� t譵 n� 頲 kh玭g?",2,"Gi髉 /yes","Kh玭g gi髉 /no")
	elseif(UTask_world19 == 1) then
		if(HaveItem(182) == 1) then
			Talk(2, "", "Зy ch糿g ph秈 l� ng鋍 b閕 c馻 con l穙? L� n祇卨� n祇� huhuhu..., con c馻 l穙 ch誸 th秏 qu�, th� h醝 m閠 b� gi� nh� l穙 s� s鑞g sao y厖", "C秏 琻 ch竨  gi髉 l穙 t譵 頲 mi課g ng鋍 b閕 n祔, nh譶 n� ta c� c秏 gi竎 con trai ta 產ng � b猲 c筺h! B鴆 th� ph竝 n祔 l� c馻 gia truy襫, l穙 th� m閠 ch� c騨g kh玭g bi誸, th玦 th� t苙g ch竨 v藋. Huhuhu厖")
			DelItem(182)
			AddEventItem(183)
			SetTask(47, 2)
			AddNote("m mi課g Ng鋍 B閕 a cho C� L穙 Th竔. ")
			Msg2Player("m mi課g Ng鋍 B閕 a cho C� L穙 Th竔. ")
			AddRepute(4)		-- 加声望6点
			Msg2Player("Thanh th� giang h� c馻 b筺 t╪g 4 甶觤 ")
		else
			Talk(1,"","B課  � ph輆 Йng th� tr蕁, c竎 ng� d﹏ thng c藀 thuy襫 � , n誹 ch蕌 th蕐 n� th� n鉯 v韎 n� ta � nh� r蕋 mong n� v�! Kh魠.kh魠")
		end
	else				-- 非任务对话
		if (random(0,1) == 0) then
			Talk(1,"","C竎 ng� d﹏ th藅 l� kh�! Ta c� hai a con 甶 nh c� tr猲 h� u b� s鉵g l韓 d譵 ch誸. ")
		else
			Talk(1,"","дn ngi nh c� c騨g kh玭g c� c� m� ╪, kh玭g nh c� th� ngay c� n c琺 ╪ c騨g kh玭g c�!")
		end
	end
end;

function yes()
	Talk(1,"","Ch竨 th蕐 y! Ta  gi� c� r錳, qu猲 n鉯 cho ch蕌 bi誸 con ta h譶h d竛g th� n祇,kh� kh魠卼r猲 c� n� c� 甧o m閠 mi課g ng鋍 b閕, r蕋 d� nh薾 ra. ")
	SetTask(47, 1)
	AddNote("Ti誴 nh薾 nhi謒 v�: Con trai c馻 C� L穙 Th竔 甶 nh c� 3 ng祔 kh玭g v�, gi髉 b� l穙 ra b課 t祏 t譵 c藆 ta. ")
	Msg2Player("Ti誴 nh薾 nhi謒 v�: Con trai c馻 C� L穙 Th竔 甶 nh c� 3 ng祔 kh玭g v�, gi髉 b� l穙 ra b課 t祏 t譵 c藆 ta. ")
end;

function no()
	Talk(1,"","Th藅 l� l祄 phi襫 ch竨 qu�. ")
end;
