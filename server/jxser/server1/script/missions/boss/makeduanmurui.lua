--端木睿(565)，生于每天22：05，在227,1630,3276
function main()
	mapindex = SubWorldID2Idx(227)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 565
	bosslvl = 95
	posx = 1630*32
	posy = 3276*32
	AddNpcEx(bossid,bosslvl,3,mapindex,posx,posy,1, "an M閏 Du� ", 1)
	AddGlobalNews("C� ngi nh譶 th蕐 an M閏 Du�  xu蕋 hi謓 b� 萵 � m� cung (203, 204) sa m筩 Йn Ho祅g. ")
end; 