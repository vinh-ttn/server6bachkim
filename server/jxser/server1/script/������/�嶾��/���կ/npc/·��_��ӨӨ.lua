-- 五毒 路人NPC 毒仙子白莹莹 20级任务
-- by：Dan_Deng(2003-08-05)

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>Lu玭 lu玭 c� k� ngu ng鑓 kh玭g bi誸 s鑞g ch誸 l� g�, kh玭g l� tr� p nh� b鎛 ti猲 t� ta y l筰 l� m閠 甶襲 sai tr竔 hay sao?"
	G_TASK:OnMessage("Ng� чc", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("Ta n t譵 玭g c� vi謈 kh竎", main2)
	tbDailog:Show() 
end

function main2()
	UTask_wu = GetTask(10)
	Uworld50 = GetTask(50)
	if (Uworld50 == 20) then			-- 点醒徐中原任务
		Talk(6,"Uworld50_20","B筩h c� nng! X璦 nay ch竛h t� u kh玭g dung h頿, T� Чi Nh筩 hy v鋘g c� s� r阨 xa T� Trung Nguy猲 ","R阨 xa anh 蕐 th� ta s鑞g c遪 � ngh躠 g�? C騨g v� mu鑞 頲 su鑤 i s鑞g b猲 c筺h anh 蕐 m� ta  thay i r蕋 nhi襲, t筰 sao c竎 ngi kh玭g nh譶 th蕐 頲 nh鱪g 甶襲 n祔?","C� th藅 s� l� mu鑞 kh竛g l筰 s� quy誸 nh c馻 l謓h t玭 sao?","Ta ch� mu鑞 s韒 頲 th祅h th﹏ v韎 Trung Nguy猲 i ca, sau  s� r髏 lui kh醝 giang h� chuy猲 t﹎ nu玦 ch錸g nu玦 con, kh玭g m祅g g� n th� s� lo筺 l筩 n鱝. Nh� v藋 th� c� g� n猲 t閕 ch�?","C� th藅 s� nh� v藋 kh玭g","Tr阨 xanh ch鴑g gi竚, n誹 nh� ti觰 n� c� n鯽 l阨 gi� d鑙, xin h穣 n鎖 s蕀 s衪 nh ch誸 ti ngay. Ti觰 n� kh玭g h� o竛 tr竎h")
	elseif (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 20*256+10) then
			i = GetItemCount(85)				-- 人头
			if (i >= 7) then
				Talk(1,"L20_prise","Ti猲 t�! Thu閏 h�  mang 7 c竔 u c馻 'La Ti猽 S琻 Th蕋 Qu� 'v� y r錳 ")
			else
				Talk(1,"","Ch糿g ph秈 l� ngi  甶 La Ti猽 s琻 r錳 �? T筰 sao v蒼 c遪 c� m苩 � y?")
			end
		elseif ((UTask_wu == 20*256) and (GetLevel() >= 20)) then		--20级任务
			Talk(4,"L20_get","莥! V鮝 m韎 n! C� nh� quy t綾 kh玭g v藋? Х l﹗ qu� r錳, t筰 sao v蒼 ch璦 giao 'Nh﹏ u Tr竛g' ra y","Nh﹏ u Tr竛g l� c竔 g�?","с l� nh鱪g c竔 u b鋘 ngh辌h ph秐 v韎 Ng� чc Gi竜 ","Thu閏 h� ngu n! Xin ti猲 t� ch� d箉 th猰 l莕 n鱝")
		else							-- 常规对话
			Skill150Dialog("Lu玭 lu玭 c� k� ngu ng鑓 kh玭g bi誸 s鑞g ch誸 l� g�, kh玭g l� tr� p nh� b鎛 ti猲 t� ta y l筰 l� m閠 甶襲 sai tr竔 hay sao?")
		end
	else
		Skill150Dialog("цi v韎 b鎛 ti觰 th� m� n鉯, c竔 lo筰 g鋓 l� nam nh﹏ th� kh玭g m阨 h� h� c騨g d蒼 x竎 n, i x� t鑤 v韎 h� m閠 ch髏, th� m閠 t猲 hai t猲 產ng b竛 m筺g cho ta  th玦.")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("Ng� чc", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end


function L20_get()
	Say("C竔 b鋘 La Ti猽 S琻  r蕋 th蘭 kh竧 s綾 p c馻 ti猲 t� n祔! H�! C鉩 th鑙 m� i ╪ th辴 thi猲 nga! Ngi h穣 ch辵 kh� l猲 La Ti猽 S琻 l莕 n鱝, gi誸 s筩h h誸 b鋘 ch髇g cho ta",2,"D�! Thu閏 h� s� l藀 t鴆 甶 l蕐 u b鋘 ch髇g. /L20_get_yes","Thu閏 h� v� c玭g k衜 c醝, e r籲g. /L20_get_no")
end;

function L20_get_yes()
	Talk(1, "", "V藋 th� ta s� i  nghe tin t鑤 c馻 ngi nh�!")
	SetTask(10,20*256+10)
	AddNote("V� B筩h Doanh Doanh, n La Ti猽 s琻  gi誸 La Ti猽 Th蕋 Qu� ")
	Msg2Player("V� B筩h Doanh Doanh, n La Ti猽 s琻  gi誸 La Ti猽 Th蕋 Qu� ")
end;

function L20_get_no()
	Talk(1,"","Ta  v鑞 bi誸 ngi ch� l� m閠 t猲 ti觰 qu� nh竧 gan. Th藅 l� th� v� d鬾g!")
end;

function L20_prise()
	Talk(1,"","Hahaha! Th藅 vui qu�! Ngi th藅 r蕋 c� b秐 l躰h! Л頲! Ti猲 t� ta gi� l阨 th╪g ngi l� Th玦 M謓h S� Gi� ")
	i = GetItemCount(85)				-- 人头
	for j = 1,i do DelItem(85) end
	SetTask(10,30*256)
	SetRank(51)
--	AddMagic(70)
--	AddMagic(66)
	add_wu(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g B筺! Х 頲 th╪g l� Ng� чc Gi竜 Th玦 m謓h s� gi� S� 頲 h鋍 v� c玭g: X輈h Di謒 Th鵦 Thi猲, T筽 Nan Dc Kinh ")
	AddNote("V� B筩h Doanh Doanh, 甶 gi誸 La Ti猽 s琻 th蕋 qu�, 頲 th╪g l�: Th玦 M謓h S� Gi� ")
end;

function Uworld50_20()
	SetTask(50,30)
	Msg2Player("Nghe nh鱪g l阨 c馻 B筩h Doanh Doanh, b筺 c騨g c秏 th蕐 ng c秏, thng x鉻, nh璶g kh玭g bi誸 l祄 c竎h n祇  gi髉  ")
end
