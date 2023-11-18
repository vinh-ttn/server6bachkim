--龙泉村 路人 钟离
--龙泉村新手任务：阳春白雪羹
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world20 = GetTask(20)
	if (UTask_world20 == 0) and (GetLevel() >= 5) then 		--任务启动
		Talk(2,"W20_get","T蕋 c� c竎 m鉵 ╪ trong thi猲 h� ch璦 c� m鉵 n祇 m� ta ch璦 l祄 qua. Nh璶g m� c� m閠 m鉵 g鋓 l�' Dng B筩h Tuy誸 M�' l� ta l祄 m穒 v蒼 ch璦 頲 ","T筰 sao v藋?")
	elseif (UTask_world20 == 5) then
		if (HaveItem(231) == 1) and (HaveItem(232) == 1) then		-- 任务完成
			SetTask(20,10)
			DelItem(231)
			DelItem(232)
			Talk(1,"","Dng xu﹏ Linh Chi! B筩h Tuy誸 B竎h h頿. T鑤 l緈! Th藅 kh玭g bi誸 ph秈 l祄 sao  c秏 t� ngi. Зy l� ch髏 輙 l遪g th祅h, xin h穣 nh薾 l蕐 ")
			AddNote("Mang Dng Xu﹏ Linh Chi v� B筩h Tuy誸 B竎h H頿 giao cho Chung C莔, ho祅 th祅h nh拗m v� ")
			Msg2Player("Mang Dng Xu﹏ Linh Chi v� B筩h Tuy誸 B竎h H頿 giao cho Chung C莔, ho祅 th祅h nh拗m v� ")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			if(GetSex() == 0) then
				AddItem(0, 9, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("Nh薾 頲 m閠 mi課g Ng鋍 B閕 ")
			else
				AddItem(0, 9, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("Nh薾 頲 m閠 t骾 x� Hng m祏 甧n ")
			end
			AddRepute(8)
			Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 8 甶觤 ")
		else
			Talk(1,"","Sao h�? Hai m鉵   ngi u t譵 v� 頲 r錳 �?")
		end
	elseif (UTask_world20 == 10) then		-- 任务已经完成
		Talk(1,"","Th藅 l� c秏 琻 ngi")
	else
		Talk(1,""," trong thi猲 h�, ╪ c竎 m鉵 ╪ c馻 thi謓 h�. C� i ta t﹎ huy誸 ch� l� 頲 ╪ t蕋 c� c竎 m鉵 ngon trong thi猲 h� m� th玦 ")
	end
end;

function W20_get()
	Say("M鉵 ╪ n祔 c莕 ph秈 c� 'Dng Xu﹏ Linh Chi v� B筩h tuy誸 B竎h h頿,nghe n鉯 ch� c� � th玭 Long tuy襫 m韎 c� hai th� n祔. Ta  t譵 r蕋 l﹗ r錳 nh璶g v蒼 ch璦 t譵 頲 ch髇g ",2,"T譵 gi髉 玭g ta /W20_get_yes","Kh玭g m祅g n /W20_get_no")
end

function W20_get_yes()
	SetTask(20,5)
	Talk(1,"","в ta gi髉 玭g t譵!")
	AddNote("Nh薾 nhi謒 v� gi髉 Chung C莔 甶 t譵 Dng Xu﹏ Linh Chi v� B筩h Tuy誸 B竎h H頿 ")
	Msg2Player("Nh薾 nhi謒 v� gi髉 Chung C莔 甶 t譵 Dng Xu﹏ Linh Chi v� B筩h Tuy誸 B竎h H頿 ")
end

function W20_get_no()
end
