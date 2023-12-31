-- 昆仑 掌门 璇玑子 入门任务、出师任务、重返门派任务
-- by：Dan_Deng(2003-07-30)
-- Update：Dan_Deng(2003-10-27)重写重返师门任务，并重新整理脚本

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�."
	G_TASK:OnMessage("C玭 L玭", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 9) then
		tbDailog:AddOptEntry("H鋍 k� n╪g c蕄 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Mu鑞 th豱h gi竜 vi謈 kh竎", oldentence)
	tbDailog:Show() 
end

function oldentence()
	local UTask_kl = GetTask(9);
	local nFactID = GetLastFactionNumber();

	if (UTask_kl == 70*256) and (GetFaction() == "kunlun") then			-- 回师错误修正
		SetFaction("")
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_kl == 70*256) and (GetTask(5) >= 5*256) and (GetTask(5) < 10*256) then		-- 以前接过入门任务的
		SetTask(5,0)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_kl == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(9,70*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (GetTask(5) == 70*256) and (GetTask(9) == 70*256) then			-- 转门派错误修正
		SetTask(5,75*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_kl == 80*256 and nFactID == 9 and GetCamp() == 3 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("kunlun");
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	elseif (UTask_kl == 70*256 and nFactID == 9 and GetCamp() ~= 4 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	end

	local tbDes = {"Цi ngh� u s�/#daiyitoushi_main(9)", "Mu鑞 th豱h gi竜 vi謈 kh竎/common_talk"};
	
	Say("G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_kl = GetTask(9);
	local Uworld31 = GetByte(GetTask(31),2)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),9) == 0) then				-- 世界任务：武林向背
		Talk(1,"","Th﹏ l� th莕 d﹏ i T鑞g, ch鑞g gi芻 ngo筰 x﹎ t蕋 nhi猲 ngh躠 b蕋 kh� t�, nh璶g nh筩 ph� c馻 чc C� Ki誱 Trng Phong t鮪g ph鬰 v� cho ngi Kim. в h緉 th� l躰h, ch� e kh� l遪g m� ph鬰 t飊g")
		Uworld40 = SetBit(GetTask(40),9,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl == 60*256+20) and (HaveItem(16) == 1)) then	-- 出师任务完成
			Talk(2,"L60_prise","Chng m玭! е t� kinh tr秈 tr╩ gian ng祅 kh�, cu鑙 c飊g  t譵 頲 Ng� S綾 th筩h t筰 Ho祅g H� nguy猲 u!","Ch� hy v鋘g vi猲 Ng� S綾 th筩h n祔 c� th� mang l筰 h錸g ph骳 cho b鎛 m玭. Ngic� th� ho祅 th祅h nhi謒 v� to l韓 kh� kh╪ n祔, ta c騨g c秏 th蕐 r蕋 y猲 vui! T� y ngi c� th� thu薾 l頸 xu蕋 s� r錳!")
		elseif ((UTask_kl == 60*256) and (GetLevel() >=50)) then		-- 出师任务
			Say("Truy襫 thuy誸 k�: n╩ x璦 N� Oa luy謓 Ng� S綾 th筩h v� tr阨, v� xong tr阨, l蕐 nh鱪g vi猲  d� ra r秈 xu鑞g tr莕 gian, trong  c� 1 vi猲 r琲 ngay Ho祅g H� nguy猲 u. Ng� S綾 th筩h tng tr璶g quang minh v� h筺h ph骳, ai c� 頲 Ng� S綾 th筩h, ngi  s� g苝 may tr竛h n筺. N誹 ngic� th� gi髉 b鎛 ban t譵 頲 Ng� S綾 th筩h, ngic� th� thu薾 l頸 xu蕋 s�.",2,"V藋  t� s� 甶 t譵 /L60_get_yes","Chuy謓  nh� m� kim y bi觧, hay l� th玦 v藋. /L60_get_no")
		elseif (UTask_kl == 80*256) then						-- 重返后的自由出入
			check_skill()
			Say("C� v� nh� v� ngh� c馻 ngi c騨g kh玭g k衜, c� th輈h xu鑞g n骾 th鵦 ti詎 m閠 phen?",2,"е t� c騨g 產ng c� �  /goff_yes","е t� mu鑞 t藀 luy謓 th猰 1 th阨 gian n鱝. /no")
		else
			Talk(1,"","L祄 Chng m玭 kh玭g d� d祅g ch髏 n祇!")
		end
	elseif (Uworld31 == 20) then		--入门任务
		Talk(4,"enroll_prise","Nghe n鉯 ngi b総 cho con g竔 ta 1 con kim t� h莡?","ng v藋!","Uhm! Th� th� ngic� y猽 c莡 g�?","V穘 b鑙 mu鑞 b竔 t� nh藀 C玭 L玭 ph竔 h鋍 ngh� ")
