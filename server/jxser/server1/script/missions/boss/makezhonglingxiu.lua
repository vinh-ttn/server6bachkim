--钟灵秀(567)，生于每天00：05，在224,1889,2973
function main()
	mapindex = SubWorldID2Idx(224)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 567
	bosslvl = 95
	posx = 1889*32
	posy = 2973*32
	AddNpcEx(bossid,bosslvl,2,mapindex,posx,posy,1, "Chung Linh T� ", 1)
	AddGlobalNews("C� ngi nh譶 th蕐 Th髖 Y猲 m玭 L� Hoa s� gi� Chung Linh T� t筰 sa m筩 Йn Ho祅g (236, 185) gi誸 ch誸 v� s� ngi c馻 Thi猲 Nh蒼 Gi竜. ")
end; 