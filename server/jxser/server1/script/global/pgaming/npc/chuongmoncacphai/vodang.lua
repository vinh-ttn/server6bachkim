--description: 武当派道一真人　武当10级任务、40级任务、出师任务、重返门派任务
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关
-- 修改Dan_Deng的错误：QBJ
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
				"T苙g b竛h ng祔 xu﹏/#tbMasterGift:getGift('wudang')",
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
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 8) then
		Describe("T譵 ta c� vi謈 g�?", 2,
			"H鋍 k� n╪g c蕄 120./lvl120skill_learn",
			"Mu鑞 th豱h gi竜 vi謈 kh竎/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_wd = GetTask(5)
	local nFactID = GetLastFactionNumber();

	if (UTask_wd == 70*256) and (GetFaction() == "wudang") then			-- 回师错误修正
		SetFaction("")
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_wd == 70*256) and (GetTask(9) >= 5*256) and (GetTask(9) < 10*256) then		-- 以前接过入门任务的
		SetTask(9,0)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_wd == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(5,70*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_wd == 80*256 and nFactID == 8 and GetCamp() == 1 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("wudang");
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	elseif (UTask_wd == 70*256 and nFactID == 8 and GetCamp() ~= 4 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	end

	local tbDes = {"Цi ngh� u s�/#daiyitoushi_main(8)", "Mu鑞 th豱h gi竜 vi謈 kh竎/common_talk"};
	
	Say("G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_wd = GetTask(5)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),5) == 0) then				-- 世界任务：武林向背
		Talk(1,"","B﹜ gi� Minh ch� l蕐 danh ngh躠 ' Thi猲 h� i ngh躠'  m阨, V� ng ph竔 kh玭g th� kh玭g n. H穣 chuy觧 l阨 t韎 чc C� minh ch�: V� ng ph竔 tu﹏ theo s� s緋 x誴 c馻 Minh ch�.")
		Uworld40 = SetBit(GetTask(40),5,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 4) and (GetFaction() == "wudang") then
		if (UTask_wd == 60*256+20) and (HaveItem(69) == 1 and HaveItem(70) == 1 and HaveItem(71) == 1) then
			Talk(2, "L60_prise", "C� th� l祄 ngi lo cho c竔 lo c馻 thi猲 h�, l�  t 頲 m閠 ch� 'hi謕'. B﹜ gi� th阨 th� l鋋n l筩, b謓h d辌h, chi課 tranh, b筼 quy襫, nh﹏ d﹏ 產u kh� l莔 than, ngi c� th� l祄 thu薾 theo l遪g d﹏, 甧m v� ngh�  h鋍 t筼 ph骳 cho b� t竛h", "Ch骳 m鮪g b筺 th祅h ngh� xu蕋 s�! B筺 頲 phong l� Huy襫 V� Th莕 Th�, T� h玬 nay c� th� t� do h祅h hi謕 giang h�!C� th� ch鋘 gia nh藀 v祇 m玭 ph竔 kh竎 ti誴 t鬰 h鋍 ngh�, c騨g c� th� t� l藀 bang h閕 m� r閚g th� l鵦 giang h�, ho芻 l祄 c kh竎h h祅h oai phong l蒻 li謙! Giang h� ki誱 hi謕, tr阨 cao t r閚g, hy v鋘g b筺 s� ti誴 t鬰 ph竧 tri觧 ti襫  c馻 m譶h")
		elseif (UTask_wd == 60*256) and (GetLevel() >= 50) then					--出师任务
			Say("Tr猲 <color=Red>Th竔 T� Nham<color> c� <color=Red>3 c竔 B秓 rng <color>, m鏸 c竔 B秓 rng c� ni猰 l� b颽, n誹 ngi c� th� ho祅 th祅h nhi謒 v� ghi tr猲 l� b颽, th� c� th� m� B秓 rng l蕐 <color=Red>3 m鉵 b秓 v藅<color> mang v� y!", 2, "Ti誴 nh薾 nhi謒 v� /L60_get_yes", "T筸 th阨 kh玭g xu蕋 s� /L60_get_no")
		elseif ((UTask_wd == 40*256+60) or (UTask_wd == 40*256+80)) and (HaveItem(164) == 1) then		--40级任务完成
			Talk(3, "L40_prise", " S� ph�! е t� thay Chu s� huynh 甶 n骾 Ph鬰 Ng璾 m閠 chuy課,甧m th� giao cho Nhu薾 Nng, y l� th� tr� l阨 c馻 b� 蕐!", "Th� ra l� v藋.....vi謈 n祔 ngi kh玭g n猲 n鉯 lung tung, nh� ch璦?", " е t� hi觰 r�! ")
--		为计时器错误打补丁，变量值为35、未学武当剑法(151)的，也可以接10级任务（已取消）
--		elseif ((UTask_wd == 10*256) or (((UTask_wd == 35) or (UTask_wd >= 20*256)) and (HaveMagic(151) == -1))) and (GetLevel() >= 10) and (GetFaction() == "wudang") then
		elseif (UTask_wd == 10*256) and (GetLevel() >= 10) then
			Talk(1,"","е t� V� ng ph竔 ta u ph秈 h鋍 thu閏 <color=Red>'Чo c Kinh'<color>. Ngi h穣 n th豱h gi竜 <color=Red>Di謕 Ti誴 M�<color> s� th骳, h鋍 thu閏'Чo c Kinh'. Sau  quay l筰 l筰 t譵 ta")
			SetTask(5, 10*256+20)
			AddNote("T筰 T� Ti猽 i 甶謓 g苝 Чo Nh蕋 Ch﹏ Nh﹏, nh薾 nhi謒 v� Чo c kinh, t譵 Di謕 Ti誴 M� h鋍 Чo c kinh. ")
			Msg2Player("T筰 T� Ti猽 i 甶謓 g苝 Чo Nh蕋 Ch﹏ Nh﹏, nh薾 nhi謒 v� Чo c kinh, t譵 Di謕 Ti誴 M� h鋍 Чo c kinh. ")
		elseif (UTask_wd == 10*256+50) then					--10级任务
			Talk(1,"L10_Q1","Х thu閏 ch璦? Vi s� mu鑞 ki觤 tra ngi, nghe r� ch璦?")
		elseif (UTask_wd == 10*256+60)  then
			L10_Q2()
		elseif (UTask_wd == 10*256+70)  then
			L10_Q3()
		elseif (UTask_wd == 80*256) then						-- 重返后的自由出入（新加技能）
			check_skill()
		elseif (UTask_wd == 10*256+20) then
			Talk(1,"","е t� V� ng ph竔 ta u ph秈 h鋍 thu閏 <color=Red>'Чo c Kinh'<color>. Ngi h穣 n th豱h gi竜 <color=Red>Di謕 Ti誴 M�<color> s� th骳, h鋍 thu閏'Чo c Kinh'. Sau  quay l筰 l筰 t譵 ta")
		elseif (UTask_wd > 60*256) and (UTask_wd < 70*256) then					--尚未完成出师任务
			Talk(1,"","Ngi ph秈 m� 3 b秓 rng tr猲<color=Red>Th竔 T� Nham<color>ph輆 sau<color=Red>h藆 s琻<color>, l蕐 頲<color=Red>3 b� b秓 v藅<color>b猲 trong, m韎 c� th� xu蕋 s� 頲!")
		elseif (UTask_wd >= 50*256) and (GetFaction() == "wudang") then					--已经完成40级任务，尚未接到出师任务
			Talk(1,"","Chuy謓 c馻 Nhu薾 Nng kh玭g 頲 n鉯 lung tung, nh� ch璦?")
		else					--已经完成10级任务，尚未完成40级任务（缺省对话）
			Talk(1,"","L祄 ngi c� th� k誸 th祅h huynh  b籲g h鱱, u l� do duy猲 s� c�!")
		end
--	elseif (GetTask(9) == 5*256+10) then		-- 转门派到昆仑
--		Say("道一真人：昆仑派门风不正，况且为免疑虑，转门派的话我必须收回你所有本派武艺。你真的执意要入昆仑？",2,"不错，我意已决/defection_yes","那我还是不去了/defection_no")
	elseif (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_wd == 70*256) and (GetTask(9) < 5*256) then		-- 重返师门任务
		Talk(2,"return_select","H� s琻 trong nh鱪g ng祔 n祔, ngi c秏 th蕐 th� n祇?","Phi猽 b箃 giang h� nhi襲 ng祔 m韎 bi誸 v� c玭g c馻 m譶h th藅 t�.")
	elseif (GetCamp() == 4) and ((UTask_wd == 70*256+10) or (UTask_wd == 70*256+20)) then		-- 重返师门任务中
		Say("Chu萵 b�  5 v筺 lng ch璦?",2,"Х chu萵 b� xong/return_complete","V蒼 ch璦 chu萵 b� xong/return_uncompleted")
	elseif (UTask_wd >= 70*256) then							--已经出师
		Talk(1,"","Tuy ngi  xu蕋 s�, ta c騨g c� v礽 l阨 mu鑞 g鰅 g緈 c飊g ngi: V韎 ngi t藀 v�, Чo v� v鑞 r蕋 quan tr鋘g, c v� c騨g c祅g ph秈 chuy猲 t﹎ tu dng. Ngi h鋍 v� m� kh玭g tu luy謓 c s� kh玭g th� t 頲 c秐h gi韎 v� h鋍, mong ngi c� g緉g tu dng!")
	else
		Talk(1,"","V� h鋍 c� o, theo 阯g ch輓h o m韎 c� th� t th祅h. N誹 甶 nh莔 阯g, s� u鎛g c玭g c� i tu luy謓")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
--	if (HaveMagic(267) == -1) then
--		AddMagic(267)					-- 三环套月
--		Msg2Player("你学会了“三环套月”")
--		Say("道一真人：为师这次闭关苦思数日，新创了一招“三环套月”，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
		Say("V� ngh� c馻 ngi  c� nhi襲 ti課 b�! Ch綾 c� th� h� s琻 th� luy謓 m閠 phen!",2,"D�! е t� 甶 li襫 /goff_yes","е t� t藀 luy謓 v蒼 ch璦  /no")
--	end
end

-------------------------- 重返门派相关 ---------------------
function goff_yes()
	Talk(1,"","Л頲! H穣 ghi nh� t玭 ch� c馻 b鎛 ph竔: 'Lu玭 l祄 vi謈 thi謓, gi髉  k� y誹 畊鑙 ngh蘯 kh�'")
	SetTask(5,70*256)
	AddNote("R阨 kh醝 V� ng ph竔, l筰 chu du giang h�. ")
	Msg2Player("R阨 kh醝 V� ng ph竔, l筰 chu du giang h�. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- 转派，收回原门派武功技能
-- 刷掉技能
	n = 0
	i=153; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 怒雷指
	i=151; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 武当剑法
	i=152; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 武当拳法
	i=155; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 沧海明月
	i=156; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 纯阳心法
	i=157; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 坐忘无我
	i=158; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 剑飞惊天
	i=159; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 七星阵
	i=160; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 梯云纵
	i=161; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 两仪心法
	i=162; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 玄一无象
	i=164; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 剥及而复
	i=165; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 无我无剑
	i=166; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 太极神功
	i=267; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- 三环套月
	AddMagicPoint(n)
-- 刷完技能后继续转门派流程
	SetTask(9,5*256+20)
	SetTask(5,75*256)				-- 为原门派作个标记
	SetRank(63)
	if (GetRepute() < 200) then
		Msg2Player("V� h祅h vi b蕋 trung v韎 m玭 ph竔, danh v鋘g c馻 b筺 gi秏 xu鑞g "..GetRepute().."甶觤!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V� h祅h vi b蕋 trung v韎 m玭 ph竔, danh v鋘g c馻 b筺 gi秏 xu鑞g 200 甶觤! ")
		AddRepute(-200)
	end
	AddNote("Thu h錳 v� c玭g V� ng, h駓 b� ch鴆 v� Huy襫 v� ch﹏ nh﹏. B筺 c� th� gia nh藀 C玭 L玭 ph竔. ")
	Msg2Player("Thu h錳 v� c玭g V� ng, h駓 b� ch鴆 v� Huy襫 v� ch﹏ nh﹏. B筺 c� th� gia nh藀 C玭 L玭 ph竔. ")
	Talk(1,"KickOutSelf","N誹  nh� th�, ta nh ph秈 thu l筰 v� ngh� b鎛 ph竔 m� ngi  h鋍!")
end

function defection_no()
	AddNote("B筺 t� b� suy ngh� quay l筰 C玭 L玭 ph竔. ")
	Msg2Player("B筺 t� b� suy ngh� quay l筰 C玭 L玭 ph竔. ")
	SetTask(9,1*256)			-- 为企图叛师做个标记，以备将来不时之需
end

function return_select()
	Say("C� r蕋 nhi襲 ngi nghi猲 c鴘 v� ph竧 huy v� c玭g c馻 b鎛 ph竔. Th� n祇? Ngi c� h鴑g th� quay l筰 c飊g ta nghi猲 c鴘 v� h鋍 n c秐h gi韎 t鑙 cao kh玭g?",2,"е t� hy v鋘g c� th� c飊g nghi猲 c鴘 v� h鋍 /return_yes","Kh玭g c莕 u/return_no")
end;

function return_yes()
	Talk(1,"","V� ng s琻 c� nhi襲 du kh竎h thng l穖, s琻 l� c騨g v� th� m� h� h醤g nhi襲! в th� th竎h ngi, ngi c� th� quy猲 g鉷 5 v筺 lng ti襫 tu s鯽 s琻 l� kh玭g? ")
	SetTask(5,70*256+20)
	AddNote("Giao 50000 lng b筩 c� th� quay l筰 V� ng ph竔. ")
	Msg2Player("Giao 50000 lng b筩 c� th� quay l筰 V� ng ph竔. ")
end;

function return_no()
	Talk(1,"","Xin 產 t� h秓 � c馻 Chng m玭. Nh璶g hi謓 o suy ma th辬h, sinh linh ch辵 c秐h thng t﹎. е t� sao c� th� m総 l蕄 tai ng�!")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","Hay l緈! Ta s� th玭g b竜 tin ngi  quay l筰 m玭 ph竔!")
		Pay(50000)
		SetTask(5, 80*256)
		SetFaction("wudang")
--		if (HaveMagic(166) == -1) then
--			AddMagic(165)
--			AddMagic(267)
--			AddMagic(166)
		add_wd(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("B筺 h鋍 頲 tr蕁 ph竔 tuy謙 h鋍 Th竔 C鵦 Th莕 C玭g, V� Ng� V� Ki誱, Tam Ho祅 Thao Nguy謙. ")
--		end
		SetCamp(1)
		SetCurCamp(1)
		SetRank(73)
		AddNote("Х tr� v� V� ng ph竔,ng trong h祅g ng�. ")
		Msg2Player(GetName().."Л頲 phong l祄 Huy襫 V� Ch﹏ Qu﹏ c馻 V� ng ph竔, ti誴 t鬰 � l筰 V� ng t藀 luy謓. ")
	else
		Talk(2,"","H�? H譶h nh� kh玭g  l緈!","�! Xin l鏸! в  t� ki觤 tra l筰 c竔 !")
	end
end;

function return_uncompleted()
	Talk(1,"","N祇, c� l猲!")
end;

------------------- 10级任务 --------------------
function L10_Q1()
	Say("C﹗ th� nh蕋 kh雐 bi猲 trong chng 1 'Чo c Kinh' l� g�?", 3, "Чo sinh nh蕋, nh蕋 sinh nh�, nh� sinh tam, tam sinh v筺 v藅 /no", "Nh﹏ ph竝 a, a ph竝 thi猲, thi猲 ph竝 o, o ph竝 t� nhi猲 /no", "Чo kh� o, phi thng o; danh kh� danh, phi thng danh /L10_Q2")
end;

function L10_Q2()
	SetTask(5,10*256+60)
	Say("C﹗ h醝 k� ti誴: 'Чi Tng' trong 'Чi Tng v� h譶h' l� ch� c竔 g�?", 3, "M閠 lo筰 ng v藅 /no", "H譶h tr筺g l韓 nh蕋 /L10_Q3", "Th竔 tng /no")
end;

function L10_Q3()
	SetTask(5,10*256+70)
	Say("Gi醝! C﹗ h醝 cu鑙 c飊g: Ph輆 sau c馻 c﹗ 'Tri Nh﹏ Gi� Tr�, T� Tri Gi� Minh' l� c﹗ g�?", 3, "Чi tr鵦 nhc kh骳, i x秓 nhc chuy誸 /no", "Th緉g nh﹏ gi� h鱱 l鵦, t� th緉g gi� cng /L10_prise", "H鋋 h�, ph骳 chi s� k�; h鋋 h�, h鋋 chi s� ph鬰 /no")
end;

function no()
	Talk(1,"","Xem ra ngi ch糿g c� ch髏 kh� c玭g g�! H鋍 thu閏 'Чo c Kinh' r錳 h穣 n!")
end;

function L10_prise()
	Talk(1,"","Xem ra ngi  b� ch髏 c玭g phu luy謓 t藀! Gi醝 l緈!")
	SetRank(8)
	SetTask(5, 20*256)
--	AddMagic(152)
--	AddMagic(151)
	add_wd(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("V� T� Ti猽 i 甶謓, tr� l阨 ch輓h x竎 3 c﹗ h醝 c馻 chng m玭, ho祅 th祅h nhi謒 v� Чo c kinh. Tr� th祅h Nh祅 T秐 o nh﹏. ")
	Msg2Player("Ch骳 m鮪g B筺! Х tr� th祅h Nh祅 T秐 Чo Nh﹏! H鋍 頲 V� ng Quy襫 Ph竝, V� ng Ki誱 Ph竝. ")
end

----------------------- 40级任务 -----------------------
function L40_prise()
	DelItem(164)
	SetRank(11)
	SetTask(5, 50*256)
--	AddMagic(160)
	add_wd(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g B筺! Tr� th祅h Nh藀 Quan Чo Nh﹏! H鋍 頲 v� c玭g Th� V﹏ Tung c馻 V� ng ph竔. ")
	AddNote("дn T� Ti猽 i 甶謓, giao th� c馻 Nhu薾 Nng cho Чo Nh蕋 Ch﹏ Nh﹏, ho祅 th祅h nhi謒 v�. Tr� th祅h Nh藀 Quan o nh﹏. ")
end;

------------------------- 出师任务 -------------------------
function L60_get_yes()
Say("Ngi ph秈 m� 3 b秓 rng tr猲<color=Red>Th竔 T� Nham<color>ph輆 sau<color=Red>h藆 s琻<color>, l蕐 頲<color=Red>3 b� b秓 v藅<color>b猲 trong, m韎 c� th� xu蕋 s� 頲!", 0);
SetTask(5, 60*256+20)	
AddNote("G苝 Чo Nh蕋 Ch﹏ Nh﹏ t筰 T� Ti猽 i 甶謓, nh薾 nhi謒 v� xu蕋 s�, ra v竎h Th竔 T� Nham sau n骾 l蕌 3 v藅 qu� trong 3 B秓 rng. ")
Msg2Player("G苝 Чo Nh蕋 Ch﹏ Nh﹏ t筰 T� Ti猽 i 甶謓, nh薾 nhi謒 v� xu蕋 s�, ra v竎h Th竔 T� Nham sau n骾 l蕌 3 v藅 qu� trong 3 B秓 rng. ")
end;

function L60_get_no()
	Talk(1,"","C騨g t鑤! V藋 ngi h穣 � l筰 V� ng h鋍 ngh� th猰 m閠 th阨 gian!")
end;

function L60_prise()
	DelItem(69)
	DelItem(70)
	DelItem(71)
--	AddGlobalCountNews(GetName().."艺成出师，告别各位师弟师妹出山闯荡江湖！", 1)
	Msg2SubWorld("е t� V� ng ph竔 "..GetName().."Xu蕋 s� th祅h c玭g, c竜 bi謙 c竎 s�  s� mu閕 xu蕋 s琻 h祅h hi謕 trng ngh躠! ")
	SetRank(63)
	SetTask(5, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("V� T� Ti猽 i 甶謓, l蕐 3 b秐 ch﹏ kinh giao cho chng m玭 Чo Nh蕋 Ch﹏ Nh﹏, ho祅 th祅h nhi謒 v� x蕋 s�. Tr� th祅h ngi gi髉 vi謈, thu薾 l頸 xu蕋 s�. ")
	Msg2Player("Ch骳 m鮪g b筺 xu蕋 s�! Л頲 phong l祄 Huy襫 V� Th莕 Th�! Danh v鋘g c馻 b筺 t╪g th猰 120 甶觤! ")
	AddRepute(120)
end;

function no()
end
