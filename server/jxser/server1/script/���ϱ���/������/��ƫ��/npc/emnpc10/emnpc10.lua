--description: 峨嵋派苏词馨 
--author: yuanlan	
--date: 2003/3/5
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Dan_Deng(2003-08-12)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if ((UTask_em == 40*256) and (GetLevel() >= 40) and (GetFaction() == "emei")) then
			Talk(2, "L40_get","Trong v� s� t� mu閕, t譶h c秏 c馻 ta v韎 T莕 s� t� r蕋 th﹏ thi誸. T� 蕐 s緋 m鮪g sinh nh藅. Ta mu鑞 t苙g t� 蕐 1 m鉵 qu�. T莕 s� t� tinh th玭g ﹎ lu藅, t� lu玭 mu鑞 c� 頲 kh骳 nh筩 tuy謙 ph萴 <color=Red>'B竎h 觰 Tri襲 Ph鬾g'<color>.","Ta t譵 ki誱 kh緋 n琲 m韎 bi誸 � <color=Red>Thanh Th祅h s琻<color> c� v� <color=Red>Cao Nh﹏<color> 萵 c� 產ng c蕋 gi� quy觧 kh骳 ph� n祔, nh璶g m穒 kh玭g t譵 頲 玭g ta. Sinh nh藅 T莕 s� T�  g莕 k�, ph秈 l祄 sao y?")
		elseif ((UTask_em == 40*256+80) and (HaveItem(22) == 1)) then					--得到百鸟朝凤曲谱
			L40_prise()
		elseif (UTask_em >= 50*256) and (GetFaction() == "emei") then   							--已经完成40级任务，尚未出师
			Talk(1,"","T莕 s� t� nh譶 th蕐 kh骳 ph� vui m鮪g kh玭 xi誸, u do c玭g c馻 mu閕!")
		else
			Talk(1,"","G莕 y giang h� kh玭g y猲, dng nh� l筰 c� chuy謓 i s�!")
		end
	elseif (UTask_em >= 70*256) then										--已经出师
		Talk(1,"","Ti觰 s� mu閕, sau n祔 h祅h hi謕 giang h� g苝 kh� kh╪ g� h穣 quay v� t譵 ta!")
	else
		Talk(1,""," Dng c玭g s竛g t竎 kh骳 '謕 Luy課 Hoa' c� c﹗ 'ёnh Vi謓 th﹎ th﹎ th﹎ c� h鴄', c玭g phu d飊g ch� c馻 c﹗ n祔, th藅 khi課 ngi i th竛 ph鬰!")
	end
end;

function L40_get()
	Say("Mu閕 c� b籲g l遪g gi髉 ta t譵 v� cao nh﹏  kh玭g?", 2, "уng �!/L40_get_yes", "Kh玭g c遪 th阨 gian n鱝 /L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","T鑤 l緈! V� <color=Red>Cao nh﹏<color>  產ng 萵 c� trong <color=Red>Th莕 Ti猲 ng<color> � Thanh Th祅h s琻.")
	SetTask(1, 40*256+10)
	AddNote("B猲 T� Thi猲 謓 Nga Mi ph竔 g苝 T� T� Hinh nhi謒 v� ti誴 theo Kh骳 Ph�, t譵 g苝  B竎h 觰 Tri襲 Ph鬾g. ")
	Msg2Player("Ti誴 nh薾 nhi謒 vu, t譵 B竎h 觰 Tri襲 Ph鬾g kh骳 ph� ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","Kh骳 ph� 'B竎h 觰 Tri襲 Ph鬾g'! T鑤 l緈! T莕 s� t� th蕐 頲 nh蕋 nh r蕋 vui, c秏 琻 ti觰 s� mu閕! ")
	DelItem(22)
	SetRank(17)
	SetTask(1, 50*256)
--	AddMagic(86)
	add_em(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! Х tr� th祅h Thanh Li猲 Ti猲 T�. H鋍 頲 L璾 Thu�. ")
	AddNote("V� Nga Mi, giao B竎h 觰 Tri襲 Ph鬾g kh骳 ph� cho T� T� Hinh, ho祅 th祅h nhi謒 v�. Th╪g ch鴆 th祅h Thanh Li猲 Ti猲 T�. ")
end;
