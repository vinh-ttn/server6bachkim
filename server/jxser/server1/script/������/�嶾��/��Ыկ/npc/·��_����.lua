-- 五毒 路人NPC 赤蝎寨主屠异 30级任务
-- by：Dan_Deng(2003-08-05)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 30*256+10) then		-- 任务进行中
			if (HaveItem(87) == 1) then
				Talk(2,"L30_step1","Ng鑓 th藅! M閏 Hng nh n祔 l� gi�!","Kh玭g sao! C騨g kh玭g tr竎h 頲 ngi! Ngi ch璦 t鮪g th蕐 qua M閏 Hng жnh. M閏 Hng жnh th藅 s� s� ph竧 ra 竛h s竛g xanh lam. C遪 th� n祔 l筰 ph竧 ra 竛h s竛g v祅g")
			else
				Talk(1,"","в ta t� tay 甶 b総 ph秐 . Ta mu鑞 b総 h緉 mang v祇 trong Ng� чc ng, cho c tr飊g c緉 ch誸 h緉 ")
			end
		elseif (UTask_wu == 30*256+20) then		-- 任务完成
			if (HaveItem(221) == 1) then
				DelItem(221)
				L30_prise()
			else
				Talk(1,"","Nh� y! M閏 Hng жnh th藅 s� s� ph竧 ra 竛h s竛g xanh lam. ")
			end
		elseif ((UTask_wu == 30*256) and (GetLevel() >= 30)) then		--30级任务
			Talk(4,"L30_get","Gi竜 quy c馻 b鎛 gi竜, ph秐  ph秈 ch誸. V藋 m� v蒼 c遪 nh鱪g k� cu錸g v鋘g ","L� n祇 v蒼 c遪 nh鱪g k� mu鑞 t� 甶 t譵 ch� ch誸 �?","Kh玭g ng� k� th﹏ t輓 nh蕋 m� ta tin tng l筰 d竚 nh c緋 b竨 v藅 luy謓 c玭g M閏 Hng жnh c颽 ta. H緉  ch箉 l猲 V� di s琻! H�! H緉 tng l� c� th� tho竧 kh醝 Th� T﹎ Chng c馻 ta �? ","у Tr筰 Ch� d� nh s� x� tr� h緉 th� n祇?")
		else							-- 常规对话
			Talk(1,"","Kh玭g ph秈 l� ta kh玭g tin tng  t�, nh璶g m� c竔 b鋘 n祔 c� r譶h ta c� m鉵 n祇 l� l� tr閙. M鉵 b秓 b鑙 n祔 ta  c鵦 kh� l緈 m韎 c� 頲 n� ")
		end
	else
		Talk(1,"","Ta b譶h sinh r蕋 h薾 nh鱪g k� b閕 t輓 b閕 ngh躠")
	end
end;

function L30_get()
	Say("B﹜ gi� ta cho ngi m閠 c� h閕 l藀 c玭g, h穣 甶 n V� di s琻  b総 b鋘 ph秐  , l蕐 l筰 M閏 жnh Hng. Ngi c� ng � 甶 kh玭g? ",2,"Xin ph鬾g m謓h c馻 у tr筰 ch�. /L30_get_yes","Thu閏 h� c玭g l鵦 c遪 y誹, ch� s� kh玭g ho祅 th祅h 頲 nhi謒 v�. /L30_get_no")
end;

function L30_get_yes()
	Talk(1, "", "Л頲! N誹 ngi c� th� 畂箃 l筰 M閏 Hng жnh, ta s� th╪g ngi l�: H綾 竚 Di猰 La ")
	SetTask(10,30*256+10)
	AddNote("L筰 l猲 V� Di s琻  l蕐 l筰 M閏 Hng жnh ")
	Msg2Player("L筰 l猲 V� Di s琻  l蕐 l筰 M閏 Hng жnh ")
end;

function L30_get_no()
end;

function L30_step1()
	Talk(1,"","D�! Thu閏 h� l莕 n祔 nh蕋 nh s� 甧m 頲 M閏 Hng жnh th藅 v� ")
	SetTask(10,30*256+20)
	DelItem(87)
	AddNote("L筰 l猲 V� Di s琻  l蕐 l筰 M閏 Hng жnh th藅 ")
	Msg2Player("L筰 l猲 V� Di s琻  l蕐 l筰 M閏 Hng жnh th藅 ")
end;

function L30_prise()
	Talk(2,"","M閏 Hng жnh! T鑤! T鑤! Ta s� thng ph箃 ph﹏ minh. L莕 n祔 ngi l藀 i c玭g. B総 u th� h玬 nay, ngi s� 頲 th╪g l�: H綾 竚 Di猰 La "," t� у tr筰 ch�!")
	SetTask(10,40*256)
	SetRank(52)
--	AddMagic(68)
--	AddMagic(384)
--	AddMagic(64)
--	AddMagic(69)
	add_wu(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g B筺! Х 頲 th╪g l� H綾 竚 Di猰 La. H鋍 頲 v� c玭g: U Minh Kh� L﹗, B竎h чc Xuy猲 T﹎, B╪g Lam Huy襫 Tinh, V� H譶h чc ")
	AddNote("箃 頲 M閏 Hng жnh v� cho у D�, 頲 th╪g l� H綾 竚 Di猰 La ")
end;
