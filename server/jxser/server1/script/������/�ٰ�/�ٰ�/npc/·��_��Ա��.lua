-- 临安　路人　华员外
-- by：Dan_Deng(2003-09-16)
-- edit by 小浪多多
Include("\\script\\event\\zhongqiu2007\\picture_head.lua")
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0709220000 and ndate < 0710312400 then
		SetTaskTemp(TSK_TEMP,1)
		Describe("Hoa vi猲 ngo筰: Trung thu  n, ch� c莕 thu th藀  6 <color=red>m秐h tranh V﹏ Du<color>  h頿 th祅h 1 b鴆 tranh ho祅 ch豱h mang n cho ta, ta s� t苙g l筰 i hi謕 1 b竛h <color=red>C鑞g Nguy謙 Ph� Dung<color>.",2,"фi b竛h C鑞g Nguy謙 Ph� Dung/makeItemUI","Nh﹏ ti謓 gh� qua th玦/NoChoice")
	else
		if (random(0,1) == 0) then
			Talk(1,"","Ta v鑞 kh玭g ph秈 l� ngi trong ch鑞 quan trng nh璶g l筰 quen thu閏 v韎 nhi襲 ngi n鎖 danh trong Giang h�. Ch� c莕 c� ti襫 b筩, vi謈 g� m� ch糿g xong!")
		else
			Talk(1,"","Ai ai c騨g u mu鑞 l祄 quan v� ch璦 hi觰 頲 hi觤 nguy lu玭 r譶h r藀. Ch糿g b籲g 頲 ta, ti猽 di猽 t� t筰")
		end
	end
end;
