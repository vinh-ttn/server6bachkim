--两湖区 衡山派 独孤剑对话 世界任务：武林向背
-- By: Dan_Deng(2004-02-03)

Include("\\script\\global\\repute_head.lua")
Include("\\script\\global\\chuangong.lua")
Include("\\script\\task\\lv120skill\\head.lua")		-- 120级技能任务

Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()

	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	tbDailog.szTitleMsg = "<npc>L﹗ ng祔 kh玭g g苝! T譵 ta c� vi謈 g�?"
	tbDailog:AddOptEntry("Ta n b竔 ph醤g Minh ch�.", old_main)
	tbDailog:AddOptEntry("Minh Ch� ngi c� bi誸 Nguy謙 Ca Фo n祔 c� t錸 t筰 th藅 hay kh玭g?", yuegedao_help)
	tbDailog:Show()
	
--	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
--		Describe(strimg..GetName().."好久不见了，近日找我有什么事？",3,"我是特来拜访一下盟主你。/old_main", "我想打听关于传功的事情。/chuangong_info", "我想取消上次的传功申请!/cg_undo")
--	else
--		Describe(strimg..GetName().."好久不见了，近日找我有什么事？",2,"我是特来拜访一下盟主你。/old_main", "我想打听关于传功的事情。/chuangong_info" )
--		Describe(strimg..GetName().."好久不见了，近日找我有什么事？",1,"我是特来拜访一下盟主你。/old_main");
--	end
end

function old_main()
	Uworld39 = GetTask(39)
	Uworld40 = GetTask(40)
	Udate = tonumber(date("%Y%m%d"))						-- 需要转换成数值才能直接进行比较
	if (Uworld39 == 10) then									-- 任务进行中
		if (Uworld40 == 1023) then									-- bin(1111111111)，任务完成
			U39_prise()
		else
			Talk(1,"U39_progress", 11332)
		end
	elseif (Uworld39 == 0) or ((Udate > Uworld39) and (Uworld39 > 20040101)) then			-- 任务启动条件：大于20级，声望等级大于2级，任务未做过或已完成超过1日
		if (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >= 2) then
			Say(11333 ,2,"Kh玭g th祅h v蕁 , ta c� th� l祄 頲. /U39_yes","Ta hi謓 r蕋 b薾,  khi kh竎 n鉯 ti誴. /no")
		else
			Talk(3,"", 11334, 11335, 11336)
		end
	elseif (Uworld39 >= Udate) then								-- 任务已完成，未到重复时间
		Talk(2,"", 11337, 11338)
	else																	-- 其它(???)
		Talk(1,"", 11339)
		SetTask(39,0)
		SetTask(40,0)
	end
end;

function U39_yes()
	Talk(1,"", 11340)
	SetTask(39,10)
	SetTask(40,0)
	Earn(10000)
	Msg2Player("Ti誴 nh薾 nhi謒 v� Th竔  V� L﹎: Thay чc C� Ki誱 甶 th╩ d� th竔  c竎 m玭 ph竔 c� ng l遪g li猲 k誸 di謙 nc Kim hay kh玭g. ")
	AddNote("Ti誴 nh薾 nhi謒 v� Th竔  V� L﹎: Thay чc C� Ki誱 甶 th╩ d� th竔  c竎 m玭 ph竔 c� ng l遪g li猲 k誸 di謙 nc Kim hay kh玭g. ")
end

function U39_prise()
	Talk(2,"", 11341, 11342)
	SetTask(39,date("%Y%m%d"))					-- 变量改为当前日期
	SetTask(40,0)									-- 子变量复位
	i = 10+random(1,10)							-- 声望随机奖励11---20点
	AddRepute(i)
	Msg2Player("Ho祅 th祅h nhi謒 v� Th竔  V� L﹎ c馻 чc C� Ki誱, danh v鋘g c馻 b筺 t╪g "..i.."甶觤.")
	AddNote("Quay l筰 Ho祅h s琻 Чi ёnh, ho祅 th祅h nhi謒 v� Th竔  V� L﹎ c馻 чc C� Ki誱. ")
end

