---中原南区\武当派\武当派\npc\wdnpc06.lua
--description: 武当派周云泉　武当40级任务
--author: yuanlan	
--date: 2003/5/15
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-17)
-- updage by xiaoyang(2004\4\15) 武当90级任务
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

function main()
	

	local szTitleMsg = "<npc>G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�."
	local tbOpt = 
	{
		{"Nhi謒 v� k� n╪g c蕄 150", dailog150skill},
		{"Mu鑞 th豱h gi竜 vi謈 kh竎", org_dailog}
	}

	CreateNewSayEx(szTitleMsg, tbOpt)
end

function org_dailog()
	UTask_wd = GetTask(5)
	Uworld129 = GetTask(129)
	if((UTask_wd == 40*256) and (GetLevel() >= 40) and (GetFaction() == "wudang")) then
		Say("Ngi c� th� gi髉 ta kh玭g? Chng m玭 mu鑞 ta 甧m <color=Red>1 l� th�<color> n <color=Red>K� Qu竛 ng<color> a cho <color=Red>Nhu薾 Nng<color>, t nhi猲 ta 產ng c� chuy謓 g蕄, ngi thay ta a th� 頲 kh玭g?", 2, "Kh玭g th祅h v蕁 !/L40_get_yes", "Xin l鏸, ta c遪 c� vi謈 kh竎 /L40_get_no")
	elseif (UTask_wd >= 40*256+20) and (UTask_wd <= 40*256+40) and (HaveItem(163) == 0) then		-- 道具丢了
		AddEventItem(163)
		Talk(1,"","Ngi th藅 l� m穘g! Th� c馻 chng m玭  kh玭g c莔 c遪 mu鑞 ch箉 n鱝?")
	elseif (UTask_wd == 40*256+60) and (HaveItem(164) == 1) then					--有润娘的回信
		Talk(2, "", "Chu s� huynh! Ta  gi髉 huynh a th� r錳, y l� th� h錳 ﹎ c馻 Nhu薾 Nng!", "V蕋 v� cho ngi qu�!  giao l� th� h錳 ﹎ n祔 cho Chng m玭 甶! Chng m玭 � trong T� Ti猽 甶謓.")
		Msg2Player("V� t韎 n骾 V� ng t譵 Chu V﹏ Tuy襫, bi誸 頲 n猲 giao th� cho chng m玭. ")
		AddNote("V� t韎 n骾 V� ng t譵 Chu V﹏ Tuy襫, bi誸 頲 n猲 giao th� cho chng m玭 ")
		SetTask(5,40*256+80)
	elseif (UTask_wd == 40*256+80) and (HaveItem(164) == 0) then			-- 道具丢了
		AddEventItem(164)
		Talk(1,"","Ngi  qu猲 th� � ch� ta r錳!")
	elseif (Uworld129 == 10) then
		Talk(12,"Uworld129_admit","Чo huynh l� m閠 trong 6 v� h祇 ki謙 V� ng! T筰 h�  nghe danh t� l﹗, h玬 nay m韎 頲 l猲 n骾 th豱h gi竜.","T鑤!.Chu m�  l﹗ ch璦 c� i th� th鵦 th�, ch﹏ tay ng鴄 ng竬 l緈 r錳!"," V� ng o gia ti猲 hng, ti觰 t� kh玭g d竚 qua m苩. L祄 sao ta d竚 t� u nh� v藋?","Ta v鑞 kh玭g th輈h ch蘮 衟 k� kh竎, C竎 h� l莕 u l猲 V� ng, c竎h t� th� do ngi quy誸 nh."," V� h鋍 nh蕋 o l璾 truy襫 n ng祔 nay, t� c� c� c竎 ph莕 n閕 ngo筰 gia. Xin h醝 n猲 xem tr鋘g lo筰 n祇?","N閕 gia luy謓 kh�, ngo筰 gia luy謓 th﹏. Kh玭g c� th﹏ th� t鑤 th� l祄 sao nh th莕? Do  n猲 xem tr鋘g ngo筰 gia."," Kh玭g ph秈! Thi猲 a v筺 v藅, t筼 h鉧 s� nhi猲. N誹 l蕐 t﹎ ng� kh�, l蕐 kh� quan t鴆, t鴆 th玭g t� nhi猲 m韎 tu luy謓 頲 ch輓h o.","T﹎ g�? Kh� g�? N誹 m閠 ngi c� 3, 5 b謓h, h祅g ng祔 n玭 m鯽 ra m竨, th� c竔 g� g鋓 l� thi猲 a."," V� c玭g m筺h nh蕋 bi觰 hi謓 � b猲 ngo礽. Nh璶g.....","Л頲 r錳! Ta c穒 kh玭g l筰 ngi. N誹 mu鑞 ch鴑g minh nh鱪g th� n祔, hay l� ngi 甶 t譵 S�  L� Thi猲 M鬰 c馻 ta!"," Xin Chu i hi謕 th� l鏸"," mau! Ngi l祄 ta ch辵 h誸 n鎖 r錳!")
   elseif(Uworld129 == 30)then
   	Talk(6,"Uworld129_admit2","B籲g h鱱! Mau qua y!","Chu huynh c� g� ch� gi竜?","�! Cho ngi xem th� n祔!",".....Th� nh�? Ch骳 m鮪g Chu huynh!","Ha ha! Cha m� � nh� i ta, ta ph秈 l藀 t鴆 xu鑞g n骾! Nh� B籲g h鱱 chuy觧 l阨 cho S� huynh  ta gi飉."," � i l蕐 ch� hi誹 l祄 u! Chu huynh y猲 t﹎!")
   elseif (Uworld129 > 10) and (Uworld129 < 60)then
   	Talk(1,"","V� ng gi� v� tr� quan tr鋘g c馻 v� l﹎ Trung Nguy猲, n V� ng b祅 lu薾 v� v� c玭g l� ngi t譵 ng ch� r錳.")
	elseif (UTask_wd == 40*256+20) then
		Talk(1,"","<color=Red>Nhu薾 Nng<color> � trong <color=Red>K� Qu竛 ng<color>.")
	elseif (UTask_wd > 40*256+20) and (UTask_wd < 40*256+80) then					--已经接到40级任务，尚未完成
		Talk(1,"","G苝 Nhu薾 Nng ch璦? M鋓 vi謈 th� n祇?")
	elseif (UTask_wd >= 50*256) and (GetFaction() == "wudang") then					--已经完成40级任务，尚未出师
		Talk(1,""," o竛 gi鱝 S� ph� v� Nhu薾 Nng, ta c� nghe qua, ch� v� S� ph� h譶h nh� kh玭g mu鑞 nh綾 n, ch髇g ta l祄  t� c騨g kh玭g n猲 h醝 nhi襲 qu�.")
	elseif (UTask_wd >= 70*256) then							--已经出师
		Talk(1,"","Ch髇g ta 頲 l祄 ng m玭, t鴆 l� c� duy猲, ngi h鱱 duy猲 sau n祔 s� g苝 l筰, xin h穣 b秓 tr鋘g! ")
	else
		dailog150skill()
	end
