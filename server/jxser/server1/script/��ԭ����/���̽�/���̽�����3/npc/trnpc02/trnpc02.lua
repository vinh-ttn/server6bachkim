--description: 天忍教火堂堂主
--author: yuanlan	
--date: 2003/5/18
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4);
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 10*256) and (GetLevel() >= 10) then
			Say("T筰 t莕g hai c馻 b鎛 gi竜, � <color=Red>Th蕋 S竧 чng<color> c� giam <color=Red>b秠 t猲 t� t�<color>, b鋘 ch髇g u l� nh鱪g k� ph秐 b閕 b鎛 gi竜, n誹 ngi c� th� nh b筰 ba t猲 trong s� b鋘 ch髇g, l蕐 頲 <color=Red>m秐h Th蕋 S竧 l謓h b礽<color>, l� c� th� th╪g l猲 c蕄 V� 秐h S竧 Th� c馻 b鎛 gi竜, ngi c� mu鑞 v祇 trong Th蕋 S竧 чng kh玭g?", 2, "X玭g v祇 Th蕋 S竧 ng /L10_get_yes", "T筸 th阨 ch璦 v祇 /L10_get_no")
--		elseif (UTask_tr == 10*256+50) and (HaveItem(51) == 1) and  HaveItem(52) == 1 and HaveItem(53) == 1 and HaveItem(54) == 1 and HaveItem(55) == 1 and HaveItem(56) == 1 and (HaveItem(57) == 1) then
		elseif (UTask_tr == 10*256+50) then		-- 修改任务完成条件（2003-09-27）
			i = check_token()
			if (i >= 3) then
				Talk(1,"L10_prise","R蕋 t鑤! v祇 Th蕋 S竧 чng h�  s� ngi m韎 c� th� tr� ra, ngc l筰 ngi c� chuy謓 g� th� t� m譶h x� l�!")
			else
				Talk(1,"","Th� n祇? M閠 cu閏 kh秓 nghi謒 nh� nh� th� m� ngi c騨g l祄 kh玭g xong �?")
			end
		elseif (UTask_tr < 20*256) then								--尚未接10级任务
			Talk(1,"","ng ngh� gia nh藀 b鎛 gi竜 s� ╪ kh玭g ng錳 r錳, b鎛 gi竜 kh玭g ch鴄 ch蕄 nh鱪g ngi th鮝 th穒 u!")
		else
			Talk(1,"","Ngi m韎 gia nh藀 b鎛 gi竜, ngi m筺h c遪 c� ngi m筺h h琻, ngi ph秈 c萵 th薾 y!")
		end
	else
		Talk(1,"","Ch� c� k� m筺h m韎 c� th� sinh t錸 tr猲 th� gian, k� m筺h th緉g k� y誹, nh鱪g ngi tu luy謓 ch璦 t韎 th� s� b� k� kh竎 ti猽 di謙, ﹗ c騨g l� do t� chu鑓 l蕐, ng n猲 o竛 tr竎h ngi kh竎.")
	end
end;

function L10_get_yes()
	Talk(1,"","<color=Red>Th蕋 S竧 l謓h b礽<color> c� t蕋 c� b秠 m秐h, ph﹏ ra tr猲 ngi <color=Red>b秠 t猲 t� t�<color>, ngi ch� c莕 l蕐 3 m秐h l� 頲.")
	SetTask(4, 10*256+50)
	AddNote("Nh薾 nhi謒 v� Th蕋 S竧 ng c馻 V祇 Th蕋 S竧 ng l蕐 ba m秐h Th蕋 S竧 l謓h b礽. ")
	Msg2Player("Nh薾 nhi謒 v� Th蕋 S竧 ng c馻 V祇 Th蕋 S竧 ng l蕐 ba m秐h Th蕋 S竧 l謓h b礽. ")
end;

function L10_get_no()
	Talk(1,"","Khi  l祄 xong r錳 h穣 quay l筰 t譵 ta!")
end;

function L10_prise()
	SetTask(4, 20*256)
	SetRank(56)
--	AddMagic(132)
--	AddMagic(131)
--	AddMagic(136)
	add_tr(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("B筺 頲 phong l� V� 秐h S竧 Th�! H鋍 頲 Thi猲 Nh蒼 M﹗ Ph竝, Thi猲 Nh蒼 o ph竝, H醓 Ph莕 Li猲 Hoa. ")
	AddNote("Лa c竎 m秐h Th蕋 S竧 l謓h b礽 cho Л阯g ch� Ng閠 Ng筼, ho祅 th祅h nhi謒 v� Th蕋 S竧 ng, th╪g c蕄 V� 秐h S竧 Th�. ")
end;

function check_token()
	i = 0
	if (HaveItem(51) == 1) then
		i = i + 1
		DelItem(51)
	end
	if (HaveItem(52) == 1) then
		i = i + 1
		DelItem(52)
	end
	if (HaveItem(53) == 1) then
		i = i + 1
		DelItem(53)
	end
	if (HaveItem(54) == 1) then
		i = i + 1
		DelItem(54)
	end
	if (HaveItem(55) == 1) then
		i = i + 1
		DelItem(55)
	end
	if (HaveItem(56) == 1) then
		i = i + 1
		DelItem(56)
	end
	if (HaveItem(57) == 1) then
		i = i + 1
		DelItem(57)
	end
	return i
end;
