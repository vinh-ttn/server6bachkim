

-------局部变量定义 开始---------
local fn		= function(nItemIndex) local szMsg=format("Ch骳 m鮪g cao th� %s  nh薾 頲 %s",GetName(),GetItemName(nItemIndex)) AddGlobalNews(szMsg) Msg2SubWorld(szMsg) end
-------局部变量定义 结束---------

tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "CreateDialog",
	szName = "фi ho祅 m� h錸g 秐h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C竎 h� mu鑞 i lo筰 trang b� n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"фi [Ho祅 m黓 H錸g 秐h h錸g t� chi猽",2} },
		{"AddDialogOpt",	{"фi [Ho祅 m黓 H錸g 秐h qua ki誱 t﹜ phng",3} },
		{"AddDialogOpt",	{"фi [Ho祅 m黓 H錸g 秐h th萴 vi猲 uy觧",4} },
		{"AddDialogOpt",	{"Ta mu鑞 i [Ho祅 M黓 H錸g 秐h M鬰 T骳",5} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "фi [Ho祅 m黓 H錸g 秐h h錸g t� chi猽",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Ho祅 M黓 H錸g 秐h H錸g T� Chi猽",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho祅 M� Kim B礽",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,437},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "фi [Ho祅 m黓 H錸g 秐h qua ki誱 t﹜ phng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Ho祅 M黓 H錸g 秐h Ki誱 Qua T﹜ Phng",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho祅 M� Kim B礽",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,435},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "фi [Ho祅 m黓 H錸g 秐h th萴 vi猲 uy觧",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Ho祅 M黓 H錸g 秐h Tr莔 Vi猲 V穘 T髖",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho祅 M� Kim B礽",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,434},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "Ta mu鑞 i [Ho祅 M黓 H錸g 秐h M鬰 T骳",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Ho祅 M黓 H錸g 秐h M鬰 T骳 Tng Vong",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho祅 M� Kim B礽",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,436},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "nil",
	szName = "фi kim b礽 th祅h trang b� ho祅g kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ex_goldequp_coin",	{nil} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "фi c鵦 ph萴 h錸g 秐h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C竎 h� mu鑞 i lo筰 trang b� n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu鑞 i [C鵦 ph萴] H錸g 秐h H錸g T� Chi猽",8} },
		{"AddDialogOpt",	{"Ta mu鑞 i [C鵦 ph萴] H錸g 秐h Ki誱 Qua T﹜ Phng",9} },
		{"AddDialogOpt",	{"Ta mu鑞 i [C鵦 ph萴] H錸g 秐h Tr莔 Vi猲 V穘 T髖",10} },
		{"AddDialogOpt",	{"Ta mu鑞 i [C鵦 ph萴] H錸g 秐h M鬰 T骳 Tng Vong",11} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Ta mu鑞 i [C鵦 ph萴] H錸g 秐h H錸g T� Chi猽",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[C鵦 ph萴] H錸g 秐h H錸g T� Chi猽",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho祅 M� Kim B礽",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,535},nQuality=1,CallBack=fn},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "Ta mu鑞 i [C鵦 ph萴] H錸g 秐h Ki誱 Qua T﹜ Phng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[C鵦 ph萴]H錸g 秐h Ki誱 Qua T﹜ Phng",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho祅 M� Kim B礽",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,533},nQuality=1,CallBack=fn},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "Ta mu鑞 i [C鵦 ph萴] H錸g 秐h Tr莔 Vi猲 V穘 T髖",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[C鵦 ph萴] H錸g 秐h Tr莔 Vi猲 V穘 T髖",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho祅 M� Kim B礽",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,532},nQuality=1,CallBack=fn,},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "Ta mu鑞 i [C鵦 ph萴] H錸g 秐h M鬰 T骳 Tng Vong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[C鵦 ph萴] H錸g 秐h M鬰 T骳 Tng Vong",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ho祅 M� Kim B礽",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,534},nQuality=1,CallBack=fn,},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 L� Quan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L� Quan"},
	tbCondition = 
	{
		{"NpcFunLib:IsInCity",	{nil} },
	},
	tbActition = 
	{
--Change request 04/06/2011, ng ch� t筼 trang b� b筩h kim - Modified by DinhHQ - 20110605
--		{"AddDialogOpt",	{"фi kim b礽 th祅h trang b� ho祅g kim",6} },
--		{"AddDialogOpt",	{"фi c鵦 ph萴 h錸g 秐h",7} },
--		{"AddDialogOpt",	{"фi ho祅 m� h錸g 秐h",1} },
--		{"AddDialogOpt",	{"фi kim b礽 trang b� ho祅g kim (ti誴 theo)",13} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "nil",
	szName = "фi kim b礽 trang b� ho祅g kim (ti誴 theo)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ex_goldequp_coin_2",	{nil} },
	},
}
