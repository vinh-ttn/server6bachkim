Include([[\script\missions\springfestival\festival_head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	festival_setplayertogame();
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	festival_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
