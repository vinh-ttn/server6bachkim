--description: 天王帮地护法夏诚　天王50级任务
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 50*256) and (GetLevel() >= 50) then
			Say("G莕 y trong Th駓 tr筰 c� l阨 n l� чng ёnh H� xu蕋 hi謓 <color=Red>Th駓 Qu竔<color>, gi誸 ch誸 r蕋 nhi襲 ng� d﹏, khi課 cho l遪g ngi lo s�, ngic� b籲g l遪g 甶 甶襲 tra th� kh玭g? ", 2, "уng �!/L50_get_yes", "Xin h穣 ph竔 ngi kh竎 /L50_get_no")
		elseif (UTask_tw == 50*256+20) and (HaveItem(95) == 1) then
			L50_prise()
		elseif (UTask_tw > 50*256) and (UTask_tw < 60*256) then					--已经接到50级任务，尚未完成
			Talk(1,"","C� v礽 ngi nh譶 th蕐 <color=Red>Th駓 Qu竔<color>thng xu蕋 hi謓 � <color=Red>ph輆 ng<color>. Ph輆 Йng c� m閠 <color=Red>S琻 ng th玭g qua y чng ёnh h�<color>. Ta nghi l� trong ng c� C� qu竔!")
		else					--已经完成50级任务，尚未出师（缺省对话）
			Talk(1,"","Thi猲 h� ng祔 nay r蕋 h鏽 n, nh璶g � tr阨  ph� h� b鎛 bang ")
		end
	elseif (UTask_tw >= 70*256) then							--已经出师
		Talk("M閠 ng祔 l祄 huynh  th� su鑤 i l� huynh , ngi n猲 b秓 tr鋘g ")
	else
		Talk(1,"","Ta m蕐 ng祔 nay thng nh譶 th蕐 ng� s綾 xu蕋 hi謓 tr猲 m苩 h�! Kh玭g bi誸 y l� 甶襪 l祅h hay d�!")
	end
end;

function L50_get_yes()
	Talk(1,"","C� v礽 ngi nh譶 th蕐 <color=Red>Th駓 Qu竔<color>thng xu蕋 hi謓 � <color=Red>ph輆 ng<color>. Ph輆 Йng c� m閠 <color=Red>S琻 ng th玭g qua y чng ёnh h�<color>. Ta nghi l� trong ng c� C� qu竔!")
	SetTask(3, 50*256+20)
	AddNote("дn ph輆 Йng Hi謚 l謓h i g苝 Ph骳 Th祅h, nh薾<color=Red> nhi謒 v� thu� qu竔<color>, 甶 xu鑞g y чng ёnh H� xem h� th鵦 th� n祇. ")
	Msg2Player("дn ph輆 Йng Hi謚 l謓h i g苝 Ph骳 Th祅h, nh薾 nhi謒 v� thu� qu�, 甶 xu鑞g y чng ёnh H� xem h� th鵦 th� n祇 ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(1,"","Ng� S綾 th筩h n祔 kh玭g ch� c� th� an nh l遪g ngi m� c遪 mang h筺h ph骳 cho b鎛 bang. Th藅 l� tr阨mu鑞 gi髉 ta!")
	DelItem(95)
	SetTask(3, 60*256)
	SetRank(48)
--	AddMagic(42)
	add_tw(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ho祅 th祅h nhi謒 v� th駓 qu竔, tr� th祅h H� Фo Tng qu﹏, h鋍 頲 v� c玭g Kim Chung Tr竜. ")
	AddNote("Tr� l筰 Thi猲 Vng Bang, giao Ng� s綾 th筩h cho Ph骳 Th祅h ho祅 th祅h nhi謒 v�, tr� th祅h H� Фo tng qu﹏. ")
end;
