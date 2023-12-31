--description: 武当派姚石门　武当20级任务、重返门派任务
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）


-- 修改后与邪教主线相关的武当派姚石门珠脚本
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\global\\skills_table.lua");

function main()

-- 新任务系统与邪教主线相关的脚本 --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()


	if (myTaskValue==170) then -- 来到武当派后与姚石门的对话
		task_level40_01();
		return
	elseif (myTaskValue==209) then -- 玩家等级不够 40 级，再次回来时
		task_level40_02();
		return
	elseif (myTaskValue==210) then 
		Say("Hy v鋘g ngi c� th� gi髉 gi髉 v� l﹎ d裵 tr� i n筺 n祔.",0);
		return
	elseif (myTaskValue==220) then
		task_level40_06();
		return 
	end
		
	
-- 新任务系统与邪教主线相关的脚本 --



	UTask_wd = GetTask(5);
	if (GetFaction() == "wudang") and (GetSeries() == 4) then
--		为计时器错误打补丁，变量值为35、学会了武当剑法(151)、未学纯阳心法(156)的，也可以接20级任务（已取消）
--		if ((UTask_wd == 20*256) or (((UTask_wd == 35) or (UTask_wd >= 30*256)) and (HaveMagic(151) >= 0) and (HaveMagic(156) == -1))) and (GetLevel() >= 20) then
		if (UTask_wd == 20*256) and (GetLevel() >= 20) then
			Say("Ta 頲 s� ph� nu玦 dng th祅h ngi, d箉 ta v� c玭g, i v韎 ta 琻 tr鋘g nh� n骾. M蕐 ng祔 n鱝 l� t韎 l� th� 80 tu鎖 c馻 s� ph�,ta  l蕐 t遖n b� ti襫 d祅h d鬽  mua <color=Red>Thi猲 T祄 Чo B祇<color> � Tng Dng, nh bi誹 s� ph� l祄 l� ", 2, "Gi髉  t譵 ki誱/L20_get_yes", "Ta b薾 r錳/L20_get_no")
		elseif (UTask_wd == 20*256+20) then
			if (HaveItem(66) == 1) then
				SetTask(5, 20*256+40)
				AddNote("Tr� v� Ph� M蓇 甶謓, bi誸 頲 c� th� n Tng Dng g苝 玭g ch� t筽 h鉧 t譵 c竎h v� Чo b祇.")
				Msg2Player(" Tng Dng g苝 玭g ch� t筽 h鉧 t譵 c竎h v� Чo b祇.")
				Talk(2, "", "Th藅 xui qu�! Чo b祇  b� S鉯  c緉 r竎h, ph秈 l祄 sao y?", "Чo b祇 n祔 mua � ti謒 t筽 h鉧 Tng Dng, ta 甶 <color=Red>Tng Dng<color> t譵 <color=Red>ch� ti謒 t筽 h鉧 <color> ngh� c竎h.")
			else
				Talk(1,"","Ta nh� <color=Red>Thi猲 T祄 Чo B祇<color> b� nh r琲 � <color=Red>H醓 Lang ng<color>.")
			end
		elseif (UTask_wd == 20*256+80) and (HaveItem(68) == 1) then
			L20_prise()
		elseif (UTask_wd == 20*256+40) and (HaveItem(66) == 0) then		-- 任务中物品丢失的容错处理
			AddEventItem(66)
			Msg2Player("T譵 頲 'Thi猲 T祄 Чo b祇 b� r竎h'.")
			Talk(1,"","Ngi n鉯 n t譵 ch� ti謒 t筽 h鉧 s鯽 o b祇, sao l筰 kh玭g mang theo o b祇?")
		elseif (UTask_wd >= 20*256+40) and (UTask_wd < 30*256) then					--已经接到20级任务，尚未完成
			Talk(2,"","Kh玭g c� Thi猲 T祄 Чo B祇, ta l蕐 g�  l祄 sao ch骳 th� S� ph�?","Ta n Tng Dng t譵 ti謒 t筽 h鉧 ngh� c竎h.")
		else
			Talk(1,"","Ta th蕐 v� c玭g s� ph� ng祔 c祅g th﹎ h藆 kh玭g th� lng 頲,c� i ta h鋍 c騨g kh玭g n鎖.")
		end
	elseif (UTask_wd >= 70) then								--已经出师
		Talk(1,"","S� ph� thng n鉯 'H秈 n筽 b竎h xuy猲, h鱱 dung t綾 i, b輈h l藀 thi猲 nh蒼, v� d鬰 t綾 cng', ta mu鑞 t苙g c﹗ n祔 cho ngi!")
	else
		Talk(1,"","S� ph� i v韎 ta ﹏ tr鋘g nh� n骾, y猽 thng ta nh� cha m� ta!")
	end
end;

function L20_get_yes()
	Talk(1,"","Hay l緈! Xin 產 t�! Ta nh� <color=Red>Thi猲 T祄 Чo B祇<color> b� r琲 <color=Red>H醓 Lang ng<color>.")
	SetTask(5, 20*256+20)
	AddNote("G苝 Уo Th筩h M玭, nh薾 nhi謒 v� Чo b祇, n H醓 Lang чng t譵 Thi猲 T祄 Чo b祇.")
	Msg2Player("G苝 Уo Th筩h M玭, nh薾 nhi謒 v� Чo b祇, n H醓 Lang чng t譵 Thi猲 T祄 Чo b祇.")
end;

function L20_get_no()
	Talk(1,"","Ta nh t� 甶 t譵 th玦!.")
end;

function L20_prise()
	Talk(1,"","Qu� nhi猲 s鯽 頲 r錳! Hay qu�! Th藅 c秏 琻!")
	DelItem(68)
	SetRank(9)
	SetTask(5, 30*256)
--	AddMagic(159)
	add_wd(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! B筺  頲 th╪g l祄 Thanh Tu Чo Nh﹏! H鋍 頲 Th蕋 Tinh Tr薾!")
	AddNote("Tr� v� Ph� M蓇 甶謓, 甧m Thi猲 T祄 Чo b祇 giao cho Уo Th筩h M玭, ho祅 th祅h nhi謒 v� Чo b祇. Л頲 phong l� Thanh Tu Чo Nh﹏.")
end;
