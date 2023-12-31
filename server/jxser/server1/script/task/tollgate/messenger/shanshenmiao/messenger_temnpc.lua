-------------------------------------------------------------------------
-- FileName		:	messenger_temnpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:29:14
-- Desc			:   山神庙关卡的出口处对话npc，纳兰青城
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --增加同伴剧情任务完成的控制判断
Include("\\script\\activitysys\\g_activity.lua")			--活动编辑器
Include("\\script\\activitysys\\playerfunlib.lua")		--活动编辑器

function main()
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()

	if ( messenger_middletime() == 10 ) then
		Msg2Player("Xin l鏸! "..name.."! B筺  h誸 th阨 gian th鵦 hi謓 nhi謒 v� T輓 s�! Nhi謒 v� th蕋 b筰!.")
		losemessengertask()
	else
		if ( Uworld1206 == 0 ) then
			Describe(DescLink_NaLanQingCheng..":"..name..", c� ph秈  qua kh秓 nghi謒 Mi誹 S琻 Th莕 kh玭g, mu鑞 r阨 kh醝 礹?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")	
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_NaLanQingCheng..": T輓 S� L謓h - M閏"..name..", c� ph秈  qua kh秓 nghi謒 Mi誹 S琻 Th莕 kh玭g, mu鑞 r阨 kh醝 礹?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_NaLanQingCheng..": T輓 s� l謓h - уng"..name.."C� ph秈 ngi  tr秈 qua kh秓 nghi謒 Mi誹 S琻 Th莕 kh玭g, mu鑞 r阨 kh醝 礹?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_NaLanQingCheng..": T輓 s� l謓h - B筩"..name.."v蕋 v� cho ngi qu�! C� ph秈  tr秈 qua kh秓 nghi謒 Mi誹 S琻 Th莕 kh玭g, mu鑞 r阨 kh醝 礹?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_NaLanQingCheng..": T輓 s� l謓h - V祅g"..name.."Ngi t� xa t韎 v蕋 v� nh�, c� ph秈  tr秈 qua kh秓 nghi謒 Mi誹 S琻 Th莕 kh玭g, mu鑞 r阨 kh醝 礹?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_NaLanQingCheng..": Ng� T� l謓h b礽 - V祅g"..name.."Trc gi� ta ch璦 th蕐 qua Ng� T� Kim B礽 bao gi�, h玬 nay xem nh� 頲 m� t莔 nh譶! Ngi ng l� l頸 h筰. C� ph秈 ngi  tr秈 qua kh秓 nghi謒 Mi誹 S琻 Th莕 kh玭g, mu鑞 r阨 kh醝 礹?",3,"ng! Ta mu鑞 r阨 kh醝/messenger_comeback","Ta ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g mu鑞 ti誴 t鬰 l祄 n鱝/messenger_icantdo","Kh玭g ph秈! Ta c遪 mu鑞 th� ti誴/no")
		end
	end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 2 ) then
		nt_setTask(1202,30)  --山神庙任务的任务变量设置为任务完成状态
		nt_setTask(1213,0)  --双倍经验时间
		nt_setTask(1214,0)  --定点打怪开关
		nt_setTask(1215,0)  --boss刷怪开关
		DisabledUseTownP(0)
		SetFightState(0)		-- 打完仗后改为非战斗状态
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		taskProcess_002_07:doTaskEntity()
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 2, n_level);
		
		SetPos(1337,3154);
	else
		Describe(DescLink_NaLanQingCheng..": Xin l鏸!   b筺 ch璦 ho祅 th祅h c鯽 秈 ph輆 trc, t筰 b秐  Mi誹 S琻 Th莕 b筺 ph秈 h� 輙 nh蕋 <color=red>hai t猲 o Y猽<color> m韎 t輓h qua 秈.",1,"K誸 th骳 i tho筰/no")
	end
end

function messenger_icantdo()
	Describe(DescLink_NaLanQingCheng..": C� ph秈 b筺 mu鑞 r阨 kh醝, n誹 ch璦 ho祅 th祅h nhi謒 v� m� r阨 kh醝, b筺 c騨g c� th� n D辌h Quan giao tr� nhi謒 v� v� nh薾 ph莕 thng nh璶g ph莕 thng s� gi秏 xu鑞g r蕋 nhi襲.",2,"ng! Ta mu鑞 r阨 kh醝/s_fallmessengertask","в ta ngh� l筰 xem sao/no")

end

function s_fallmessengertask()
		nt_setTask(1202,25)  --山神庙任务的任务变量设置为简单完成状态
		nt_setTask(1213,0)  --双倍经验时间
		nt_setTask(1214,0)  --定点打怪开关
		nt_setTask(1215,0)  --boss刷怪开关
		DisabledUseTownP(0)
		SetFightState(0)		-- 打完仗后改为非战斗状态
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1337,3154);
end

function no()
end