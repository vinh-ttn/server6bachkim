--少林后山密室 二门 trap
-- by：Dan_Deng(2003-08-04)

function main(sel)
	UTask_sl = GetTask(7)
	UTask_sl40tmp = GetTaskTemp(43)
	if (UTask_sl >= 40*256+20) and (UTask_sl < 50*256) then		-- 必须在任务中才能进入，并且每次进入都要回答问题
		Say("Kh萿 quy誸 m� th筩h m玭 l�: ",4,"竛 Ma Ni B竧 M� H錸g /L40_S2_wrong","H錸g B鑙 M� Ma Ni 竛 /L40_S2_wrong","B竧 M� Ni H錸g 竛 Ma /L40_S2_wrong","竛 B竧 Ni Ma M� H錸g. /L40_S2_correct")
	else
		Talk(1,"","B筺 l猲 y m蕐 l莕 th筩h m玭, nh璶g th筩h m玭 tr琻 trt kh玭g c� m閠 甶觤 t鵤 n祇.")
--		SetPos()		--把玩家移出trap点
	end
--	AddTermini(47)		--这是什么东西？
end;

function L40_S2_correct()
	Talk(1,"","Kh萿 quy誸 v鮝 ni謒 xong, th筩h m玭 t� t� m� ra.")
--	NewWorld(74, 2040 ,3259)		-- 等待提供地图坐标
end;

function L40_S2_wrong()
	Talk(1,"","Sau khi c kh萿 quy誸 xong, th筩h m玭 v蒼 kh玭g c� ph秐 鴑g g� h誸, kh玭g bi誸 c� nh� nh莔 kh萿 quy誸 kh玭g?")
--	SetPos()		--把玩家移出trap点
end;
