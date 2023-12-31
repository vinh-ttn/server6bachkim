--description: 唐门唐鹤 10级任务 
--author: yuanlan	
--date: 2003/3/10
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-13)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2);
	Uworld51 = GetTask(51)
	if (Uworld51 == 40) then		-- 洗清冤屈任务进行中
		Talk(6,"Uworld51_50","Chuy謓 ngi mu鑞 gi髉 Nh蕋 Tr莕 ta  bi誸 r錳.","T筰 sao Л阯g C鮱 m玭 ch� l筰 c� th祅h ki課 v韎 Nh蕋 Tr莕 c玭g t� v藋? T鑤 x蕌 g� c騨g l� con ru閠 c馻 m譶h?","Nh蕋 Tr莕 nhi襲 l莕 mu鑞 thay i gia quy, l祄 cho M玭 ch� kh玭g vui, l筰 th猰 B蕋 Nhi詍 mu鑞 tranh quy襫, hay n鉯 x蕌 Nh蕋 Tr莕 trc m苩 M玭 ch�.","Th藅 ra chuy謓 Cao t╪g Thi誹 L﹎ g苝 n筺 l莕 n祔 theo ta ngh� c� li猲 quan v韎 Kim qu鑓. Kim qu鑓 lu玭 xem ph竔 Thi誹 L﹎ l� c竔 gai trong m総. M蕐 ng祔 trc ta nh薾 頲 th玭g b竜 n鉯 Thi猲 Nh蒼 gi竜 b� m藅 th﹗ t鉳 c竎 b� c蕄 tuy謙 h鋍 m玭 ph竔 � Trung Nguy猲.","C� chuy謓 n祔 �? V藋 Thi猲 Nh蒼 gi竜 l� i tng b� nghi ng� nhi襲 nh蕋?","ng v藋! Ta ph秈 � y, vi謈 d� la tin t鴆 giao cho ngi.")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 10*256+80) and (HaveItem(36) == 1) then		--10级任务完成
			L10_prise()
		elseif (UTask_tm == 10*256) and (GetLevel() >= 10) then				--10级任务启动
--			DelItem(36)							--防止重接任务后，玩家捡起任务道具
			Say("T鑙 qua khi е t� B鎛 t鋋 n <color=Red>Th祅h Й Ph�<color> h祅h s�,  k� tr閙 l蕐 m蕋 竚 kh� c m玭 <color=Red>Ma V� ch﹎<color>, chuy謓 n祔 khi課 Chng m玭 n鎖 tr薾 l玦 nh, ai gi髉 B鎛 toa l蕐 l筰 Ma V� ch﹎ s� 頲 tr鋘g thng! ", 2, "T譵 gi髉 /L10_get_yes", "Ta kh玭g quan t﹎!/L10_get_no")
		elseif (UTask_tm > 10*256) and (UTask_tm < 20*256) then					--已经接到10级任务，尚未完成
			Talk(1,"","<color=Red>Ma V� ch﹎<color> b� m蕋 � <color=Red>Th祅h Й Ph�<color>, ngi c� th� v祇 th祅h ﹎ th莔 甶襲 tra. ng r錳! Ngi v蒼 ch璦 th蕐 qua <color=Red>Ma V� ch﹎<color> ph秈 kh玭g? To祅 th﹏ n� c� m祏 甧n, gi鑞g nh� c﹜ kim c馻 con mu鏸.")
		elseif (UTask_tm >= 20*256) then					--已经完成10级任务，尚未出师
			Talk(1,"","Ngi qu� l� c� b秐 l躰h, c� th� gi髉 Л阯g M玭 t譵 l筰 Ma V� ch﹎, ch� c莕 ngi c� g緉g tng lai nh蕋 nh s� r閚g m�.")
		else
			Talk(1,"","Hai v� c閚g t� B鎛 m玭 b蕋 h遖, m芻 d� kh玭g n鉯 ra nh璶g vi謈 n祔 kh玭g x� l� t鑤 nh蕋 nh s� c� h藆 ho筺. Kh玭g bi誸 M玭 ch� c� d� t輓h g�?")
		end
	else								--普通对话
		Talk(1,"","竚 kh� B鎛 m玭 vang danh giang h�, lu薾 v� v� c玭g c騨g kh玭g thua k衜 ph竔 kh竎.")
	end
end;

function L10_get_yes()
	Talk(1,"","<color=Red>Ma V� ch﹎<color> b� m蕋 � <color=Red>Th祅h Й Ph�<color>, ngi c� th� v祇 th祅h ﹎ th莔 甶襲 tra. ng r錳! Ngi v蒼 ch璦 th蕐 qua <color=Red>Ma V� ch﹎<color> ph秈 kh玭g? To祅 th﹏ n� c� m祏 甧n, gi鑞g nh� c﹜ kim c馻 con mu鏸.")
	SetTask(2, 10*256+20)
	AddNote("G苝 Л阯g H筩 � V� C玭g ph遪g, nh薾 nhi謒 v� <color=Red>甶 Th祅h Й t譵 Ma V� Ch﹎.<color> ")
	Msg2Player("Nh薾 nhi謒 v� Ma V� Ch﹎, 甶 Th祅h Й t譵 Ma V� Ch﹎. ")
end;

function refuse()
	Talk(1,"","竚 kh� B鎛 m玭 b� m蕋, l祄 sao n鉯 kh玭g li猲 quan n ngi?")
end;

function L10_prise()
	Talk(1,"","Ngi qu� nhi猲 c� b秐 l躰h, c� th� gi髉 B鎛 m玭 t譵 l筰 Ma V� ch﹎. Л頲! B鎛 t鋋 s� d箉 ngi v礽 chi猽, nh譶 k� y! ")
	DelItem(36)
	SetRank(26)
	SetTask(2, 20*256)
--	AddMagic(43)
--	AddMagic(347)
	add_tm(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("Tr� v� V� C玭g ph遪g, giao Ma V� Ch﹎ cho Л阯g H筩, ho祅 th祅h nhi謒 v�, th╪g l祄 Tr竛g 甶nh. ")
	Msg2Player("Giao Ma V� Ch﹎ t譵 頲 cho Л阯g H筩, ho祅 th祅h nhi謒 v� Ma V� Ch﹎, th╪g l� Л阯g M玭 Tr竛g 甶nh. H鋍 頲 Л阯g M玭 竚 kh�, мa Di謒 H醓. ")
end;

----------------------- 世界任务 --------------------------
function Uworld51_50()
	SetTask(51,50)
	Msg2Player("Л阯g H筩 suy 畂竛 l� vi謈 n祔 c� li猲 quan v韎 Thi猲 Nh蒼 Gi竜, nh� b筺 甶 d� la tin t鴆. ")
end
