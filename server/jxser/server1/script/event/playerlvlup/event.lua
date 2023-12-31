--========文件定义==================================--
--文件名：/script/event/playerlvlup/event.lua
--作者：yfeng
--创建日期：2005-3-31
--最后修改日期：
--功能叙述：
--	全区全服闪电冲级行动
--
--游戏脚本·剑侠情缘网络版
--金山软件股份有限公司，copyright 1992-2005
--==================================================--
if not EVENTHEAD_LUA then
	Include ("\\script\\event\\eventhead.lua")
end	

TKID_PLAYERLEVELUP = 1081	--任务变量编号，记录冲级活动的各种状态
TKVAL_PLAYERLEVELUP_OPEN = 1 --参加冲级活动

SKILLS = {
	{	{318,1},{319,1},{321,1}}, --少林
	{	{322,1},{323,1},{325,1}}, --天王
	{	{339,1},{302,1},{342,1},{351,0}}, --唐门
	{	{353,1},{355,1},{390,0}}, --五毒
	{	{328,1},{380,1},{332,0}}, --峨嵋
	{	{336,1},{337,1}}, --翠烟
	{	{357,1},{359,1}}, --丐帮
	{	{361,1},{362,1},{391,0}}, --天忍
	{	{365,1},{368,1}}, --武当
	{	{372,1},{375,1},{394,0}}, --昆仑
}

--========类定义====================================--
--类名：EPlayerLevelUp
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	全区全服玩家闪电冲级活动的具体功能
--成员变量：
--成员函数：
--.GiveTask()
--.PlayerLevelUp()
--==================================================--
EPlayerLevelUp = {
--========函数定义==================================--
--函数原形：.GiveTask()
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	给玩家发闪电冲级任务
--==================================================--
	GiveTask = function()
		if not validateDate(DATESPLAYERLEVELUP,DATEEPLAYERLEVELUP) then
			Talk(1,"","Xin l鏸! Th阨 gian ho箃 ng  h誸 r錳!")
			return
		end
		local flag = GetTask(TKID_PLAYERLEVELUP)
		if (flag == TKVAL_PLAYERLEVELUP_OPEN) then
			Talk(1,"","C� ph秈 ngi  b竜 danh tham gia 'Ho箃 ng luy謓 c蕄' kh玭g? Sao l筰 c遪 n y?")
			return
		end
		local level = GetLevel()
		if(	level > 49 and level < 71 ) then
			SetTask(TKID_PLAYERLEVELUP,TKVAL_PLAYERLEVELUP_OPEN)
			Talk(1,"","Ngi  b竜 danh tham gia ho箃 ng luy謓 c蕄. C� g緉g th╪g c蕄 n c蕄 80 甶!")
			Msg2Player("B筺  ti誴 nh薾 nhi謒 v� luy謓 c蕄, h穣 mau 甶 luy謓 c玭g!")
			return
		end
		Talk(1,"","Xin l鏸! Ъng c蕄 c馻 b筺 kh玭g ph� h頿 tham gia 'Ho箃 ng luy謓 c蕄'!")
		return
	end,
--========函数定义==================================--
--函数原形：EPlayerLevelUp.OnLevelUp()
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	参加活动的玩家，每升一级，得到2小时经验翻倍
--==================================================--
	OnLevelUp = function ()
		if not validateDate(DATESPLAYERLEVELUP,DATEEPLAYERLEVELUP) then
			return
		end
		local level = GetLevel()
		local flag = GetTask(TKID_PLAYERLEVELUP)
		if(flag == TKVAL_PLAYERLEVELUP_OPEN) then
			if(level < 80 and level > 49 ) then
				EPlayerLevelUp.payDoubleExp()
				return	
			elseif(level == 80) then
				EPlayerLevelUp.payAdvSkills()
			end
		end
	end,
	
	payDoubleExp = function()
		AddSkillState(531,10,1,2*60*60*18)
		AddSkillState(461,1, 1,2*60*60*18)
		Msg2Player("Ch骳 m鮪g b筺 trong chng tr譶h 'Ho箃 ng luy謓 c蕄'  頲 th╪g c蕄, ph莕 thng h� th鑞g t苙g cho b筺 l� t╪g i 甶觤 kinh nghi謒 trong 2 gi�.")
	end,
	
	payAdvSkills = function()
		local faction = GetLastFactionNumber()
		if(faction ~= -1) then
			for i=1,getn(SKILLS[faction+1]) do
				AddMagic(SKILLS[faction+1][i][1],SKILLS[faction+1][i][2])
			end
			Msg2Player("Ch骳 m鮪g b筺 l莕 n祔 t筰 'Ho箃 ng luy謓 c蕄' th祅h c玭g ho祅 th祅h nhi謒 v�, ng th阨 h鋍 頲 k� n╪g c蕄 90")
			AddGlobalNews("M鋓 ngi c飊g nhau ch骳 m鮪g"..GetName().."Trong chng tr譶h 'Ho箃 ng luy謓 c蕄'  th祅h c玭g ho祅 th祅h nhi謒 v�, ng th阨 l穘h ng� 頲 k� n╪g c蕄 90")
			return
		end
		Msg2Player("Ch骳 m鮪g b筺 trong chng tr譶h 'Ho箃 ng luy謓 c蕄' th祅h c玭g ho祅 th祅h nhi謒 v�.")
	end,
}

--========函数定义==================================--
--函数原形：PlayerLevelUp
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	礼官开启活动的对话
--参数：
--返回值：
--用例：
--==================================================--
function BTNPlayerLevelUp()
	local msg = "Hoan ngh猲h tham gia 'Ho箃 ng luy謓 c蕄'. Ngi ch琲 c蕄 50 n c蕄 70 u c� th� b竜 danh tham gia, ch� c莕 trong th阨 gian ho箃 ng ng c蕄 t╪g n c蕄 80, th� l藀 t鴆 h鋍 頲 c竎 k� n╪g c蕄 90"
	local btns = {
		"Ta mu鑞 b竜 danh tham gia/JoinPlayerLevelUp",
		"Ta mu鑞 t譵 hi觰 r� h琻/AboutPlayerLevelUp"
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end

--========函数定义==================================--
--函数原形：JoinPlayerLevelUp
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	报名参加活动
--==================================================--
function JoinPlayerLevelUp()
	EPlayerLevelUp.GiveTask()
end

--========函数定义==================================--
--函数原形：AboutPlayerLevelUp()
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	关于冲击活动的介绍
--==================================================--
function AboutPlayerLevelUp()
	local msg = ": Ъng c蕄 t� 50 n 70 (Bao g錷 c� c蕄 50 v� 70) c� th� n L� Quan b竜 danh tham gia 'Ho箃 ng luy謓 c蕄'. L� Quan s� hng d蒼 m鬰 ti猽 c竎 nhi謒 v� 80. Trong th阨 gian b竜 danh tham gia ng c蕄 ngi ch琲 m鏸 khi l猲 m閠 c蕄, c� th� nh薾 t╪g i 甶觤 kinh nghi謒 trong 2 gi� (Sau khi ch誸, s� m蕋 甶 hi謚 qu� nh﹏ i) , n khi t ng c蕄 80, sau khi  t 頲 m鬰 ti猽 luy謓 c蕄, ngi ch琲 s� h鋍 頲 k� n╪g c蕄 90 (Tr� t猲 m祏 tr緉g ra) ."
	local btns ={
		"Tr� l筰/BTNPlayerLevelUp",
		"сng/Quit",
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end

