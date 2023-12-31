Include("\\script\\activitysys\\config\\35\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "finish songjing and mark >= 3000",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,40,EVENT_LOG_TITLE,"TongKimDat3000DiemNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TongKimDat3000DiemNhanHatGiong", "40 H箃 Gi鑞g", 1}},
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"VuotQuaAi17NhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "VuotQuaAi17NhanHatGiong", "10 H箃 Gi鑞g", 1}},
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"VuotQuaAi28NhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "VuotQuaAi28NhanHatGiong", "10 H箃 Gi鑞g", 1}},
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "NpcOnDeath",
	szName = "fengling_leader",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinhNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietThuyTacDauLinhNhanHatGiong", "10 H箃 Gi鑞g", 1}},
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "fengling_bigleader",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinhNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietThuyTacDaiDauLinhNhanHatGiong", "20 H箃 Gi鑞g", 1}},
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ_10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"VuotQuaAi10ViemDeNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "VuotQuaAi10ViemDeNhanHatGiong", "20 H箃 Gi鑞g", 1}},
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "worldboss",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,50,EVENT_LOG_TITLE,"TieuDietBossHoangKimNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietBossHoangKimNhanHatGiong", "50 H箃 Gi鑞g", 1}},
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "FinishKillerBoss",
	szName = "killer",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {90},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,3,EVENT_LOG_TITLE,"TieuDietBossSatThuNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietBossSatThuNhanHatGiong", "3 H箃 Gi鑞g", 1}},
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "killer monster",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{szName="M﹎ B筩",tbProp={6,1,3103,1,0,0},nExpiredTime=20120201,},1,"5"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "FinishSongJin",
	szName = "finish songjing and mark >= 1000 and mark < 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"TongKimDat1000DiemNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TongKimDat1000DiemNhanHatGiong", "20 H箃 Gi鑞g", 1}},
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "click npc named plutus",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Чi Th莕 T礽"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"Trong ti誸 tr阨 xu﹏ 蕀 竝 n祔, c竎 i hi謕 c� th� n ch� c馻 ta y l蕐 c竎 lo筰 tr竔 c﹜  h頿 th祅h <color=yellow> M﹎ B筩 Ng� Qu� v� M﹎ V祅g Ng� Qu� <color>. Nh蕁 chu閠 s� d鬾g <color=yellow> M﹎ B筩 Ng� Qu� v� M﹎ V祅g Ng� Qu� <color> s� c� ph莕 thng h藆 h躰h, n誹 nh� may m緉 c� th� nh薾 頲 <color=yellow> Bao L� X� N╩ M韎, n誹 nh� i hi謕 a Bao L� X� N╩ M韎 (nh�) <color> v� 10 v筺 t苙g cho l穙 n筽 giao cho ta th� ta s� t苙g cho ngi ph莕 thng phong ph�. Trong su鑤 th阨 gian ho箃 ng ta s� lu玭 � y  cung h藆 gi� o cua c竎 ch� v� !"} },
		{"AddDialogOpt",	{"H頿 th祅h M﹎ B筩 Ng� Qu�",12} },
		{"AddDialogOpt",	{"H頿 th祅h M﹎ V祅g Ng� Qu�",15} },
		{"AddDialogOpt",	{"Giao n閜 Bao L� X� N╩ M韎 (nh�)",18} },
		{"AddDialogOpt",	{"фi Bao L� X� п",22} },
		{"AddDialogOpt",	{"Mi詎 ph� nh薾 kinh nghi謒",28} },
		{"AddDialogOpt",	{"Giao n閜 m苩 n� h譶h r錸g",30} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "wuguobaiyinpan select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H頿 th祅h M﹎ B筩 Ng� Qu� c� hai c竎h, c竎h th� 1: 1 N秈 Chu鑙 + 1 Tr竔 Cam + 1 Tr竔 Bi + 1 Tr竔 H錸g + 1 Tr竔 L� + 1 M﹎ B筩; C竎h 2 l�: 1 Tr竔 D鮝 + 1 Tr竔  я +1 Tr竔 M秐g C鐄 + 1 Tr竔 Sung + 1 Tr竔 Xo礽 + 1 M﹎ V祅g. Чi hi謕 mu鑞 s� d鬾g c竎h n祇. ",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"C竎h 1",13} },
		{"AddDialogOpt",	{"c竎h 2",14} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "wuguobaiyinpan plan_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M﹎ B筩 Ng� Qu�",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"N秈 Chu鑙",{tbProp={6,1,3098,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 Cam",{tbProp={6,1,3095,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 Bi",{tbProp={6,1,3097,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 H錸g",{tbProp={6,1,3099,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 L�",{tbProp={6,1,3096,1,0,0},},1} },
		{"AddOneMaterial",	{"M﹎ B筩",{tbProp={6,1,3103,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="M﹎ B筩 Ng� Qu�",tbProp={6,1,3105,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamBacNguQua"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "wuguobaiyinpan plan_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M﹎ B筩 Ng� Qu�",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Xo礽",{tbProp={6,1,3093,1,0,0},},1} },
		{"AddOneMaterial",	{"D鮝",{tbProp={6,1,3100,1,0,0},},1} },
		{"AddOneMaterial",	{" ",{tbProp={6,1,3101,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 M穘g C莡",{tbProp={6,1,3094,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 Sung",{tbProp={6,1,3102,1,0,0},},1} },
		{"AddOneMaterial",	{"M﹎ B筩",{tbProp={6,1,3103,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="M﹎ B筩 Ng� Qu�",tbProp={6,1,3105,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamBacNguQua"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "wuguohuangjinpan select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H頿 th祅h M﹎ V祅g Ng� Qu� c� hai c竎h, c竎h th� 1: 1 N秈 Chu鑙 + 1 Tr竔 Cam + 1 Tr竔 Bi + 1 Tr竔 H錸g + 1 Tr竔 L� + 1 M﹎ V祅g; C竎h th� 2: 1 Tr竔 D鮝 + 1  я + 1 M穘g C莡 + 1 Tr竔 Sung + 1 Tr竔 Xo礽 + M﹎ V祅g. Чi hi謕 mu鑞 s� d鬾g c竎h n祇.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"C竎h 1",16} },
		{"AddDialogOpt",	{"c竎h 2",17} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "wuguohuangjinpan plan_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M﹎ V祅g Ng� Qu�",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"N秈 Chu鑙",{tbProp={6,1,3098,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 Cam",{tbProp={6,1,3095,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 Bi",{tbProp={6,1,3097,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 H錸g",{tbProp={6,1,3099,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 L�",{tbProp={6,1,3096,1,0,0},},1} },
		{"AddOneMaterial",	{"M﹎ V祅g",{tbProp={6,1,3104,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3106,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamVangNguQua"} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "wuguohuangjinpan plan_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M﹎ V祅g Ng� Qu�",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Xo礽",{tbProp={6,1,3093,1,0,0},},1} },
		{"AddOneMaterial",	{"D鮝",{tbProp={6,1,3100,1,0,0},},1} },
		{"AddOneMaterial",	{" ",{tbProp={6,1,3101,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 M穘g C莡",{tbProp={6,1,3094,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr竔 Sung",{tbProp={6,1,3102,1,0,0},},1} },
		{"AddOneMaterial",	{"M﹎ V祅g",{tbProp={6,1,3104,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3106,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamVangNguQua"} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "handin redbag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",0,0,0,0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Bao L� X� N╩ M韎 (nh�)",{tbProp={6,1,3108,1,0,0},},1} },
		{"AddOneMaterial",	{"Ng﹏ lng",{nJxb=1},100000} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_REDBAG_DAILY,MAX_REDBAG_DAILY,"H玬 nay i hi謕  giao  r錳, i ng祔 mai h穣 ti誴 t鬰 nh�!","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{1000000,1,EVENT_LOG_TITLE,"NopBaoLiXiNamMoiTaiNPCDaiThanTai"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "NopBaoLiXiNamMoiTaiNPCDaiThanTai", "1000000 觤 kinh nghi謒", 1}},
		{"ThisActivity:AddTaskDaily",	{TSK_REDBAG_DAILY,1} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "use wuguodebaiyinpan",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3105,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d鬾g t筰 c竎 th祅h th� v� c竎 t﹏ th� th玭."} },
		{"ThisActivity:CheckTask",	{TSK_USED_WUGUOBAIYINPAN,MAX_USED_WUGUOBAIYINPAN,"Чi hi謕  nh薾 qu� nhi襲 ph莕 thng r錳, hay l� th� c竔 kh竎 xem sao!","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWuguobaiyinpan",	{nil} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "use wuguodehuangjinpan",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3106,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d鬾g t筰 c竎 th祅h th� v� c竎 t﹏ th� th玭."} },
		{"ThisActivity:CheckTask",	{TSK_USED_WUGUOHUANGJINPAN,MAX_USED_WUGUOHUANGJINPAN,"Чi hi謕  nh薾 qu� nhi襲 ph莕 thng r錳, hay l� th� c竔 kh竎 xem sao!","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWuguohuangjinpan",	{nil} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "use zhongzi",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3107,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:IsFightState",	{1, "Ch� c� th� s� d鬾g t筰 c竎 khu v鵦 chi課 u."} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d鬾g t筰 c竎 th祅h th� v� c竎 t﹏ th� th玭."} },
		{"ThisActivity:CheckUseZhongzi",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:UseZhongzi",	{nil} },
	},
}
tbConfig[22] = --фi bao l� x� 
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "bao li xi do select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"фi Bao L� X� п c� th� d飊g m閠 trong c竎 lo筰 b秓 th筩h sau:",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{2918,2,"H玬 nay i hi謕  i  r錳, i ng祔 mai h穣 ti誴 t鬰 nh�!","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"D飊g Tinh H錸g B秓 Th筩h",23} },
		{"AddDialogOpt",	{"D飊g Lam Th駓 Tinh",24} },
		{"AddDialogOpt",	{"D飊g T� Th駓 Tinh",25} },
		{"AddDialogOpt",	{"D飊g L鬰 Th駓 Tinh",26} },
	},
}
tbConfig[23] = --d飊g tinh h錸g i bao l� x� 
{
	nId = 23,
	szMessageType = "CreateCompose",
	szName = "baolixido_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l� x� ",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"Tinh H錸g B秓 Th筩h",{tbProp={4,353,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{		
		{"ThisActivity:ComposeRedEvelop",	{"DungTinhHongBaoThachDoiBaoLiXiDo"} },
	},
}
tbConfig[24] = --d飊g Lam Th駓 Tinh i bao l� x� 
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "baolixido_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l� x� ",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"Lam Th駓 Tinh",{tbProp={4,238,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{			
		{"ThisActivity:ComposeRedEvelop",	{"DungLamThuyTinhDoiBaoLiXiDo"} },
	},
}
tbConfig[25] = --d飊g T� Th駓 Tinh i bao l� x� 
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "baolixido_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l� x� ",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"T� Th駓 Tinh",{tbProp={4,239,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeRedEvelop",	{"DungTuThuyTinhDoiBaoLiXiDo"} },		
	},
}
tbConfig[26] = --d飊g L鬰 Th駓 Tinh i bao l� x� 
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "baolixido_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l� x� ",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"L鬰 Th駓 Tinh",{tbProp={4,240,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeRedEvelop",	{"DungLucThuyTinhDoiBaoLiXiDo"} },		
	},
}
tbConfig[27] = --S� d鬾g bao l� x� 
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "use red evelop",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30169,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{2500000,1,EVENT_LOG_TITLE,"SuDungBaoLiXiDo"} },
	},
}
tbConfig[28] =
{
	nId = 28,
	szMessageType = "CreateDialog",
	szName = "цi tho筰 nh薾 ph莕 thng free exp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"V祇 l骳 0:00-16-1-2012 n 24:00-17-1-2012, c竎 i hi謕 c蕄 150 v� 150 tr� l猲 (tr飊g sinh kh玭g gi韎 h筺) c� th� n g苝 ta  nh薾 m鉵 qu�  l� 100 tri謚 甶觤 kinh nghi謒 kh玭g c閚g d錸, m鏸 nh﹏ v藅 ch� c� th� nh薾 m閠 l莕 duy nh蕋.",0},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu鑞 nh薾 thng",29} },
	},
}
tbConfig[29] = 
{
	nId = 29,
	szMessageType = "nil",
	szName = "nh薾 ph莕 thng free exp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTimeGetFreeExp",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {{nTaskID = 2912,nStartBit = 21,nBitCount = 1,nMaxValue = 1}, 0, "M鏸 nh﹏ v藅 ch� 頲 nh薾 thng 1 l莕", "=="}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {{nTaskID = 2912,nStartBit = 21,nBitCount = 1,nMaxValue = 1}, 1}},
		{"PlayerFunLib:AddExp",	{100e6,0,EVENT_LOG_TITLE,"MienPhiNhanThuongDiemKinhNghiem"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "MienPhiNhanThuongDiemKinhNghiem", "100000000 觤 kinh nghi謒", 1}},
	},
}
tbConfig[30] = --n閜 m苩 n� r錸g
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "give dragon mask",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>фi 甶觤 kinh nghi謒",1,1,1,0.02},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"M苩 n� - Long Ch﹗",{tbProp={0,11,75,1,0,0},},1} },
		{"AddOneMaterial",	{"M苩 n� - u R錸g",{tbProp={0,11,76,1,0,0},},1} },
		{"AddOneMaterial",	{"M苩 n� - Th﹏ R錸g",{tbProp={0,11,77,1,0,0},},1} },
		{"AddOneMaterial",	{"M苩 n� - 玦 R錸g",{tbProp={0,11,78,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeDragonMask",	{nil} },		
	},
	tbActition = 
	{
		{"ThisActivity:ComposeDragonMask",	{nil} },		
	},
}