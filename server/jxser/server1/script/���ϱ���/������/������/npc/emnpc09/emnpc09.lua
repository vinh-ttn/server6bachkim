--description: 峨嵋派穆云慈 
--author: yuanlan	
--date: 2003/3/5
--update: Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 30*256+50) then				-- 30级任务中
			if (HaveItem(120) == 1) then		-- 任务完成
				L30_prise()
			else
				Talk(1,"","Phi襫 mu閕 n<color=Red>b� h� � h藆 s琻<color>t譵 xem. <color=Red>H醓 h�<color>th輈h ╪<color=Red>i g�<color>nh蕋.H穣 d飊g i g�  d� n� tr� v�, n誹 kh玭g n� s� kh玭g 甶 v韎 k� l� m苩 u.")
			end
		elseif (UTask_em == 30*256) and (GetLevel() >= 30) then		-- 30级任务启动
			Say("<color=Red>H醓 h�<color> c馻 ta kh玭g th蕐 n鱝, mu閕 c� th� gi髉 ta t譵 kh玭g?", 2, "T譵 gi髉 /L30_get_yes", "Kh玭g c遪 th阨 gian n鱝 /L30_get_no")
		elseif (UTask_em >= 40*256) then   							--已经完成30级任务，尚未出师
			Skill150Dialog("Ti觰 s� mu閕, c竚 琻 mu閕 gi髉 ta!")
		else
			Skill150Dialog("H醓 H� u, H醓 H� ngi � u, ngi ch箉 u r錳 h�? Nhanh ra y mau!")
		end
	elseif (UTask_em == 70*256) then								--已经出师
		Skill150Dialog("Ti觰 s� mu閕 ph秈 h� s琻 �? Ta v� h醓 h� s� r蕋 nh� mu閕.")
	else
		Skill150Dialog("H醓 H� c馻 ta  th玭g linh r錳, kh玭g th� n祇 l� ngi b蕋 lng 頲.")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("Nga Mi", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L30_get_yes()
	Talk(1,"","T鑤 l緈! Phi襫 mu閕 n <color=Red>b� h� � h藆 s琻<color> t譵 xem. H醓 h� th輈h ╪ <color=Red>i g�<color>. H穣 d飊g i g�  d� n� tr� v�, n誹 kh玭g n� s� kh玭g 甶 v韎 k� l� m苩 u.")
	SetTask(1, 30*256+50)
	AddNote("� g莕 h藆 阯g Nga Mi ph竔 (242, 305) g苝 M鬰 V﹏ T�, nh薾 <color=red>nhi謒 v� Ho� H�<color>, 甶 n ph竔 sau n骾 Ng筩 Ng� t譵 Ho� H�. ")
	Msg2Player("Ti誴 nh薾 nhi謒 v� Ho� H� c馻 M鬰 V﹏ T�, 甶 n ph輆 sau n骾 Ng筩 Ng� t譵 Ho� H�. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","H醓 h� �! Mu閕 th藅 l�  tinh ranh, l莕 sau kh玭g  ngi ch箉 lung tung n鱝! C秏 琻 mu閕  gi髉 ta!")
	DelItem(120)
	SetRank(16)
	SetTask(1, 40*256)
--	AddMagic(385)
--	AddMagic(82)
--	AddMagic(89)
	add_em(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! Л頲 phong l�: B筩h Li猲 Ti猲 T� ")
	AddNote("Mang Ho� H� giao cho M鬰 V﹏ T�, ho祅 th祅h nhi謒 v� Ho� H�, 頲 phong l�: B筩h Li猲 Ti猲 T� ")
end;	
