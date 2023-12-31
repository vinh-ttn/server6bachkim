--2007中秋节活动
--by 小浪多多
--2007-09-06

DA_ZHONGQIU2007_START = 0709220000	--开始时间
DA_ZHONGQIU2007_END 	= 0710142400	--结束时间
NZHONGQIU2007_LIHE_MAX = 400000000	--礼盒经验上限
NZHONGQIU2007_MAX = 400000000				--月饼经验上限
TSK_ZHONGQIU2007_LIHE = 1844				--礼盒经验上限变量
TSK_ZHONGQIU2007 = 1843							--月饼经验上限变量
ZHONGQIU_LEVEL = 50		--等级限制
SZYUEBING = ""				--存取类别名
TSK_TEMP = 51					--类别临时变量

tb_content =
{
	sztalk1 = "Th� l祄 b竛h: Th藅 tho秈 m竔, ta 產ng ngh� ng琲 v礽 ng祔.",
	sztalk2 = "Th� l祄 b竛h: L筰 n Trung Thu n鱝 r錳, tay ngh� l祄 b竛h c馻 ta ai c騨g bi誸 n, m鏸 n╩ c� kh玭g 輙 nh﹏ s� n t譵 ta gi髉 l祄 b竛h, kh竎h quan c莕 g� �?",
	szgetlvdou = "Ta mu鑞 l祄 1 c竔 b竛h u xanh/#makeyuebing(1)",
	szgetlianzi = "Ta mu鑞 l祄 1 c竔 b竛h h箃 sen/#makeyuebing(2)",
	szgetkaoji = "Ta mu鑞 l祄 1 c竔 b竛h Trung Thu g� nng/#makeyuebing(3)",
	szkaozhu = "Ta mu鑞 l祄 1 c竔 b竛h Trung Thu heo quay/#makeyuebing(4)",
	szlihe = "Ta mu鑞 l祄 1 h閜 b竛h Trung Thu/#makeyuebing(5)",
	szno = "Nh﹏ ti謓 gh� qua th玦/NoChoice",
	szmakeItemUI = "ng v藋, ta mu鑞 l祄 b竛h Trung Thu/makeItemUI",
	szlevel = "Th藅 ng ti誧, ng c蕄 kh玭g  50, kh玭g th� tham gia ho箃 ng n祔.",
	szmoney = "Th藅 ng ti誧, ng﹏ lng mang theo kh玭g .",
	szpay = "Th藅 ng ti誧, ngi ch琲 ch璦 n筽 th�, kh玭g th� d飊g b竛h Trung Thu.",
	szremake = "Tr� l筰/main",
	
}

--礼盒获得材料和几率
tb_Mareial_LIHE = 	
{
	100000,
	{
		{G=6,D=1,P=1207,nrate=0.0125	,szname="M秐h tranh V﹏ Du"},
		{G=6,D=1,P=1208,nrate=0.0125	,szname="M秐h tranh V﹏ Du"},
		{G=6,D=1,P=1209,nrate=0.0125	,szname="M秐h tranh V﹏ Du"},
		{G=6,D=1,P=1210,nrate=0.0125	,szname="M秐h tranh V﹏ Du"},
		{G=6,D=1,P=1211,nrate=0.0125	,szname="M秐h tranh V﹏ Du"},
		{G=6,D=1,P=1212,nrate=0.0125	,szname="M秐h tranh V﹏ Du"},
		{G=6,D=1,P=1213,nrate=0.0125	,szname="M秐h tranh Ti猲 V�"},
		{G=6,D=1,P=1214,nrate=0.0125	,szname="M秐h tranh Ti猲 V�"},
		{G=6,D=1,P=1215,nrate=0.0125	,szname="M秐h tranh Ti猲 V�"},
		{G=6,D=1,P=1216,nrate=0.0125	,szname="M秐h tranh Ti猲 V�"},
		{G=6,D=1,P=1217,nrate=0.0125	,szname="M秐h tranh Ti猲 V�"},
		{G=6,D=1,P=1218,nrate=0.0125	,szname="M秐h tranh Ti猲 V�"}
	}
}

