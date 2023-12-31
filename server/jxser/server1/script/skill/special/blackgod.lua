Include("\\script\\skill\\head.lua")
SKILLS={
	toukui={ --头盔技能
		autoattackskill={{{1,1250*256 + 1},{20,1250*256 + 20},{21,1250*256 + 21}},{{1,-1},{20,-1}},{{1,1*18*256 + 3},{20,1*18*256 + 3}}},
					},
	toukui_zuzhou={ --头盔效果
		forbit_attack={
			[1]={{1,1},{20,1}},
			[2]={{1,18*3},{2,18*4},{20,18*4}}
									},
								},
	huwan={ --护腕技能
		autoattackskill={{{1,1252*256 + 1},{20,1252*256 + 20},{21,1252*256 + 21}},{{1,-1},{20,-1}},{{1,1*18*256 + 3},{20,1*18*256 + 3}}},
				},
	huwan_zuzhou={ --护腕效果
		forbit_takemedicine=
		{
			{{1,1}, {2,1}},
			{{1,18*3},{2,18*4},{20,18*4}},
			{{1,0},{2,0}},
		},
		forbit_usetownportal=
		{
			{{1,1}, {2,1}},
			{{1,18*3},{2,18*4},{20,18*4}},
			{{1,0},{2,0}},
		},
								},
	daopao={ --道袍
		autoreplyskill={{{1,1254 * 256 + 1},{20,1254 * 256 + 20},{21,1254*256 + 21}},{{1,-1},{2,-1}},{{1,30*18*256 + 3},{20,30*18*256 + 3}}},
					},
	daopao_fuzhu={ --道袍效果
		allres_yan_p={{{1,20},{2,20}},{{1,18*10},{2,18*15},{20,18*15}}},
								},
	xiezi ={ --鞋子加速		
		autorescueskill=
		{
			{
				{1,1256*256 + 1},{20,1256*256 + 20},
			},
			{
				{1,-1},{20,-1}
			},
			{
				{1,1*18*256 + 30},
				{2,1*18*256 + 30},
			}
		},
				},
	xiezi_fuzhu={
		fastwalkrun_p={{{1,30},{20,30}},{{1,18*10},{2,18*15},{20,18*15}}},
	},
	yaodai ={ --腰带		
		autorescueskill=
		{
			{
				{1,1258*256 + 1},{20,1258*256 + 20},
			},
			{
				{1,-1},{20,-1}
			},
			{
				{1,10*18*256 + 10},
				{2,10*18*256 + 10},
			}
		},
					},
	yaodai_fuzhu={
		hide={{{1,1},{20,1}},{{1,5*18},{20,5*18}}},
		enhancehit_rate={{{1,100},{2,100}},{{1,18*4},{2,18*4},{3,18*4},{4,18*4},{20,18*4}}},
	},
}

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

-----------------------------------------------------------
--函数GetSkillLevelData(levelname, data, level)
--levelname：魔法属性名称
--data：技能名称
--level：技能等级
--return：当技能名称为data，技能等级为level
--			时的魔法属性levelname所需求的三个参数的具体值
-----------------------------------------------------------
function GetSkillLevelData(levelname, data, level)
	if(data==nil) then
		return ""
	end
	if(data == "") then
		return ""
	end
	if(SKILLS[data]==nil) then
		return ""
	end
	if(SKILLS[data][levelname]==nil) then
		return ""
	end
	if(type(SKILLS[data][levelname]) == "function") then
		return SKILLS[data][levelname](level)
	end
	if(SKILLS[data][levelname][1]==nil) then
		SKILLS[data][levelname][1]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][2]==nil) then
		SKILLS[data][levelname][2]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][3]==nil) then
		SKILLS[data][levelname][3]={{0,0},{20,0}}
	end
	p1=floor(Link(level,SKILLS[data][levelname][1]))
	p2=floor(Link(level,SKILLS[data][levelname][2]))
	p3=floor(Link(level,SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;


function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;
