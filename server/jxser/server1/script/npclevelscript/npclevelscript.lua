-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--根据2个点，求线形函数f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--当x2=x1, 有x=c,该直线是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--根据2个点，求2次形函数f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--当x1或者x2 < 0 ,y =0
--当x2=x1, 有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

-----------------------------------------------
--根据2个点，求-2次形函数f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--当x2或者x1<0, y=0,
--当x1=x2,有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--描绘连接线:Link(x,points)
--根据points提供的一系列点，用相邻的两个点描绘曲线
--return y值
--x 输入值
--points 点集合
--形如：points是形如{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}的映射
function Link(x,points)
	num = getn(points)
	if(num<2) then
		return -1
	end
	for i=1,num do
		if(points[i][3]==nil) then
			points[i][3]=Line
		end
	end
	if(x < points[1][1]) then
		return points[1][3](x,points[1][1],points[1][2],points[2][1],points[2][2])
	end
	if(x > points[num][1]) then
		return points[num][3](x,points[num-1][1],points[num-1][2],points[num][1],points[num][2])
	end
	
	c = 2
	for i=2,num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end
	return points[c][3](x,points[c-1][1],points[c-1][2],points[c][1],points[c][2])
end


--计算NPC属性
--可以计算的属性包括：
--Exp、Life、LifeReplenish、AttackRating、Defense、MinDamage、MaxDamage；
--Level1、Level2、Level3、Level4。



--取得用|分割的参数的函数。

function GetParam(strParam, index)
nLastBegin = 1
for i=1, index - 1 do
nBegin = strfind(strParam, "|", nLastBegin)
nLastBegin = nBegin + 1
end;
num = 1

strnum = strsub(strParam, nLastBegin)
nEnd = strfind(strnum, "|")
if nEnd == nil then 
return strnum
end
str1 = strsub(strnum,1,nEnd -1);
return str1
end;



--入口主函数，第一个参数为NPC等级，等二个参数为数据类型，第三个参数是传入的npcs中的字符串。
--被一个npc单独用的脚本可以不考虑第三个参数的输入。
function GetNpcLevelData(Series, Level, StyleName, ParamStr)
	if(StyleName=="Level5") then  --提取npc等级
		return ParamStr
	end
	if(StyleName=="AIMode") then  --主动回血AI模式
		return ParamStr
	end
	if(StyleName=="AIParam1") then --无敌人时，巡逻概率20%
		return ParamStr
	end
	if(StyleName=="AIParam2") then --剩余生命低于这个百分比的时候执行相应处理
		return ParamStr
	end
	if(StyleName=="AIParam3") then --在AIParam2的情况出现的时候是否执行相应处理的概率
		return ParamStr
	end
	if(StyleName=="AIParam4") then 	--在AIParam2的情况出现并决定要执行相应处理，使用回复
									--技能的概率 对应SkillList里面的技能 1
		return ParamStr
	end
	if(StyleName=="AIParam5") then --skill2的使用概率:普通物理攻击
		return ParamStr
	end
	if(StyleName=="AIParam6") then --skill3的使用概率:特殊物理攻击
		return ParamStr
	end
	if(StyleName=="AIParam7") then --skill4的使用概率:远程攻击
		return ParamStr
	end
	if(StyleName=="AIParam8") then --待机概率
		return ParamStr
	end
	if(StyleName=="AIParam9") then --巡逻概率
		return ParamStr
	end
	
	if(StyleName=="Skill1") then --回血：治疗术
		return ParamStr
	end
	if(StyleName=="Skill1" or StyleName=="Skill2" or StyleName=="Skill3" or StyleName=="Skill4") then --近程五行攻击
		return ParamStr
	end
	if(StyleName=="PhysicalDamageBase") then --外普攻击
		return 0
	end;
	if(StyleName=="PhysicalMagicBase") then --内普攻击
		return 0
	end;
	if(StyleName=="PoisonDamageBase") then --外毒攻击
		return 0
	end;
	if(StyleName=="PoisonMagicBase") then --内毒攻击
		return 0
	end;
	if(StyleName=="ColdDamageBase") then --外冰攻击
		return 0
	end;
	if(StyleName=="ColdMagicBase") then --内冰攻击
		return 0
	end;
	if(StyleName=="FireDamageBase") then --外火攻击
		return 0
	end;
	if(StyleName=="FireMagicBase") then --内火攻击
		return 0
	end;
	if(StyleName=="LightingDamageBase") then --外雷攻击
		return 0
	end;
	if(StyleName=="LightingMagicBase") then --内雷攻击
		return 0
	end;
	if(StyleName=="PhysicsResist") then --普抗
		return 0
	end
	if(StyleName=="ColdResist") then --冰防
		return 0
	end
	if(StyleName=="FireResist") then --火防
		return 0
	end
	if(StyleName=="LightResist") then  --雷防
		return 0
	end
	if(StyleName=="PoisonResist") then  --毒防
		return 0
	end
	if(ParamStr=="") then
		return 1
	end
	
Param1 = GetParam(ParamStr,1);
Param2 = GetParam(ParamStr,2);

result = GetData(Level, Param1, Param2);
return result;
end;

--关键数据的计算函数
function GetNpcKeyData(Series, Level, StyleName, Param1, Param2, Param3)
if (StyleName == "Exp") then
return floor(GetExp(Level, Param1, Param2)*1.5);
end;