function U39_progress()
	Uworld40 = GetTask(40)
	faction_list = {"Nga My ph竔","Л阯g M玭","Thi猲 Vng Bang","Thi猲 Nh蒼 Gi竜","V� ng ph竔","Th髖 Y猲 m玭","Thi誹 L﹎ ph竔","C竔 Bang","C玭 L玭 ph竔","Ng� чc Gi竜"}
	str = ""
	for i = 1,10 do									-- 检查已置位的门派，列表顺序如上面数组顺序
		if (GetBit(Uworld40,i) == 1) then
			if (str == "") then
				str = faction_list[i]
			else
--				str = str + "、" + faction_list[i]
--				str = format("%s、%d", str, faction_list[i])
				str = str..", "..faction_list[i]
			end
		end
	end
	if (str == "") then								-- 根据检查结果相应对话
		Talk(1,"", 11343)
	else
		Talk(1,"","Ngi hi謓 gi�  甶 甶襲 tra 頲 c竎 m玭 ph竔: "..str..", hy v鋘g c� th� nhanh m閠 ch髏. ")
	end
end

function no()
end

function biguan_talk()
	if (GetLevel() < 120) then
		describe_talk({npc_string(1, "Ngi v蒼 ch璦 t c蕄 120, c玭g l鵦 h穣 c遪 non k衜, t鑤 nh蕋 ng nh髇g tay v祇 vi謈 n祔.")})
	elseif (GetLastFactionNumber() == -1) then
		describe_talk({npc_string(1, "Ngi v� m玭 v� ph竔, ta v� ngi c騨g ch糿g li猲 can g� v韎 nhau.")})
	else
		local szTemp = "Huynh "
		if (GetSex() == 1) then
			szTemp = "N� hi謕"
		end
		local tDialog =
		{
			npc_string(1, "V�"..szTemp.." n祔, h錳 n穣 ta  tuy猲 b� c玭g vi謈 c馻 li猲 minh  c�  t� 甶 l祄 r錳, ngi c遪 n t譵 ta c� g�  l祄?"),
			speak_string(1, "Ch糿g d竚 gi蕌 minh ch�, ta v� chuy謓 b� quan c馻 玭g m� n y. Trong m総 c竎 nh﹏ s� v� l﹎, th阨 gian n祔 c騨g t筸 g鋓 l� th竔 b譶h, kh玭g c� ch輓h s� binh bi課 g�. Nh璶g quy誸 nh c馻 玭g xem ra h琲 kh竎 thng, kh玭g ch鮪g s� g﹜ 輙 nhi襲 l阨 n th錳, giang h� l筰 th猰 m閠 phen b蕋 an."),
			npc_string(1, "Giang h� trc nay lu玭 r蕋 nh箉 c秏, ch綾 ngi c騨g hi觰. V� ta c騨g v� d筼 n祔 c竎 danh s� tho竔 萵 c馻 th藀 i m玭 ph竔  t竔 xu蕋 giang h�, v� an nh c馻 v� l﹎ m� ta quy誸 nh nh� v藋."),
			speak_string(1, "N誹 l� v� chuy謓 y猲 nh v� l﹎, l� n祇 minh ch� l筰 kh玭g ra m苩 l猲 ti課g vi謈 n祔?"),
			npc_string(1, "L猲 ti課g? Hi謓 gi� c騨g ch璦 ph秈 l骳, hu鑞g g� n ta c騨g kh玭g mu鑞 t譵 hi觰 s� t譶h b猲 trong, n鉯 g� n vi謈 l猲 ti課g, t蕋 c� u ch璦 r� r祅g, v� th� ta c莕 c� th阨 gian  t譵 hi觰. C竎 h� h穣 quay v� trc 甶, ta c� vi謈 c莕 ph秈 gi秈 quy誸."),
			speak_string(1, "Th玦 頲 r錳, n誹  nh� th� ta c騨g kh玭g l祄 m蕋 th阨 gian c馻 bang ch� n鱝. �, c遪 l阨 cu鑙 c飊g ta mu鑞 n鉯 l�, c竎 nh﹏ s� v� l﹎ v� chuy謓 n祔 m� b╪ kho╪, ri猲g ta c騨g v� chuy謓 n祔 m� b玭 ba kh緋 n琲, n猲 c騨g hi v鋘g minh ch� s韒 c玭g b� ch﹏ tng c馻 v� vi謈. Ta xin c竜 t�."),
			self_string(1, "Xem ra ch� c� r阨 kh醝 Ho祅h S琻 Ph竔, t� tay 甶 甶襲 tra v� vi謈 n祔 th玦. Vi謈 li猲 quan n c c� i hi謕, nh蕋 nh ph秈 t� <color=white>C鯽 ch輓h i s秐h<color> xu蕋 h祅h m� th玦."),
		}
		describe_talk(tDialog)
		SetTask(LV120_SKILL_STATE, 2)
		SyncTaskValue(LV120_SKILL_STATE)
	end