--月饼制作需要材料
tb_Mareial =
{
	szlvdou = {
		{G=6,D=1,P=1510,szname="B竛h u xanh",num=1,nMoney=50000},
		{G=6,D=1,P=1503,szname="T骾 b閠",num=2},
		{G=6,D=1,P=1504,szname="T骾 阯g",num=2},
		{G=6,D=1,P=1505,szname="T骾 tr鴑g",num=2},
		{G=6,D=1,P=1506,szname="T骾 u xanh",num=1},
		},
	szlianzi = {
		{G=6,D=1,P=1511,szname="B竛h h箃 sen",num=1,nMoney=100000},
		{G=6,D=1,P=1503,szname="T骾 b閠",num=2},
		{G=6,D=1,P=1504,szname="T骾 阯g",num=2},
		{G=6,D=1,P=1505,szname="T骾 tr鴑g",num=2},
		{G=6,D=1,P=1507,szname="T骾 h箃 sen",num=1},
		},
	szkaoji = {
		{G=6,D=1,P=1512,szname="B竛h Trung Thu g� nng",num=1,nMoney=150000},
		{G=6,D=1,P=1503,szname="T骾 b閠",num=3},
		{G=6,D=1,P=1504,szname="T骾 阯g",num=3},
		{G=6,D=1,P=1505,szname="T骾 tr鴑g",num=3},
		{G=6,D=1,P=1508,szname="T骾 th辴 g�",num=1},
		},
	szkaozhu = {
		{G=6,D=1,P=1513,szname="B竛h Trung Thu heo quay",num=1,nMoney=200000},
		{G=6,D=1,P=1503,szname="T骾 b閠",num=4},
		{G=6,D=1,P=1504,szname="T骾 阯g",num=4},
		{G=6,D=1,P=1505,szname="T骾 tr鴑g",num=4},
		{G=6,D=1,P=1509,szname="T骾 th辴 heo",num=1},
		},
	szlihe = {
		{G=6,D=1,P=1514,szname="H閜 b竛h Trung Thu",num=1,nMoney=300000},
		{G=6,D=1,P=1510,szname="B竛h u xanh",num=1},
		{G=6,D=1,P=1511,szname="B竛h h箃 sen",num=1},
		{G=6,D=1,P=1512,szname="B竛h Trung Thu g� nng",num=1},
		{G=6,D=1,P=1513,szname="B竛h Trung Thu heo quay",num=1},
		},		
}

function funmsg()
		SZYUEBING = getTaskItemName()
		szmsg = format("Ch骳 m鮪g b筺  nh薾 頲 %d <color=yellow>%s<color>.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"])
		return szmsg
end

function funtalkmake()
		SZYUEBING = getTaskItemName()
		sztalkmake = format("Th� l祄 b竛h: Mu鑞 l祄 %d c竔 <color=red>%s<color> c莕 %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color> v� %d lng, ngi ng � kh玭g?",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return sztalkmake
end

function funtalkmlimit()
		SZYUEBING = getTaskItemName()
		sztalkmlimit= format("Th� l祄 b竛h: Nguy猲 li謚 mang theo kh玭g , l祄 %d <color=red>%s<color> c莕 %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color> v� %d lng.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return sztalkmlimit
end

function fungiveitemui()
		SZYUEBING = getTaskItemName()
		szgiveitemui= format("Th� l祄 b竛h: Mu鑞 l祄 %d %s c莕 %d %s, %d %s, %d %s, %d %s v� %d lng.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return szgiveitemui
end

function check_zhongqiu2007_date()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ( ( ndate > DA_ZHONGQIU2007_START ) and ( ndate < DA_ZHONGQIU2007_END ) ) then
		return 1
	end
	return 0
end

function check_item(szItemKey)	--判断物品是否存在
	SZYUEBING = getTaskItemName()
	for nkey, tb_item in tb_Mareial[SZYUEBING] do
			local szkey = tb_item["G"]..","..tb_item["D"]..","..tb_item["P"]
			if nkey ~= 1 then
					if szkey == szItemKey then
						return 1
					end
			end
	end
	return 0
end
function check_level()		--判断等级
	if GetLevel() < ZHONGQIU_LEVEL then
		return 0
	end 
	return 1
end

function check_money()		--判断钱
	SZYUEBING = getTaskItemName()
	if GetCash() < tb_Mareial[SZYUEBING][1]["nMoney"]then
		return 0
	end
	return 1
end

function check_pay()		--判断充值用户
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function pack(...)
	return arg
end

function getTaskItemName()		--获得tb类别名
	if GetTaskTemp(TSK_TEMP) == 1 then
		return "szlvdou"
	end
	if GetTaskTemp(TSK_TEMP) == 2 then
		return "szlianzi"
	end
	if GetTaskTemp(TSK_TEMP) == 3 then
		return "szkaoji"
	end
	if GetTaskTemp(TSK_TEMP) == 4 then
		return "szkaozhu"
	end
	if GetTaskTemp(TSK_TEMP) == 5 then
		return "szlihe"
	end
	return "szlvdou"
end

