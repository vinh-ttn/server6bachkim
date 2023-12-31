-- 月老.lua 结婚申请人NPC，NPC所在地待定
-- By: Dan_Deng(2003-12-27)
-- Uworld67 == GetTask(67)　各字位意义：1-7(结婚任务各状态)，8-15(结婚次数)，16-23(待定)，24(婚否)，25-32(待定)
-- PS：2（是否送过戒指）
-- GetTaskTemp(5)：记录是否已提亲（或被提亲）
-- GetTaskTemp(6)：记录提亲者的在线ID
-- GetTaskTemp(7)：记录被提亲者的在线ID
-- 结婚条件：未婚, 等级>=20, 男方做队长, 男方去找月老说话, 然后女方再去说话，接受求亲
-- By: Dan_Deng(2004-03-02) 重写脚本结构，以便维护
-- Update: Dan_deng(2004-03-02) 协议离婚
-- Update: Fanghao_Wu(2004-8-20) 七夕送礼
-- Update: 子非鱼 (2007-10-12) 修改修复婚状态

Include("\\script\\global\\teamhead.lua");
Include("\\script\\event\\valentine2007\\event.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")

TK_DATE_APPLYDIV = 1779; --单方离婚任务号
TOTALSEC_OF_DAY = 60 * 60 * 24; -- 1天等于多少秒，用于把天数转成秒
COSTOFSIMGLEDIV = 1000000; --单方离婚花费

function main(sel)
	if (check_married() == 1) then
		SetTask(67, SetBit(GetTask(67), 24, 0));
		Msg2Player("<color=yellow>T譶h tr筺g h玭 ph鑙 c馻 b筺  thay i<color>");
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	
	if (GetSex() == 0) and (GetTaskTemp(5) == 1) then	
		tbDailog.szTitleMsg = "<#><npc>� trung nh﹏ c馻 ngi v蒼 ch璦 tr� l阨 ngi, c� c莕 m阨 c� ta nhanh nhanh m閠 ch髏 kh玭g?"
		tbDailog:AddOptEntry("Ta ngh� vi謈 c莡 h玭 c馻 ta qu� 阯g t, ngi c� th� h駓 b� cho ta 頲 kh玭g?", male_cancel)
		tbDailog:AddOptEntry("Л頲, ta 甶 th� xem", male_hurry)
	elseif (GetSex() == 1) and (GetTaskTemp(5) == 1) then	
		tbDailog.szTitleMsg = "<#><npc>anh ta 產ng i ngi tr� l阨 k譨,  suy ngh� k� l� mu鑞 c飊g v韎 anh ta 甶 su鑤 cu閏 i hay ch璦?"
		tbDailog:AddOptEntry("V﹏g, Ta nguy謓 su鑤 i n﹏g kh╪ s鯽 竜 cho anh ta, c飊g nhau 甶 h誸 cu閏 i.", female_yes)
		tbDailog:AddOptEntry("Kh玭g! Ta kh玭g mu鑞 trong l骳 b錸g b閠 a ra quy誸 nh c� i ngi m譶h.", female_cancel)
	else
		tbDailog.szTitleMsg = "<#><npc>Th鵦 ra l穙 gi� n祔 su鑤 ng祔 b薾 r閚, nh璶g c� th� xem v� gi秈 quy誸 頲 t譶h duy猲 c馻 ngi tr� tu鎖."
		tbDailog:AddOptEntry("Ta  c� � trung nh﹏, mu鑞 c莡 h玭 v韎 c� 蕐", Qmarry)
		tbDailog:AddOptEntry("T輓h c馻 ch髇g ta kh玭g h頿 nhau, mu鑞 li h玭 cho r錳.", divorce)
		tbDailog:AddOptEntry("Phu Th� ch髇g t玦 c穒 v� su鑤 ng祔, xin Nguy謙 L穙 gi髉 t玦 v礽 l阨 khuy猲.", fix_marry)
		tbDailog:AddOptEntry("Xin n phng ly h玭", singlediv_apply)
		tbDailog:AddOptEntry("Th� t鬰 x衪 x� n phng ly h玭.", sure_process_dinglediv)
		tbDailog:AddOptEntry("Kh玭g c� g�, ta ch� qua 阯g m� th玦.", no)
	end
	
	tbDailog:Show()
end
-----------单方面离婚----------------
--申请单方面离婚
function singlediv_apply()
	if (check_marrystate() == 0) then
		return
	end;
	
	local nDays = get_passdays();
	local str = "Th阨 gian xin ly h玭 ch璦  <color=yellow>1 ng祔<color>, ";
	if (nDays > 0) then
		str = format("Ngi xin ly h玭  頲 <color=yellow>%d ng祔<color> r錳, ",nDays);
	end;
	if (GetTask(TK_DATE_APPLYDIV) ~= 0) then
		Say(format("Nguy謙 L穙: %s kh玭g c莕 ph秈 xin ly h玭 n鱝.", str), 0);
		return
	end;
	
	Say(format("Tr╩ n╩ tu m韎 c� th� c飊g thuy襫, ng祅 ki誴 tu m韎 c� th� n猲 duy猲.Trong bi觧 ngi m猲h m玭g, g苝 nhau, thng y猽 nhau h� ph秈 chuy謓 d� d祅g! Кn phng ly h玭 c莕 n筽 ph�  <color=yellow>%d lng<color>. Ngi th藅 s� mu鑞 畂筺 tuy謙 m鑙 duy猲 n祔 ch�?",COSTOFSIMGLEDIV), 2,
		"Xin ly h玭 n phng/makesure_apply",
		"в ta xem l筰/no");
end;