end

function yuegedao_help()
	Talk(2, "yuegedao_fix", "чc C� Ki誱: thu� thi誹 ni猲 khi ta h祅h t萿 giang h� c� nghe n鉯 n. Ngi h醝 c� vi謈 g� kh玭g?",
													"Ngi ch琲: nh� ng祔 h玬 nay Nguy謙 Ca L謓h l筰 t竔 xu蕋 giang h�, sau khi  t� nh薾 頲 m� kh玭g bi誸 ph秈 x� tr� th� n祇 cho ph秈 l�?")
end

function yuegedao_fix()
	local TSK_LV150_SKILL = 2885
	local FINAL_150SKILL_TASKSTATE = 14
	local tbname_150skill_list = {
		[0] = {1055, 1056, 1057},
		[1] = {1058, 1059, 1060},
		[2] = {1069, 1070, 1071, 1110},
		[3] = {1066, 1067},
		[4] = {1061, 1062, 1114},
		[5] = {1063, 1065},
		[6] = {1073, 1074},
		[7] = {1075, 1076},
		[8] = {1078, 1079},
		[9] = {1080, 1081},
	}
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
	}
	local nLevel = GetLevel()
	if nLevel < 150 then
		Talk(1, "", "Ngi v蒼 ch璦  c蕄 150, kh玭g c� t� c竎h nh薾 Nguy謙 Ca L謓h!")
		return
	end
	local nFact = GetLastFactionNumber()
	if nFact == -1 then	
		Talk(1, "", "Ngi v蒼 ch璦 gia nh藀 m玭 ph竔 n祇 c�, kh玭g c� t� c竎h nh薾 Nguy謙 Ca L謓h!")
		return 1
	end
	local tbSkill = tbname_150skill_list[nFact]
	local nGetAllSkill = 1
	for i = 1, getn(tbSkill) do
		local nSkillId = tbSkill[i]
		if HaveMagic(nSkillId) == -1 then
			nGetAllSkill = 0
			break
		end
	end
	local nYueGedaoStep = mod(floor(GetTask(TSK_LV150_SKILL)/100), 100)
	if nGetAllSkill == 1 or nYueGedaoStep >= FINAL_150SKILL_TASKSTATE then
		Talk(1, "", "Xem ra ngi  l穘h h閕 頲 r蕋 nhi襲 甶襲 t鑤 tr猲 Nguy謙 Ca Фo, ngi kh玭g c莕 ph秈 c� c竔 l謓h b礽 n祔 n鱝 u, vi詎 l� giang h�, ngi c� 甶 甶.")
		return
	end
	local nTaskStep = mod(GetTask(TSK_LV150_SKILL), 100)
	if nTaskStep < tbFactStepList[nFact] then
		Talk(1, "", "Trc ti猲 ngi c� l祄 cho t鑤 vi謈 m� s� m玭 c馻 ngi giao cho r錳 h穣 n鉯.")
		return
	end
	if CalcItemCount(-1, 6, 1, 2908, -1) > 0 then
		Talk(1, "", "R� r祅g l� ngi c� m閠 Nguy謙 Ca L謓h r錳.")
		return
	end
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "H祅h trang 輙 c莕 ph秈 c� 1 � tr鑞g")
		return
	end
	Talk(1, "", "Ta v蒼 c遪 m閠 Nguy謙 Ca L謓h, ngi c� c莔 l蕐 甶, s� c� 輈h l緈 y.")
	local tbAward = {
		{szName = "Nguy謙 Ca L謓h", tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "дn чc C� Ki誱 - Ho祅h S琻 Ph竔 nh薾 Nguy謙 Ca L謓h")	
end
