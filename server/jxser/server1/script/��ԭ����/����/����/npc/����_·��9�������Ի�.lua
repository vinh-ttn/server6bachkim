--中原南区 襄阳府 路人9范二春对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

function main(sel)
	if allbrother_0801_CheckIsDialog(184) == 1 then
		allbrother_0801_FindNpcTaskDialog(184)
		return 0;
	end
i = random(0,1)

if (i == 0) then
Say("Nh� ng t萿 qu� kh� kh╪! ьi l竧 n鱝 ta s� cho b� m閠 bao g筼, nhanh l猲!",0)
return
end;

if (i == 1) then
Say("M鋓 ngi u l� t譶h l祅g ngh躠 x鉳, gi髉  nhau l� chuy謓 ph秈 l祄!",0)
end;

end;

