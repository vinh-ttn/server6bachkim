--description: 唐门唐闲 50级任务 
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2)
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 50*256) and (GetLevel() >= 50) then		--50级任务启动
			Talk(3, "L50_step0", "V藋 th� n祇 m韎 l� t鑤!", "Л阯g Nh祅 s� th骳 c� chuy謓 g� v藋?", "Ngi kh玭g bi誸 �! B鎛 Л阯g n鎖 ti課g c� <color=Red>1 b�<color>'竚 Kh� Ph�', chia th祅h 2 quy觧, b猲 tr猲 c� ghi r� c竎h ch� t筼 v� c竎h d飊g t蕋 c� 竚 kh� c馻 b鎛 m玭. Зy l� b� ki誴 b鎛 m玭 kh玭g bao gi� truy襫 ra ngo礽. B� ki誴 do ta gi�,  an to祅, ta t trong 2 h閜 s総, nh璶g n h玬 nay ta m韎 ph竧 hi謓 h閜 s総  b� k� gian nh tr竜 th祅h 1 quy觧 V� T� Thi猲 Th�. B� ki誴 b� th蕋 l筩, th藅 l� chuy謓 l韓 r錳!")
		elseif (UTask_tm == 50*256+80) then
			if ( HaveItem(48) == 1) then					--有暗器谱
				Talk(2, "L50_prise", "Л阯g Nh祅 s� th骳, h鉧 ra ngi tr閙 '竚 kh� ph�' l� Tam s� huynh Л阯g H遖. Ta� h�  畂箃 b� ki誴 tr� v�, huynh xem c� ph秈 kh玭g?", "ng r錳! Зy ch輓h l� quy觧 '竚 kh� ph�' b� m蕋, ngi  h鉧 gi秈 頲 m閠 tr薾 i h鋋 cho b鎛 Л阯g. C玭g lao c馻 ngi th藅 l韓!")
			else									--丢失处理
				Talk(1,"","Tuy  t譵 ra ph秐  Л阯g H遖, nh璶g ch璦 t譵 竚 kh� ph� v� l� ch璦 頲 u!")
			end
		elseif (UTask_tm > 50*256) and (UTask_tm < 60*256) then					--尚未完成50级任务
			Talk(1,"","Л阯g Nh祅:B� ki誴 b� cp th藅 kh玭g ph秈 chuy謓 a. Kh玭g nh鱪g l穙 phu mang tr竎h nhi謒 n苙g n� m� c遪 g﹜ h筰 cho ngi v� t閕!")
		elseif (UTask_tm >= 60*256) then					--已经完成50级任务，尚未出师
			Talk(1,"","May m� c� ngi h鉧 gi秈 頲 i h鋋, n誹 kh玭g th� h藆 qu� kh玭 lng!")
		else
			Talk(1,"","C玭g phu 竚 kh�, ngi c� ch� n祇 kh玭g hi觰 c� n h醝 l穙 phu!")
		end
	elseif (UTask_tm >= 70*256) then							--已经出师
		Talk(1,"","Tr猲 giang h�, 產o thng d� tr竛h n� nh璶g 竚 ti詎 kh� ph遪g.")
	else											-- 缺省对话
		Talk(1,"","C玭g phu 竚 kh� trong thi猲 h�, n誹 ta kh玭g ng u thi猲 h� th� c遪 ai n鱝! Ngi ph鬰 kh玭g?")
	end
end;

function L50_step0()
	Talk(2,"L50_get","B鎛 m玭 canh ph遪g nghi猰 ng苩, ngi ngo礽 kh玭g c竎h n祇 bi誸 頲 b� ki誴 gi蕌 � u, c� mu鑞 tr閙 c騨g kh玭g tr閙 頲. V� th� ngi tr閙 b� ki誴 xu蕋 qu� nh藀 th莕 c竎h m蕐, nh蕋 nh c騨g c� th� ti誴 c薾 頲 k� tr閙. Ta nghi r籲g c� n閕 gian, nh璶g chuy謓 n祔 li猲 l魕 qu� l韓, n誹 b竜 l猲 chng m玭 s� g﹜ n猲 chuy謓 t祔 nh! Ta ch� hy v鋘g mau s韒 t譵 ra k� tr閙, s� d莕 d莕 che l蕄 甶 chuy謓 n祔!", "B� ki誴 b� m蕋 khi n祇?")
end;

function L50_get()
	Say("D鵤 theo suy 畂竛, b� ki誴 b� m蕋 tr閙 h玬 qua!", 2, "Gi髉 t譵 b� ki誴 /L50_get_yes", "Kh玭g  kh� n╪g /L50_get_no")
end;

function L50_get_yes()
	Talk(1,"","T筰 h� 甶 h醝 th╩ <color=Red>ngi kh竎<color>, n鉯 kh玭g ch鮪g s� t譵 ra u m鑙!")
	SetTask(2, 50*256+20)
	AddNote("G苝 Л阯g Nh祅 t筰 竚 kh� ph遪g (504, 317) , nh薾 <color=red>nhi謒 v� t譵 竚 Kh� Ph�<color> ")
	Msg2Player("Nh薾 nhi謒 v� 竚 Kh� Ph�.  t譵 竚 Kh� Ph� b� nh c緋. ")
end;

function L50_get_no()
end;

function L50_prise()
	DelItem(48)
	SetRank(30)
	SetTask(2, 60*256)
--	AddMagic(349)
	add_tm(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Giao 竚 Kh� Ph� cho Л阯g Nh祅, th╪g l祄 Л阯g M玭 T� L穙 M玭 Nh﹏! H鋍 頲 L玦 K輈h Thu藅. ")
	AddNote("Giao 竚 Kh� Ph� cho Л阯g Nh祅, nhi謒 v� ho祅 th祅h, th╪g l�: T� L穙 M玭 Nh﹏. ")
end;
