--description: 峨嵋派妙如 
--author: yuanlan	
--date: 2003/3/4
--update: Dan_Deng(2003-07-22), 加入门派任务的等级要求
--update: Dan_Deng(2003-07-24), 加“重返门派”任务
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1);
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 20*256) and (GetLevel() >= 20) then		--接到20级任务
			Say("G莕 y � <color=Red>H藆 s琻 s琻 ng<color> thng c� <color=Red>M穘h H�<color> xu蕋 hi謓, h筰 ch誸 v� s� b� t竛h l猲 n骾 d﹏g hng. Ta th﹏ l�  t� Ph藅 m玭 sao co th� m総 l蕄 tai ng� nh譶 M穘h H� s竧 h筰 d﹏ l祅h? Mu閕 c� th� 甶 thu ph鬰 h� d� kh玭g?", 2, "уng �!/L20_get_yes", "L鵦 b蕋 t遪g t﹎ /L20_get_no")
		elseif (UTask_em == 20*256+80) then										--20级任务过程中
			L20_prise()
		elseif (UTask_em == 20*256+50) then
			Talk(1,"","C莔 t芻 ti猲 c莔 vng! Mu閕 ch� c莕 thu ph鬰 頲 <color=Red>H� vng <color>. Nh鱪g con h� c遪 l筰 s� kh玭g d竚 t竎 qu竔. H� v鑞 c鴑g u, mu閕 ph秈 thu ph鬰 n� <color=Red>3 l莕 <color>, n� m韎 bi誸 khu蕋 ph鬰 th藅 s�.")
		elseif (UTask_em >= 30*256) then   							--已经完成20级任务，尚未出师
			Skill150Dialog("Mu閕 c�  b秐 l躰h v祇 hang H� thu ph鬰 M穘h H�, th藅 x鴑g danh l�  t� Nga Mi!")
		else
			Skill150Dialog("V� h鋍 v� Ph藅 l� u c莕 ph秈 th蕌 r�, chuy謓 tr猲 i ch� c莕 c� l遪g 総 s� 頲 th祅h t鵸.")
		end
	elseif (UTask_em >= 70*256) then										--已经出师
		Skill150Dialog("Theo hu� c╪ c馻 mu閕, 総 s� c� th祅h t鵸, n l骳 mu閕 ph秈 r阨 xa t� mu閕 ta!")
	else
		Skill150Dialog("V� h鋍 v� Ph藅 l� u c莕 ph秈 th蕌 r�, chuy謓 tr猲 i ch� c莕 c� l遪g 総 s� 頲 th祅h t鵸.")
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

function L20_get_yes()
	Talk(1,"","C莔 t芻 ti猲 c莔 vng! Mu閕 ch� c莕 thu ph鬰 頲 <color=Red>H� vng <color>. Nh鱪g con h� c遪 l筰 s� kh玭g d竚 t竎 qu竔. H� v鑞 c鴑g u, mu閕 ph秈 thu ph鬰 n� <color=Red>3 l莕 <color>, n� m韎 bi誸 khu蕋 ph鬰 th藅 s�.")
	SetTask(1, 20*256+50)
	AddNote("G苝 ni c� Di謚 Nh� � Gi秐g Kinh 阯g (240, 308) , nh薾 <color=red>nhi謒 v� ph鬰 h�<color>, 甶 l猲 M穘h H� ng sau n骾 thu ph鬰 h� d�. ")
	Msg2Player("G苝 ni c� Di謚 Nh� � Gi秐g Kinh 阯g, nh薾 nhi謒 v� ph鬰 h�, 甶 l猲 M穘h H� ng sau n骾 thu ph鬰 h� d�. ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","Mu閕 c�  b秐 l躰h v祇 hang H� thu ph鬰 M穘h H�, th藅 x鴑g danh l�  t� Nga Mi!")
	SetRank(15)
	SetTask(1, 30*256)
--	AddMagic(93)
	add_em(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! Х 頲 th╪g l祄 C萴 Y Ni! H鋍 頲 T� H祅g Ph� ч. ")
	AddNote("Tr� v� gi秐g kinh 阯g c馻 Nga Mi ph竔, ph鬰 m謓h Di謚 Nh�, ho祅 th祅h nhi謒 v� thu ph鬰 m穘h h�, 頲 phong l�: C萴 Y Ni. ")
end;