--确认申请：单方面离婚
function makesure_apply()
	local nDate = GetCurServerTime();
	SetTask(TK_DATE_APPLYDIV, nDate);
	
	WriteLog(format("%s\tAccount:%s[Name:%s]  xin ly h玭 n phng.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName() ));	
	Say("Nguy謙 L穙: Tuy ngi  quy誸, nh璶g ch� e sau n祔 l筰 h鑙 h薾, ta s� cho ngi th阨 gian  suy ngh� l筰, m閠 tu莕 sau h穣 n g苝 ta.", 0);
	informother(Say, format("Ph鑙 ng蓇 %s  n g苝 Nguy謙 L穙 xin n phng ly h玭, 1 tu莕 sau s� t� ng <color=yellow>畂筺 tuy謙 quan h� ph鑙 ng蓇<color>.",GetName()), 0);
end;

--通知配偶
function informother(proc, ...)
	local Lover = GetMateName();
	if (Lover == "") then 
		return 1
	end;
	
	local nOldPlayer = PlayerIndex
	local nIdx = SearchPlayer(Lover);
	if (nIdx <= 0) then
		return 1;
	end;
	
	if (not proc or type(proc) ~= "function") then
		return 1;
	end;
	PlayerIndex = nIdx;
	call(proc, arg);
	
	PlayerIndex = nOldPlayer;
end;


--申请单方面离婚
function sure_process_dinglediv()
	if (check_marrystate() == 0) then
		return
	end;
	
	if (GetTask(TK_DATE_APPLYDIV) == 0) then
		Say("Nguy謙 L穙: Ngi mu鑞 xin n phng 畂筺 tuy謙 quan h� ph鑙 ng蓇?", 2,
			"Xin ly h玭 n phng/singlediv_apply",
			"Nh﹏ ti謓 gh� qua th玦/no");
		return
	end;
	
	local nDays = get_passdays();
	local str = "Th阨 gian xin ly h玭 ch璦  <color=yellow>1 ng祔<color>, ";
	if (nDays > 0) then
		str = format("ngi xin ly h玭 ch� m韎 <color=yellow>%d ng祔<color>, ",nDays);
	end;
	if (nDays < 7) then
		Say(format("Nguy謙 L穙: Ngi n鉵g l遪g qu� r錳, %s v蒼 ch璦  1 tu莕, h穣 quay v� suy ngh� cho k�.",str), 0);
		return 0;
	end;
	
	Say(format("Tr╩ n╩ tu m韎 c� th� c飊g thuy襫, ng祅 ki誴 tu m韎 c� th� n猲 duy猲.Trong bi觧 ngi m猲h m玭g, g苝 nhau, thng y猽 nhau h� ph秈 chuy謓 d� d祅g! Кn phng ly h玭 c莕 n筽 ph�  <color=yellow>%d lng<color>. Ngi th藅 s� mu鑞 畂筺 tuy謙 m鑙 duy猲 n祔 ch�?", COSTOFSIMGLEDIV), 2,
		"L祄 th� t鬰 ly h玭 n phng/process_dinglediv",
		"в ta xem l筰/no");
end;

--进行单方面离婚
function process_dinglediv()
	if (GetCash() < COSTOFSIMGLEDIV) then
		Say(format("Nguy謙 L穙: Кn phng ly h玭 c莕 n筽 <color=yellow>%d<color> lng, ti襫 ngi mang theo ch璦 !",COSTOFSIMGLEDIV), 0);
		return 0;
	end;
	
	if (Pay(COSTOFSIMGLEDIV) == 0) then
		return
	end;
	
	divorce_dateproc(PlayerIndex);
	WriteLog(format("%s\tAccount:%s[Name:%s]  ti課 h祅h n phng ly h玭.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName() ));
	Say("Nguy謙 L穙: Hi謓 gi� ngi  ly h玭 r錳, ngi c� th� 甶 t譵 t譶h y猽 ch th鵦  chung s鑞g nh鱪g ng祔 c遪 l筰.", 0);
	
	Msg2Player(format("Х n筽 <color=yellow>%d lng<color> l� ph� n phng ly h玭.", COSTOFSIMGLEDIV));
	Msg2Player("T譶h tr筺g h玭 nh﹏ hi謓 t筰 l� c th﹏.");
	informother(divorce_dateproc);
	informother(Say, format("Ph鑙 ng蓇 %s  n g苝 Nguy謙 L穙 xin <color=yellow>n phng ly h玭<color>, 畂筺 tuy謙 quan h� ph鑙 ng蓇 v韎 b筺.",GetName()), 0);
end;

--获得申请了多少天
function get_passdays()
	local nApplyDate = GetTask(TK_DATE_APPLYDIV);
	local nDate = GetCurServerTime();
	if (nApplyDate == 0 or nDate < nApplyDate) then
		return -1;
	end;
	
	local nDays = floor((nDate - nApplyDate) / TOTALSEC_OF_DAY);
	return nDays;
end;

--设置单方离婚设置
function divorce_dateproc()
	local nWorld67 = GetTask(67);
	nWorld67 = SetBit(nWorld67,24,0);
	SetTask(TK_DATE_APPLYDIV, 0);
	UnMarry();
	
	nRepute = GetRepute();				-- 声望相关处理
	if (nRepute > 10) then
		nRepute = 10;
	end;
	AddRepute(-1 * nRepute)								-- 声望10点(不足10点则降为0);
	
	nDivorceTimes = GetByte(nWorld67,2) + 1
	if (nDivorceTimes > 100) then
		nDivorceTimes = 100;
	end;
	nWorld67 = SetByte(nWorld67, 2, nDivorceTimes);
	SetTask(67,nWorld67);
end;

--检查婚姻和申请单方面离婚的状态
function check_marrystate()
	local nLvl = GetLevel();
	local nSex = GetSex();
	local bMarried = GetBit(GetTask(67),24);
	
	if (nLvl < 20) then
		Say("Nguy謙 L穙: ng a v韎 ta, ngi v蒼 ch璦 n tu鎖 th祅h gia l藀 th蕋.", 0);
		return 0;
	end;
	
	local str = "C� nng";
	if (nSex == 1) then
		str = "ch祅g trai";
	end;
	
	if (bMarried == 0) then
		Say(format("Nguy謙 L穙: ng a v韎 ta, ngi v蒼 ch璦 k誸 h玭 m� l筰 xin ly h玭, h穣 mau 甶 t譵 %s  k誸 h玭 甶.", str), 0);
		return 0;
	end;
	return 1;
end;
function check_married_team()
	local nOldPlayer = PlayerIndex;
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		return 1;
	end;
	local mem = {};
	mem[1] = GetTeamMember(1);
	mem[2] = GetTeamMember(2);
	local szName = "";
	for i = 1, nTeamSize do
		PlayerIndex = mem[i];
		if (check_married() == 1) then --如果单方面离婚了
			szName = GetName();
			SetBit(GetTask(67),24,0);
			SetTask(67,1);
		end;
		PlayerIndex = nOldPlayer;
	end;
	if (szName == "") then
		return 1
	end;
	
	local str = format("<color=yellow>Tr筺g th竔 h玭 nh﹏ %s  thay i<color>",szName)
	for i = 1, nTeamSize do
		OtherPlayer(mem[i], Msg2Player, str);
	end;
	return 1;
end;


function check_married()
	if (GetMateName() == "" and GetBit(GetTask(67),24) == 1) then
		return 1;
	end;
	return 0;
end;

----------------------- 七夕活动用9块爱恋巧克力换取奖励 ------------------
function chocolate()
	Say("9 mi課g s� c� la c� th� i 999 v筺 甶觤 kinh nghi謒, c騨g c� th� nh薾 l蕐 nh鱪g ph萵 thng b蕋 ng�, ngi ch鋘 lo筰 n祇?",3,"фi 999 v筺 甶觤 kinh nghi謒/chocolate_exp","фi ph莕 thng v藅 ph萴/chocolate_gift","Kh玭g c� g�, ta ch� 甶 ngang qua th玦!/no");
end

function chocolate_exp()
	local nNowDate = tonumber(date("%d"));
	if(CalcEquiproomItemCount( 6, 1, 833, 1) < 9) then
		Say("H譶h nh� tr猲 ngi kh玭g c�  9 mi課g s� c� la th� ph秈? Nh� y m閠 mi課g c騨g kh玭g th� thi誹 !",0);
		return
	end
	if(GetTask(1564) == nNowDate) then
		if(GetTask(1565) > 0) then
			Say("N誹 l蕐 s� c� la i 甶觤 kinh nghi謒 th� m閠 ng祔 ch� c� th� i m閠 l莕 th玦, h琻 n鱝 ngi gi�  ng n猲 ╪ nhi襲  ng鋞.",0);
			return
		end
		ConsumeEquiproomItem( 9, 6, 1, 833, 1);
		AddOwnExp(9990000);
		SetTask(1565,GetTask(1565)+1);
	else
		ConsumeEquiproomItem( 9, 6, 1, 833, 1);
		AddOwnExp(9990000);
		SetTask(1565,1);
		SetTask(1564,nNowDate);
	end
end

function chocolate_gift()
	if(CalcEquiproomItemCount( 6, 1, 833, 1) < 9) then
		Say("H譶h nh� tr猲 ngi kh玭g c�  9 mi課g s� c� la th� ph秈? Nh� y m閠 mi課g c騨g kh玭g th� thi誹 !",0);
		return
	end
	ConsumeEquiproomItem( 9, 6, 1, 833, 1);	
	local i = random(1,1000);
	if(i <= 300) then
		AddEventItem(353);
		Msg2Player("B筺 nh薾 頲 1 Tinh H錸g B秓 Th筩h");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T筰 l� h閕 th竛g b秠 nh薾 頲 m閠 vi猲 Tinh H錸g B秓 Th筩h");	
	elseif(i > 300 and i <= 460) then
		AddEventItem(238);
		Msg2Player("B筺 nh薾 頲 1 Lam Th駓 Tinh");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T筰 l� h閕 th竛g b秠 nh薾 頲 m閠 vi猲 Lam Th駓 Tinh");		
	elseif(i > 460 and i <= 620) then
		AddEventItem(240);
		Msg2Player("B筺 nh薾 頲 1 L鬰 Th駓 Tinh");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T筰 l� h閕 th竛g b秠 nh薾 頲  m閠 vi猲 L鬰 Th駓 Tinh");		
	elseif(i > 620 and i <= 800) then
		AddEventItem(239);
		Msg2Player("B筺 nh薾 頲 1 T� Th駓 Tinh");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T筰 l� h閕 th竛g b秠 nh薾 頲 m閠 vi猲 T� Th駓 Tinh");		
	elseif(i > 800 and i <= 949) then
		AddItem(6,1,147,6,0,0);
		Msg2Player("B筺 nh薾 頲 1 Huy襫 Tinh Kho竛g Th筩h c蕄 6");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T筰 l� h閕 th竛g b秠 nh薾 頲 m閠 vi猲 Huy襫 Tinh Kho竛g Th筩h c蕄 6 ");		
	elseif(i > 949 and i <= 979) then
		AddItem(6,1,147,7,0,0);
		Msg2Player("Ngi nh薾 頲 m閠 vi猲 Huy襫 Tinh Kho竛g Th筩h c蕄 7");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T筰 l� h閕 th竛g b秠 nh薾 頲 m閠 vi猲 Huy襫 Tinh Kho竛g Th筩h c蕄 7");		
	elseif(i > 979 and i <= 989) then
		AddItem(6,1,147,8,0,0);
		Msg2Player("B筺 nh薾 頲 1 Huy襫 Tinh Kho竛g Th筩h c蕄 8");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T筰 l� h閕 th竛g b秠 nh薾 頲 m閠 vi猲 Huy襫 Tinh Kho竛g Th筩h c蕄 8");		
	elseif(i > 989 and i <= 990) then
		AddItem(6,1,147,9,0,0);
		Msg2Player("B筺 nh薾 頲 1 Huy襫 Tinh Kho竛g Th筩h c蕄 9");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T筰 l� h閕 th竛g b秠 nh薾 頲 m閠 vi猲 Huy襫 Tinh Kho竛g Th筩h c蕄 9");		
	elseif(i > 990 and i <= 1000) then
		AddItem(6,1,398,9,0,0);
		Msg2Player("B筺 nh薾 頲 1 Kho竛g Th筩h Th莕 B�.");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T筰 l� h閕 th竛g b秠 nh薾 頲 m閠 vi猲 Kho竛g Th筩h Th莕 B� ");		
	else
	end
end
----------------------- 七夕活动用9块爱恋巧克力换取奖励 ------------------

----------------------- 通用功能函数 ------------------
function default_talk()			-- 缺省对话
	Talk(1,"","N誹 hai b猲  c� � v韎 nhau, ch� c莕  trng th祅h v� ch璦 k誸 h玭 v韎 ai, c飊g nhau n y ta s� t竎 h頿 lng duy猲. Ngi h穣 n鉯 � mu鑞 c莡 th﹏ v韎 ta, ta s� thay ngi chuy觧 cho ngi 蕐, gi髉 ngi t竎 th祅h h玭 s�!")
end

function check_team()
	Player1_ID = GetTeamMember(1)
	Player2_ID = GetTeamMember(2)
-- 查询队伍中的女性成员，若有则记录她的ID到临时变量
	if (OtherPlayer(Player2_ID,GetSex) == 1) then
		His_ID = Player1_ID
		Her_ID = Player2_ID
		Her_world67 = OtherPlayer(Her_ID,GetTask,67)
		His_world67 = OtherPlayer(His_ID,GetTask,67)
	elseif (OtherPlayer(Player1_ID,GetSex) == 1) then
		His_ID = Player2_ID
		Her_ID = Player1_ID
		Her_world67 = OtherPlayer(Her_ID,GetTask,67)
		His_world67 = OtherPlayer(His_ID,GetTask,67)
	else
		His_ID = 0
		Her_ID = 0
	end
	return His_ID,Her_ID,His_world67,Her_world67
end

function do_qmarry_cancel()
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (OtherPlayer(His_ID,GetTaskTemp,0,5) == 1) and (OtherPlayer(Her_ID,GetTaskTemp,0,5) == 1) and (OtherPlayer(Her_ID,GetTaskTemp,0,6) == His_ID) and (OtherPlayer(His_ID,GetTaskTemp,0,7) == Her_ID) then	-- 双方数据能对上，允许删除
		OtherPlayer(His_ID,SetTaskTemp,5,0)
		OtherPlayer(His_ID,SetTaskTemp,6,0)
		OtherPlayer(His_ID,SetTaskTemp,7,0)
		OtherPlayer(Her_ID,SetTaskTemp,5,0)
		OtherPlayer(Her_ID,SetTaskTemp,6,0)
		OtherPlayer(Her_ID,SetTaskTemp,7,0)
--		Msg2Player("求婚取消成功。")
--	else
--		Msg2Player("无法取消求婚。")
	end
end

function OtherPlayer_talk(PlayerId, msg)		-- 为别人发消息
	OldPlayer = PlayerIndex
	PlayerIndex = PlayerId
	Talk(1,"",msg)
	PlayerIndex = OldPlayer
end
----------------------- 求婚相关 -----------------------
function Qmarry()			-- 求婚以及结婚合法性检测
	if (GetFaction() == "shaolin") or (GetFaction() == "emei") then		-- 和尚尼姑不准结婚
		Talk(1,"","Ngi l� ngi xu蕋 gia sao d竚 ngh� n chuy謓 h錸g tr莕? Hay  v鴗 b� h誸 m玭 quy?")
	elseif (GetSex() == 1) then											-- 普通的对女性的说话
		Talk(1,"","Chuy謓 th祅h th﹏ n祔, 阯g 阯g l� m閠 c� g竔 nh� ngi sao l筰 ch� ng th竔 qu� v藋? H穣  t﹏ lang n c莡 th﹏!")
	elseif (GetTeamSize() ~= 2) or (IsCaptain() ~= 1) then		-- (队伍人员不对)或(自己不是队长)，转缺省对话
		default_talk()
	else					-- 检测各种条件，并且开始求婚过程
		His_ID,Her_ID,His_world67,Her_world67 = check_team();
--		check_married_team();
		if (Her_ID == 0) then				-- 队伍中无女性成员，转缺省对话
			Talk(1,"","Hai v� 阯g 阯g l� i nam nh﹏ l筰 mu鑞 k誸 h玭 g� ch�? ng 甧m l穙 gi� n祔 ra a gi靚!")
--			default_talk()
		elseif (OtherPlayer(Her_ID,GetFaction) == "emei") then		-- 不准娶尼姑
			Talk(1,"","Mu鑞 ci ni c� sao? N誹 c竎 ngi th藅 t﹎ y猽 nhau, t鑤 nh蕋 h穣 n khuy猲 c� ta ho祅 t鬰!")
		elseif (GetBit(His_world67,24) == 1) then				-- 男方已婚
			Talk(1,"","Ngi  c� th� t� r錳! L� n祇 l筰 mu鑞 tam th� t� thi誴!?")
		elseif (GetBit(Her_world67,24) == 1) then		-- 女方已婚
			Talk(1,"","<#> Ngi ta"..OtherPlayer(Her_ID,GetName).."<#>  g� qua r錳, sao c� th� m閠 v� g� cho hai ch錸g 頲!")
		elseif (GetLevel() < 20) or (OtherPlayer(Her_ID,GetLevel) < 20) then		-- 有人等级不够
			Talk(1,"","Tu鎖 ngi c遪 nh�, vi謈 h玭 nh﹏ i s� i n l骳 trng th祅h h穣 t輓h!")
		else									-- 符合所有条件
			SetTaskTemp(7,Her_ID)
			SetTaskTemp(6,His_ID)
			Say("Ch祅g trai tr�! C� ph秈 mu鑞 k誸 duy猲 c飊g c� g竔 b猲 c筺h ngi?",2,"D�! Con mu鑞 h醝 ci c� ta/qmarry_get","Kh玭g, ch髇g ta ch� t譶h c� 甶 ngang qua th玦/qmarry_no")
		end
	end
end

function qmarry_get()			-- 男方：启动提亲
	SetTaskTemp(5,1)
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (GetTeamSize() ~= 2) or (GetTaskTemp(7) ~= Her_ID) then			-- 队伍发生了改变，拒绝。。。
		Talk(1,"","Ngi do d� qu� l﹗, c� nng   甶 m蕋 r錳!")
	else
		Her_Name = OtherPlayer(Her_ID,GetName)
		Talk(1,"","<#> T鑤! Ngi v� "..Her_Name.."<#> qu� nhi猲 tr阨 sinh m閠 c苝, ta l藀 t鴆 n n鉯 v韎 c� 蕐 xem � ki課 th� n祇.")
		Msg2Player("<#> B筺 quy誸 nh c莡 h玭 "..Her_Name.."<#> 甧m t﹎ t� c馻 m譶h n鉯 cho Nguy謙 H� L穙 Nh﹏ nghe xong, b総 u im l苙g ch� i s� ph秐 鴑g c馻 c� ta.")
		OtherPlayer(Her_ID,Msg2Player,GetName().."<#> c莡 h玭 v韎 ngi, ngi ng � g� cho anh ta kh玭g? Mau 甧m nh鱪g t﹎ t� trong l遪g n鉯  cho Nguy謙 H� L穙 Nh﹏ nghe 甶.")
		OtherPlayer(Her_ID,SetTaskTemp,5,1)
		OtherPlayer(Her_ID,SetTaskTemp,6,His_ID)
		OtherPlayer(Her_ID,SetTaskTemp,7,Her_ID)
	end
end

function male_cancel()			-- 男方：取消提亲
	do_qmarry_cancel()
	Talk(1,"","Cng 衟 kh玭g h筺h ph骳, n誹 c� ta nh蕋 th阨 ch璦 th� quy誸 nh 頲 th� nh ph秈 i 1 th阨 gian sau hay t輓h!")
	Msg2Player("Ngi p trc m苩 ngi l筰 t� v� nh髏 nh竧, b� � ni謒 c莡 h玭 v韎 c� 蕐.")
	OtherPlayer(Her_ID,Msg2Player,GetName().."<#> t� ch鑙 l阨 c莡 h玭 c馻 b筺.")		-- 消息是发到女方，注意消息内容相符
end

function male_hurry()		-- 求婚：催促
	Her_ID = GetTaskTemp(7)
	OtherPlayer(Her_ID,Msg2Player,GetName().."<#> c莡 h錸 v韎 ngi, ngi ng � g� cho anh ta kh玭g? Mau 甧m nh鱪g t﹎ t� trong l遪g n鉯  cho Nguy謙 H� L穙 Nh﹏ nghe 甶!")
end

----------------------- 答复求婚、确认婚姻 -------------
function female_cancel()		-- 女方：拒绝提亲
	do_qmarry_cancel()
	Talk(1,"","Ngi kh玭g b籲g l遪g, ta nh ph秈 b竜 tin n祔 cho h緉 th玦!")
	Msg2Player("Con c鉩 m� c� tng l� Thi猲 nga? B筺  ko do d� c� tuy謙 ngay l阨 c莡 h玭 n祔.")
	OtherPlayer(His_ID,Msg2Player,GetName().."<#>  c� tuy謙 l阨 c莡 h玭 c馻 ngi, ti觰 t� ti誴 t鬰 c� g緉g l猲!")
end

function female_yes()			-- 女方：接受提亲
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	His_Name	= OtherPlayer(His_ID,GetName)
	Her_Name	= GetName()
	if (GetBit(Her_world67,24) == 1) then				-- 已婚
		Talk(1,"","Ngi  c� phu qu﹏, sao c遪 mu鑞 l蕐 ngi kh竎?")
	elseif (GetTeamSize() ~= 2) then		-- 队伍人数已改变
		Talk(1,"","Ta c遪 ch璦 th蕐 t﹏ lang c馻 ngi. N誹 ngi mu鑞 ta t竎 h頿, ph秈 c飊g nhau n n鉯 chuy謓 v韎 ta!")
	elseif (His_ID ~= GetTaskTemp(6)) then			-- 队长不是求婚者
		Talk(1,"","H譶h nh� ngi mu鑞 c莡 h玭 v韎 ngi kh竎 ch╪g? R鑤 cu閏 ngi mu鑞 l蕐 ai y? Ta c� ch髏 m� h�!")
	else				-- 数据已经对上，进行结婚处理
		DoMarry(GetTeam())
		
				-- 在这里判断婚姻关系是否真正确立，否则直接返回 by zero 2007/06/27
		local szMaleName, szFemaleName = "","";
		local nOldPlayerIndex = PlayerIndex;
		
			PlayerIndex = His_ID;
			szMaleName = GetMateName();
			PlayerIndex = nOldPlayerIndex;
			szFemaleName = GetMateName();
			
		if szMaleName == "" or szFemaleName=="" then
			Msg2Player("<color=yellow>Ch璦 t筼 頲 quan h� ph鑙 ng蓇, h穣 th� l筰 sau!<color>");
			OtherPlayer(His_ID, Msg2Player, "<color=yellow>Ch璦 t筼 頲 quan h� ph鑙 ng蓇, h穣 th� l筰 sau!<color>");
			return
		end;
		
		
		SetTaskTemp(5,0)		--取消求婚状态
		SetTaskTemp(6,0)
		SetTaskTemp(7,0)
		OtherPlayer(His_ID,SetTaskTemp,5,0)
		OtherPlayer(His_ID,SetTaskTemp,6,0)
		OtherPlayer(His_ID,SetTaskTemp,7,0)
		Her_world67 = SetBit(Her_world67,24,1)		-- 设置结婚变量
		His_world67 = SetBit(His_world67,24,1)
		if (GetBit(Her_world67,2) == 0) and (GetLevel() >= 50) then		-- 女方送戒指
			Her_world67 = SetBit(Her_world67,2,1)		-- 设置结婚变量（已送戒指）
			present_ring(Her_ID)
		end
		if (GetBit(His_world67,2) == 0) and (OtherPlayer(His_ID,GetLevel) >= 50) then		-- 男方送戒指
			His_world67 = SetBit(His_world67,2,1)		-- 设置结婚变量（已送戒指）
			present_ring(His_ID)
		end
		SetTask(67,Her_world67)
		OtherPlayer(His_ID,SetTask,67,His_world67)

		Msg2Player("<#> B筺  ch蕄 nh薾 l阨 c莡 h玭 c馻 "..His_Name.."<#> ch骳 m鮪g hai  v� b竎h ni猲 giai l穙, tr╩ n╩ h筺h ph骳!")
		OtherPlayer(His_ID, Msg2Player, Her_Name.."<#>  ti誴 nh薾 l阨 c莡 h玭 c馻 b筺, ch骳 m鮪g hai v� b竎h ni猲 giai l穙, tr╩ n╩ h筺h ph骳!")
		OtherPlayer_talk(His_ID, "Ch骳 m鮪g hai v�, d﹜ t� h錸g  th総 ch苩 m鑙 lng duy猲 n祔 r錳!")
		OtherPlayer_talk(Her_ID, "Ch骳 m鮪g hai v�, d﹜ t� h錸g  th総 ch苩 m鑙 lng duy猲 n祔 r錳!")
		AddGlobalCountNews("<#> ch髇g ta c飊g ch骳 m鮪g"..His_Name.."<#> v韎"..GetName().."<#> hai v� t﹏ nh﹏ v躰h k誸 ng t﹎, b竎h ni猲 giai l穙!",3)
		
	end
end

function present_ring(PlayerId)			-- 送戒指（判断、置变量已移至结婚过程中）
	OldPlayer = PlayerIndex
	PlayerIndex = PlayerId

	item_level = floor(GetLevel() / 10) + 2
	if (item_level > 10) then
		item_level = 10
	end
--	item_lucky = (item_level - 3) * 5
	p = {0,0,0,0,0,0}
	j = item_level - 6
	if (j > 6) then j = 6 end
	for i=1,j do
		if (item_level - i - 2 < 0) then
			p[i] = 0
		else
			p[i] = item_level - i - 2
		end
	end
	AddItem(0,3,0,item_level,random(0,4),5,p[1],p[2],p[3],p[4],p[5],p[6])
	Msg2Player("Nguy謙 L穙 t苙g cho b筺 m閠 chi誧 nh蒼 ")
	PlayerIndex = OldPlayer
end

----------------------- 修复婚姻关系 -------------------
function fix_marry()
	if( GetTeamSize() == 2 ) then
		His_ID,Her_ID,His_world67,Her_world67 = check_team()
		His_Name = GetName()
		Her_Name = OtherPlayer(Her_ID,GetName)
		if (His_ID ~= 0) and (Her_ID ~= 0) and (GetBit(His_world67,24) == 1) and (GetBit(Her_world67,24) == 1) and (OtherPlayer(His_ID,GetMateName) == "") and (OtherPlayer(Her_ID,GetMateName) == "") then		-- 异性、两人队伍、均已婚，则视为允许修复
			Talk(1,"","V� ch錸g c穒 nhau l� chuy謓 b譶h thng, ch衝 trong s鉵g c遪 khua, ng v� chuy謓 n祔 m� th� h薾 nhau. N祇, l筰 y! N緈 tay nhau h遖 gi秈!")
			DoMarry(GetTeam())
			Msg2Player("<#> B筺 v� "..Her_Name.."<#>  ph鬰 h錳 quan h� ph鑙 ng蓇")
			OtherPlayer(Her_ID,Msg2Player,"<#> B筺 v� "..His_Name.."<#>  ph鬰 h錳 quan h� ph鑙 ng蓇")
		elseif (GetBit(GetTask(67),24) == 1) and (GetMateName() == "") then			-- 可能修复，但对方条件不成立
			if (GetSex() == 0) then
				Talk(1,"","V� ch錸g c穒 nhau l� chuy謓 b譶h thng, ch衝 trong s鉵g c遪 khua. Th� n祔 nh�, ngi d総 v� t韎 y  ta khuy猲 nh� c� ta!")
			else
				Talk(1,"","V� ch錸g c穒 nhau l� chuy謓 b譶h thng, ch衝 trong s鉵g c遪 khua. Th� n祔 nh�, ngi c飊g ch錸g t韎 y  ta khuy猲 nh� h緉!")
			end
		else			-- 自己条件不成立
			if (GetSex() == 0) then
				Talk(1,"","R� r祅g l� kh玭g c� chuy謓 g�, ch祅g trai tr� nh tr猽 c顃 gi� n祔 ch╪g?")
			else
				Talk(1,"","R� r祅g l� kh玭g c� chuy謓 g�, c� nng ng n鉯 d鑙!")
			end
		end
	else
		if (GetSex() == 0) then
			Talk(1,"","V� ch錸g c穒 nhau l� chuy謓 b譶h thng, ch衝 trong s鉵g c遪 khua. Th� n祔 nh�, ngi d総 v� t韎 y  ta khuy猲 nh� c� ta!")
		else
			Talk(1,"","V� ch錸g c穒 nhau l� chuy謓 b譶h thng, ch衝 trong s鉵g c遪 khua. Th� n祔 nh�, ngi c飊g ch錸g t韎 y  ta khuy猲 nh� h緉!")
		end
	end
end

----------------------- 离婚相关 -----------------------
function divorce()
	if (GetTeamSize() == 2) and (IsCaptain() == 1) then		-- 组队、人数为2、自己是队长
		His_ID,Her_ID,His_world67,Her_world67 = check_team()
		His_Name = OtherPlayer(His_ID,GetName)
		Her_Name = OtherPlayer(Her_ID,GetName)
		if (GetBit(His_world67,24) == 1) and (OtherPlayer(His_ID,GetMateName) == Her_Name) and (GetBit(Her_world67,24) == 1) and (OtherPlayer(Her_ID,GetMateName) == His_Name) then		-- 双方结婚关系正确
			Say("Ly h玭 kh玭g ph秈 l� tr� a, ngi trong giang h� s� v� chuy謓 ly h玭 m� nh gi� th蕄 c竎 ngi. C� mu鑞 suy ngh� l筰 kh玭g?",2,"Ch髇g ta  quy誸 nh r錳, xin l祄 th� t鬰 ly d� 甶!/divorce_yes","в ta suy ngh� k� l筰 xem/no")
		else
			Talk(1,"","R鑤 cu閏 ngi mu鑞 ly h玭 v韎 ai? Ngi n祔 v鑞 kh玭g ph秈 l� ngi ph鑙 ng蓇 c馻 ngi!")
		end
	else
		Talk(1,"","N誹 nh蕋 nh mu鑞 ly h玭, ph秈 c飊g v� ngi n l祄 th� t鬰 ly h玭!")
	end
end

function divorce_yes()
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (GetTeamSize() ~= 2) or (His_ID == 0) or (Her_ID == 0) or (OtherPlayer(His_ID,GetMateName) ~= Her_Name) or (OtherPlayer(Her_ID,GetMateName) ~= His_Name) then			-- 复查组队状态
		Talk(1,"","Ngi do d� qu� l﹗, ph鑙 ng蓇 c馻 ngi  甶 r錳!")
	elseif (GetCash() >= 50000) then
		Pay(50000)
		UnMarry(GetTeam())						-- 解除婚姻关系]
--Msg2Player("His_world67="..His_world67.."  Her_world67="..Her_world67)
		His_repute = OtherPlayer(His_ID,GetRepute)				-- 男方相关处理
		if (His_repute > 10) then His_repute = 10 end
		OtherPlayer(His_ID,AddRepute,-1 * His_repute)								-- 减男方声望10点(不足10点则降为0)
		His_DivorceTimes = GetByte(His_world67,2) + 1								-- 计算离婚次数
		if (His_DivorceTimes > 100) then His_DivorceTimes = 100 end			-- 超过100次不再记录
		His_world67 = SetByte(His_world67,2,His_DivorceTimes)						-- 离婚次数写入
		His_world67 = SetBit(His_world67,24,0)											-- 婚姻状态
--Msg2Player("His_world67="..His_world67)
		OtherPlayer_talk(His_ID,"N誹 v藋匟i謓 t筰 h玭 nh﹏ c馻 hai ngi  頲 h駓 b�! Ngi  kh玦 ph鬰 t� do r錳.")		-- 为双方发离婚消息
		Her_repute = OtherPlayer(Her_ID,GetRepute)				-- 女方相关处理
		if (Her_repute > 10) then Her_repute = 10 end
		OtherPlayer(Her_ID,AddRepute,-1 * Her_repute)								-- 减女方声望10点(不足10点则降为0)
		Her_DivorceTimes = GetByte(Her_world67,2) + 1
		if (Her_DivorceTimes > 100) then Her_DivorceTimes = 100 end
		Her_world67 = SetByte(Her_world67,2,Her_DivorceTimes)
		Her_world67 = SetBit(Her_world67,24,0)
--Msg2Player("Her_world67="..Her_world67)

		OtherPlayer(His_ID,SetTask,67,His_world67)
		OtherPlayer(Her_ID,SetTask,67,Her_world67)
		OtherPlayer_talk(Her_ID,"N誹 v藋匟i謓 t筰 h玭 nh﹏ c馻 hai ngi  頲 h駓 b�! Ngi  kh玦 ph鬰 t� do r錳.")
	else
		Talk(1,"","Ngi ch璦 mang  ph� th� t鬰, c莕 ph秈 c� 5 v筺 lng l祄 th� t鬰!")
	end
end

----------------------- 合欢包相关 ---------------------
function gather_bonus()
	Say("Kh玭g sai, 3 Bao h頿 hoan, 3 kh╪ Uy猲 Μng v� 3 N� t譶h � th� c� th� i 1 vi猲 Th駓 Tinh v� 1 T﹎ T﹎ Tng 竛h ph�; \n 2 Bao h頿 hoan, 2 kh╪ Uy猲 Μng v� 2 N� t譶h � c� th� i 1 vi猲 Ng﹏ Nguy猲 B秓 v� 1 T﹎ T﹎ Tng 竛h ph�; \n 1 Bao h頿 hoan, 1 kh╪ Uy猲 Μng v� 1 N�  t譶h � c� th� i 1 T﹎ T﹎ Tng 竛h ph�. \n ngi mu鑞 i lo筰 n祇?",4,"Ta i Th駓 Tinh v� T﹎ T﹎ Tng 竛h ph� /gather_bonus1","Ta i Ng﹏ Nguy猲 B秓 v� T﹎ T﹎ Tng 竛h ph� /gather_bonus2","Ta ch� i T﹎ T﹎ Tng 竛h ph� /gather_bonus3","Oh, xin l鏸, ta nh� nh莔!/no")
end

function gather_bonus1()
	if (GetItemCount(344) >= 3) then				-- 合欢包
		if (GetItemCount(345) >= 3) then			-- 鸳鸯帕
			if (GetItemCount(346) >= 3) then		-- 情意结
				for i=1,3 do
					DelItem(346)
					DelItem(345)
					DelItem(344)
				end
				AddItem(6,1,18,1,0,0,0)			-- 心心相印符
				i = 238 + random(0,2)		-- 随机给一颗宝石
				AddEventItem(i)
				Talk(1,"","Hay l緈! Ta t苙g ngi 1 vi猲 th駓 tinh v� 1 t蕀 T﹎ T﹎ Tng 竛h Ph�. уng th阨 ch骳 t譶h y猽 hai ngi g緉 b� keo s琻!")
			else
				Talk(1,"","Ngi kh玭g c� 3 c竔 N� T譶h �, t譵  r錳 h穣 i nh�!")
			end
		else
			Talk(1,"","Ngi kh玭g c� 3 c竔 Kh╪ Uy猲 Μng, t譵  r錳 h穣 i nh�!")
		end
	else
		Talk(1,"","Ngi kh玭g c� 3 c竔 Bao h頿 hoan, t譵  r錳 h穣 i nh�!")
	end
end

function gather_bonus2()
	if (GetItemCount(344) >= 2) then				-- 合欢包
		if (GetItemCount(345) >= 2) then			-- 鸳鸯帕
			if (GetItemCount(346) >= 2) then		-- 情意结
				for i=1,2 do
					DelItem(346)
					DelItem(345)
					DelItem(344)
				end
				AddItem(6,1,18,1,0,0,0)			-- 心心相印符
				AddEventItem(342)
				Talk(1,"","Hay l緈! Ta t苙g ngi 1 Ng﹏ Nguy猲 b秓 v� 1 t蕀 T﹎ T﹎ Tng 竛h Ph�. уng th阨 ch骳 t譶h y猽 hai ngi g緉 b� keo s琻!")
			else
				Talk(1,"","Ngi kh玭g c� 2 c竔 N� T譶h �, t譵  r錳 h穣 i nh�!")
			end
		else
			Talk(1,"","Ngi kh玭g c� 2 c竔 Kh╪ Uy猲 Μng, t譵  r錳 h穣 i nh�!")
		end
	else
		Talk(1,"","Ngi kh玭g c� 2 c竔 Bao h頿 hoan, t譵  r錳 h穣 i nh�!")
	end
end

function gather_bonus3()
	if (HaveItem(344) == 1) then				-- 合欢包
		if (HaveItem(345) == 1) then			-- 鸳鸯帕
			DelItem(344)
			DelItem(345)
			AddItem(6,1,18,1,0,0,0)			-- 心心相印符
			Talk(1,"","Hay l緈! Ta t苙g ngi 1 t蕀 T﹎ T﹎ Tng 竛h Ph�. уng th阨 ch骳 t譶h y猽 hai ngi g緉 b� keo s琻!")
		else
			Talk(1,"","Ngi kh玭g c� Kh╪ Uy猲 Μng, t譵  r錳 h穣 i nh�!")
		end
	else
		Talk(1,"","Ngi kh玭g c� Bao h頿 hoan, t譵  r錳 h穣 i nh�!")
	end
end

-------------- 2004-8-22 七夕送礼活动 ------------------
function present_QiXi( nPlayerIndex )
	local nPreservedPlayerIndex = PlayerIndex;
	
	PlayerIndex = nPlayerIndex;

	Talk( "H玬 nay ng v祇 r籱 th竛g b秠, Nguy謙 L穙 s� t苙g m閠 m鉵 qu� c bi謙! Ch骳 ph骳 2 ngi u b筩 r╪g long!" );
	-- 送2个“心心相印符”
	for i = 1, 2 do
		AddItem( 6, 1, 18, 1, 0, 0 ,0);
	end
	Msg2Player( "B筺 nh薾 頲 2 T﹎ T﹎ Tng 竛h ph�!" );
	-- 送9朵“玫瑰花”
	for i = 1, 9 do
		AddItem( 6, 0, 20, 1, 0, 0 ,0);
	end	
	Msg2Player( "B筺 nh薾 頲  9 b玭g hoa h錸g!" );
	-- 50级以上玩家加送1个“天山玉露”
	if( GetLevel() >= 50 ) then
		AddItem(6, 1, 72, 1, 0, 0, 0);
		Msg2Player( "B筺 nh薾 頲 m閠 b譶h Thi猲 S琻 B秓 L�!" );
	end
	
	PlayerIndex = nPreservedPlayerIndex;
end

----------------------- end ----------------------------
function no()
end