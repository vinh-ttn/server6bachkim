--中原北区 宋金战场 宋军军医
--苏宇

function main(sel)
	if (GetCurCamp() == 1) then
		Say("Tr竛g s� n猲 mua 輙 thng dc ph遪g th﹏! Chi課 trng sinh t� kh� lng!", 2, "Mua thu鑓 /yes", "Kh玭g mua/no")
	else
		Talk(1,"","Ngi u! Mau n b総 gian t�!")
	end
end;

function yes()
Sale(53)
end;

function no()
end;