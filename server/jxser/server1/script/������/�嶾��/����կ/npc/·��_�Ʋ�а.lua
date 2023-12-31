-- 五毒 路人NPC 金蛇寨主云不邪 40级任务
-- by：Dan_Deng(2003-08-05)
-- update by: xiaoyang(2004\4\13) 加入90级门派任务

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
	tbDailog.szTitleMsg = "<npc>Ng� чc Gi竜 ch髇g ta c� v� v祅 c dc, c� m閠 s� c dc l� d飊g h祅g tr╩ lo筰 c v藅 m� luy謓 ch�, lo筰 c b� truy襫 n祔, ch� c莕 ch筸 nh� m閠 ch髏 th玦, th� s� ch誸 kh玭g c� v誸 t輈h"
	G_TASK:OnMessage("Ng� чc", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("Ta n t譵 玭g c� vi謈 kh竎", main2)
	tbDailog:Show() 
end

function main2()
	UTask_wu = GetTask(10)
	Uworld124 = GetTask(124)
	if(GetSeries() == 1) and (GetFaction() == "wudu") then
		if((UTask_wu == 40*256+10) and (HaveItem(143) == 1)) then		-- 任务进行中
			L40_prise()
		elseif((UTask_wu == 40*256) and (GetLevel() >= 40)) then		--40级任务
			Say("Ngi h穣 甶 n Kim X� Huy誸 tr筩h b総 cho ta m閠 con Nh穘 K輓h Vng M穘g X�,ta mu鑞 u鑞g m竨 c馻 n�  t╪g cng c玭g l鵦 ",2,"Tu﹏ l謓h!/L40_get_yes","Thu閏 h� v蒼 c遪 m閠 chuy謓 kh竎. /L40_get_no")
		else							-- 常规对话
			Skill150Dialog("Зy l� m閠 th� gi韎 cng gi� sinh t錸, mu鑞 ti誴 t鬰 s鑞g th� h穣 nhanh nhanh m� 甶 luy謓 c玭g 甶!")
		end
	elseif (Uworld124 == 10) then
		Talk(9,"Uworld_envelop","V﹏ B蕋 T�!","Ai da! Tr玭g th藅 l� p trai! Ngi t譵 ti觰 V﹏ n祔 c� vi謈 g�?","Mau a thu鑓 gi秈  Dng Ti誹 ra y!","Th� ra l� ngi mu鑞 l� ah h飊g! Л頲 th玦! Ch� c莕 ngi ch辵 � l筰 y v韎 ta th� mu鑞 g� c騨g 頲"," Ph�! Ngi l� m閠 k� nham hi觤 c 竎, n誹 kh玭g a thu鑓 gi秈 ra y, th� s� kh玭g ai c遪 nh薾 ra b� d筺g c馻 ngi n鱝!","H�! C竔 t猲 kh玭g bi誸 t鑤 x蕌 l� g�! Л頲! � y ta c� m閠 b鴆 th�, ngi h穣 mang gi髉 ta n Л阯g M玭 giao cho Tuy謙 Xu﹏ T萿 Л阯g D�. R錳 ngi s� c� c竔 ngi mu鑞. ","Ta d鵤 v祇 u  tin ngi?","L穙 t� y m芻 d� ti課g t╩ tr猲 giang h� c� h琲 x蕌. Nh璶g m� ngih穣 c� th� 甶 h醝 xem, c� ph秈 ta l� ngi lu玭 bi誸 gi� ch� T輓 hay kh玭g","T筸 th阨 tin ngi m閠 l莕")
	elseif (Uworld124 == 20 ) and (HaveItem(385) == 0) then
      Talk(1,"","B籲g h鱱! ng c� v閕 v祅g nh� v藋! Th� ta v蒼 c遪 ch璦 a,ngi l祄 sao c� th� 甶 g苝 Л阯g D� ")
      AddEventItem(385)
      Msg2Player("Ti誴 nh薾 th� t輓 c馻 V﹏ B蕋 T� ")
	elseif (Uworld124 == 30) and (HaveItem(386) == 1) then
		DelItem(386)
		SetTask(124,35)
      Talk(5,"Uworld124_jump","Sao h�?","莥! Х b� h緉 ph竧 hi謓 ra trong th� c� c!","Sao l筰 th� 頲! Ta b� c r蕋 b� m藅 c萵 th薾 h緉 l祄 sao c� th� 甶襲 tra ra 頲! Лa l筰 cho ta!","A!...Tr猲 th� n祔 l筰 c� m閠 lo筰 k辌h c kh竎!","V﹏ B蕋 T�! H筰 ngi th� c騨g s� n l骳 b� ngi h筰! Ngi s鑞g kh玭g h誸 ng祔 h玬 nay u!")        
	elseif (Uworld124 == 35) then
		Talk(1,"Uworld124_jump","Qua y! C飊g ch琲 v韎 ti觰 V﹏ 甶!")
	elseif (Uworld124 == 40) and (HaveItem(387) == 0) then
		SetTask(124,35)
		Talk(2,"Uworld124_jump","V﹏ l穙 t芻! Mau a m閠 ph莕 thu鑓 gi秈 ra y!","Ph�! L骳 n穣 ta c� h琲 s� su蕋 n猲 m韎 tr髇g k� c馻 ngi! ng c� qu� v鋘g tng! Xem y! ")
	elseif (Uworld124 >= 40) then			-- 任务完成
		Talk(1,"","Ngi. Th藅 qu� 竎 c! ")
	else
		Skill150Dialog("Ng� чc Gi竜 ch髇g ta c� v� v祅 c dc, c� m閠 s� c dc l� d飊g h祅g tr╩ lo筰 c v藅 m� luy謓 ch�, lo筰 c b� truy襫 n祔, ch� c莕 ch筸 nh� m閠 ch髏 th玦, th� s� ch誸 kh玭g c� v誸 t輈h")
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

function L40_get_yes()
	Talk(1,"","Л頲 r錳! H穣 nh� l� ph秈 甶 t譵 m閠 mi課g 'x� hng' trc, n誹 kh玭g ngi s� kh玭g th� kh鑞g ch� 頲 r緉")
	SetTask(10,40*256+10)
	AddNote(" n Kim X� huy誸 tr筩h  b総 m閠 con Nh穘 K輓h vng M穘g X� cho V﹏ B蕋 T� ")
	Msg2Player(" n Kim X� huy誸 tr筩h  b総 m閠 con Nh穘 K輓h vng M穘g X� cho V﹏ B蕋 T� ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","Ngi l� m閠 trong s� nh鱪g ngi  v祇 trong Kim X� tr筩h m� c遪 s鑞g s鉻 tr� v�. Xem ra th� b秐 l躰h c馻 ngi qu� kh玭g t莔 thng ch髏 n祇")
	SetTask(10,50*256)
	DelItem(143)
	SetRank(53)
--	AddMagic(356)
--	AddMagic(73)
	add_wu(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g B筺!: Х 頲 th╪g l祄: V� фng La S竧! H鋍 頲 v� c玭g: Xuy猲 Y Ph� Gi竝, V筺 чc Th鵦 T﹎ ")
	AddNote("Ti課 v祇 Kim X� tr筩h b総 頲 Nh穘 K輓h vng M穘g X�, 頲 th╪g l� V�  La S竧 ")
end;

function Uworld_envelop()
	AddEventItem(385)
	SetTask(124,20)
	Msg2Player("Ti誴 nh薾 th� t輓 c馻 V﹏ B蕋 T�. ")
	AddNote("Ti誴 nh薾 th� t輓 c馻 V﹏ B蕋 T�, 甶 t譵 Л阯g D�. ")
end

function Uworld124_jump()
	SetFightState(1)
	NewWorld(234,1616,3195)
end
