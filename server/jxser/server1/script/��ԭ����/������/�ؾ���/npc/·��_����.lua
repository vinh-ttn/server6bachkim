-- 少林 路人NPC 玄慈 50级任务
-- by：Dan_Deng(2003-08-04)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if ((UTask_sl == 50*256+30) and (HaveItem(28) == 1)) then		-- 50级任务进行中
			L50_prise()
		elseif ((UTask_sl == 50*256) and (GetLevel() >= 50)) then		--50级任务启动
			Talk(2,"L50_get","D辌h C鑤 Kinh, 'D辌h C﹏ kinh' v� 'T葃 T駓 Kinh' 頲 g鋓 l� 'Thi誹 L﹎ Tam Kinh', tng truy襫 do Чt Ma S� T� vi誸, ch輓h l� tinh t髖 v� h鋍 c馻 b鎛 ph竔.","N╩ x璦 Kim binh Nam h�,  tr竛h B秓 甶觧 r琲 v祇 tay gi芻, trong l骳 h鏽 lo筺,  t� c馻 b鎛 t鋋 l� Tr鮪g Vi詎  甧m tam kinh 甶 gi蕌 trong khu r鮪g t飊g ph輆 sau t�. Trong cu閏 chi課, Tr鮪g Vi詎 do b秓 v� T祅g Kinh c竎 n猲  t� thng. V� sau c竎 t╪g ch髇g v祇 r鮪g t飊g ch� t譵 頲 'D辌h C﹏ Kinh' v� 'T葃 T駓 Kinh' c遪 'D辌h C鑤 Kinh' th� v蒼 ch璦 t譵 th蕐.")
--		elseif (UTask_sl == 70*256+10) then			-- 重返门派任务完成
--			Say("玄慈：十顶僧帽你收集齐了吗？",2,"已经准备好了/return_completed","请再等一段时间/return_sele_no")
--		elseif (UTask_sl == 70) then			-- 重返门派任务
--			Talk(1,"return_sele","玩家：师父，我出师了还可以借阅藏经阁中的书籍吗？")
		else							-- 常规对话
			Talk(1,"","C� t辌h b秓 甶觧 c馻 b鎛 t� r蕋 nhi襲, Kim qu鑓 nh適 ng�  l﹗.")
		end
	else
		Talk(1,"","T祅g Kinh C竎 c遪 l� ph竝 阯g, l� n琲 c竎 cao t╪g thuy誸 kinh gi秐g ph竝, T祅g Kinh C竎 c馻 b鎛 t� c� r蕋 nhi襲 kinh Ph藅, r蕋 nhi襲 tuy謙 b秐 tr﹏ ph萴.")
	end
end;

function L50_get()
	Say("N誹 'D辌h C鑤 Kinh' th藅 s�  b�  t� ta l祄 m蕋, th� th藅 h� th裯 v韎 Ph藅 T�!",2,"T譵 gi髉 /L50_get_yes","Ta kh玭g quan t﹎!/L50_get_no")
end

function L50_get_yes()
	SetTask(7,50*256+10)
	AddNote("Nh薾 nhi謒 v� t譵 kinh c馻 Thi誹 L﹎: T譵 l筰 quy觧 D辌h C鑤 Kinh 頲 Tr鮪g Vi詎 gi蕌. ")
	Msg2Player("Nh薾 nhi謒 v� t譵 kinh c馻 Thi誹 L﹎: T譵 l筰 quy觧 D辌h C鑤 Kinh 頲 Tr鮪g Vi詎 gi蕌. ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(1,"","Зy ng l� 'D辌h C鑤 Kinh'! Hay qu�.....")
	SetTask(7,60*256)
	DelItem(28)
	SetRank(6)
--	AddMagic(271)
--	AddMagic(11)
--	AddMagic(19)
	add_sl(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("T譵 頲 D辌h C鑤 Kinh, ho祅 th祅h nhi謒 v� t譵 kinh. Th╪g c蕄 Ph鬰 ma Thi猲 Vng. ")
	Msg2Player("Ch骳 m鮪g b筺! B筺  th╪g ch鴆 Ph鬰 ma Thi猲 Vng c馻 Thi誹 L﹎ ph竔! H鋍 頲 v� c玭g Long Tr秓 H� Tr秓, Ho祅h Quy L鬰 H頿, Ma Ha V� Lng. ")
end;
