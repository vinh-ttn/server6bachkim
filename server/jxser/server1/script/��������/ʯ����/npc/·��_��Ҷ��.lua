--石鼓镇 路人 柳叶儿 新手任务送饭
-- By: Dan_Deng(2003-09-03)

function main(sel)
	UTask_world22 = GetTask(22)
	if (UTask_world22 == 0) then		-- 任务启动
		if (GetSex() == 0) then
			Say("Ca ca, cha c馻 mu閕 產ng d箉 v� ngh� � ngo礽 th玭, huynh c� th� gi髉 mang c琺 cho 玭g 蕐 kh玭g? ",2,"Gi髉 c� 蕐 mang c琺. /W22_get_yes","Kh玭g r秐h, 產ng b薾. /W22_get_no")
		else
			Say("T� t�, cha c馻 mu閕 產ng d箉 v� ngh� � ngo礽 th玭. T� c� th� gi髉 mang c琺 cho 玭g 蕐 kh玭g? ",2,"Gi髉 c� 蕐 mang c琺. /W22_get_yes","Kh玭g r秐h, 產ng b薾. /W22_get_no")
		end
	elseif (UTask_world22 == 5) then
		if (HaveItem(233) == 0) then		-- 道具丢了
			AddEventItem(233)
			if (GetSex() == 0) then
				Talk(1,"","Ca ca, huynh ng qu猲 mang c琺 甶 nha. ")
			else
				Talk(1,"","T� t�, t� ng qu猲 mang c琺 甶 nha. ")
			end
		else
			if (GetSex() == 0) then
				Talk(1,"","Ca ca c� th� nhanh m閠 t� 頲 kh玭g, c琺  ngu閕 l筺h c� r錳. ")
			else
				Talk(1,"","T� t� c� th� nhanh m閠 t� 頲 kh玭g, c琺  ngu閕 l筺h c� r錳. ")
			end
		end
	else				-- 非任务对话
		Talk(1,"","M� ta  甶 theo g� n 玭g kh竎, ta 頲 玭g ta nu玦 dng, khinh c玭g 玭g r蕋 gi醝, 玭g c� lu玭 luy謓 c玭g v韎 ngi ngo礽 th玭. ")
	end
end;

function W22_get_yes()
	SetTask(22,5)
	AddEventItem(233)
	AddNote("Nh薾 nhi謒 v�: Gi髉 Li評 Di謕 Nhi mang c琺 ra cho v� s� � ngo礽 th玭. ")
	Msg2Player("Nh薾 nhi謒 v�: Gi髉 Li評 Di謕 Nhi mang c琺 ra cho v� s� � ngo礽 th玭. ")
end

function W22_get_no()
end
