function GetSkillLevelData(levelname, data, level)

if (levelname == "lightingdamage_v") then
return Getlightingdamage_v(level)
end;

if (levelname == "steallife_p") then
return Getsteallife_p(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getlightingdamage_v(level)
result1 = 26+level*9
result2 = 46+level*18
return Param2String(result1,0,result2)
end;

function Getsteallife_p(level)
result = 2+floor(level*2/3)
return Param2String(result,0,0)
end;

function Getskill_cost_v(level)
result = 15+level
return Param2String(result,0,0)
end;
