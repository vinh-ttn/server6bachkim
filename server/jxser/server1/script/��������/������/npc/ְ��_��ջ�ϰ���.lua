--龙门镇 路人 客栈老板娘 新手任务：介绍工作
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world25 = GetTask(25)
	UTask_world27 = GetTask(27)
	if (UTask_world25 == 3) then		-- 任务“介绍工作”进行中
		Talk(5,"W25_step","B� ch�! C� c莕 th猰 ngi gi髉 vi謈 kh玭g?","Gi髉 vi謈? Hi謓 c遪 產ng thi誹 m閠 ch﹏ ti觰 nh�  d鋘 b祅","C� ngi mu鑞 d� tuy觧, v藋 nh薾 kh玭g?","C遪 xem kh� n╪g!","T� trung Nguy猲 n y, t譵 m閠 b鱝 c琺 th藅 kh玭g d� d祅g")
	elseif (UTask_world27 == 0) and (GetLevel() >= 5) then
		Say("! T譵 cho ta 3 mi課g th辴 heo r鮪g, v� y cho ta i kh竎h!",2,"Bi誸 r錳/W27_get_yes","Phi襫 ch誸 頲!  t譵 ngi kh竎 甶! /W27_get_no")
	elseif (UTask_world27 == 5) then
		i = GetItemCount(228)
		if (i >= 3) then
			for j = 1,i do DelItem(228) end
			Talk(1,"","�! чng t竎 c鵦 k� nhanh! N祔! C竔 m� n祔 ta kh玭g c莕 d飊g n n鱝! T苙g cho ngi !")
			SetTask(27,10)
			AddRepute(9)
			AddNote("H穣 mau 甧m th辴 heo r鮪g v� giao cho b� ch�, ho祅 th祅h nhi謒 v�! ")
			Msg2Player("H穣 mau 甧m th辴 heo r鮪g v� giao cho b� ch�, ho祅 th祅h nhi謒 v�! ")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			if(GetSex() == 0) then
				AddItem(0, 7, 6, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("Nh薾 頲 m閠 t蕀 kh╪ v秈 ")
			else
				AddItem(0, 7, 10, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("S� 頲 m閠 mi課g s総 h譶h tr遪 ")
			end
			Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 9 甶觤 ")
		else
			Talk(1,"","L祄 g� m� c� ng th莕 ngi ra v藋? Xem b� d筺g c馻 ngi k譨! C遪 ch璦 ch辵 甶?!")
		end
	elseif (UTask_world25 == 6) then
		Talk(1,"","�! Ngi n鉯 c竔 ngi t猲 l� Thng Quan Thu g� 匞鋓 h緉 n y! S� tr� th� c馻 ta v蒼 c遪 thi誹!")
	else				-- 非任务对话
		Talk(1,"","Oa Oa! Kh竎h quan kh玭g tr� � L� qu竛 n祔 �? 100 d苖 xung quanh 'Long m玭 tr蕁' n祔 kh玭g ai h琻 頲 L� qu竛 c馻 ta! Kh玭g tin th� ngi s� h鑙 h薾 !")
	end
end;

function W25_step()
	Talk(1,"","Л頲 r錳! V藋 h穣 mau g鋓 y n y gi髉 ta!")
	SetTask(25,6)
	AddNote("B� ch�  ng � m阨 Thng Quan Thu n y gi髉 v謈! H穣 mau mang tin vui n祔 n cho h緉! ")
	Msg2Player("B� ch�  ng � m阨 Thng Quan Thu n y gi髉 v謈! H穣 mau mang tin vui n祔 n cho h緉! ")
end

function W27_get_yes()
	SetTask(27,5)
	AddNote("Nh薾 nhi謒 v�! V祇 r鮪g l蕐 3 mi課g th辴 heo r鮪g v� giao cho b� ch�! ")
	Msg2Player("Nh薾 nhi謒 v�! V祇 r鮪g l蕐 3 mi課g th辴 heo r鮪g v� giao cho b� ch�! ")
end

function W27_get_no()
end
