function main(sel)
if ( GetFightState() == 0 ) then	
	SetPos(1251, 3005)		
	SetFightState(1)	
	SetFightState(1)
	SetPKFlag(1)
	ForbidChangePK(1)	
else			       		
	SetPos(1246, 3018)		
	SetFightState(0)		
end;
SetProtectTime(18*3)
AddSkillState(963, 1, 0, 18*3) 
end;