end

function dailog150skill()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc>Ta lu玭 t� khuy猲 m譶h t筰 V� ng S琻 ch╩ ch� luy謓 v� c玭g, 甧m t蕋 c� tinh l鵦 a v祇 tu luy謓 v� h鋍, t� trc n gi� kh玭g c� ngh� n vi謈 l蕐 v� sinh con, cho n b﹜ gi� th�  qua c竔 th阨 xu﹏ 蕐 r錳, trong l遪g c騨g c� ch髏 u s莡."
	G_TASK:OnMessage("Th髖 Y猲", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L40_get_yes()
	Talk(1,""," t�! <color=Red>Nhu薾 Nng<color> � trong <color=Red>K� Qu竛 ng<color>, h穣 mang b鴆 th� n祔 甶!")
	Msg2Player("Л頲 chng m玭 giao l� th�  a cho Nhu薾 Nng. ")
	AddEventItem(163)
	SetTask(5, 40*256+20)
	AddNote("T筰 b� h� Thanh Thu� g苝 Chu V﹏ Tuy襫, nh薾 nhi謒 v� Nhu薾 Nng, n ng K� Qu竛 Ph鬰 Ng璾 s琻 a th� cho m閠 ngi g鋓 l� Nhu薾 Nng. ")
	Msg2Player("T筰 b� h� Thanh Thu� g苝 Chu V﹏ Tuy襫, nh薾 nhi謒 v� Nhu薾 Nng, n ng K� Qu竛 Ph鬰 Ng璾 s琻 a th� cho m閠 ngi g鋓 l� Nhu薾 Nng. ")
end;

function L40_get_no()
	Say("V藋 ta t譵 ngi kh竎 gi髉. ")
end;

function Uworld129_admit()
	SetTask(129,20)  --设置任务变量20
	Msg2Player("Sau khi n鉯 chuy謓 v韎 Chu V﹏ Tuy襫, quay l筰 t譵 L� Thi猲 M鬰. ")
	AddNote("Sau khi n鉯 chuy謓 v韎 Chu V﹏ Tuy襫, quay l筰 t譵 L� Thi猲 M鬰. ")
end

function Uworld129_admit2()
	SetTask(129,40)
	Msg2Player("Sau khi n鉯 chuy謓 v韎 Chu V﹏ Tuy襫, quay l筰 t譵 L� Thi猲 M鬰. ")
	AddNote("Chu V﹏ Tuy襫 nh薾 th� gia nh, ngi vui m鮪g cho h緉, p 鴑g thay h緉 n鉯 v韎 L� Thi猲 M鬰. ")
end
