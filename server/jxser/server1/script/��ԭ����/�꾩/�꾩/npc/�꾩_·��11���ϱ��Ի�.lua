-------------------------------------------------------------------------
-- FileName		:	汴京_路人11傅南冰对话.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-28 15:22:45
-- Desc			:	中原北区 汴京府 路人11傅南冰对话
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\zhongli\\zhonglitasknpc.lua")

function main(sel)
	Uworld75 = nt_getTask(75)
	U75_sub4 = nt_getTask(55)
	Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 ~= 0 ) then
		funanbing()
	elseif (Uworld75 == 10) and (U75_sub4 < 10) then		-- 任务中，接取子任务
		if (HaveItem(384) == 1) then
			nt_setTask(55,10)
			AddNote("Nhi謒 v� Quy襫 khuynh thi猲 h�: n Dng Ch﹗ mua Kim L╪g Xu﹏ cho Ph� Nam B╪g.")
			Msg2Player("Nhi謒 v� Quy襫 khuynh thi猲 h�: n Dng Ch﹗ mua Kim L╪g Xu﹏ cho Ph� Nam B╪g.")
			Talk(1,""," Th阨 bu鎖 n祔 c遪 h鋍 v� c玭g  l祄 g�? 莥! Mu鑞 h鋍 c騨g 頲! Dng ch﹗ mua gi髉 ta Kim L╪g Xu﹏ nh�.")
		else
		 	Talk(1,""," Ngay c� m閠 phong th� c騨g kh玭g c�, ch� n鉯 mi謓g kh玭g th� l祄 sao ta c� th� tin ngi 頲?")
		end
	elseif (Uworld75 == 10) and (U75_sub4 == 10) then		-- 子任务完成判断
		if (HaveItem(77) == 1) then
			DelItem(77)
			nt_setTask(55,20)
			AddNote("Nhi謒 v� Quy襫 khuynh thi猲 h�: ho祅 th祅h vi謈 mua ru")
			Msg2Player("Nhi謒 v� Quy襫 khuynh thi猲 h�: ho祅 th祅h vi謈 mua ru")
			Talk(1,"","H�! Ru 'Kim L╪g Xu﹏' n祔 ngon tuy謙! Л頲! Ta ng �! ")
		else
			Talk(1,"","Kim L╪g Xu﹏ v蒼 c遪 ch璦 mua v� sao?")
		end
	else
		Talk(1,"","H玬 nay c� ru ta u鑞g cho say, ch糿g c莕 bi誸 ai l祄 thi猲 t� ai l祄 qu﹏ th莕 ")
	end
end;
