--description: 天王帮左使古柏　天王30级任务
--author: yuanlan	
--date: 2003/4/25
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if ((UTask_tw == 30*256) and (GetLevel() >= 30) and (GetFaction() == "tianwang")) then
			Say("Th藅 xui x蝟! H玬 qua ta 甶 ngang qua <color=Red>Y課 T� ng<color>,  l祄 r琲 m蕋 <color=Red>Thi猲 Vng l謓h<color>. с l� t輓 v藅 c馻 b鎛 bang. N誹 kh玭g t譵 l筰 頲�.H莥!..", 2, "Gi髉 t譵 Thi猲 Vng l謓h /L30_get_yes", "Ta kh玭g quan t﹎!/L30_get_no")
		elseif (UTask_tw == 30*256+20) and (HaveItem(145) == 1 ) then
			L30_prise()
		elseif (UTask_tw > 30*256) and (UTask_tw < 40*256) then					--已经接到30级任务，尚未完成
			Talk(1,"","<color=Red>Thi猲 Vng l謓h<color> m蕋 � <color=Red>Y課 T� ng<color>. N誹 ngi t譵 l筰 頲, ta s� phong ngi l� Chng У u L躰h.")
		elseif (UTask_tw >= 40*256) then					--已经完成30级任务，尚未出师
			Talk(1,"","H秓 huynh ! Ngi  gi髉 ta m閠 vi謈 l韓 r錳!")
		else
			Talk(1,"","Ch髇g ta b綾 kh竛g Kim binh, Nam ph遪g Tri謚 T鑞g, hai b猲 u t竎 chi課 th藅 kh玭g d� d祅g g� ")
		end
	elseif (UTask_tw >= 70*256) then							--已经出师
		Talk(1,"","Xu蕋 s� r錳 ng qu猲 thng xuy猲 tr� v� th╩ c竎 huynh  nh�!")
	else
		Talk(1,"","ng coi thng bang ch� l� m閠 n� nhi.C� ta x� l� c竎 vi謈 trong bang t蕋 c� u u ra , thng ph箃 ph﹏ minh, trong l遪g m鋓 ngi u r蕋 k輓h tr鋘g c� ta.")
	end
end;

function L30_get_yes()
	Talk(1,"","<color=Red>Thi猲 Vng l謓h<color> m蕋 � <color=Red>Y課 T� ng<color>. N誹 ngi t譵 l筰 頲, ta s� phong ngi l� Chng У u L躰h.")
	SetTask(3, 30*256+20)
	AddNote("T筰 c鯽 T﹜ Thi猲 甶謓, ti誴 nh薾 nhi謒 v� <color=red>Thi猲 Vng l謓h<color>, 甶 n Y課 T� ng t譵 Thi猲 Vng l謓h ")
	Msg2Player("T筰 c鯽 T﹜ Thi猲 甶謓 ti誴 nh薾 nhi謒 v� Thi猲 Vng l謓h, 甶 n Y課 T� ng t譵 Thi猲 Vng l謓h ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","Th� ra Thi猲 Vng L謓h  b� b鋘 cp � Y課 T� ng tr閙 m蕋, may l� t譵 l筰 頲, n誹 kh玭g s� b� bang ch� qu� tr竎h. Ngi th藅  gi髉 ta m閠 vi謈 l韓. B鎛 s� n鉯 l阨 s� gi� l蕐 l阨, nh蕋 nh s� phong ngi l祄 Chng Ц u L躰h.")
	DelItem(145)
	SetRank(46)
	SetTask(3, 40*256)
--	AddMagic(37)
--	AddMagic(35)
--	AddMagic(31)
	add_tw(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Mang Thi猲 Vng l謓h giao cho C� B竎h, ho祅 th祅h nhi謒 v� Thi猲 Vng l謓h. Л頲 phong l�: Chng У u L躰h. H鋍 頲 B竧 Phong Tr秏, Dng Quan Tam 謕, H祅g V﹏ Quy誸. ")
	AddNote("Tr� l筰 o Thi猲 Vng mang Thi猲 Vng l謓h giao cho C� B竎h, ho祅 th祅h nhi謒 v�, 頲 phong l�: Chng У u L躰h ")
end;
