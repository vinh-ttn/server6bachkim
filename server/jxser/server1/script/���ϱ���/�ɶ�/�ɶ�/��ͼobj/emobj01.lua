--description: 西南北区 成都府 峨嵋派10级任务亮银矿
--author: yuanlan	
--date: 2003/5/24

function main()
	SetPropState()
	AddEventItem(118)
	Msg2Player("Nh苩 頲 m閠 mi課g Lng Ng﹏ Kho竛g. ")
	if (GetTask(1) > 10*256) and (GetTask(1) < 20*256) then
		AddNote("T譵 th蕐 m閠 mi課g Lng Ng﹏ Kho竛g trong khu r鮪g � ph輆 t﹜ Th祅h Й. ")
	end
end;
