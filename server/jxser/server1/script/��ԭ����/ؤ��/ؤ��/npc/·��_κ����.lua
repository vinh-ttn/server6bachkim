-- 丐帮 传功长老魏了翁 40级任务
-- by：Dan_Deng(2003-07-28)

Include("\\script\\global\\skills_table.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	UTask_gb = GetTask(8)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 40*256+30) then		--40级任务完成
			Talk(2,"L40_prise","е t� t鮪g g苝 Trng i nh﹏ v�  a m藅 h祄 cho 玭g ta.","V藋 th� ta y猲 t﹎! Ngi th藅 v蕋 v�! Chuy謓 n祔 ta s� b萴 r� v韎 Bang ch�, phong ngi l祄 i  t� c蕄 40 c馻.")
		elseif (UTask_gb == 40*256+10) then		--40级任务中
			if (HaveItem(236) == 1) then
				Talk(4,"","Ng魕 trng l穙! Ta  gi謙 tr� s竧 th� Kim Qu鑓, y l� m藅 h祄 l蕐 頲 tr猲 ngi ch髇g.","Лa ta xem.....","�! Trong b鴆 m藅 h祄 n祔 c� vi誸 t猲 t蕋 c� nh鱪g m玭 ph竔 v� t蕋 c� nh鱪g ngi trong tri襲 nh c蕌 k誸 v韎 Kim qu鑓. Ph秈 giao b鴆 m藅 h祄 n祔 cho Trng Tu蕁 i nh﹏, b秓 玭g 蕐 ph秈 h誸 s鴆  ph遪g.","Ngi ph秈 nhanh ch鉵g 甶 Dng Ch﹗ m閠 chuy課!. Trng i nh﹏ hi謓 產ng � l� qu竛'H閕 h鱱'. Ngi ph秈 giao t薾 tay b鴆 m藅 h祄 n祔 cho 玭g 蕐!")
				SetTask(8,40*256+20)
				AddNote("Mang m藅 h祄 甶 giao cho Trng Tu蕁 ")
				Msg2Player("Mang m藅 h祄 甶 giao cho Trng Tu蕁 ")
			else
				Talk(1,"","Th阨 gian c蕄 b竎h! Ph秈 l藀 t鴆 ti評 tr� ngay nh鱪g chng ng筰 trc m総 Trng i nh﹏! ")
			end
		elseif ((UTask_gb == 40*256) and (GetLevel() >= 40)) then		--40级任务启动
			Say("Theo tin th竚 b竜 c馻  t� � L﹎ An a v�: ph竔 ch� h遖 trong tri襲 nh  li猲 k誸 v韎 b鋘 s竧 th� ngi Kim. Ch髇g ﹎ m璾 s� 竚 s竧 Khu M藅 s� Trng Tu蕁. Trc khi Trng i nh﹏ v� n L﹎ An, ch髇g ta ph秈 gi誸 s筩h b鋘 s竧 th� ",2,"Xin h穣 giao cho  t�. /L40_get_yes","е t� c玭g l鵦 c遪 y誹, e kh玭g 琻g n鎖 tr鋘g nhi謒 /L40_get_no")
		elseif (UTask_gb == 40*256+20) and (HaveItem(236) == 0) then		-- 任务中物品丢失处理
			AddEventItem(236)
			Talk(1,"","Chuy謓 n祔 nh蕋 nh蕋 u kh玭g 頲 sai s鉻. B鴆 m藅 h祄 n祔 ngi nh� ph秈 lu玭 mang theo b猲 ngi!")
		else
			Skill150Dialog("N誹 nh� Чi H� nghi猲g , C竔 bang ta m閠 c﹜ kh� ch鑞g, ch� c� th� c骳 cung t薾 tu� gi鑞g nh� Gia C竧 Kh鎛g Minh, th� ch誸 kh玭g t�.")
		end
	else
		Skill150Dialog("Ngi ma ta ngng m� nh蕋 l� Gia C竧 Kh鎛g Minh, n ph髏 cu鑙 v蒼 trung th祅h!")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("C竔 Bang", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end


function L40_get_yes()
	Talk(1,"","Ngi n猲 c萵 th薾! ")
	SetTask(8,40*256+10)
	AddNote("Nh薾 nhi謒 v�: Gi誸 b鋘 s竧 th� ngi Kim, b秓 v� an to祅 cho Trng Tu蕁 ")
	Msg2Player("Nh薾 nhi謒 v�: Gi誸 b鋘 s竧 th� ngi Kim, b秓 v� an to祅 cho Trng Tu蕁 ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(3,""," t� Ng魕 trng l穙! ")
	SetTask(8,50*256)
	SetRank(41)
--	AddMagic(277)
	add_gb(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g B筺! Х 頲 th╪g l�: C竔 Bang Long u  t� 頲 h鋍 Ho箃 B蕋 L璾 Th� ")
	AddNote("B秓 v� an to祅 cho Trng Tu蕁, ho祅 th祅h nhi謒 v� c蕄 40, 頲 th╪g Long u  t� ")
end;
