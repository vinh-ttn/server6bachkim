Include("\\script\\activitysys\\config\\86\\variables.lua")
tbConfig = {}

tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "Chuanguan",
	szName = "闯关过第28关",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
--		{"PlayerFunLib:GetItem",	{{tbProp={4,417,1,1,0,0,0},nBindState = -2},2,"Event_QuocKhanhVN","VuotAi28NhanTienDong"}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1652,1,0,0},nExpiredTime=20180310,},20,"Event_QuocKhanhVN","VuotAi28NhanTienDong"}},		
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi28", "20 T骾 M鮪g Xu﹏", 1}},
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡杀死水贼头领",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
--		{"PlayerFunLib:GetItem",	{{tbProp={4,417,1,1,0,0,0},nBindState = -2},1,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanDayThung"}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1652,1,0,0},nExpiredTime=20180310,},10,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanDayThung"}},
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "10 T骾 M鮪g Xu﹏", 1}},
	},
}

tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯过第十关",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
--		{"PlayerFunLib:GetItem",	{{tbProp={4,417,1,1,0,0,0},nBindState = -2},5,"Event_QuocKhanhVN","VuotAiViemDe10NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1652,1,0,0},nExpiredTime=20180310,},50,"Event_QuocKhanhVN","VuotAiViemDe10NhanDayThung"} },		
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "20 T骾 M鮪g Xu﹏", 1}},
	},
}

tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "NpcOnDeath",
	szName = "杀死黄金BOSS",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1652,1,0,0},nExpiredTime=20180310,},50,"Event_QuocKhanhVN","TieuDietBossTheGioi"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietBossTheGioi", "20 T骾 M鮪g Xu﹏", 1}},
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "fenglingdu_bigboatboss",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{90,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1652,1,0,0},nExpiredTime=20180310,},10,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanDayThung"}},
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "10 T骾 M鮪g Xu﹏", 1}},
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "FinishSongJin",
	szName = "T鑞g kim cao c蕄 k誸 th骳 t苙g li nh c� (th緉g)",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1652,1,0,0},nExpiredTime=20180310,},20,"[Ho箃 ng trung thu] [T鑞g Kim s秐 sinh li nh c竇"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "20 T骾 M鮪g Xu﹏", 1}},
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "FinishSongJin",
	szName = "T鑞g kim cao c蕄 k誸 th骳 t苙g li nh c� (h遖)",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {0,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1652,1,0,0},nExpiredTime=20180310,},15,"[Ho箃 ng trung thu] [T鑞g Kim s秐 sinh li nh c竇"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "15 T骾 M鮪g Xu﹏", 1}},		
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "FinishSongJin",
	szName = "T鑞g kim cao c蕄 k誸 th骳 t苙g li nh c� (thua)",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {-1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1652,1,0,0},nExpiredTime=20180310,},10,"[Ho箃 ng trung thu] [T鑞g Kim s秐 sinh c莕 c﹗ c竇"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "10 T骾 M鮪g Xu﹏", 1}},		
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "ClickNpc",
	szName = "V筺 L閏",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {"V筺 L閏"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"H頿 Th祅h B竛h Ch璶g",16} },
		{"AddDialogOpt",	{"фi Th駓 Tinh L蕐 V藅 Ph萴 Event",10} },		
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "фi qu� noel",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {"<npc>C竎 h� mu鑞 i lo筰 n祇?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"фi T� Th駓 Tinh",11} },
		{"AddDialogOpt",	{"фi T� Lam Tinh",12} },
		{"AddDialogOpt",	{"фi T� L鬰 Tinh",13} },
		{"AddDialogOpt",	{"фi T� Tinh H錸g B秓 Th筩h",14} },
		{"AddDialogOpt",	{"фi H祅h Hi謕 L謓h",15} },	
	},
}


tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "H頿 th祅h Tr� C� Thng",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {"Tr� C� Thng",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"1 T� Th駓 Tinh",{tbProp={4,239,1,1,0,0,0},},1} },
		{"lib:CheckDay",	{20180106, 20180310, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4688,1,0,0},nExpiredTime=20180310,},1,"[Ho箃 ng T骾 M鮪g Xu﹏]"} },
	},
}

tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "H頿 th祅h Tr� C� Thng",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {"Tr� C� Thng",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"1 Lam Th駓 Tinh",{tbProp={4,238,1,1,0,0,0},},1} },
		{"lib:CheckDay",	{20180106, 20180310, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4688,1,0,0},nExpiredTime=20180310,},1,"[Ho箃 ng T骾 M鮪g Xu﹏]"} },
	},
}

tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "H頿 th祅h Tr� C� Thng",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {"Tr� C� Thng",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"1 L鬰 Th駓 Tinh",{tbProp={4,240,1,1,0,0,0},},1} },
		{"lib:CheckDay",	{20180106, 20180310, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4688,1,0,0},nExpiredTime=20180310,},1,"[Ho箃 ng T骾 M鮪g Xu﹏]"} },
	},
}

tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "H頿 th祅h Tr� C� Thng",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {"Tr� C� Thng",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"1 Tinh H錸g B秓 Th筩h",{tbProp={4,353,1,1,0,0,0},},1} },
		{"lib:CheckDay",	{20180106, 20180310, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4688,1,0,0},nExpiredTime=20180310,},1,"[Ho箃 ng T骾 M鮪g Xu﹏]"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "H頿 th祅h Tr� C� Thng",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {"Tr� C� Thng",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"H祅h Hi謕 L謓h",{tbProp={6,1,2566,1,0,0},},10} },
		{"lib:CheckDay",	{20180106, 20180310, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4688,1,0,0},nExpiredTime=20180310,},1,"[Ho箃 ng T骾 M鮪g Xu﹏]"} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "CreateDialog",
	szName = "фi qu� noel",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {"<npc>C竎 h� mu鑞 i lo筰 n祇?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
	{"AddDialogOpt",	{"L祄 B竛h Ch璶g Thng",17} },
	{"AddDialogOpt",	{"L祄 B竛h Ch璶g Thng H筺g",18} },
	},
}

tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "фi H箃 Th駓 Tinh",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {"фi H箃 Th駓 Tinh",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L� b竛h",{tbProp={6,1,1653,1,0,0},},2} },
		{"AddOneMaterial",	{"G筼 n誴",{tbProp={6,1,1654,1,0,0},},2} },
		{"AddOneMaterial",	{"u xanh",{tbProp={6,1,1655,1,0,0},},2} },
		{"AddOneMaterial",	{"D﹜ c鉯",{tbProp={6,1,1656,1,0,0},},2} },	
		{"lib:CheckDay",	{20180106, 20180310, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1663,1,0,0},nExpiredTime=20180310,},1,"[Ho箃 ng Noel] [фi H箃 Th駓 Tinh]"} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "фi H箃 Ho祅g Kim",
	nStartDate = 201802060000,
	nEndDate  = 201803100000,
	tbMessageParam = {"фi H箃 Ho祅g Kim",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L� b竛h",{tbProp={6,1,1653,1,0,0},},2} },
		{"AddOneMaterial",	{"G筼 n誴",{tbProp={6,1,1654,1,0,0},},2} },
		{"AddOneMaterial",	{"u xanh",{tbProp={6,1,1655,1,0,0},},2} },
		{"AddOneMaterial",	{"D﹜ c鉯",{tbProp={6,1,1656,1,0,0},},2} },
		{"AddOneMaterial",	{"Th辴 heo",{tbProp={6,1,4688,1,0,0},},1} },
		{"lib:CheckDay",	{20180106, 20180310, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1662,1,0,0},nExpiredTime=20180310,},1,"[Ho箃 ng Noel] [фi H箃 Ho祅g Kim]"} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "YDBZguoguan",
	szName = "Vi猰 д vt qua 秈 th� 10 nh薾 頲 T骾 Gi竛g Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1652,1,0,0},nExpiredTime=20180310,},20,"Event_QuocKhanhVN","VuotAi28NhanTienDong"}},		
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi28", "20 T骾 M鮪g Xu﹏", 1}},
	},
}