--	elseif (UTask_kl == 5*256+20) then			-- 转门派完成
--		Talk(1,"defection_complete","璇玑子：好，好！你也转了过来，武当派无人矣！")
	elseif (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_kl == 70*256) and ((GetTask(5) < 5*256) or (GetTask(5) == 75*256)) then		-- 重返师门任务
		Talk(1,"return_select","S� ph�! е t� ra giang h� phi猽 b箃  頲 m閠 th阨 gian, c秏 th蕐 m譶h ki課 th鴆 k衜 c醝, c� th� cho  t� quay v� t竔 nh藀 m玭  ti課 tu v� c玭g?")
	elseif (GetCamp() == 4) and ((UTask_kl == 70*256+10) or (UTask_kl == 70*256+20)) then		-- 重返师门任务中
		Say("Чo l� l祄 ngi nh� ngi v鮝 n鉯 , h鋍 頲 � u v藋?",2,"Х chu萵 b� xong/return_complete","V蒼 ch璦 chu萵 b� xong/return_uncompleted")
	elseif (GetTask(5) == 70*256+10) and (HaveMagic(182) >= 0) then		-- 武当重返门派，收回五雷正法
		Say("V� ng to祅 m閠 l� tham danh l鮝 g箃 m鋓 ngi, u鎛g c玭g ta t薾 t﹎ l鵦 o t筼 ngi th� m� ngi d竚 l祄 chuy謓 v� 琻 b閕 ngh躠 nh� v藋!",2,"Kh玭g sai, � ta  quy誸. /defection_yes","е t�  bi誸 l鏸 r錳. /no")
	else
		Talk(1,"","Thi誹 L﹎, V� ng th�  l� g�? S� c� m閠 ng祔, ta p b鋘 h� di g鉻 gi祔")
	end
