--石鼓镇 武师 新手任务送饭、练轻功
-- By: Dan_Deng(2003-09-04)
-- Update: Dan_Deng(2003-11-04)改为模板方式，全服统一调用一个函数以利于维护、扩展

Include("\\script\\global\\itemhead.lua")
Include("\\script\\global\\各派接引弟子\\轻功_武师模板.lua")

function main(sel)
	UTask_world22 = GetTask(22)		-- 送饭任务
	if (UTask_world22 == 5) and (HaveItem(233) == 1) then			-- 送饭任务完成
		Talk(4,"W22_prise","Li評 Di謕 Nhi nh� ngi 甧m c琺 cho ta? N� nh� tu鎖 th� m� ph秈 lo nhi襲 vi謈, ta kh玭g ph秈 l� 玭g n閕 t鑤. Nh� n╩ x璦 l骳 n� 3 tu鎖.....sau .....l筰 c遪.....","g ╪ c琺 甶!","C竚 琻! Ta c遪 nhi襲 chuy謓 ngi mu鑞 nghe kh玭g?",".....Kh玭g c莕!")
	else
		learn()
	end
end;

function W22_prise()
	Talk(1,"","Th�.....c竚 琻 ngi! H穣 gi� l蕐 v� kh� ph遪g th﹏.")
	DelItem(233)
	SetTask(22,10)
	AddNote("Лa c琺 cho v� s�, nhi謒 v� ho祅 th祅h ")
	Msg2Player("Лa c琺 cho v� s�, nhi謒 v� ho祅 th祅h ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,7)
	i = random(0,8)
	if(i <= 5) then
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	else
		i = i - 6
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	end
	Msg2Player("Nh薾 頲 m閠 m鉵 binh kh� ")
	AddRepute(3)
	Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 3 甶觤 ")
end;
