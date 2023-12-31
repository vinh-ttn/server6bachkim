xmas2007_findgirl_taskID = 1859		--寻找神秘少女任务变量
xmas2007_findgirl_limit_taskID = 1862		--寻找神秘少女场次
xmas2007_findgirl_gblvalue_taskID = 1245 --全局开启变量
xmas2007_findgirl_exp = 10000000	--寻找神秘少女获得经验

tb_xmas2007_findgirl_item = --寻找神秘少女奖励
{
	100000,--总概率
	{0.00625,{0,143},"чng S竧 B筩h Kim 猽 Long Gi韎"},
	{0.00625,{0,144},"чng S竧 B筩h Ng鋍 C祅 Kh玭 B閕"},
	{0.00625,{0,145},"чng S竧 B筩h Kim T� Ph鬾g Gi韎"},
	{0.00625,{0,146},"чng S竧 Ph� Th髖 Ng鋍 H筺g Khuy猲"},
}

tb_xmas2007_bossmap = 	--随机地图坐标点
{
	[1]=		--凤翔
	{--x,y坐标(神秘圣诞树,阿山,阿雄)
		{1420, 3275},
		{1800, 3069},
		{1810, 3384},
	},
	[37]=		--淀京
	{
		{2021,2821},
		{1600,2817},
		{1801,3411},
	},
	[80]=		--扬州
	{
		{1629, 2868},
		{1549, 3369},
		{1630, 2869},
	},
	[11]=		--成都
	{
		{2964, 4809},
		{2999, 5258},
		{3339, 5157},
	},
	[78]=		-- 襄阳
	{
		{1719, 3355},
		{1690, 3550},
		{1391, 3052},
	},
	[176]=	-- 临安
	{
		{1231,3348},
		{1203,3059},
		{1130,2693},
	},
	[162]=	-- 大理
	{
		{1805,3322},
		{1784,2991},
		{1326,3134},
	},
	[321]=	-- 长白山南
	{
		{1019,2698},
		{1195,2759},
		{1321,2492},
		{1431,3011},
		{1540,2290},
		{1450,3133},
	},
	[322]=  -- 长白山北
	{
		{1609,4101},
		{1603,3509},
		{1705,3541},
		{1795,4054},
		{1831,3411},
		{1976,3586},
		{2049,3598},
	},
}
tb_xmas_city = 		--随机地图
{
	[1] 	= "Phng Tng",
	[37] 	= "Bi謓 Kinh",
	[80]  = "Dng Ch﹗",
	[11]  = "Th祅h Й",
	[78]  = "Tng Dng",
	[176] = "L﹎ An",
	[162]	="Чi L�",
	[321]	="Trng B筩h S琻 Nam",
	[322]	="Trng B筩h S琻 B綾",
}
tb_xmas_girl = 	--神秘少女
{
	--bossID,等级,五行(-1为随机)
	{1326,95,-1,"Йng Nhi"},
	{1327,95,-1,"B筩h Nhi"},
	{1328,95,-1,"Tuy誸 Nhi"},
}

tb_xmas_boss = 	--召唤黄金boss
{
	--bossID,等级,五行(-1为随机)
	{1322,95,-1,"C﹜ gi竛g sinh th莕 b�"},
	{1324,95,-1,"A S琻"},
	{1323,95,-1,"A H飊g"},
}

tbxmas2007_callboss_item =		--召唤黄金boss掉落表
{
	100,--总概率,单件计算
	--概率,{物品ID},数量,名称
	{100,{4,239,1},1,"T� Th駓 Tinh"},
	{100,{4,240,1},1,"L鬰 Th駓 Tinh"},
	{100,{4,238,1},1,"Lam Th駓 Tinh"},
	{100,{4,353,1},6,"Tinh H錸g B秓 Th筩h"},
	{100,{6,1,1007},1,"H箃 Th駓 Tinh"},
	{5,{0,142},1,"чng s竧 b筩h kim 甶猽 long gi韎"},
	{5,{0,143},1,"чng s竧 b筩h ng鋍 c祅 long b閕"},
	{5,{0,144},1,"чng s竧 b筩h kim t� ph鬾g gi韎"},
	{5,{0,145},1,"чng S竧 Ph� Th髖 Ng鋍 H筺g Khuy猲"},
}

function xmas2007_sdl_writeLog(sztitle,szevent)	--记录,sztitle=事件名,szevent=事件内容
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end

function xmas2007_findgirl_returndate()
	local nmin = tonumber(GetLocalDate("%M"))
	local ntasknim = 0
	if nmin >=0 and nmin < 20 then
		ntasknim = 0
	elseif nmin >=20 and nmin < 40 then
		ntasknim = 20
	elseif nmin >=40 and nmin < 60 then
		ntasknim = 40	
	end	
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	local ntaskdate = ndate * 100 + ntasknim
	return ntaskdate
end
