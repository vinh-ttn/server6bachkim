-- 昆仑 弟子 朱缺 30级任务
-- by：Dan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if (UTask_kl == 30*256+10) and (GetItemCount(111) >= 3) then		--30级任务完成
			L30_prise()
		elseif ((UTask_kl == 30*256) and (GetLevel() >= 30)) then		--30级任务启动
			Say("S� t玭 Chng m玭 c� l謓h 甶 t譵 3 vi猲 D� Minh Ch﹗, nh鱪g chuy謓 nh� nh苩 nh� v藋 th� giao cho ngi 甶 l祄 v藋. ",2,"D�......... /L30_get_yes","Kh� n╪g c馻 ta th蕄 k衜, ch� s� kh玭g m 琻g n鎖. /L30_get_no")
		else
			Talk(1,"","Ta suy ngh� m穒 c騨g kh玭g hi觰 t筰 sao s� ph� ta v蒼 c遪  nh鱪g ngi nh� l穙 gi� Th竛 t錸 t筰 tr猲 i. Ngi ta thng n鉯 kh玭g c b蕋 trng phu, kh玭g gi誸 l穙  甶 c� nh� l� c遪 c竔 ung b鋍... �, ngi � y nghe l衝 g� ! ")
		end
	else
		Talk(1,"","C玭 L玭 ph竔 n誹 mu鑞 c飊g c竎 m玭 ph竔 � trung nguy猲 b譶h ng a v�, nh蕋 nh ph秈 c� nh鱪g ngi v� c玭g xu蕋 ch髇g, nh﹏ ngh躠 h琻 ngi nh� ta n緈 quy襫 m韎 頲!")
	end
end;

function L30_get_yes()
	Talk(1,"","Nghe n鉯 g莕 y c� c竔 ng Tuy誸 B竜, b猲 trong c� r蕋 nhi襲 d� minh ch﹗ gi� tr� n鎖 ti課g kh緋 n琲, ta s� 甶 n y th� v薾 may v藋!")
	SetTask(9,30*256+10)
	AddNote("Ti誴 nh薾 nhi謒 v� c蕄 30: V祇 Tuy誸 B竜 ng l蕐 v� 3 vi猲 D� Minh Ch﹗ ")
	Msg2Player("Ti誴 nh薾 nhi謒 v� c蕄 30: V祇 Tuy誸 B竜 ng l蕐 v� 3 vi猲 D� Minh Ch﹗ ")
end;

function L30_get_no()
	Talk(1,"","S� huynh sai b秓 m� c騨g d竚 kh玭g tu﹏ l謓h, qu� l� to gan!")
end;

function L30_prise()
	Talk(1,"","Uhmm! чng t竎 c騨g kh玭g n n鏸 ch薽. Л頲! Ta s� phong ngi l� Th竔 Vi H� Ph竝, t� y v� sau c� c� g緉g l祄 vi謈 cho ta th� t蕋 nhi猲 s� kh玭g 輙 l頸 輈h cho ngi!")
	i = GetItemCount(111)
	for j = 1, i do DelItem(111) end
	SetTask(9,40*256)
	SetRank(22)
--	AddMagic(178)
--	AddMagic(172)
--	AddMagic(393)
--	AddMagic(173)
--	AddMagic(177)			-- 百川纳海
	add_kl(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch髇g m鮪g ngi! Х 頲 th╪g c蕄 th祅h C玭 L玭 ph竔 Th竔 Vi H� Ph竝, h鋍 頲 v� c玭g Nh蕋 Khi Tam thanh, Thi猲 T� T蕁 L玦, Thi猲 Thanh мa Tr鋍, B綾 Minh Цo H秈 ")
	AddNote("T譵 頲 3 h箃 D� Minh Ch﹗, ho祅 th祅h nhi謒 v� c蕄 30 c馻 C玭 L玭, 頲 th╪g ti課 tr� Th竔 Vi H� Ph竝 ")
end;