end;
---------------------- 技能调整相关 ------------------------
function check_skill()
--	if (HaveMagic(275) == -1) then
--		AddMagic(275)					-- 霜傲昆仑
--		Msg2Player("你学会了“霜傲昆仑”")
--		Say("璇玑子：为师这次闭关苦思数日，新创了一招“霜傲昆仑”，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
		Say("C� v� nh� v� ngh� c馻 ngi c騨g kh玭g k衜, c� th輈h xu鑞g n骾 th鵦 ti詎 m閠 phen?",2,"D�! е t� 甶 li襫 /goff_yes","е t� t藀 luy謓 v蒼 ch璦  /no")
--	end
end
--------------------- 转门派相关 ------------------------
function defection_complete()
	Msg2Player("Hoan ngh猲h b筺 gia nh藀 C玭 L玭 ph竔, tr� th祅h Ph蕋 tr莕  t�. ")
	SetRevPos(131,57)		  				-- 设置重生点
	SetTask(9,10*256)						-- 入门
	SetFaction("kunlun")      			-- 玩家加入昆仑
	SetCamp(3)
	SetCurCamp(3)
	SetRank(19)
	AddMagic(169)
	Msg2Player("H鋍 頲 H� Phong ph竝 ")
	AddNote("Gia nh藀 C玭 L玭 ph竔, tr� th祅h Ph蕋 Tr莕  t�, h鋍 頲 H� Phong ph竝 ")
	Msg2Faction("kunlun",GetName().." t� V� ng n gia nh藀 C玭 L玭 ph竔. L鵦 lng b鎛 ph竔  m筺h l筰 c祅g m筺h!",GetName())
end

-------------------------- 重返门派相关 ---------------------
function goff_yes()
	Talk(1,"","Л頲 r錳! Ngi h穣 甶 甶! ng qu猲 r籲g nh� c� ch髇g ta m� ngi m韎 c� 頲 ng祔 h玬 nay!")
	SetTask(9,70*256)
	AddNote("R阨 kh醝 C玭 L玭 ph竔, l筰 ti誴 t鬰 phi猽 b箃 giang h� ")
	Msg2Player("R阨 kh醝 C玭 L玭 ph竔, l筰 ti誴 t鬰 phi猽 b箃 giang h� ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_select()
	Say("襲 n祔 kh玭g h頿 v韎 quy nh c馻 m玭 ph竔. Nh璶g n誹 ngi l� ngi th蕌 hi觰 o l�, ta c� th� gi髉 ngi ngh� c竎h ",2,"T苙g 50000 lng b筩 /return_yes","Kh玭g tr飊g ph秐 s� m玭 n鱝 /return_no")
end;

function return_yes()
	Talk(1,"","T鑤 l緈! Qu� nhi猲 l� ngi bi誸 甶襲. Ngi  ng� ra nh鱪g o l� l祄 ngi r錳, c騨g n猲 nhanh ch鉵g chu萵 b� 甶!")
	SetTask(9,70*256+20)
	AddNote("Ch� c莕 giao n筽 50. 000 lng b筩 th� c� th� tr飊g ph秐 s� m玭 ")
	Msg2Player("Ch� c莕 giao n筽 50. 000 lng b筩 th� c� th� tr飊g ph秐 s� m玭 ")
end;

function return_no()
	Talk(1,"","N誹 nh� v藋 ch綾 ta l筰 ph秈 quay v� giang h� ti誴 t鬰 h鋍 t藀 th猰 m閠 th阨 gian n鱝. ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","T鑤 l緈! V藋 th� ta s� 甶 th玭g b竜 tin ngi  quay tr� l筰 m玭 ph竔. ")
		Pay(50000)
		SetTask(9,80*256)
		SetFaction("kunlun")
--		if (HaveMagic(275) == -1) then
--			AddMagic(182)
--			AddMagic(275)
		add_kl(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("B筺  h鋍 tuy謙 h鋍 Tr蕁 ph竔 Sng Ng筼 C玭 L玭, Ng� L玦 Ch輓h Ph竝")
--		end
		SetCamp(3)
		SetCurCamp(3)
		SetRank(75)
		AddNote("Х quay tr� l筰 C玭 L玭 ph竔, l筰 ghi t猲 trong m玭 ph竔 ")
		Msg2Player(GetName().."<#>Л頲 phong l祄 H� Ph竝 Ch﹏ Qu﹏ c馻 C玭 L玭 ph竔, tr� v� ph竔 C玭 L玭 ti誴 t鬰 tu h祅h. ")
	else
		Talk(2,"","Ch� n鉯 mi謓g kh琲 kh琲, kh玭g a ra h祅h ng c� th� n祇 sao?","Xin l鏸! Ta s� l藀 t鴆 甶 ki誱 ti襫!")
	end
end;

function return_uncompleted()
	Talk(1,"","C� 蕀 蕀 髇g 髇g nh� th�, l祄 sao cho ngi ta tin 頲 th祅h � c馻 ngi!")
end;

----------------------- 门派任务相关 -------------------
function enroll_prise()
	Talk(1,"","Mu鑞 nh藀 m玭 th� ch� b籲g c竔 vi謈 nh� nh苩 nh� v藋 th玦 kh玭g , nh璶g th蕐 ngith玭g minh lanh l�, b鎛 to� cho ph衟 ngi l祄 K� Danh  t� v藋! ")
	i = ReturnRepute(30,29,3)		-- 缺省声望，最大无损耗等级，每级递减
	AddRepute(i)
	Uworld31 = SetByte(GetTask(31),2,127)
	SetTask(31,Uworld31)
	AddNote("<#>Ho祅 th祅h nhi謒 v� Kim T� H莡, tr� th祅h <color=Red>K� Danh  t�<color>. Danh v鋘g c馻 b筺 t╪g th猰 "..i.."<#>甶觤.")
	Msg2Player("Ho祅 th祅h nhi謒 v� Kim T� H莡, tr� th祅h K� danh  t�. ")
end;

function L60_get_yes()
	SetTask(9,60*256+10)
	AddNote("Ti誴 nh薾 nhi謒 v� xu蕋 s�: дn Ho祅g H� Nguy猲 u t譵 Ng� S綾 th筩h ")
	Msg2Player("Ti誴 nh薾 nhi謒 v� xu蕋 s�: дn Ho祅g H� Nguy猲 u t譵 Ng� S綾 th筩h ")
end;

function L60_get_no()
end;

function L60_prise()
	Talk(1,""," t� Chng m玭! ")
	DelItem(16)
	SetRank(65)
	SetTask(9, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Ho祅 th祅h nhi謒 v� xu蕋 s�, 頲 phong l� Ti猲 Ph� Ch﹏ Qu﹏ ")
	Msg2Player("Ch骳 m鮪g B筺! Th祅h ngh� xu蕋 s�! B筺  頲 phong l� Ti猲 Ph� Ch﹏ Qu﹏ ")
end;
