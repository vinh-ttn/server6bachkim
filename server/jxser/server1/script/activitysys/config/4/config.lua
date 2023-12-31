Include("\\script\\activitysys\\config\\4\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "KillMonster",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"340,321,322,225,226,227,75"} },
	},
	tbActition = 
	{
		{"ThisActivity:KillMonster",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "SongJin1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "SongJin3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,30,EVENT_LOG_TITLE,"TongKim3000"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "ChuangGuan17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"VuotAi17"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "ChuangGuan28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"VuotAi28"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "FengLingDu_Boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "FengLingDu_BigBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,15,EVENT_LOG_TITLE,"VuotAiViemDe6"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "GoldenBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,30,EVENT_LOG_TITLE,"TieuDietBossTheGioi"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "KillerBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,3,EVENT_LOG_TITLE,"TieuDietBossSatThu"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "ClickNpc_QiuYun",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thu V﹏"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi韎 thi謚 ho箃 ng",23} },
		{"AddDialogOpt",	{"H頿 th祅h Hoa Phng п",12} },
		{"AddDialogOpt",	{"H頿 th祅h Hoa Phng Tr緉g",13} },
		{"AddDialogOpt",	{"H頿 th祅h Hoa Phng T輒",14} },
		{"SetDialogTitle",	{"<npc>3/5/2012 n 24:00/31/52012, c竎 ch� v� i hi謕 c� th� n ch� c馻 t玦 s� d鬾g H箃 M莔, T骾 Thu鑓 T╪g Trng, B譶h Nc, Ph萴 M祏 S綾  h頿 th祅h c竎 lo筰 Hoa Phng  i l蕐 ph莕 thng."} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "nil",
	szName = "ComposeRedFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"Red"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "nil",
	szName = "ComposeWhiteFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"White"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "nil",
	szName = "ComposePurpleFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"Purple"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "UseRedFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3161,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"ThisActivity:CheckTask",	{TSK_RED_FLOWER_COUNT,N_MAX_RED_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseRedFlower",	{nil} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "UseWhiteFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3163,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"ThisActivity:CanUseWhiteFlower",	{nil} },
		{"ThisActivity:CheckTask",	{TSK_2_FLOWER_COUNT,N_MAX_2_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWhiteFlower",	{nil} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "UsePurpleFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3162,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H祅h trang 輙 nh蕋 c遪 1 ch� tr鑞g"} },
		{"ThisActivity:CheckTask",	{TSK_2_FLOWER_COUNT,N_MAX_2_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UsePurpleFlower",	{nil} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "ServerStart",
	szName = "ServerStart",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{"Thu V﹏",1907,{{11,3182,4951}}} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ClickNpc",
	szName = "ClickNpc_LingFan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H祅g rong"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua T骾 Thu鑓 T╪g Trng",20} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Buy_NongYao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T骾 Thu鑓 T╪g Trng",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H祅h trang 輙 nh蕋 c遪 1 ch� tr鑞g"} },
		{"AddOneMaterial",	{"Ng﹏ lng",{nJxb=10000},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3158,1,0,0},nExpiredTime=20120601,},1,EVENT_LOG_TITLE,"BuyNongyao"} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "UseSeedBox",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3164,1,0,0}}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Kh玭g gian h祅h trang kh玭g  ch� tr鑞g, xin h穣 s緋 x誴 l筰 輙 nh蕋 c遪 hai ch� tr鑞g trong h祅h trang"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3157,1,0,0},nExpiredTime=20120601},100,EVENT_LOG_TITLE,"UseSeedBox"} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "UseWaterBox",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3165,1,0,0}}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Kh玭g gian h祅h trang kh玭g  ch� tr鑞g, xin h穣 s緋 x誴 l筰 輙 nh蕋 c遪 hai ch� tr鑞g trong h祅h trang"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3159,1,0,0},nExpiredTime=20120601},100,EVENT_LOG_TITLE,"UseWaterBox"} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>H箃 M莔 c� th� t譵 th蕐 t筰 M筩 Cao Qu藅, Trng B筩h S琻 Nam, Trng B筩h S琻 B綾, Sa M筩 1, Sa M筩 2, Sa M筩 3, Kh醓 Lang чng, T骾 Thu鑓 T╪g Trng c� th� t譵 th蕐 t筰 H祅g Rong, B譶h Nc c� th� th玭g qua tham gia T鑞g Kim, Vt 秈, Phong L╪g ч, Vi猰 д, Boss Ho祅g Kim, Boss S竧 Th�. Ph萴 M祏 S綾 c� t筰 K� Tr﹏ C竎, khi i hi謕 t譵  4 lo筰 v藅 ph萴 n祔 c� th� n ch� c馻 ta y h頿 th祅h c竎 lo筰 Hoa Phng s綾 m祏  i ph莕 thng phong ph�",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[31] = --一个细节
{
	nId = 31,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[32] = --一个细节
{
	nId = 32,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
