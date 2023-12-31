-------------------------------------------------------------------------
-- FileName		:	enemy_flynpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-07 10:23:14
-- Desc			:   风之骑关卡的出口处对话npc，风之骑将白翼
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的赖
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的赖
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --增加同伴剧情任务完成的控制判断
Include("\\script\\activitysys\\g_activity.lua")			--活动钡辑器
Include("\\script\\activitysys\\playerfunlib.lua")		--活动钡辑器

function main()
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	
	if ( messenger_middletime() == 10 ) then 
               Msg2Player("Th藅 xin l鏸 ! "..name.."! ngi  kh玭g c遪 th阨 gian nhi謒 v� t輓 s�, nhi謒 v� th蕋 b筰 !.") 
               losemessengertask() 
       else 
            if ( Uworld1206 == 0 ) then 
                Describe(DescLink_BaiYi..":"..name..", Ngi kh玭g ph秈 l�  xuy猲 qua phong k� khi猽 chi課 sao ? Ngh� ra quan a ?",3,"Ta mu鑞 r阨 甶/messenger_comeback","Ta v蒼 ch璦 ho祅 th祅h kh秓 nghi謒, nh璶g kh玭g th� ti誴 t鬰 l祄/messenger_icantdo","Kh玭g ph秈, ta c遪 mu鑞 ti誴 t鬰 l祄/no") 
            elseif ( Uworld1206 == 1 ) then 
                Describe(DescLink_BaiYi..": T輓 s� l謓h - m閏 "..name..", ngi kh玭g ph秈 l�  xuy猲 qua phong k� khi猽 chi課 sao ? Ngh� ra quan a ?",3,"Ta mu鑞 r阨 甶 /messenger_comeback","Ta kh玭g ho祅 th祅h kh秓 nghi謒, nh璶g l� kh玭g mu鑞 ti誴 t鬰 l祄 /messenger_icantdo","Kh玭g ph秈 l�, ta c遪 mu鑞 ti誴 t鬰/no") 
            elseif ( Uworld1206 == 2 ) then 
                Describe(DescLink_BaiYi..": T輓 s� l謓h - ng "..name.." i nh﹏, c� ph秈 hay kh玭g ngi  qua li評 phong k� ch khi猽 chi課 ? Ngh� ra quan ph秈 kh玭g ?",3,"Ta mu鑞 r阨 甶 /messenger_comeback","Ta kh玭g ho祅 th祅h kh秓 nghi謒, nh璶g l� kh玭g mu鑞 ti誴 t鬰 l祄 /messenger_icantdo","Kh玭g ph秈 l� , ta c遪 mu鑞 ti誴 t鬰 /no") 
            elseif ( Uworld1206 == 3 ) then 
                Describe(DescLink_BaiYi..": T輓 s� l謓h - ng﹏ "..name.." i nh﹏, c� ph秈 hay kh玭g ngi  qua li評 phong k� ch khi猽 chi課 ? Ngh� ra quan ph秈 kh玭g ?",3,"Ta mu鑞 r阨 甶 /messenger_comeback","Ta kh玭g ho祅 th祅h kh秓 nghi謒, nh璶g l� kh玭g mu鑞 ti誴 t鬰 l祄 /messenger_icantdo","Kh玭g ph秈 l� , ta c遪 mu鑞 ti誴 t鬰 /no") 
            elseif ( Uworld1206 == 4 ) then 
                Describe(DescLink_BaiYi..": T輓 s� l謓h - kim "..name.." i nh﹏, c� ph秈 hay kh玭g ngi  qua li評 phong k� ch khi猽 chi課 ? Ngh� ra quan ph秈 kh玭g ?",3,"Ta mu鑞 r阨 甶 /messenger_comeback","Ta kh玭g ho祅 th祅h kh秓 nghi謒, nh璶g l� kh玭g mu鑞 ti誴 t鬰 l祄 /messenger_icantdo","Kh玭g ph秈 l� , ta c遪 mu鑞 ti誴 t鬰 /no") 
            elseif ( Uworld1206 == 5 ) then 
                Describe(DescLink_BaiYi..": Ng� t� kim b礽 - kim "..name.." i nh﹏, ta ch璦 th蕐 qua ng� t� kim b礽, h玬 nay coi nh� l� m� r閚g ra nh穘 gi韎. Ngi th藅 l� l頸 h筰. Ngi  qua li評 phong k� ch khi猽 chi課, ngh� ra quan ph秈 kh玭g ?",3,"Ta mu鑞 r阨 甶 /messenger_comeback","Ta kh玭g ho祅 th祅h kh秓 nghi謒, nh璶g l� kh玭g mu鑞 ti誴 t鬰 l祄 /messenger_icantdo","Ta c遪 mu鑞 ti誴 t鬰 /no") 
            end 
       end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 5 ) then
		nt_setTask(1201,30)  --风之骑任务的任务变量设置为任务完成状态
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
		taskProcess_002_06:doTaskEntity()  --同伴剧情任务
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 1, n_level);
		
		SetPos(1563,3118);
	else
		Describe(DescLink_BaiYi..": Th藅 xin l鏸, ngi kh玭g vt qua ki觤 tra, � phong k� tr猲 b秐  輙 nh蕋 ngi mu鑞 x竎 nh <color=red>5 c竔 t鋋 <color> m韎 c� th� vt qua ki觤 tra.",1,"K誸 th骳 i tho筰 /no")
	end
end

function messenger_icantdo()
	    Describe(DescLink_BaiYi..": Ngi ngh� r阨 甶 ph秈 kh玭g ? N誹 nh� kh玭g ho祅 th祅h nhi謒 v� li襫 r阨 甶, ngi c騨g c� th� n d辌h quan n琲  ng nhi謒 v� c飊g nh薾 thng, nh璶g l�, ph莕 thng s� 輙 甶 r蕋 nhi襲. ",2,"Ta mu鑞 r阨 甶 /f_fallmessengertask","в cho ta mu鑞 /no")
end

function f_fallmessengertask()	
		nt_setTask(1201,25)  --风之骑任务的任务变量设置为简单任务完成状态
		nt_setTask(1213,0)  --双倍经验时间
		nt_setTask(1214,0)  --定点打怪开关
		nt_setTask(1215,0)  --boss刷怪开关
		nt_setTask(1211,0)
		DisabledUseTownP(0)
		SetFightState(0)		-- 打完仗后改为非战斗状态
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1563,3118);
end


function no()
end
