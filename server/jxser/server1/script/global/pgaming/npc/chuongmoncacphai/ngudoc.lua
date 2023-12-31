-- 五毒 路人NPC 教主黑面郎君 出师任务、重返门派任务
-- by：Dan_Deng(2003-08-05)
-- Update：Dan_Deng(2003-10-27)重写重返师门任务，并重新整理脚本

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- 带艺投师
--dinhhq: new lunar year 2011
Include("\\script\\vng_event\\LunarYear2011\\npc\\mastergift.lua")

function main()
	if tbVNG_LY2011:isActive() == 1 then
		local tbSay = 
			{
				"T苙g b竛h ng祔 xu﹏/#tbMasterGift:getGift('wudu')",
				"Mu鑞 th豱h gi竜 vi謈 kh竎/oldMain"
			}
		Say("N╩ m韎 an khang th辬h vng", getn(tbSay), tbSay)
		return
	end
	oldMain()
end
function oldMain()
	if allbrother_0801_CheckIsDialog(4) == 1 then
		allbrother_0801_FindNpcTaskDialog(4)
		return 0;
	end
	if (vt06_isactive() ~= 0) then
		Say("T譵 ta c� vi謈 g�?", 2, "Mu鑞 th豱h gi竜 i s�!/oldentence", "M鮪g l�  S�, t筰 h�  t譵  揟h�  S瓟 v� 揟h� Cao у�./vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 3) then
		Describe("T譵 ta c� vi謈 g�?", 2,
			"H鋍 k� n╪g c蕄 120./lvl120skill_learn",
			"Mu鑞 th豱h gi竜 vi謈 kh竎/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_wu = GetTask(10)
	local nFactID = GetLastFactionNumber();

	if (UTask_wu == 70*256) and (GetFaction() == "wudu") then			-- 回师错误修正
		SetFaction("")
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_wu == 70*256) and (GetTask(2) >= 5*256) and (GetTask(2) < 10*256) then		-- 以前接过入门任务的
		SetTask(2,0)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_wu == 80*256) and (GetCamp() == 4) then			-- 回师错误修正
		SetTask(10,70*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (GetTask(2) == 70*256) and (GetTask(10) == 70*256) then			-- 转门派错误修正
		SetTask(2,75*256)
		Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
		return
	elseif (UTask_wu == 80*256 and nFactID == 3 and GetCamp() == 2 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("wudu");
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	elseif (UTask_wu == 70*256 and nFactID == 3 and GetCamp() ~= 4 and GetFaction() == "M韎 nh藀 giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th鑞g ph竧 hi謓 sai s鉻,  k辮 th阨 h錳 phuc!",0)
			return
		end
	end
	
	local tbDes = {"Цi ngh� u s�/#daiyitoushi_main(3)", "Mu鑞 th豱h gi竜 vi謈 kh竎/common_talk"};
	
	
	Say("G莕 y ta c� r蕋 nhi襲 vi謈 gi秈 quy誸, ngi n y c� vi謈 g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_wu = GetTask(10)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),10) == 0) then				-- 世界任务：武林向背
		Talk(1,"","чc C� Ki誱 mu鑞 li猲 T鑞g ch鑞g Kim? C� g� hay ho ch�? B鎛 gi竜 v� Kim qu鑓 v鑞 l� ch� li猲 minh m藅 thi誸. C竎 ngis鴆 y誹 th� c� nh� v藋 li謚 c� 琻g c� n鎖 kh玭g")
		Uworld40 = SetBit(GetTask(40),10,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 60*256+20) and (HaveItem(222) == 1) then		-- 任务进行中
			Talk(2,"L60_prise","Thu閏 h�  畂箃 l筰 b秓 v藅 c馻 gi竜 ph竔, xin tr筰 ch� xem th�!","Gi醝! Hay l緈! C鵦 k� gi醝 Qu� nhi猲 ngi  kh玭g ph� s� k� v鋘g c馻 ta. Th藅 kh玭g h� danh c馻 'ng� c gi竜 ph竔',V藋 l� ngi c� th� thu薾 l頸 xu蕋 s� r錳! Ng祔 sau n誹 c� vang danh v� l﹎, th� ng qu猲 nh綾 n t猲 c馻 b鎛 gi竜 nh� ")
		elseif (UTask_wu == 60*256) and (GetLevel() >= 50) then		--出师任务
			Say("B鎛 gi竜 v� Nh筺 Хng ph竔 v鑞 kh玭g i tr阨 chung. 10 n╩ trc b鎛 gi竜 v� Nh筺 Хng ph竔  ti課 h祅h m閠 cu閏 竎 chi課. B鎛 gi竜  b� 竚 to竛. T輈h чc Chu c馻 b鎛 gi竜  b� Nh筺 Хng ph竔 cp 甶. B鋘 ch髇g  甧m v� ng Dng Gi竎 � Nh筺 Хng s琻. Chuy謓 n祔 n n祔 v蒼 c遪 l� m鑙 tr╪ tr� c馻 ta. Ng祔 n祇 ch璦 l蕐 頲 n� v� th� ta ch璦 th� an l遪g. N誹 nh� ngi mu鑞 xu蕋 s� th� l筰 甶 畂箃 l筰 T輈h чc Chu v� y cho ta",2,"Thu閏 h� s� 甧m h誸 t﹎ s鴆 c馻 m譶h  mang 頲 b竨 v藅 c馻 b鎛 m玭 v� /L60_get_yes","е t� t礽 m遪 s鴆 k衜. Ch� e kh玭g ho祅 th祅h 頲 nhi謒 v� n祔! /no")
		elseif (UTask_wu == 80*256) then						-- 重返后的自由出入
			Say("Ngi 產ng mu鑞 xu蕋 s� ph秈 kh玭g? ng l骳! H穣 cho gi韎 v� l﹎ � Trung Nguy猲 th蕐 頲 s� l頸 h筰 c馻  t� b鎛 m玭 ",2,"D�!  t� gi竜 ch�! /goff_yes","е t� t� th蕐 m譶h v� ngh� v蒼 ch璦 , e r籲g s� ph� l遪g c馻 gi竜 ch�! /no")
		else
			Talk(1,"","ng c� qu� coi tr鋘g c竔 b鋘 C竔 Bang t� x璶g l� V� L﹎  nh蕋 bang ph竔 kia, Thi誹 L﹎ m韎 ch輓h l� thi猲 h�  nh蕋 m玭 ph竔! H�,cho d� l�  nh蕋 cao th� c騨g kh� m� ch n鎖 v韎 c dc tuy謙 ph萴 c馻 ta")
		end
--	elseif (UTask_wu == 5*256+20) then			-- 转门派完成
--		Talk(1,"defection_complete","黑面郎君：哈哈哈哈，给我好好干，荣华富贵少不了你的！")
--	elseif (GetSeries() == 1) and (GetTask(2) == 5*256+10) and (HaveMagic(76) >= 0) then		-- 叛师入唐门，逐出五毒，收回全部技能
--		Say("黑面郎君：想入唐门？难道本门武功还不够强，你竟然想投奔唐门？",2,"弟子只是想偷学唐门绝技来为本教光大/defection_yes","对不起，弟子知错了/no")
	elseif (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_wu == 70*256) and ((GetTask(2) < 5*256) or (GetTask(2) == 75*256)) then		-- 重返师门任务
		Say("Ngi mu鑞 tr� l筰 b鎛 gi竜? Chuy謓 n祔 n鉯 l韓 th� l� l韓, m� n鉯 nh� th� l� nh�. Ch� c莕 ngi n緈 r� 頲 nh鱪g quy lu藅 th� c� th� quy誸 nh. ",2,"Xin gi竜 ch� chi誹 c� /return_yes","Xin cho ph衟  t� suy ngh� th猰 m閠 ch髏 /no")
	elseif (GetCamp() == 4) and ((UTask_wu == 70*256+10) or (UTask_wu == 70*256+20)) then			-- 重返过程中。设置为70*256+20，但兼容70*256+10的值
		Say("Nh鱪g 甶襲 ngi  n鉯 ,  chu萵 b� xong ch璦",2,"Chu萵 b� xong r錳 /return_complete","Xin h穣 cho  t� th猰 m閠 輙 th阨 gian n鱝 /return_uncompleted")
	else							-- 常规对话
		Talk(1,"","Cho ph衟  t� trong b鎛 ph竔 t� h� c l蒼 nhau l� n閕 nh c馻 b鎛 ph竔. K� n祇 cng l鵦 h琻 th� s� t錸 t筰")
	end
end;

---------------------- 技能调整相关 ------------------------
--function check_skill()
--	x = 0
--	skillID = 61					-- 五毒棒法
--	i = HaveMagic(skillID)
--	if (i >= 0) then
--		x = x + 1
--		DelMagic(skillID)
--		AddMagicPoint(i)
--	end
--	if (x > 0) then		-- 若有技能发生变化，则踢下线，否则返回继续流程
--		Say("黑面郎君：为师这次闭关苦思数日，将本门武艺作了一番整顿，现在传授于你。你学完后先回去好好休息一番，以免伤到经脉。",1,"多谢师父/KickOutSelf")
--	else
--		return
--	end
--end

--------------------- 转门派相关 ------------------------
function defection_complete()
	Msg2Player("Hoan ngh猲h b筺 gia nh藀 Ng� чc gi竜, ngi  tr� th祅h Ng� чc уng T� r錳 ")
	SetRevPos(183,70)		  			--设置重生点
	SetTask(10,10*256)				-- 入门
	SetFaction("wudu")       	--玩家加入门派
	SetCamp(2)
	SetCurCamp(2)
	SetRank(49)
	AddMagic(63)
	Msg2Player("H鋍 頲 чc Sa Chng ")
	AddNote("Gia nh藀 Ng� чc gi竜, Tr� th祅h Ng� чc ng t�, h鋍 頲 чc Sa Chng ")
	Msg2Faction("wudu",GetName().." t� Л阯g M玭 n gia nh藀 Ng� чc gi竜. L鵦 lng b鎛 ph竔  m筺h l筰 c祅g m筺h!",GetName())
end

--------------------- 重返门派相关 ----------------------
function goff_yes()
	Talk(1,"","Л頲! Xu蕋 s� r錳 ng l祄 cho danh ti課g c馻 b鎛 ph竔 b� � danh trong v� l﹎ nh� ")
	SetTask(10,70*256)
	AddNote("R阨 Ng� чc gi竜, ti誴 t鬰 chu du giang h� ")
	Msg2Player("B筺 r阨 Ng� чc gi竜, ti誴 t鬰 chu du giang h� ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_yes()
	Talk(3,"","� y  t� c� 50000 lng ng﹏ lng. xin gi竜 ch� ti誴 nh薾","T鑤 l緈! Ngi  c� th祅h � nh� v藋, ta c騨g kh� m� t� ch鑙","Xin cho ph衟  t� 甶 chu萵 b� v礽 th�. ")
	SetTask(10,70*256+20)
	AddNote("Giao n閜 50000 ng﹏ lng th� c� th� tr� l筰 Ng� чc Gi竜 ")
	Msg2Player("Giao n閜 50000 ng﹏ lng th� c� th� tr� l筰 Ng� чc Gi竜 ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","莥! Ngi b﹜ gi�  l�  t� c馻 b鎛 gi竜 r錳! Ta s�  b箃 ngi l� U Minh Qu� Vng ")
		Pay(50000)
		SetTask(10,80*256)
		SetRank(80)
--		if (HaveMagic(75) == -1) then
--			AddMagic(71)
--			AddMagic(74)
--			AddMagic(75)
		add_wu(70)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("B筺 h鋍 頲 tuy謙 h鋍 tr蕁 ph竔; Ng� чc k� Kinh, V� c玭g Thi猲 Cng мa S竧. Chu C竝 Thanh Minh ")
--		end
		SetFaction("wudu")
		SetCamp(2)
		SetCurCamp(2)
		AddNote("Х quay tr� l筰 Ng� чc Gi竜, ti誴 t鬰 t藀 luy謓 v� ngh� ")
		Msg2Player(GetName().."Х quay tr� l筰 Ng� чc Gi竜, 頲 phong l祄 U Minh qu� Vng. ")
	else
		Talk(2,"","Х mu鑞 xu蕋 s� r錳, nh璶g r� r祅g l� ngi ch璦 chu萵 b� g� c�!","Xin l鏸! в ta ki觤 tra l筰.")
	end
end;

function return_uncompleted()
	Talk(1,"","Mau L猲!")
end;

---------------------- 门派任务相关 ---------------------
function L60_get_yes()
	SetTask(10,60*256+10)
	AddNote("箃 l筰 T� чc Chu b秓 b鑙 c馻 ch竛h ph竔 v鑞  b� Nh筺 Хng ph竔 cp 甶 ")
	Msg2Player("箃 l筰 T� чc Chu b秓 b鑙 c馻 ch竛h ph竔 v鑞  b� Nh筺 Хng ph竔 cp 甶 ")
end;

function L60_prise()
	Talk(1,"","Thu閏 h� kh綾 c鑤 ghi t﹎. Tuy謙 kh玭g d竚 qu猲")
	SetTask(10,70*256)
	DelItem(222)
	SetRank(70)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("箃 l筰 T� c Chu t� tay c馻 Nh筺 Хng ph竔, tr� l筰 cho Ng� чc Gi竜. Ho祅 th祅h nhi謒 v� xu蕋 s�. Л頲 phong l� U Minh Qu� S�, thu薾 l頸 xu蕋 s� ")
	Msg2Player("Ch骳 m鮪g B筺! Х th祅h c玭g xu蕋 s�. B筺  頲 phong l� U Minh Qu� S� ")
end;

function no()
end;
