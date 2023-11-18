--龙泉村 路人 彭放
--龙泉村新手任务：修刀
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world19 = GetTask(19)
	if (UTask_world19 == 0) and (GetLevel() >= 2) then 		--修刀任务启动
		if (GetSex() == 0) then
			W19_rank = "h藆 sinh"
		else
			W19_rank = "C� nng"
		end
		Talk(2,"W19_get","B祅h Ph鉵g:"..W19_rank.."c� th� gi髉 t筰 h� kh玭g?","Gi髉 g� y? ")
	elseif (UTask_world19 == 2) and (HaveItem(229) == 0) then
		AddEventItem(229)
		Talk(1,"", 10903)
	elseif (UTask_world19 == 8) and HaveItem(230) then		-- 任务完成
		Talk(1,"", 10904)
		DelItem(230)
		SetTask(19,10)
		AddNote("Mang b秓 產o  s鯽 xong v� cho B祅h Ph鉵g, ho祅 th祅h nhi謒 v� ")
		Msg2Player("Mang b秓 產o  s鯽 xong v� cho B祅h Ph鉵g, ho祅 th祅h nhi謒 v� ")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0) then
			AddItem(0, 8, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("Nh薾 頲 Ng璾 B� H� Uy觧 ")
		else
			AddItem(0, 8, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("Nh薾 頲 Ng璾 B� H� Uy觧 ")
		end
		AddRepute(6)
		Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 6 甶觤 ")
	else
		Talk(1,"", 10905)
	end
end;

function W19_get()
	Say(10906 ,2,"Gi髉  h緉! /W19_get_yes","Kh玭g c莕 do d� /W19_get_no")
end

function W19_get_yes()
	SetTask(19,2)
	AddEventItem(229)
	Talk(1,"", 10907)
	AddNote("Ti誴 nh薾 nhi謒 v�: Gi髉 B祅h Ph鉵g mang 產o 甶 s鯽 ")
	Msg2Player("Ti誴 nh薾 nhi謒 v�: Gi髉 B祅h Ph鉵g mang 產o 甶 s鯽 ")
end

function W19_get_no()
end
