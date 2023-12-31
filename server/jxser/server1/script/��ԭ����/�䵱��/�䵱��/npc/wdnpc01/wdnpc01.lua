--description: 武当派小道士清风　捡木桶任务（武当入门任务）
--author: yuanlan
--date: 2003/5/14
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2004-01-12)重新设计入门任务，改为记名弟子任务

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_wd = GetTask(5)
	UTask_world31 = GetByte(GetTask(31),1)
	if (UTask_world31 == 0)	and (GetLevel() >= 10) and (GetFaction() ~= "wudang") then			-- 水桶任务启动
		Say("Khi ta l蕐 nc kh玭g c萵 th薾  l祄 t d﹜ th飊g, k誸 qu� l� <color=Red>th飊g g�<color> r琲 xu鑞g <color=Red>gi課g<color>, kh玭g l蕐 頲 nc,quay v� nh蕋 nh b� s� huynh qu� tr竎h. Ngi c� ng � gi髉 ta l蕐 th飊g g� l猲 kh玭g?", 2, "уng �!/uworld31_get_yes", "ta kh玭g gi髉 ngi 頲 /uworld31_get_no")
	elseif (UTask_world31 == 5) and (HaveItem(65) == 1) then					--有木桶
		uworld31_prise()
	elseif (UTask_world31 < 10) then 					--尚未完成捡木桶任务
		Talk(1,"","<color=Red>Th飊g g�<color> c馻 ta r琲 xu鑞g <color=Red>gi課g<color>, n誹 kh玭g t譵 頲 <color=Red>th飊g g�<color>, kh玭g l蕐 頲 nc s� b� S� huynh tr竎h ph箃.")
	elseif (UTask_world31 == 10) then 					--以前完成捡木桶任务
		UTask_world31 = SetByte(GetTask(31),1,127)
		SetTask(31,UTask_world31)
		Talk(1,"","C秏 琻 ngi l莕 trc  gi髉 ta l蕐 l筰 th飊g g�! Ta s� cho ngi l祄  t� k� danh V� ng ph竔, sau n祔 ngi c� th� mua b竛 trang b� v� kh� c馻 V� ng ph竔.")
	elseif (GetFaction() == "wudang") then   				--已经入门，尚未出师
		Talk(1,"","H祅g ng祔 u k猽 ta t韎 y l蕐 nc, c遪 th阨 gian u m� tu luy謓 n鱝! Ngi c� r秐h th� n n鉯 chuy謓 v韎 ta 頲 kh玭g?")
	elseif (UTask_wd == 70*256) then							--已经出师
		Talk(1,"","Ngi th藅 c� b秐 l躰h! Chao 玦! Bao gi� ta m韎 c� th� xu蕋 s� y?")
	else
		Talk(1,"","V� ng s琻 b綾 th玭g v韎 T莕 L躰h, ph輆 Nam gi竝 v韎 Ba S琻, li猲 mi猲 kh雐 ph鬰, ngang d鋍 tr╩ d苖, 72 nh h飊g v� l� k�, h祅g n╩ ngi ta du ngo筺 n y r蕋 ng!")
	end
end;

function uworld31_get_yes()
	Talk(1,"","Hay qu�! <color=Red>Th飊g g�<color> b� r琲 xu鑞g <color=Red>gi課g<color> .")
--	DelItem(65)									--防止重接任务后，玩家捡起任务道具
	SetTask(31,SetByte(GetTask(31),1,5))
	AddNote("G苝 ti觰 o s� Thanh Phong � gi課g Ma ch﹎ ph輆 Йng trc n骾, Ti誴 nh薾 nhi謒 v�: Gi髉  Thanh Phong xu鑞g y gi課g t譵 th飊g g�. ")
	Msg2Player("Ti誴 nh薾 nhi謒 v�: Gi髉  Thanh Phong xu鑞g y gi課g t譵 th飊g g�. ")
end;

function uworld31_get_no()
	Talk(1,"","V藋 ta t譵 ngi kh竎 gi髉!")
end;

function uworld31_prise()
	DelItem(65)
	UTask_world31 = SetByte(GetTask(31),1,127)
	i = ReturnRepute(25,24,4)		-- 缺省声望12，最大无损耗等级24级，每级递减8%
	SetTask(31,UTask_world31)
	AddRepute(i)		-- 加声望
	Talk(1,"","C秏 琻 ngi  gi髉 ta l蕐 l筰 th飊g g�! Ta  ng � y r蕋 l﹗, ngi l� trong s� 輙 ngi ch辵 gi髉 ta t譵 l筰 th飊g g�, ta phong ngi l�  t� k� danh V� ng ph竔,sau n祔 ngi c� th� mua b竛 trang b� v� kh� c馻 V� ng ph竔.")
	AddNote("Gi髉  ti觰 o s� Thanh Phong t譵 l筰 th飊g g�, nhi謒 v� ho祅 th祅h. Tr� th祅h K� danh  t�. Danh v鋘g t╪g th猰 ")
	Msg2Player("Gi髉  ti觰 o s� Thanh Phong t譵 l筰 th飊g g�, nhi謒 v� ho祅 th祅h. Tr� th祅h K� danh  t�. Danh v鋘g t╪g th猰 "..i.."甶觤.")
end

function no()
end;
