

-------局部变量定义 开始---------
-------局部变量定义 结束---------

tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ItemScript",
	szName = "S� d鬾g rng ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2319,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{67,1,"Th� Luy謓 Л阯g"} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "S� d鬾g rng m閏",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2318,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{66,1,"Th� Luy謓 Л阯g"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "S� d鬾g rng b筩",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2320,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{68,1,"Th� Luy謓 Л阯g"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "ItemScript",
	szName = "S� d鬾g rng ho祅g kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2321,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{69,1,"Th� Luy謓 Л阯g"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "ItemScript",
	szName = "S� d鬾g rng b筩h kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2322,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{70,1,"Th� Luy謓 Л阯g"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "ClickNpc",
	szName = "C﹗ h醝 hoa ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hoa ng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Tham gia 畂竛 Hoa ng",7} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "nil",
	szName = "Tham gia 畂竛 Hoa ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"Ch� c� C蕄 50 (bao g錷 c蕄 50) ho芻 nh﹏ v藅  chuy觧 sinh m韎 c� th� tham gia 畂竛 hoa ng",">="} },
	},
	tbActition = 
	{
		{"tbRiddle:Show",	{"huadeng.txt",3,"","Ch骳 m鮪g i hi謕  tr� l阨 ng c﹗ h醝","tbJiaoShi2009:Award","","tbJiaoShi2009:WrongAnswer",0} },
	},
}
