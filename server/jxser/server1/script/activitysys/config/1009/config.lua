Include("\\script\\activitysys\\config\\1009\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "B秐  nh qu竔 nh薾 m秐h chi課 c玭g l謓h",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,225,226,227"} },
	},
	tbActition = 
	{
		--{"NpcFunLib:DropSingleItem",	{ITEM_COMMAND_PIECE_2,1,"20"} },
		{"ThisActivity:DropItemRandom",	{nil} },
	},
}

tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {"H祅g rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua m秐h Chi課 C玭g L謓h",3} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {"M秐h chi課 c玭g l謓h 1",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Ng﹏ lng",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_COMMAND_PIECE_1,1,EVENT_LOG_TITLE,"MuaManhChienCongLenh1"} },
	},
}
tbConfig[4] = --цi tho筰 Chng Жng Cung N�
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 Chng Жng Cung N�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Chng Жng Cung N�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu鑞 i Chi誧 M� H遖 B譶h",5} },		
		{"AddDialogOpt",	{"Ta mu鑞 i Chi誧 M� Tai B蘯",6} },		
		{"AddDialogOpt",	{"Ta mu鑞 i Chi誧 M� T� Do",7} },		
	},
}
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "фi Chi誧 M� H遖 B譶h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Chi誧 M� H遖 B譶h",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi kh玭g , l莕 sau h穣 n nh�!",">="} },
		{"AddOneMaterial",	{"M秐h chi課 c玭g 1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"M秐h chi課 c玭g 2",ITEM_COMMAND_PIECE_2,5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_HAT_PEACE,1,EVENT_LOG_TITLE,"DoiChiecMuHoaBinh"} },
	},
}
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "фi Chi誧 M� Tai B蘯",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Chi誧 M� Tai B蘯",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi kh玭g , l莕 sau h穣 n nh�!",">="} },
		{"AddOneMaterial",	{"M秐h chi課 c玭g 1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"M秐h chi課 c玭g 2",ITEM_COMMAND_PIECE_2,5} },
		{"AddOneMaterial",	{"T骾 m鮪g chi課 th緉g",ITEM_BAG_VICTORY,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EAR_HAT_DIRT,1,EVENT_LOG_TITLE,"DoiChiecMuTaiBeo"} },
	},
}
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "фi Chi誧 M� T� Do",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Chi誧 M� T� Do",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi kh玭g , l莕 sau h穣 n nh�!",">="} },
		{"AddOneMaterial",	{"M秐h chi課 c玭g 1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"M秐h chi課 c玭g 2",ITEM_COMMAND_PIECE_2,5} },
		{"AddOneMaterial",	{"T骾 m鮪g chi課 th緉g",ITEM_BAG_VICTORY,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_HAT_FREEDOM,1,EVENT_LOG_TITLE,"DoiChiecMuTuDo"} },
	},
}
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "S� d鬾g Chi誧 M� Tai B蘯",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30197,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d鬾g t筰 c竎 th祅h th� v� c竎 t﹏ th� th玭."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_USING, 2000, "M鏸 nh﹏ v藅 ch� 頲 s� d鬾g v藅 ph萴 n祔 2000 l莕.", "<"}},	
		--{"ThisActivity:UseLimitHat", {1}},
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"SuDungMuTaiBeo"} },
		{"ThisActivity:UseHatDirt",	{nil} },
	},
}
tbConfig[9] = 
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "S� d鬾g Chi誧 M� T� Do",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30199,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d鬾g t筰 c竎 th祅h th� v� c竎 t﹏ th� th玭."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_USING, 2000, "M鏸 nh﹏ v藅 ch� 頲 s� d鬾g v藅 ph萴 n祔 2000 l莕.", "<"}},	
		--{"ThisActivity:UseLimitHat", {1}},
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{12e6,0,EVENT_LOG_TITLE,"SuDungMuTuDo"} },
		{"ThisActivity:UseHatFreedom",	{nil} },
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "S� d鬾g Chi誧 M� H遖 B譶h",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30198,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d鬾g t筰 c竎 th祅h th� v� c竎 t﹏ th� th玭."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_PEACE_USING, 1000, "M鏸 nh﹏ v藅 ch� 頲 s� d鬾g v藅 ph萴 n祔 1000 l莕.", "<"}},	
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"SuDungMuHoaBinh"} },
		--{"ThisActivity:UseHatPeace",	{nil} },
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_HAT_PEACE_USING, 1}},
	},
}
