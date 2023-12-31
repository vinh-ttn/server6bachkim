--description: 天忍教弟子　禹王剑任务（天忍记名弟子任务）
--author: yuanlan	
--date: 2003/5/17
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tr = GetTask(4)
	UTask_gb = GetTask(8)
	UTask_world30 = GetByte(GetTask(30),1)
	if (UTask_world30 == 0) and (GetLevel() >= 10) and (GetFaction() ~= "tianren") then		-- 任务启动（要求10级以上）
--		DelItem(50)						--防止重接任务后，玩家捡起任务道具
		Say("Tr猲 <color=Red>Hoa S琻<color> c� gi蕌 m閠 thanh <color=Red>V� Vng Ki誱<color>, ai l蕐 頲 thanh ki誱 蕐 cho b鎛 gi竜 s� 頲 tr鋘g thng!", 2, " l蕐 Thanh ki誱 /get_yes", "Kh玭g th輈h l緈!/get_no")
	elseif ((UTask_world30 == 5) and (HaveItem(50) == 1)) then					--有禹王剑
		world30_prise()
	elseif ((UTask_world30 > 0) and (UTask_world30 < 10)) then
		Talk(1,"","<color=Red>V� Vng Ki誱<color> 頲 gi蕌 tr猲 <color=Red>Hoa S琻<color>, t� y n Hoa S琻 xa x玦 hi觤 tr�, ngi ph秈 c萵 th薾!")
	elseif (UTask_world30 == 10) then		-- 以前完成任务的人转换变量值
		Utask_world30 = SetByte(GetTask(30),1,127)
		SetTask(30,Uworld30)
		if (GetFaction() == "tianren") then
			Talk(1,"","C玭g lao ngi t譵 頲 V� Vng Ki誱, b鎛 gi竜 s� ghi nh�, s� kh玭g b筩 i ngi!")
		else
			Talk(1,"","V� c玭g lao ngi l藀 cho b鎛 gi竜, b鎛 gi竜 nh薾 ngi l祄  t�!")
		end
	elseif (UTask_tr == 70*256) and (GetFaction() ~= "tianren") then							--已经出师
		Talk(1,"","Ngi mu鑞 甶 v� phng Nam �? Cao th� v� l﹎ Trung Nguy猲 nhi襲 v� s�, h穣 suy ngh� k� trc khi 甶.")
	else
		Talk(1,"","Ngi bi誸 kh玭g? Phong Л阯g Л阯g Ch� ch輓h l� Th蕋 c玭g ch骯 c馻 琻g kim Ho祅g  Чi Kim, ch糿g nh鱪g xinh p m� v� ngh� c騨g cao cng.")
	end
end;

function get_yes()
	Talk(1,"","T� y n Hoa S琻 xa x玦 hi觤 tr�, ngi c� th� n <color=Red>Bi謓 Kinh<color>, 甶 xa phu n <color=Red>Phng Tng<color>g莕 Hoa S琻, c騨g c� th� nh� <color=Red>Nh藅 Nguy謙 Уn Ch� Ch� � H頿 T竧<color> c馻 b鎛 gi竜 a ngi 甶.")
	SetTask(30, SetByte(GetTask(30),1,5))
	AddNote("Nh薾 nhi謒 v�:  Hoa s琻 t譵 V� Vng Ki誱. ")
	Msg2Player("Nh薾 nhi謒 v�:  Hoa s琻 t譵 V� Vng Ki誱. ")
end;

function get_no()
	Talk(1,"","L骳 n祇 c騨g c� ngi mu鑞 l蕐 V� Vng Ki誱  頲 tr鋘g thng.")
end;

function world30_prise()
	DelItem(50)
	i = ReturnRepute(15,19,6)		-- 缺省声望15，最大无损耗等级19级，每级递减6%
	Uworld30 = SetByte(GetTask(30),1,127)
	AddRepute(i)
	SetTask(30,Uworld30)
	Earn(500)
	Talk(1,"","V� c玭g lao ngi l藀 cho b鎛 gi竜, b鎛 gi竜 nh薾 ngi l祄  t�!")
	AddNote("Quay l筰 Thi猲 Nh蒼 Gi竜, a V� Vng Ki誱 cho Thi猲 Nh蒼 T� S�, tr� th祅h  t�, 頲 thng 500 lng. ")
	Msg2Player("Quay l筰 Thi猲 Nh蒼 Gi竜, a V� Vng Ki誱 cho Thi猲 Nh蒼 T� S�, ho祅 th祅h nhi謒 v�. T� th祅h  t� c馻 Thi猲 Nh蒼 Gi竜, 頲 thng 500 lng, danh v鋘g 琧 n﹏g cao. "..i.."甶觤.")
end;

function enroll_prise()
	SetFaction("tianren")    				--玩家加入天忍教
	SetCamp(2)
	SetCurCamp(2)
	AddMagic(135)
	SetRank(55)						--设置称号
	SetRevPos(49, 28)  					--设置重生点
	SetTask(4, 10*256)
	Msg2Player("Hoan ngh猲h gia nh藀 Thi猲 Nh蒼 Gi竜, tr� th祅h S竧 Th�, h鋍 頲 v� c玭g T祅 Dng Nh� Huy誸. ")
	AddNote("Gia nh藀 Thi猲 Nh蒼 Gi竜, tr� th祅h S竧 Th�, h鋍 頲 v� c玭g T祅 Dng Nh� Huy誸. ")
end;

function enroll_no()
end;
