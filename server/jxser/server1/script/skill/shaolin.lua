Include("\\script\\global\\pgaming\\configserver\\configall.lua")

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/nTocDoLuyenSkillThieuLam)
end

SKILLS={
	--少林派
	jingang_fumo={ --Kim Cang Phuc Ma
		physicsenhance_p={{{1,15},{20,55}}},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,321},{2,321}},
			[3]={{1,1},{20,100}}
		},
		addskilldamage2={
			[1]={{1,319},{2,319}},
			[3]={{1,1},{20,150}}
		},
		addskilldamage3={
			[1]={{1,11},{2,11}},
			[3]={{1,1},{20,150}}
		},
		addskilldamage4={
			[1]={{1,19},{2,19}},
			[3]={{1,1},{20,150}}
		},
		addskilldamage5={
			[1]={{1,1056},{2,1056}},
			[3]={{1,1},{20,150}}
		},
		addskilldamage6={
			[1]={{1,1057},{2,1057}},
			[3]={{1,1},{20,51}}
		},
		missle_speed_v={{{1,18},{20,18}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,54},{20,54}}},
		skill_cost_v={{{1,2},{20,6}}}
	},
	shaolin_gunfa={ --少林棍法
		addphysicsdamage_p={{{1,25},{20,100}},{{1,-1},{2,-1}},{{1,2},{2,2}}},
		attackratingenhance_p={{{1,35},{20,272}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,6},{20,45,Conic}},{{1,-1},{2,-1}}}
	},
	shaolin_daofa={ --少林刀法
		addphysicsdamage_p={{{1,25},{20,215}},{{1,-1},{2,-1}},{{1,1},{2,1}}},
		deadlystrikeenhance_p={{{1,5},{20,15,Conic}},{{1,-1},{2,-1}}}
	},
	shaolin_quanfa={ --少林拳法
		addphysicsdamage_p={{{1,25},{20,415}},{{1,-1},{2,-1}},{{1,9},{2,9}}},
		addphysicsdamage_p={{{1,25},{20,215}},{{1,-1},{2,-1}},{{1,9},{2,9}}},
		attackratingenhance_p={{{1,35},{20,272}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,6},{20,45,Conic}},{{1,-1},{2,-1}}}
	},
	xinglong_buyu={ --行龙不雨
		physicsenhance_p={{{1,60},{20,445}}},
		physicsdamage_v={
			[1]={{1,20},{20,220}},
			[3]={{1,20},{20,220}},
		},
		seriesdamage_p={{{1,1},{20,10}}},
		deadlystrike_p={{{1,5},{20,20}}},
		addskilldamage1={
			[1]={{1,318},{2,318}},
			[3]={{1,1},{20,150}}
		},
		addskilldamage2={
			[1]={{1,317},{2,317}},
			[3]={{1,1},{20,150}}
		},
		addskilldamage3={
			[1]={{1,271},{2,271}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage4={
			[1]={{1,272},{2,272}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage5={
			[1]={{1,1083},{2,1083}},
			[3]={{1,1},{20,125}}
		},
		addskilldamage6={
			[1]={{1,1055},{2,1055}},
			[3]={{1,1},{20,125}}
		},
		skill_cost_v={{{1,2},{20,10}}}
	},
	longzhao_huzhua={ --龙爪虎抓
		physicsenhance_p={{{1,120},{20,1242}}},
		physicsenhance_p={{{1,120},{20,600}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		ignoredefense_p={{{1,9},{20,85},{21,86}}},
		stun_p={{{1,1},{20,5}},{{1,1},{20,5}}},
		deadlystrike_p={{{1,5},{20,40}}},
		colddamage_v={
			[1]={{1,10},{20,56}},
			[3]={{1,10},{20,56}}
		},
		addskilldamage1={
			[1]={{1,318},{2,318}},
			[3]={{1,1},{20,110},{25,150},{27,161}}
		},
		addskilldamage2={
			[1]={{1,317},{2,317}},
			[3]={{1,1},{20,110},{25,150},{27,161}}
		},
		addskilldamage3={
			[1]={{1,1083},{2,1083}},
			[3]={{1,1},{20,110},{25,125},{27,133}}
		},
		addskilldamage4={
			[1]={{1,1055},{2,1055}},
			[3]={{1,1},{20,110},{25,125},{27,133}}
		},
		missle_speed_v={{{1,26},{20,26}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,78},{20,78}}},
		skill_cost_v={{{1,1},{20,16}}}
	},
	luohan_zhen={ --罗汉阵
		addphysicsdamage_p={{{1,11},{20,135}},{{1,18},{2,18}},{{1,6},{2,6}}},
		meleedamagereturn_p={{{1,1},{20,20},{25,25},{26,25}},{{1,18},{2,18}}},
		rangedamagereturn_p={{{1,1},{20,20},{25,25},{26,25}},{{1,18},{2,18}}},
		adddefense_v={{{1,40},{20,800}},{{1,18},{2,18}}},
	},
	budong_mingwang={ --不动明王
		attackratingenhance_p={{{1,28},{20,275}},{{1,18*120},{20,18*180}}},
		adddefense_v={{{1,15},{20,250}},{{1,18*120},{20,18*180}}},
		skill_cost_v={{{1,10},{20,40}}}
	},
	shizi_hou={ --狮子吼
		stun_p={{{1,15},{20,65},{21,66}},{{1,5},{20,27},{21,28}}},
		physicsdamage_v={
			[1]={{1,45},{20,140}},
			[3]={{1,45},{20,140}}
		},
		skill_cost_v={{{1,10},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
	},
	mohe_wuliang={ --腗a Ha Vo Luong量
		physicsenhance_p={{{1,52},{20,372}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		addskilldamage1={
			[1]={{1,321},{2,321}},
			[3]={{1,1},{20,112}}
		},
		addskilldamage2={
			[1]={{1,1057},{2,1057}},
			[3]={{1,1},{20,38}}
		},
		colddamage_v={
			[1]={{1,10},{20,56}},
			[3]={{1,10},{20,56}}
		},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,15},{20,35}}}
	},
	hengsao_liuhe={ --篐oanh Tao Luc Hop
		physicsenhance_p={{{1,71},{20,417}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		attackrating_p={{{1,12},{20,50}}},
		colddamage_v={
			[1]={{1,10},{20,56}},
			[3]={{1,10},{20,56}}
		},
		deadlystrike_p={{{1,10},{20,30}}},
		addskilldamage1={
			[1]={{1,319},{2,319}},
			[3]={{1,1},{20,96}}
		},
		addskilldamage2={
			[1]={{1,1056},{2,1056}},
			[3]={{1,1},{20,40}}
		},
		skill_attackradius={{{1,96},{20,96}}},
		skill_cost_v={{{1,8},{20,8}}}
	},
	yijin_jing={ --易筋经
		allres_p={{{1,1},{20,20}},{{1,-1},{2,-1}}},
		meleedamagereturn_p={{{1,1},{20,20},{25,25},{26,25}},{{1,-1},{2,-1}}},
		rangedamagereturn_p={{{1,1},{20,20},{25,25},{26,25}},{{1,-1},{2,-1}}}
	},
	rulai_qianye={ --如来千叶
		addphysicsdamage_p={{{1,65},{30,215}},{{1,18*120},{30,18*360}},{{1,6},{2,6}}},
		lifemax_p={{{1,3},{30,80}},{{1,18*120},{30,18*360}}},
		addcolddamage_v={{{1,10},{30,215}},{{1,18*120},{30,18*360}}},
		deadlystrikeenhance_p={{{1,5},{30,15}},{{1,18*120},{30,18*360}}},
		attackspeed_v={{{1,35},{30,65},{35,70},{36,82},{37,96},{38,98},{39,100},{40,101},{41,102},{42,103},{43,104},{44,105},{45,106},{46,107},{47,108}},{{1,18*120},{30,18*360}}},
		lifemax_yan_p={{{1,21},{35,150},{36,150}},{{1,-1},{30,-1}}},
		skill_cost_v={{{1,15},{30,45}}}
	},
	damo_dujiang={ --达摩渡江
		physicsenhance_p={{{1,65},{15,345},{20,615}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		ignoredefense_p={{{1,9},{20,90},{21,94},{22,98},{23,99},{24,99},}},
		skill_cost_v={{{1,15},{20,35}}},
		colddamage_v={
			[1]={{1,10},{20,155}},
			[3]={{1,10},{20,155}}
		},
		deadlystrike_p={{{1,5},{20,40}}},
		addskillexp1={{{1,318},{2,318}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6312,1.15,1,2,1)},
							{2,SkillExpFunc(6312,1.15,2,2,1)},
							{3,SkillExpFunc(6312,1.16,3,2,1)},
							{4,SkillExpFunc(6312,1.17,4,2,1)},
							{5,SkillExpFunc(6312,1.18,5,2,1)},
							{6,SkillExpFunc(6312,1.19,6,2,1)},
							{7,SkillExpFunc(6312,1.20,7,2,1)},
							{8,SkillExpFunc(6312,1.21,8,2,1)},
							{9,SkillExpFunc(6312,1.22,9,2,1)},
							{10,SkillExpFunc(6312,1.23,10,2,1)},
							{11,SkillExpFunc(6312,1.24,11,2,1)},
							{12,SkillExpFunc(6312,1.23,12,2,1)},
							{13,SkillExpFunc(6312,1.22,13,2,1)},
							{14,SkillExpFunc(6312,1.21,14,2,1)},
							{15,SkillExpFunc(6312,1.20,15,2,1)},
							{16,SkillExpFunc(6312,1.19,16,2,1)},
							{17,SkillExpFunc(6312,1.18,17,2,1)},
							{18,SkillExpFunc(6312,1.17,18,2,1)},
							{19,SkillExpFunc(6312,1.16,19,2,1)},
							{20,SkillExpFunc(6312,1.15,20,2,1)},
							}},
		missle_speed_v={{{1,30},{20,30}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,90},{20,90}}},
		addskilldamage1={
			[1]={{1,1083},{2,1083}},
			[3]={{1,10},{20,50}}
		},
		addskilldamage2={
			[1]={{1,1055},{2,1055}},
			[3]={{1,10},{20,50}}
		},
	},
	
	quanshaolin150={ --拳少林150
		physicsenhance_p={{{1,65},{15,415},{20,740},{23,1130},{26,1325}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		ignoredefense_p={{{1,9},{20,90},{21,94},{22,98},{23,99},{24,99},}},
		skill_cost_v={{{1,18},{20,42},{23,49}}},
		colddamage_v={
			[1]={{1,12},{20,185},{23,239},{26,266}},
			[3]={{1,12},{20,185},{23,239},{26,266}}
		},
		stun_p={{{1,1},{20,8},{21,10},{22,10}},{{1,5},{20,5},{21,6}}},
		deadlystrike_p={{{1,6},{20,45},{23,57},{26,63}}},
		missle_speed_v={{{1,30},{20,32},{21,32}}},
		missle_lifetime_v={{{1,6},{20,6}}},
		skill_attackradius={{{1,180},{20,180}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,21000},
												}},	
	},
	hengsao_qianjun={ --横扫千军
		physicsenhance_p={{{1,10},{15,150},{20,353}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		skill_cost_v={{{1,15},{20,20}}},
		attackrating_p={{{1,25},{20,412}}},
		deadlystrike_p={{{1,10},{20,30}}},
		colddamage_v={
			[1]={{1,10},{20,114}},
			[3]={{1,10},{20,114}}
		},
		addskilldamage1={
			[1]={{1,1056},{2,1056}},
			[3]={{1,1},{20,20}}
		},
		skill_attackradius={{{1,128},{20,128}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5070,1.15,1,3,1)},
							{2,SkillExpFunc(5070,1.15,2,3,1)},
							{3,SkillExpFunc(5070,1.16,3,3,1)},
							{4,SkillExpFunc(5070,1.17,4,3,1)},
							{5,SkillExpFunc(5070,1.18,5,3,1)},
							{6,SkillExpFunc(5070,1.19,6,3,1)},
							{7,SkillExpFunc(5070,1.20,7,3,1)},
							{8,SkillExpFunc(5070,1.21,8,3,1)},
							{9,SkillExpFunc(5070,1.22,9,3,1)},
							{10,SkillExpFunc(5070,1.23,10,3,1)},
							{11,SkillExpFunc(5070,1.24,11,3,1)},
							{12,SkillExpFunc(5070,1.23,12,3,1)},
							{13,SkillExpFunc(5070,1.22,13,3,1)},
							{14,SkillExpFunc(5070,1.21,14,3,1)},
							{15,SkillExpFunc(5070,1.20,15,3,1)},
							{16,SkillExpFunc(5070,1.21,16,3,1)},
							{17,SkillExpFunc(5070,1.18,17,3,1)},
							{18,SkillExpFunc(5070,1.17,18,3,1)},
							{19,SkillExpFunc(5070,1.16,19,3,1)},
							{20,SkillExpFunc(5070,1.15,20,3,1)},
							}},
	},
	gunshaolin150={ --棍少林150
		physicsenhance_p={{{1,12},{15,180},{20,425},{23,719},{26,866}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		skill_cost_v={{{1,18},{20,25},{23,27}}},
		attackrating_p={{{1,65},{20,595},{23,762},{26,846}}},
		deadlystrike_p={{{1,20},{20,45},{23,52},{26,56}}},
		colddamage_v={
			[1]={{1,12},{20,138},{23,177},{26,197}},
			[3]={{1,12},{20,138},{23,177},{26,197}}
		},
		skill_attackradius={{{1,128},{20,128}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,21000},
												}},	
	},
	wuxiang_zhan={ --无相斩
		physicsenhance_p={{{1,45},{15,150},{20,333}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,10},{20,111}},
			[3]={{1,10},{20,111}}
		},
		skill_cost_v={{{1,15},{20,45}}},
		addskilldamage1={
			[1]={{1,1057},{2,1057}},
			[3]={{1,1},{20,18}}
		},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5700,1.15,1,2,1)},
							{2,SkillExpFunc(5700,1.15,2,2,1)},
							{3,SkillExpFunc(5700,1.16,3,2,1)},
							{4,SkillExpFunc(5700,1.17,4,2,1)},
							{5,SkillExpFunc(5700,1.18,5,2,1)},
							{6,SkillExpFunc(5700,1.19,6,2,1)},
							{7,SkillExpFunc(5700,1.20,7,2,1)},
							{8,SkillExpFunc(5700,1.21,8,2,1)},
							{9,SkillExpFunc(5700,1.22,9,2,1)},
							{10,SkillExpFunc(5700,1.23,10,2,1)},
							{11,SkillExpFunc(5700,1.24,11,2,1)},
							{12,SkillExpFunc(5700,1.23,12,2,1)},
							{13,SkillExpFunc(5700,1.22,13,2,1)},
							{14,SkillExpFunc(5700,1.21,14,2,1)},
							{15,SkillExpFunc(5700,1.20,15,2,1)},
							{16,SkillExpFunc(5700,1.19,16,2,1)},
							{17,SkillExpFunc(5700,1.18,17,2,1)},
							{18,SkillExpFunc(5700,1.17,18,2,1)},
							{19,SkillExpFunc(5700,1.16,19,2,1)},
							{20,SkillExpFunc(5700,1.15,20,2,1)},
							}},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
	},
	daoshaolin150={ --刀少林150
		physicsenhance_p={{{1,55},{15,180},{20,400},{23,664},{26,796}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		colddamage_v={
			[1]={{1,12},{20,135},{23,173},{26,193}},
			[3]={{1,12},{20,135},{23,173},{26,193}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1085},{20,1085}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{15,1}}},
		skill_cost_v={{{1,18},{20,55},{23,66},{26,72}}},
		missle_speed_v={{{1,32},{20,36},{23,38},{30,38}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,21000},
												}},	
	},
	dachengrulaizhou={ --大乘如来咒
		poisondamagereturn_p={{{1,5},{15,40},{20,45},{21,45}},{{1,-1},{2,-1}}},
		returnskill_p={{{1,5},{15,50},{20,56},{21,57}},{{1,-1},{2,-1}}},
		autoreplyskill={{{1,20 * 256 + 1},{20,20 * 256 + 20},{21,20*256 + 21}},{{1,-1},{2,-1}},{{1,10*18*256 + 1},{19,4*18*256 + 3},{20,5*18*256 + 3},{21,5*18*256 + 3}}},
		skill_skillexp_v={{	{1,17851239},
							{2,19487603},
							{3,22760330},
							{4,27669421},
							{5,34214875},
							{6,42396694},
							{7,52214875},
							{8,63669421},
							{9,76760330},
							{10,91487603},
							{11,107851239},
							{12,135669421},
							{13,174942148},
							{14,225669421},
							{15,274418181},
							{16,344618181},
							{17,425738181},
							{18,517778181},
							{19,620738181},
							{20,620738181},
							}},	
	},
}
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

------------------------------------------------------
--技能设定格式如下：
--SKILLS={
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	。。。。。
--}
--如：
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--魔法属性physicsenhance_p参数1，1级时为35，20级时为335，曲线不填，默认线形
--			[2]={{1,0},{20,0}},
--		},--没有[3]，表示魔法属性physicsenhance_p参数2，默认为任何时候都是0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--以上描述技能“三环套月”的魔法属性和数值
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

