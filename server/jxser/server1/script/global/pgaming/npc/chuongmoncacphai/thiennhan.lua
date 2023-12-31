--description: 天忍教教主完颜宏烈　天忍教出师任务、重返门派任务
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-14)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关
-- Update：Dan_Deng(2003-10-27)为重返师门任务加入取消任务功能，以及与新门派对应

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师
--dinhhq: new lunar year 2011
Include("\\script\\vng_event\\LunarYear2011\\npc\\mastergift.lua")

function main()
	if tbVNG_LY2011:isActive() == 1 then
		local tbSay = 
			{
				"T苙g b竛h ng祔 xu﹏/#tbMasterGift:getGift('tianren')",
				"Mu鑞 th豱h gi竜 vi謈 kh竎/oldMain"
			}
		Say("N╩ m韎 an khang th辬h vng", getn(tbSay), tbSay)
		return
	end
	oldMain()
end
function oldMain()
	if (vt06_isactive() ~= 0) then
		Say("T譵 ta c� vi謈 g�?", 2, "Mu鑞 th豱h gi竜 i s�!/oldentence", "M鮪g l�  S�, t筰 h�  t譵  揟h�  S瓟 v� 揟h� Cao у�./vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 7) then
		Describe("T譵 ta c� vi謈 g�?", 2,
			"H鋍 k� n╪g c蕄 120./lvl120skill_learn",
			"Mu鑞 th豱h gi竜 vi謈 kh竎/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_tr = GetTask(4);
	local nFactID = GetLastFactionNumber();

	if (UTask_tr == 70*256) and (GetFaction() == "tianren") then			-- 回师错误修正
		SetFaction("")
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_tr == 70*256) and (GetTask(8) >= 5*256) and (GetTask(8) < 10*256) then		-- 以前接过入门任务的
		SetTask(8,0)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_tr == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(4,70*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_tr == 80*256 and nFactID == 7 and GetCamp() == 2 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tianren");
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	elseif (UTask_tr == 70*256 and nFactID == 7 and GetCamp() ~= 4 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	end

	local tbDes = {"Цi ngh� u s�/#daiyitoushi_main(7)", "Mu鑞 th豱h gi竜 vi謈 kh竎/common_talk"};
	
	Say("G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tr = GetTask(4);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),4) == 0) then				-- 世界任务：武林向背
		Talk(1,"","чc C� Ki誱 b� m蕋 tr� �? B鎛 gi竜 v鑞 l� Чi Kim qu鑓 gi竜, чc C� Ki誱 ph竔 ngi n h醝 l穙 phu chuy謓 n祔. Л頲! Ngi n鉯 l筰 v韎 чc C� Ki誱 r籲g: C竎 ngi ch� l� l� qu﹏ � h頿, d竚 ch鑞g v韎 i qu﹏ h飊g m筺h c馻 Чi Kim, h穣 lo chuy謓 h藆 s� trc r錳 h穣 n鉯! Ha ha ha!")
		Uworld40 = SetBit(GetTask(40),4,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 60*256) and (GetLevel() >= 50) then		-- 出师任务启动
			Say("Th竛h th� c馻 b鎛 gi竜 l� cu鑞 s竎h ghi r� v� qu鑓 gi竜 c馻 Чi Kim-- <color=Red>cu鑞 s竎h da d�<color> c馻 T竧 M穘 Gi竜 Kinh V╪, cu鑞 s竎h n祔 頲 Gi竜 ch� c蕋 gi蕌 t筰 <color=Red>Th竛h чng<color>, nghe n鉯 ai v祇 Th竛h чng s� kh玭g c� 阯g v�. Ngi v鑞 l� H� Gi竜 Ph竝 Vng c馻 b鎛 gi竜, c� d竚 v祇 Th竛h чng l蕐 cu鑞 s竎h  kh玭g?", 2, "Thu閏 h� t薾 l鵦 thi h祅h /L60_get_yes", "Thu閏 h� e r籲g kh玭g m nhi謒 n鎖/L60_get_no")
		elseif (UTask_tr == 60*256+20) and (HaveItem(127) == 1 and HaveItem(128) == 1 and HaveItem(129) == 1 and HaveItem(130) == 1 and HaveItem(131) == 1) then 
			DelItem(127)
			DelItem(128)
			DelItem(129)
			DelItem(130)
			DelItem(131)
			SetTask(28,0)		-- 将子变量复位，圣洞中再继续使用
			SetTask(4,60*256+50)		-- 拿齐五把断剑后先找完颜洪烈才能进圣洞，简化程序处理。
			AddNote("Sau khi t譵  n╩ Thanh 畂秐 ki誱, quay l筰 Thi猲 Nh蒼 Gi竜, 頲 ph衟 v祇 Th竛h чng. ")
			Msg2Player("B筺  頲 ph衟 v祇 Th竛h чng ")
			Talk(1,"","R蕋 t鑤! b﹜ gi� ngi c� th� v祇 Th竛h чng l蕐 cu鑞 s竎h da d� mang v� y.")
		elseif (UTask_tr == 60*256+70) and (HaveItem(132) == 1) then		-- 出师任务完成
			Talk(2, "L60_prise", "Зy qu� nhi猲 l� Th竛h th� c馻 b鎛 gi竜! T鑤! T鑤! L穙 phu  kh玭g nh譶 l莔 ngi, v韎 tr譶h  v� c玭g c騨g nh� l遪g cam m c馻 ngi hi謓 gi�, c� ng祔 s� l祄 n猲 nh鱪g chuy謓 kinh thi猲 ng a! Hy v鋘g sau khi ngi xu蕋 s�, s� kh玭g tr� th祅h k� th� c馻 l穙 phu! Ha ha ha!", "Ch骳 m鮪g b筺 c� th� xu蕋 s�! B筺 頲 phong l� T竧 M穘 Ph竝 S� c馻 Thi猲 Nh蒼 gi竜, t� nay v� sau c� th� t� do h祅h t萿 giang h�! Hy v鋘g b筺 s� ph竧 huy n╪g l鵦, ph竧 tri觧 ti襫 !")
		elseif (UTask_tr == 80*256) then						-- 重返后的自由出入
			check_skill()
		elseif (UTask_tr > 60*256) and (UTask_tr < 60*256+50) then					--已经接到出师任务，尚未拿到五把断剑
			Talk(1,"","Trc khi v祇 <color=Red>Th竛h чng<color> l蕐 <color=Red>cu鑞 s竎h da d�<color>, ngi ph秈 n <color=Red>Bi謓 Kinh<color> t譵 <color=Red>n╩ thanh 畂秐 ki誱<color> 產ng l璾 l筩.")
		elseif (UTask_tr >= 60*256+50) and (UTask_tr <= 60*256+70) then					--已经接到出师任务，尚未拿到羊皮书
			Talk(1,"","<color=Red>cu鑞 s竎h da d�<color> � ph輆 sau trong <color=Red>Th竛h чng<color>.")
		else
			Talk(1,"","X璦 nay, quy襫 cao ch鴆 tr鋘g lu玭 h蕄 d蒼 m鋓 ngi, n╩ x璦 Th竛h Thng tuy r蕋 ﹏ s駈g ta, nh璶g v蒼 c� l遪g  k�, n誹 kh玭g sao l筰 ph竔 Th蕋 c玭g ch骯 n b鎛 gi竜 l祄 m閠 Л阯g ch� nh� nhoi n祔? ! L穙 phu kh玭g h� h� th裯 lng t﹎, nh璶g c騨g kh玭g qu秐 n鎖 nh鱪g l阨 ph� b竛g d蘭 pha!")
		end
--	elseif (GetTask(8) == 5*256+10) then		-- 转门派到丐帮
--		Say("完颜洪烈：丐帮与本帮誓不两立，你竟想背弃本教改投丐帮？小心我废了你的功夫！",2,"对不起，但吾意已决/defection_yes","我还是不去了/defection_no")
	elseif (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tr == 70*256) and (GetTask(8) < 5*256) then		-- 重返师门任务
		Talk(1,"return_sele","Th璦 Gi竜 ch�, nh鱪g ngi xu蕋 s� r錳 c� th� quay tr� l筰 m玭 ph竔 ti誴 t鬰 ph鬾g s� kh玭g?")
	elseif (GetCamp() == 4) and ((UTask_tr == 70*256+10) or (UTask_tr == 70*256+20)) then		-- 重返师门任务中
		Say("Х chu萵 b�  5 v筺 lng ch璦?",2,"Х chu萵 b� xong/return_complete","V蒼 ch璦 chu萵 b� xong/return_uncompleted")
	elseif (UTask_tr >= 70*256) then							--已经出师
		Talk(1,"","Th藅 l� h藆 sinh kh� 髖! V韎 tr譶h  v� c玭g c騨g nh� l遪g cam m c馻 ngi, s� c� ng祔 l祄 n猲 nh鱪g chuy謓 kinh thi猲 ng a! Hy v鋘g sau khi ngi xu蕋 s�, s� kh玭g tr� th祅h k� th� c馻 l穙 phu!")
	else
		Talk(1,"","Ch� c莕 nh鱪g ai c� t礽, th藅 l遪g mu鑞 gia nh藀 b鎛 gi竜, b鎛 gi竜 s絥 s祅g hoan ngh猲h.")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
--	if (HaveMagic(150) == -1) then
--		AddMagic(142)
--		AddMagic(148)
--		AddMagic(150)
--		AddNote("你学会了镇派绝学天魔解体、武功偷天换日、魔焰七杀。")
--		Msg2Player("你学会了镇派绝学天魔解体、武功偷天换日、魔焰七杀。")
--		Say("完颜宏烈：为师这次闭关苦思数日，改进了本门武功，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
		Say("Ngi c� mu鑞 甶 Nam tri襲 th╩ d� t譶h h譶h?",2,"Л頲, thu閏 h� c騨g 產ng mu鑞 th﹎ nh藀 giang h� m閠 phen. /goff_yes","Thu閏 h� t� th蕐 luy謓 t藀 ch璦  /no")
--	end
end

----------------------- 重返门派相关 --------------------
function goff_yes()
	Talk(1,"","T鑤! Nh� ng sa v祇 nh鱪g c竚 d� c馻 Nam tri襲. ")
	SetTask(4,70*256)
	AddNote("R阨 kh醝 Thi猲 Nh蒼 Gi竜, ti誴 t鬰 h祅h t萿 giang h�. ")
	Msg2Player("Ban r阨 kh醝 Thi猲 Nh蒼 Gi竜, ti誴 t鬰 h祅h t萿 giang h�. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- 转派，收回原门派武功技能
-- 刷掉技能
	n = 0
	i=135; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 残阳如血
	i=131; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天忍刀法
	i=132; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天忍矛法
	i=134; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天忍锤法
	i=136; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 火莲焚华
	i=137; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 幻影飞狐
	i=138; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 推山填海
	i=139; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 浑水摸鱼
	i=140; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 飞鸿无迹
	i=141; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 烈水睛天
	i=142; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 偷天换日
	i=143; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 厉魔夺魂
	i=145; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 弹指烈焰
	i=146; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 五行阵
	i=147; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 玄冥吸星
	i=148; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 七杀神拳
	i=149; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 蚀骨血刃
	i=150; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 天魔解体
	i=254; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 三味真火
	AddMagicPoint(n)
-- 刷完技能后继续转门派流程
	SetTask(8,5*256+20)
	SetTask(4,75*256)				-- 为原门派作个标记
	SetRank(71)
	if (GetRepute() < 200) then
		Msg2Player("V� h祅h vi b蕋 trung v韎 m玭 ph竔, danh v鋘g c馻 b筺 gi秏 xu鑞g "..GetRepute().."甶觤!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V� h祅h vi b蕋 trung v韎 m玭 ph竔, danh v鋘g c馻 b筺 gi秏 xu鑞g 200 甶觤! ")
		AddRepute(-200)
	end
	AddNote("Sau khi b� 甶 c竎 k� n╪g v� danh hi謚 trng l穙 c馻 Thi猲 Nh蒼 Gi竜, B﹜ gi� b筺 c� th� gia nh藀 C竔 Bang. ")
	Msg2Player("Sau khi b� 甶 c竎 k� n╪g v� danh hi謚 trng l穙 c馻 Thi猲 Nh蒼 Gi竜, B﹜ gi� b筺 c� th� gia nh藀 C竔 Bang. ")
	Talk(1,"KickOutSelf","Х th�, h穣 ph� b� v� c玭g, ngi th輈h th� n祇 s� nh� th� . ")
end

function defection_no()
	AddNote("B筺 t� b� � nh gia nh藀 C竔 Bang. ")
	Msg2Player("B筺 t� b� � nh gia nh藀 C竔 Bang. ")
	SetTask(8,1*256)			-- 为企图叛师做个标记，以备将来不时之需
end

function return_sele()
	Say("Ngi n鉯 mu鑞 quay l筰 b鎛 gi竜 �?",2,"Tu﹏ l謓h!/return_yes","Kh玭g. /return_no")
end;

function return_yes()
	Talk(2,"","в nh� n qu� tr譶h ph竧 tri觧 t� gian kh� c馻 b鎛 gi竜, b鎛 gi竜 quy nh nh鱪g  t� ngao du giang h� nh� ngi mu鑞 quay tr� l筰 ph秈 giao n閜 50000 lng. ","V﹏g,  t�  甧m 5 v筺 lng n.")
	SetTask(4,70*256+20)
	AddNote("Giao n閜 5 v筺 lng  quay l筰 Thi猲 Nh蒼 Gi竜. ")
	Msg2Player("Giao n閜 5 v筺 lng  quay l筰 Thi猲 Nh蒼 Gi竜. ")
end;

function return_no()
	Talk(1,"","Sau n祔 s� quay v� ph鬰 v� b鎛 gi竜, c遪 b﹜ gi� v蒼 c遪 chuy謓 t筰 h� ch璦 l祄 xong. ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","R蕋 t鑤! Ngi  tr� th祅h K� danh  t� c馻 b鎛 gi竜. Ta s�  c� ngi v韎 Th竛h Gi竜 Trng L穙 c馻 b鎛 gi竜, ng l祄 ta th蕋 v鋘g.")
		Pay(50000)
		SetFaction("tianren")	
		SetCamp(2)
		SetCurCamp(2)
		SetRank(81)
		SetTask(4, 80*256)
--		if (HaveMagic(150) == -1) then
--			AddMagic(142)
--			AddMagic(148)
--			AddMagic(150)
		add_tr(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("B筺  h鋍 頲 tr蕁 ph竔 tuy謙 h鋍: Thi猲 Ma Gi秈 Th�, Du Thi猲 Ho竛 Nh藅, Ma Di謒 Th蕋 S竧. ")
--		end
		AddNote("Quay tr� l筰 Thi猲 Nh蒼 Gi竜, l筰 ng v祇 h祅g ng�. ")
		Msg2Player(GetName().."Quay tr� l筰 Thi猲 Nh蒼 Gi竜, 頲 phong l祄 Th竛h Gi竜 trng l穙. ")
	else
		Talk(2,"","Sao? Ngi ch� 甧m bao nhi猽 ng﹏ lng th玦 sao?","Xin l鏸! в ta ki觤 tra l筰.")
	end
end;

function return_uncompleted()
	Talk(1,"","�, nhanh l猲!")
end;

----------------------- 出师任务 ------------------------
function L60_get_yes()
	Talk(1,"","L穙 phu qu� kh玭g nh譶 l莔 ngi, ngi qu� c� l遪g can m! Nh璶g trc khi v祇 Th竛h ng, ph秈 t譵 頲 <color=Red>5 thanh 畂秐 ki誱<color> l璾 l筩 � <color=Red>Bi謓 Kinh<color> cho ta.")
	SetTask(4, 60*256+20)
	AddNote("G苝 Gi竜 ch� Ho祅 Nhan H飊g Li謙, ti誴 nh薾 nhi謒 v� xu蕋 s�. Trc ti猲 ph秈 甶 Bi謓 Kinh t譵 5 thanh 畂秐 ki誱. ")
	Msg2Player("G苝 Gi竜 ch� Ho祅 Nhan H飊g Li謙, ti誴 nh薾 nhi謒 v� xu蕋 s�. Trc ti猲 ph秈 甶 Bi謓 Kinh t譵 5 thanh 畂秐 ki誱. ")
end;

function L60_get_no()
	Talk(1,""," L� n祇 ngi kh玭g ch� tr鋘g h� danh sao?")
end;

function L60_prise()
	DelItem(132)
--	AddGlobalCountNews(GetName().."艺成出师，告别各位教友南下江湖。", 1)
	Msg2SubWorld("T輓  Thi猲 Nh蒼 Gi竜 "..GetName().."Xu蕋 s� th祅h c玭g, c竜 bi謙 ch� v� gi竜 h鱱 tr� v� phng Nam. ")
	SetRank(71)
	SetTask(28,0)		-- 将子变量复位
	SetTask(4, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Quay l筰 Thi猲 Nh蒼 Чi nh, a quy觧 s竎h da d� cho Ho祅 Nhan H飊g Li謙, ho祅 th祅h nhi謒 v� xu蕋 s�. Th╪g c蕄 T竧 M穘 Ph竝 S�. ")
	Msg2Player("Ch骳 m鮪g B筺! Xu蕋 s� th祅h c玭g! Л頲 phong l� T竧 M穘 Ph竝 S�! Danh v鋘g t╪g th猰 120 甶觤! ")
	AddRepute(120)
end;

function no()
end
