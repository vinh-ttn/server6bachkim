--古柏(566)，生于每天17：05，在225,1546,3278
function main()
	mapindex = SubWorldID2Idx(225)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 566
	bosslvl = 95
	posx = 1546*32
	posy = 3278*32
	AddNpcEx(bossid,bosslvl,0,mapindex,posx,posy,1, "C� B竎h", 1)
	AddGlobalNews("Nghe n鉯 Thi猲 Vng Bang ch� T� s� C� B竎h v� c竎 u m鬰 c馻 Thi猲 Nh蒼 Gi竜  xu蕋 hi謓 t筰 M� Cung sa m筩 (193, 204) Йn Ho祅g. ")
end; 