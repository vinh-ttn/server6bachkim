Include("\\script\\activitysys\\config\\31\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "服务器启动加载npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "打怪给奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	--Fix map ID Kh醓 Lang ng - Modified by DinhHQ - 20110606
		{"NpcFunLib:CheckInMap",	{"321,322,340,75,93,144,225,226,227"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2862,1,0,0},nExpiredTime=20110630,},1,"8"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "高级宋金得分大于1000小于3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_songjinggethongselihe", "TongKim1000Diem"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "高级宋金得分大于3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {15, "jxshengri_songjinghuodehongselihe", "TongKim3000Diem"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "高级闯关过第17关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_chuangguanggetlihe", "VuotAiCaoCap(Ai17)"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "高级闯关过第28关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox",	{10, "jxshengri_chuangguanghuodelihe", "VuotAiCaoCap(Ai28)"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "在1、2、3码头打怪",
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
		{"ThisActivity:GiveRedBox", {5, "jxshengri_shuizeitoulingdiaoluohongselihe", "TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Nhi謒 v� s竧 th� c蕄 90",
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
		{"ThisActivity:GiveRedBox", {1, "jxshengri_shashouchanchuhongselihe", "TieuDietBossSatThu90"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "世界BOSS",
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
		{"ThisActivity:GiveRedBox", {20, "jxshengri_bosschanchuhongselihe", "TieuDietBossTheGioi"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveRedBox", {1, "jxshengri_yandichanchuhongselihe"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "YDBZ_KillMaxBoss",
	szName = "炎帝杀死BOSS",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"ThisActivity:YDBZ_GiveRedBox",	{nil} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "FinishMail",
	szName = "完成信使任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveRedBox", {5, "jxshengri_xinshichanchuhongselihe"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "使用蓝色礼盒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2862,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseBlueBox",	{nil} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "使用红色礼盒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2863,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseRedBox",	{nil} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "ClickNpc",
	szName = "与蛋糕对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B竛h Sinh Nh藅"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"H頿 th祅h B竛h Kem",16} },
		{"AddDialogOpt",	{"H頿 th祅h B竛h Sinh Nh藅",17} },
		{"AddDialogOpt",	{"H頿 th祅h B竛h Sinh Nh藅 c Bi謙",18} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "H頿 th祅h B竛h Kem",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B竛h Kem",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"S鱝 Ti",{tbProp={6,1,2851,1,0,0},},2} },
		{"AddOneMaterial",	{"Л阯g tinh",{tbProp={6,1,2852,1,0,0},},2} },
		{"AddOneMaterial",	{"B閠 m� ",{tbProp={6,1,2853,1,0,0},},2} },
		{"AddOneMaterial",	{"Kem",{tbProp={6,1,2856,1,0,0},},1} },
		{"AddOneMaterial",	{"B�",{tbProp={6,1,2855,1,0,0},},2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2859,1,0,0},nExpiredTime=20110630,},1,"SinhNhatVoLamTruyenKy\tHopThanhBanhKem"} },
		{"AddStatData",	{"jxshengri_naiyoubing", 1} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "H頿 th祅h B竛h Sinh Nh藅",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H頿 th祅h B竛h Sinh Nh藅",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"S鱝 Ti",{tbProp={6,1,2851,1,0,0},},2} },
		{"AddOneMaterial",	{"Л阯g tinh",{tbProp={6,1,2852,1,0,0},},2} },
		{"AddOneMaterial",	{"B閠 m� ",{tbProp={6,1,2853,1,0,0},},2} },
		{"AddOneMaterial",	{"Kem",{tbProp={6,1,2856,1,0,0},},1} },
		{"AddOneMaterial",	{"B�",{tbProp={6,1,2855,1,0,0},},2} },
		{"AddOneMaterial",	{"SoCoLa",{tbProp={6,1,2854,1,0,0},},1} },
		{"AddOneMaterial",	{"N課 Sinh Nh藅",{tbProp={6,1,2857,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GetCake",	{nil} },
		{"AddStatData",	{"jxshengri_dangao", 1} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "H頿 th祅h B竛h Sinh Nh藅 c Bi謙",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B竛h Sinh Nh藅 c Bi謙",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"B竛h Sinh Nh藅 L韓",{tbProp={6,1,2861,1,0,0},},1} },
		{"AddOneMaterial",	{"Gi� Tr竔 C﹜",{tbProp={6,1,2858,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2864,1,0,0},nExpiredTime=20110630,},1,"SinhNhatVoLamTruyenKy\tHopThanhBanhSinhNhatDacBiet"} },
		{"AddStatData",	{"jxshengri_tebiedangao", 1} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "使用奶油饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2859,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"C蕄 150 tr� l猲 ho芻  tr飊g sinh m韎 頲 s� d鬾g",">="} },
		{"ThisActivity:CheckTask",	{TSKG_NaiYouBing,1000,"Trong su鑤 th阨 gian ho箃 ng m鏸 nh﹏ v藅 ch� 頲 s� d鬾g nhi襲 nh蕋 1000  B竛h Kem","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKG_NaiYouBing,1} },
		{"ThisActivity:UseNaiYouBing",	{nil} },		
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "使用小蛋糕",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2860,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"C蕄 150 tr� l猲 ho芻  tr飊g sinh m韎 頲 s� d鬾g",">="} },
		{"ThisActivity:CheckTask",	{TKSG_XiaoDanGao,500,"Trong su鑤 th阨 gian ho箃 ng m鏸 nh﹏ v藅 ch� 頲 s� d鬾g nhi襲 nh蕋 500  B竛h Sinh Nh藅 nh�","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"H祅h trang kh玭g "} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_XiaoDanGao,1} },
		{"ThisActivity:UseXiaoDanGao",	{nil} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "使用大蛋糕",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2861,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"C蕄 150 tr� l猲 ho芻  tr飊g sinh m韎 頲 s� d鬾g",">="} },
		{"ThisActivity:CheckTaskDaily",	{TKSG_DaDanGao,10,"M鏸 ng祔 ch� 頲 s� d鬾g nhi襲 nh蕋 10  B竛h Sinh Nh藅 l韓","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"H祅h trang kh玭g "} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TKSG_DaDanGao,1} },
		{"ThisActivity:UseDaDanGao",	{nil} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "使用特别生日饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2864,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"C蕄 150 tr� l猲 ho芻  tr飊g sinh m韎 頲 s� d鬾g",">="} },
		{"ThisActivity:CheckTask",	{TKSG_TeBieShengRiBing,400,"Trong su鑤 th阨 gian ho箃 ng m鏸 nh﹏ v藅 ch� 頲 s� d鬾g nhi襲 nh蕋 400 B竛h Sinh Nh藅 c Bi謙","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"H祅h trang kh玭g "} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_TeBieShengRiBing,1} },
		{"ThisActivity:UseTeBieDanGao",	{nil} },
		{"ThisActivity:GetRabbit",	{nil} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "ClickNpc",
	szName = "L玭g Th� i l蕐 Phi猲 V�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"祅 Чi Nh﹏"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"фi Phi猲 V�",24} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "H頿 th祅h Phi猲 V�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi猲 V� ",0,2,3,1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"L玭g Th�",{tbProp={6,1,2865,1,0,0},},200} },
	},
	tbActition = 
	{
		{"ThisActivity:GetFanYu",	{nil}},
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "NpcOnDeath",
	szName = "杀死水贼大头领",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_shuizeidatoulingdiaoluohongselihe", "TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "FinishSongJin",
	szName = "HoanThanhTranTK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:AddTaskDaily",	{2725,1} },
		{"ThisActivity:Vn_AwardOnSJMatchCount",	{nil} },
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "Chuanguan",
	szName = "HoanThanhAi28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },		
	},
	tbActition = 
	{
		--{"PlayerFunLib:AddTaskDaily",	{2726,1} },
		{"ThisActivity:Vn_AwardOnCOTMatchCount",	{nil} },
	},
}
tbConfig[28] = 
{
	nId = 28,
	szMessageType = "FinishFengLingDu",
	szName = "Ho祅 th祅h Phong L╪g ч t鑞 ph�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:Vn_CheckPLDTime", {nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,},10,"SinhNhatVoLamTruyenKy\tHoanThanhPLDTonPhi"} },
	},
}