--中原南区 襄阳府 衙门卫兵1对话

FESTIVAL06_NPCNAME = "<color=yellow>V� binh Nha m玭:<color>";
Include([[\script\global\路人_衙门卫兵.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	UTask_wd = GetTask(5);
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) and (UTask_wd60sub == 2) then
		Say("Th� th祅h i nh﹏  th竜 ch箉 trong m藅 o ph輆 sau nha m玭. Gi芻 Kim c遪 ch璦 t韎  s� h穒 nh� v藋!", 0)
		AddNote("дn nha m玭, n鉯 chuy謓 v韎 ngi v� b辬h v� bi誸 t� tng  tho竧 qua 阯g b� m藅 ph輆 sau nha m玭. ")
		Msg2Player("Th� ra t� tng Tng Dng  s韒 tho竧 nh� 阯g b� m藅 ph輆 sau nha m玭. ")
	else
		Talk(1,"","N祔! Ti觰 t�! Ngi th薽 th魌 nh� th�, mu鑞 l祄 g�? L� n祇 ngi l� gian t� c馻 gi芻 Kim?")
	end
end;