if (StyleName == "Life") then
return 4*GetLife(Level, Param1, Param2);
end;

if (StyleName == "AttackRating") then
return GetAttackRating(Level, Param1, Param2);
end;

if (StyleName == "Defense") then
return GetDefense(Level, Param1, Param2);
end;

if (StyleName == "MinDamage") then
return GetMinDamage(Level, Param1, Param2);
end;

if (StyleName == "MaxDamage") then
return GetMaxDamage(Level, Param1, Param2);
end;

result = Param1 * Level * Level + Param2 * Level + Param3;
return result;
end;

--通用的线性计算公式。
function GetData(Level, Param1, Param2)
result = Param2 * Level + Param1;
return floor(result);
end;

--以下的DataPara1表示线性函数y=kx+b中的b，DataPara2表示k。
--经验值计算公式
function GetExp(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=40
DataPara2=5
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=120
DataPara2=5
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=240
DataPara2=5
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=360
DataPara2=5
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=480
DataPara2=5
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=600
DataPara2=5
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=720
DataPara2=5
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=800
DataPara2=5
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=900
DataPara2=5
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=1000
DataPara2=5
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--生命值计算函数
function GetLife(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=50
DataPara2=3
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=122
DataPara2=8
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=270
DataPara2=30
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=900
DataPara2=35
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=1450
DataPara2=60
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=2100
DataPara2=48
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=2950
DataPara2=54
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=3500
DataPara2=58
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=5050
DataPara2=11
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=6450
DataPara2=11
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;



--命中率计算函数
function GetAttackRating(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=10
DataPara2=3
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=50
DataPara2=4
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=100
DataPara2=5
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=250
DataPara2=5
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=400
DataPara2=5
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=500
DataPara2=5
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=600
DataPara2=5
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=700
DataPara2=5
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=800
DataPara2=5
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=900
DataPara2=5
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;



--闪避率计算函数。
function GetDefense(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=10
DataPara2=0
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=50
DataPara2=3
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=100
DataPara2=5
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=150
DataPara2=5
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=200
DataPara2=5
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=300
DataPara2=5
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=400
DataPara2=5
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=500
DataPara2=5
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=600
DataPara2=5
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=800
DataPara2=10
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--最小伤害计算函数
function GetMinDamage(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=3
DataPara2=0.3
return floor(GetData(Level, DataPara1, DataPara2))
end;

if (Level <= 20) then
DataPara1=8
DataPara2=0.3
return floor(GetData(Level-10, DataPara1, DataPara2))
end;

if (Level <= 30) then
DataPara1=13
DataPara2=0.4
return floor(GetData(Level-20, DataPara1, DataPara2))
end;

if (Level <= 40) then
DataPara1=20
DataPara2=0.5
return floor(GetData(Level-30, DataPara1, DataPara2))
end;

if (Level <= 50) then
DataPara1=29
DataPara2=0.5
return floor(GetData(Level-40, DataPara1, DataPara2))
end;

if (Level <= 60) then
DataPara1=39
DataPara2=0.6
return floor(GetData(Level-50, DataPara1, DataPara2))
end;

if (Level <= 70) then
DataPara1=50
DataPara2=0.7
return floor(GetData(Level-60, DataPara1, DataPara2))
end;

if (Level <= 80) then
DataPara1=65
DataPara2=0.8
return floor(GetData(Level-70, DataPara1, DataPara2))
end;

if (Level <= 90) then
DataPara1=85
DataPara2=0.9
return floor(GetData(Level-80, DataPara1, DataPara2))
end;

if (Level <= 100) then
DataPara1=112
DataPara2=1
return floor(GetData(Level-90, DataPara1, DataPara2))
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--最大伤害计算函数
function GetMaxDamage(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=3
DataPara2=0.3
return floor(GetData(Level, DataPara1, DataPara2))
end;

if (Level <= 20) then
DataPara1=8
DataPara2=0.3
return floor(GetData(Level-10, DataPara1, DataPara2))
end;

if (Level <= 30) then
DataPara1=13
DataPara2=0.4
return floor(GetData(Level-20, DataPara1, DataPara2))
end;

if (Level <= 40) then
DataPara1=20
DataPara2=0.5
return floor(GetData(Level-30, DataPara1, DataPara2))
end;

if (Level <= 50) then
DataPara1=29
DataPara2=0.5
return floor(GetData(Level-40, DataPara1, DataPara2))
end;

if (Level <= 60) then
DataPara1=39
DataPara2=0.6
return floor(GetData(Level-50, DataPara1, DataPara2))
end;

if (Level <= 70) then
DataPara1=50
DataPara2=0.7
return floor(GetData(Level-60, DataPara1, DataPara2))
end;

if (Level <= 80) then
DataPara1=65
DataPara2=0.8
return floor(GetData(Level-70, DataPara1, DataPara2))
end;

if (Level <= 90) then
DataPara1=85
DataPara2=0.9
return floor(GetData(Level-80, DataPara1, DataPara2))
end;

if (Level <= 100) then
DataPara1=112
DataPara2=1
return floor(GetData(Level-90, DataPara1, DataPara2))
end;

result = Param2 * Level + Param1;
return floor(result);
end;

