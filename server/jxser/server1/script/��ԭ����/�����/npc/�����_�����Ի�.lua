--description: 新手村_花花
--author: wangzg	
--date: 2003/7/22
--73	UTask_world45
--update 2003/7/28 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world45=GetTask(73)
	if (UTask_world45 == 0) then		-- 任务启动
		Say("Ngi c� th蕐 Ti觰 Long em ta kh玭g? Ta nh� n� 甶 mua k裲, i m穒 kh玭g th蕐 n� v�, n  t譵 c騨g kh玭g th蕐, ta lo l緉g mu鑞 ch誸! ", 2, "Ta gi髉 ngi t譵 /yes", "Ta gi髉 ngi kh玭g 頲 /no")
	elseif (UTask_world45 == 1) then
		Talk(1,"","Phi襫 ngi gi髉 ta t譵 xem!")
	elseif (UTask_world45 >= 10) then
		Talk(1,"","C竚 琻 ngi  t譵 頲 em ta.")
	else				-- 非任务对话
		Talk(1,"","Ti觰 Long em ta r蕋 l� tinh ngh辌h!")
	end	
end

function yes()
	Talk(1,"","Х l祄 phi襫 ngi! ")
	SetTask(73,1)
	AddNote("Nh薾 nhi謒 v�: Gi髉 Hoa Hoa t譵 em trai ti觰 Long. ")
	Msg2Player("Nh薾 nhi謒 v�: Gi髉 Hoa Hoa t譵 em trai ti觰 Long. ")
end

function no()
end
