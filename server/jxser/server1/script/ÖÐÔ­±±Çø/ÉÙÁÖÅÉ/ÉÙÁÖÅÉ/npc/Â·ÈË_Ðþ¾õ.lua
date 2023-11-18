-- 少林 路人NPC 玄觉 30级任务
-- by：Dan_Deng(2003-08-01)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 30*256+20) and (HaveItem(27) == 1) then		--30级任务完成
			Talk(2,"L30_prise","S� th骳! M蕐 ngi trong T莔 Th竝 l� tay ch﹏ c馻 ngi Kim, b鋘 h�  ﹎ th莔 tr閙 m蕋 quy觧 'B竧 Nh� Ba La M藅  T﹎ Kinh', nh璶g  t�  畂箃 l筰 頲, xin m阨 s� th骳 xem qua.","A Di У Ph藅! Th藅 may ngi s韒 ph竧 hi謓 ra ﹎ m璾 c馻 b鋘 h�, 畂箃 v� kinh th�, n誹 kh玭g th� h藆 qu� kh� lng, l莕 n祔 ngi l藀 c玭g l韓 r錳, b鎛 t鋋 s� th╪g ngi l祄  t� 30 c蕄!")
		elseif ((UTask_sl == 30*256) and (GetLevel() >= 30)) then		--30级任务
			Say("V鮝 l骳 n穣 c� v� t╪g nh﹏ l筰 b竜 c竜, n鉯 r籲g ph竧 hi謓 m閠 s� ngi l� m苩 產ng c� h祅h vi b� 萵 trong Thi誸 Th竝, ngi ng � n  xem th� kh玭g?",2,"уng �!/L30_get_yes","Ta c遪 c� vi謈 kh竎. /L30_get_no")
		else							-- 常规对话
			Talk(1,"","Kim Qu鑓 xem ch髇g ta nh� c﹜ kim trong m総 h�, m蕐 l莕 ph竔 ngi n g﹜ s� v韎 Thi誹 L﹎.")
		end
	else
		Talk(1,"","V� c玭g Thi誹 L﹎ ch髇g ta x璦 n nay 阯g 阯g ch竛h ch竛h, l遪g d�  lng t� bi.")
	end
end;

function L30_get_yes()
	Talk(1,"","V蕋 v� cho ngi qu�, ph秈 c萵 th薾 !")
	SetTask(7,30*256+10)
	AddNote(" Th竝 L﹎ 甶襲 tra b鋘 ngi kh� nghi. ")
	Msg2Player(" Th竝 L﹎ 甶襲 tra b鋘 ngi kh� nghi. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,""," t� s� th骳!")
	DelItem(27)
	SetTask(7,40*256)
	SetRank(4)
--	AddMagic(16)
	add_sl(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("L蕐 l筰 頲 B竧 Nh� Ba La M藅  T﹎ Kinh, th╪g ch鴆 H� Ph竝 La H竛. ")
	Msg2Player("Ch骳 m鮪g b筺! B筺  th╪g ch鴆 H� Ph竝 La H竛 c馻 Thi誹 L﹎ ph竔! H鋍 頲 v� c玭g La H竛 Tr薾. ")
end;
