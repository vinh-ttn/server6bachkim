--何怜飘(568)，生于每天16：05，在19,3248,4278
function main()
	mapindex = SubWorldID2Idx(19)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 568
	bosslvl = 95
	posx = 3248*32
	posy = 4278*32
	AddNpcEx(bossid,bosslvl,2,mapindex,posx,posy,1, "H� Linh Phi猽", 1)
	AddGlobalNews("C� ngi nh譶 th蕐 Th蕋 H錸 L筩 Ph竎h H� Linh Phi猽  xu蕋 hi謓 � T﹜ nam (406, 267) Ki誱 C竎. ")
end; 