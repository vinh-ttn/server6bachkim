Include("\\script\\activitysys\\config\\45\\variables.lua")
tbConfig = {}

tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "Chuanguan",
	szName = "闯关过第28关",
	nStartDate = 201708300000,
	nEndDate  = 201809300000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
--		{"PlayerFunLib:GetItem",	{{tbProp={4,417,1,1,0,0,0},nBindState = -2},2,"Event_QuocKhanhVN","Xu Khoa"}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4690,1,0,0}},2,"Event","vuotai28nhanlenhbai"}},		
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi28", "1 L謓h B礽 Chi課 M�", 1}},
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡杀死水贼头领",
	nStartDate = 201708300000,
	nEndDate  = 201809300000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },	
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4690,1,0,0}},1,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanDayThung"}},
--		{"PlayerFunLib:GetItem",	{{tbProp={4,417,1,1,0,0,0},nBindState = -2},1,"Event_QuocKhanhVN","Xu Khoa"}},		
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDauLinh", "1 L謓h B礽 Chi課 M�", 1}},
	},
}

tbConfig[3] = --цi tho筰 Chng Жng Cung N�
{
	nId = 3,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T秓 мa T╪g"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
--		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓  Ho祅g Kim Lo筰 2 Th祅h Maxop",4} },
--		{"AddDialogOpt",	{"Ta mu鑞 Tr飊g Luy謓 Reset th阨 h筺 Ho祅g Kim Lo筰 2",74} },	
--		{"AddDialogOpt",	{"Ta mu鑞 i M苩 N�",17} },
--		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓  Ho祅g Kim Lo筰 2",6} },
--		{"AddDialogOpt",	{"TTa mu鑞 i M苩 N� Truy襫 Th鑞g",25} },		
	},
}

tbConfig[4] = --цi tho筰 Chng Жng Cung N�
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺 nh璶g kh玭g th� gia h筺 th阨 gian cho  ngi h穣 c﹏ nh綾 cho k� nh�!"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Tr飊g Luy謓 у Ho祅g Kim Theo C竎h 1",5} },	
--		{"AddDialogOpt",	{"Ta mu鑞 i M苩 N�",17} },
		{"AddDialogOpt",	{"Tr飊g Luy謓 у Ho祅g Kim Theo C竎h 2",6} },	
--		{"AddDialogOpt",	{"Ta mu鑞 i B秓 Rng Nhu T譶h",6} },		
--		{"AddDialogOpt",	{"Ta mu鑞 i B秓 Rng Hi謕 C鑤",7} },		
--		{"AddDialogOpt",	{"Ta mu鑞 i B秓 Rng Vinh Di謚",8} },
--		{"AddDialogOpt",	{"Ta mu鑞 i B秓 B秓 Rng V� Danh",9} },			
	},
}


tbConfig[5] = --цi tho筰 Chng Жng Cung N�
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Thi誹 L﹎",7} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Thi猲 Vng",11} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Nga My",15} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Th髖 Y猲",18} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Ng� чc",21} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Л阯g M玭",24} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� C竔 Bang",28} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Thi猲 Nh蒼",31} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� V� ng",34} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� C玭 L玭",37} },	
		
	},
}
tbConfig[6] = --цi tho筰 Chng Жng Cung N�
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Thi誹 L﹎",40} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Thi猲 Vng",44} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Nga My",48} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Th髖 Y猲",51} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Ng� чc",54} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Л阯g M玭",57} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� C竔 Bang",61} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� Thi猲 Nh蒼",64} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� V� ng",67} },
		{"AddDialogOpt",	{"Ta mu鑞 tr飊g luy謓 Trang B� C玭 L玭",70} },		
		
	},
}

tbConfig[7] = --цi tho筰 Chng Жng Cung N�
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"M閚g Long Ch輓h H錸g T╪g M穙",8} },
		{"AddDialogOpt",	{"Ph鬰 Ma Ph� ч T╪g H礽",9} },
		{"AddDialogOpt",	{"T� Kh玭g Nhuy詎 B� H� Uy觧",10} },
	
		
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M閚g Long Ch輓h H錸g T╪g M穙",{tbProp={0,1},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,220},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ph鬰 Ma Ph� ч T╪g H礽",{tbProp={0,10},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,229},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T� Kh玭g Nhuy詎 B� H� Uy觧",{tbProp={0,14},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,233},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[11] = --цi tho筰 Chng Жng Cung N�
{
	nId = 11,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" K� Nghi謕 Chu Tc L╪g V﹏ Ngoa",12} },
		{"AddDialogOpt",	{" Ng� Long T蕁 Phong H� y觧",13} },
		{"AddDialogOpt",	{" H竚 Thi猲 Th鮝 Long Chi課 Ngoa",14} },
			
	},
}

tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"K� Nghi謕 Chu Tc L╪g V﹏ Ngoa",{tbProp={0,25},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,244},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng� Long T蕁 Phong H� y觧",{tbProp={0,29},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,248},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"H竚 Thi猲 Th鮝 Long Chi課 Ngoa",{tbProp={0,20},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,239},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[15] = --цi tho筰 Chng Жng Cung N�
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" V� Gian C莔 V薾 H� Uy觧",16} },
		{"AddDialogOpt",	{" V� Ma H錸g Truy Nhuy詎 Th竝 H礽",17} },
			
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"V� Gian C莔 V薾 H� Uy觧",{tbProp={0,34},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,253},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"V� Ma H錸g Truy Nhuy詎 Th竝 H礽",{tbProp={0,40},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,259},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[18] = --цi tho筰 Chng Жng Cung N�
{
	nId = 18,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" T� Ho祅g B╪g Tung C萴 uy觧",19} },
		{"AddDialogOpt",	{" B輈h H秈 H錸g Linh Kim Ti i",20} },
			
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T� Ho祅g B╪g Tung C萴 uy觧",{tbProp={0,49},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,810},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B輈h H秈 H錸g Linh Kim Ti i",{tbProp={0,53},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,272},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[21] = --цi tho筰 Chng Жng Cung N�
{
	nId = 21,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" U Lung X輈h Y誸 M藅 trang",22} },
		{"AddDialogOpt",	{" Minh 秓 U чc 竚 Y",23} },
			
	},
}

tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"U Lung X輈h Y誸 M藅 trang",{tbProp={0,57},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,276},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Minh 秓 U чc 竚 Y",{tbProp={0,62},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,281},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[24] = --цi tho筰 Chng Жng Cung N�
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"B╪g H祅 Huy襫 Y Th骳 Gi竝",25} },
		{"AddDialogOpt",	{"Thi猲 Quang Song B筼 H祅 Thi誸 Tr筩",26} },
		{"AddDialogOpt",	{"S﹎ Hoang Tinh V蒼 Phi L�",27} },		
			
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B╪g H祅 Huy襫 Y Th骳 Gi竝",{tbProp={0,72},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,291},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Thi猲 Quang Song B筼 H祅 Thi誸 Tr筩",{tbProp={0,79},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,298},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"S﹎ Hoang Tinh V蒼 Phi L�",{tbProp={0,85},},1} },
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,304},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[28] = --цi tho筰 Chng Жng Cung N�
{
	nId = 28,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"уng C鮱 Phi Long u Ho祅",29} },
		{"AddDialogOpt",	{"мch Kh竔 Tri襫 M穘g Y猽 Цi",30} },	
			
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"уng C鮱 Phi Long u Ho祅",{tbProp={0,91},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,310},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"мch Kh竔 Tri襫 M穘g y猽 i",{tbProp={0,98},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,317},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[31] = --цi tho筰 Chng Жng Cung N�
{
	nId = 31,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Ma S竧 C� H醓 Li猽 Thi猲 uy觧",32} },
		{"AddDialogOpt",	{"Ma Th� Huy誸 Ng鋍 Th蕋 S竧 B閕",33} },	
			
	},
}
tbConfig[32] = --一个细节
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ma S竧 C� H醓 Li猽 Thi猲 uy觧",{tbProp={0,104},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,323},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[33] = --一个细节
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ma Th� Huy誸 Ng鋍 Th蕋 S竧 B閕",{tbProp={0,114},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,333},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[34] = --цi tho筰 Chng Жng Cung N�
{
	nId = 34,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕",35} },
		{"AddDialogOpt",	{"C藀 Phong Th髖 Ng鋍 Huy襫 Ho祅g B閕",36} },	
			
	},
}
tbConfig[35] = --一个细节
{
	nId = 35,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕",{tbProp={0,119},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,338},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[36] = --一个细节
{
	nId = 36,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"C藀 Phong Th髖 Ng鋍 Huy襫 Ho祅g B閕",{tbProp={0,124},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,343},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[37] = --цi tho筰 Chng Жng Cung N�
{
	nId = 37,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Sng Tinh Thi猲 Tinh B╪g Tinh th�",38} },
		{"AddDialogOpt",	{"L玦 Khung Linh Ng鋍 U萵 L玦",39} },	
			
	},
}
tbConfig[38] = --一个细节
{
	nId = 38,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Sng Tinh Thi猲 Tinh B╪g Tinh th�",{tbProp={0,129},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,348},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[39] = --一个细节
{
	nId = 39,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L玦 Khung Linh Ng鋍 U萵 L玦",{tbProp={0,134},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},250} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,353},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
----------------------------------trung luyen cach 2---------------------------------------
tbConfig[40] = --цi tho筰 Chng Жng Cung N�
{
	nId = 40,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"M閚g Long Ch輓h H錸g T╪g M穙",41} },
		{"AddDialogOpt",	{"Ph鬰 Ma Ph� ч T╪g H礽",42} },
		{"AddDialogOpt",	{"T� Kh玭g Nhuy詎 B� H� Uy觧",43} },
	
		
	},
}
tbConfig[41] = --一个细节
{
	nId = 41,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M閚g Long Ch輓h H錸g T╪g M穙",{tbProp={0,1},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,220},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[42] = --一个细节
{
	nId = 42,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ph鬰 Ma Ph� ч T╪g H礽",{tbProp={0,10},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,229},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[43] = --一个细节
{
	nId = 43,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T� Kh玭g Nhuy詎 B� H� Uy觧",{tbProp={0,14},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,233},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[44] = --цi tho筰 Chng Жng Cung N�
{
	nId = 44,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" K� Nghi謕 Chu Tc L╪g V﹏ Ngoa",45} },
		{"AddDialogOpt",	{" Ng� Long T蕁 Phong H� y觧",46} },
		{"AddDialogOpt",	{" H竚 Thi猲 Th鮝 Long Chi課 Ngoa",47} },
			
	},
}

tbConfig[45] = --一个细节
{
	nId = 45,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"K� Nghi謕 Chu Tc L╪g V﹏ Ngoa",{tbProp={0,25},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,244},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[46] = --一个细节
{
	nId = 46,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng� Long T蕁 Phong H� y觧",{tbProp={0,29},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,248},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[47] = --一个细节
{
	nId = 47,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"H竚 Thi猲 Th鮝 Long Chi課 Ngoa",{tbProp={0,20},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,239},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[48] = --цi tho筰 Chng Жng Cung N�
{
	nId = 48,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" V� Gian C莔 V薾 H� Uy觧",49} },
		{"AddDialogOpt",	{" V� Ma H錸g Truy Nhuy詎 Th竝 H礽",50} },
			
	},
}
tbConfig[49] = --一个细节
{
	nId = 49,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"V� Gian C莔 V薾 H� Uy觧",{tbProp={0,34},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,253},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[50] = --一个细节
{
	nId = 50,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"V� Ma H錸g Truy Nhuy詎 Th竝 H礽",{tbProp={0,40},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,259},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[51] = --цi tho筰 Chng Жng Cung N�
{
	nId = 51,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" T� Ho祅g B╪g Tung C萴 uy觧",52} },
		{"AddDialogOpt",	{" B輈h H秈 H錸g Linh Kim Ti i",53} },
			
	},
}
tbConfig[52] = --一个细节
{
	nId = 52,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T� Ho祅g B╪g Tung C萴 uy觧",{tbProp={0,49},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,810},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[53] = --一个细节
{
	nId = 53,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B輈h H秈 H錸g Linh Kim Ti i",{tbProp={0,53},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,272},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[54] = --цi tho筰 Chng Жng Cung N�
{
	nId = 54,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" U Lung X輈h Y誸 M藅 trang",55} },
		{"AddDialogOpt",	{" Minh 秓 U чc 竚 Y",56} },
			
	},
}

tbConfig[55] = --一个细节
{
	nId = 55,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"U Lung X輈h Y誸 M藅 trang",{tbProp={0,57},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,276},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[56] = --一个细节
{
	nId = 56,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Minh 秓 U чc 竚 Y",{tbProp={0,62},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,281},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[57] = --цi tho筰 Chng Жng Cung N�
{
	nId = 57,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"B╪g H祅 Huy襫 Y Th骳 Gi竝",58} },
		{"AddDialogOpt",	{"Thi猲 Quang Song B筼 H祅 Thi誸 Tr筩",59} },
		{"AddDialogOpt",	{"S﹎ Hoang Tinh V蒼 Phi L�",60} },		
			
	},
}
tbConfig[58] = --一个细节
{
	nId = 58,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B╪g H祅 Huy襫 Y Th骳 Gi竝",{tbProp={0,72},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,291},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[59] = --一个细节
{
	nId = 59,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Thi猲 Quang Song B筼 H祅 Thi誸 Tr筩",{tbProp={0,79},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,298},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[60] = --一个细节
{
	nId = 60,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"S﹎ Hoang Tinh V蒼 Phi L�",{tbProp={0,85},},1} },
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,304},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[61] = --цi tho筰 Chng Жng Cung N�
{
	nId = 61,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"уng C鮱 Phi Long u Ho祅",62} },
		{"AddDialogOpt",	{"мch Kh竔 Tri襫 M穘g Y猽 Цi",63} },	
			
	},
}
tbConfig[62] = --一个细节
{
	nId = 62,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"уng C鮱 Phi Long u Ho祅",{tbProp={0,91},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,310},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[63] = --一个细节
{
	nId = 63,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"мch Kh竔 Tri襫 M穘g y猽 i",{tbProp={0,98},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,317},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[64] = --цi tho筰 Chng Жng Cung N�
{
	nId = 64,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Ma S竧 C� H醓 Li猽 Thi猲 uy觧",65} },
		{"AddDialogOpt",	{"Ma Th� Huy誸 Ng鋍 Th蕋 S竧 B閕",66} },	
			
	},
}
tbConfig[65] = --一个细节
{
	nId = 65,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ma S竧 C� H醓 Li猽 Thi猲 uy觧",{tbProp={0,104},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,323},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[66] = --一个细节
{
	nId = 66,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ma Th� Huy誸 Ng鋍 Th蕋 S竧 B閕",{tbProp={0,114},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,333},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[67] = --цi tho筰 Chng Жng Cung N�
{
	nId = 67,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕",68} },
		{"AddDialogOpt",	{"C藀 Phong Th髖 Ng鋍 Huy襫 Ho祅g B閕",69} },	
			
	},
}
tbConfig[68] = --一个细节
{
	nId = 68,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕",{tbProp={0,119},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,339},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[69] = --一个细节
{
	nId = 69,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"C藀 Phong Th髖 Ng鋍 Huy襫 Ho祅g B閕",{tbProp={0,124},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,343},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[70] = --цi tho筰 Chng Жng Cung N�
{
	nId = 70,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Sng Tinh Thi猲 Tinh B╪g Tinh th�",71} },
		{"AddDialogOpt",	{"L玦 Khung Linh Ng鋍 U萵 L玦",72} },	
			
	},
}
tbConfig[71] = --一个细节
{
	nId = 71,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Sng Tinh Thi猲 Tinh B╪g Tinh th�",{tbProp={0,129},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,348},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[72] = --一个细节
{
	nId = 72,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L玦 Khung Linh Ng鋍 U萵 L玦",{tbProp={0,134},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},150} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,353},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[73] = --一个细节
{
	nId = 73,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯过第十关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H祅h trang c馻 b筺 kh玭g c遪 ch� tr鑞g, ph莕 thng l莕 n祔 kh玭g nh薾 頲"} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={4,417,1,1,0,0,0},nBindState = -2},2,"Event_QuocKhanhVN","VuotAiViemDe10NhanDayThung"}},	
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAiViemDe10", "2 Ti襫 уng", 1}},
	},
}
-----------RESET DO HOANG KIM LOAI 2-------------------------
tbConfig[74] = --цi tho筰 Chng Жng Cung N�
{
	nId = 74,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau Khi tr飊g luy謓 thu閏 t輓h s� thay i v� th阨 h筺  Ho祅g Kim 頲 reset l筰 ban u ngi c� mu鑞 th� kh玭g?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Reset у Ho祅g Kim Theo C竎h 1",108} },	
--		{"AddDialogOpt",	{"Ta mu鑞 i M苩 N�",17} },
		{"AddDialogOpt",	{"Reset у Ho祅g Kim Theo C竎h 2",109} },	
--		{"AddDialogOpt",	{"Ta mu鑞 i B秓 Rng Nhu T譶h",6} },		
--		{"AddDialogOpt",	{"Ta mu鑞 i B秓 Rng Hi謕 C鑤",7} },		
--		{"AddDialogOpt",	{"Ta mu鑞 i B秓 Rng Vinh Di謚",8} },
--		{"AddDialogOpt",	{"Ta mu鑞 i B秓 B秓 Rng V� Danh",9} },			
	},
}
tbConfig[75] = --цi tho筰 Chng Жng Cung N�
{
	nId = 75,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"M閚g Long Ch輓h H錸g T╪g M穙",76} },
		{"AddDialogOpt",	{"Ph鬰 Ma Ph� ч T╪g H礽",77} },
		{"AddDialogOpt",	{"T� Kh玭g Nhuy詎 B� H� Uy觧",78} },

	},
}
tbConfig[76] = --一个细节
{
	nId = 76,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M閚g Long Ch輓h H錸g T╪g M穙",{tbProp={0,1},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,1},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[77] = --一个细节
{
	nId = 77,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ph鬰 Ma Ph� ч T╪g H礽",{tbProp={0,10},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,10},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[78] = --一个细节
{
	nId = 78,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T� Kh玭g Nhuy詎 B� H� Uy觧",{tbProp={0,14},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,14},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[79] = --цi tho筰 Chng Жng Cung N�
{
	nId = 79,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" K� Nghi謕 Chu Tc L╪g V﹏ Ngoa",80} },
		{"AddDialogOpt",	{" Ng� Long T蕁 Phong H� y觧",81} },
		{"AddDialogOpt",	{" H竚 Thi猲 Th鮝 Long Chi課 Ngoa",82} },
			
	},
}

tbConfig[80] = --一个细节
{
	nId = 80,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"K� Nghi謕 Chu Tc L╪g V﹏ Ngoa",{tbProp={0,25},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,25},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[81] = --一个细节
{
	nId = 81,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng� Long T蕁 Phong H� y觧",{tbProp={0,29},},1} },
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,29},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[82] = --一个细节
{
	nId = 82,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"H竚 Thi猲 Th鮝 Long Chi課 Ngoa",{tbProp={0,20},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,20},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[83] = --цi tho筰 Chng Жng Cung N�
{
	nId = 83,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" V� Gian C莔 V薾 H� Uy觧",84} },
		{"AddDialogOpt",	{" V� Ma H錸g Truy Nhuy詎 Th竝 H礽",85} },
			
	},
}
tbConfig[84] = --一个细节
{
	nId = 84,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"V� Gian C莔 V薾 H� Uy觧",{tbProp={0,34},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,34},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[85] = --一个细节
{
	nId = 85,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"V� Ma H錸g Truy Nhuy詎 Th竝 H礽",{tbProp={0,40},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,40},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[86] = --цi tho筰 Chng Жng Cung N�
{
	nId = 86,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" T� Ho祅g B╪g Tung C萴 uy觧",87} },
		{"AddDialogOpt",	{" B輈h H秈 H錸g Linh Kim Ti i",88} },
			
	},
}
tbConfig[87] = --一个细节
{
	nId = 87,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T� Ho祅g B╪g Tung C萴 uy觧",{tbProp={0,49},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,49},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[88] = --一个细节
{
	nId = 88,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B輈h H秈 H錸g Linh Kim Ti i",{tbProp={0,53},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,53},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[89] = --цi tho筰 Chng Жng Cung N�
{
	nId = 89,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" U Lung X輈h Y誸 M藅 trang",90} },
		{"AddDialogOpt",	{" Minh 秓 U чc 竚 Y",91} },
			
	},
}

tbConfig[90] = --一个细节
{
	nId = 90,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"U Lung X輈h Y誸 M藅 trang",{tbProp={0,57},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,57},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[91] = --一个细节
{
	nId = 91,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Minh 秓 U чc 竚 Y",{tbProp={0,62},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,62},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[92] = --цi tho筰 Chng Жng Cung N�
{
	nId = 92,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"B╪g H祅 Huy襫 Y Th骳 Gi竝",93} },
		{"AddDialogOpt",	{"Thi猲 Quang Song B筼 H祅 Thi誸 Tr筩",94} },
		{"AddDialogOpt",	{"S﹎ Hoang Tinh V蒼 Phi L�",95} },		
			
	},
}
tbConfig[93] = --一个细节
{
	nId = 93,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B╪g H祅 Huy襫 Y Th骳 Gi竝",{tbProp={0,72},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,72},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[94] = --一个细节
{
	nId = 94,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Thi猲 Quang Song B筼 H祅 Thi誸 Tr筩",{tbProp={0,79},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,79},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[95] = --一个细节
{
	nId = 95,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"S﹎ Hoang Tinh V蒼 Phi L�",{tbProp={0,85},},1} },
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,85},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[96] = --цi tho筰 Chng Жng Cung N�
{
	nId = 96,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"уng C鮱 Phi Long u Ho祅",97} },
		{"AddDialogOpt",	{"мch Kh竔 Tri襫 M穘g Y猽 Цi",98} },	
			
	},
}
tbConfig[97] = --一个细节
{
	nId = 97,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"уng C鮱 Phi Long u Ho祅",{tbProp={0,91},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,91},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[98] = --一个细节
{
	nId = 98,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"мch Kh竔 Tri襫 M穘g y猽 i",{tbProp={0,98},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,98},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[99] = --цi tho筰 Chng Жng Cung N�
{
	nId = 99,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Ma S竧 C� H醓 Li猽 Thi猲 uy觧",100} },
		{"AddDialogOpt",	{"Ma Th� Huy誸 Ng鋍 Th蕋 S竧 B閕",101} },	
			
	},
}
tbConfig[100] = --一个细节
{
	nId = 100,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ma S竧 C� H醓 Li猽 Thi猲 uy觧",{tbProp={0,104},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,104},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[101] = --一个细节
{
	nId = 101,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ma Th� Huy誸 Ng鋍 Th蕋 S竧 B閕",{tbProp={0,114},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,114},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[102] = --цi tho筰 Chng Жng Cung N�
{
	nId = 102,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕",103} },
		{"AddDialogOpt",	{"C藀 Phong Th髖 Ng鋍 Huy襫 Ho祅g B閕",104} },	
			
	},
}
tbConfig[103] = --一个细节
{
	nId = 103,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕",{tbProp={0,119},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,119},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[104] = --一个细节
{
	nId = 104,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"C藀 Phong Th髖 Ng鋍 Huy襫 Ho祅g B閕",{tbProp={0,124},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,124},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[105] = --цi tho筰 Chng Жng Cung N�
{
	nId = 105,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Sng Tinh Thi猲 Tinh B╪g Tinh th�",106} },
		{"AddDialogOpt",	{"L玦 Khung Linh Ng鋍 U萵 L玦",107} },	
			
	},
}
tbConfig[106] = --一个细节
{
	nId = 106,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Sng Tinh Thi猲 Tinh B╪g Tinh th�",{tbProp={0,129},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,129},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[107] = --一个细节
{
	nId = 107,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L玦 Khung Linh Ng鋍 U萵 L玦",{tbProp={0,134},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},20} },
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},200} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,134},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[108] = --цi tho筰 Chng Жng Cung N�
{
	nId = 108,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 thu閏 t輓h trang b� s� thay i v� th阨 h筺  s� 頲 Reset l筰 tr筺g th竔 ban u ngi c� mu鑞 th� kh玭g."},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Thi誹 L﹎",75} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Thi猲 Vng",79} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Nga My",83} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Th髖 Y猲",86} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Ng� чc",89} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Л阯g M玭",92} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� C竔 Bang",96} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Thi猲 Nh蒼",99} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� V� ng",102} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� C玭 L玭",105} },
		
	},
}
tbConfig[109] = --цi tho筰 Chng Жng Cung N�
{
	nId = 109,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 thu閏 t輓h trang b� s� thay i v� th阨 h筺  s� 頲 Reset l筰 tr筺g th竔 ban u ngi c� mu鑞 th� kh玭g."},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Thi誹 L﹎",110} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Thi猲 Vng",114} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Nga My",118} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Th髖 Y猲",121} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Ng� чc",124} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Л阯g M玭",127} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� C竔 Bang",131} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� Thi猲 Nh蒼",134} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� V� ng",137} },
		{"AddDialogOpt",	{"Ta mu鑞 Reset th阨 h筺 Trang B� C玭 L玭",140} },	
		
	},
}
-----------RESET DO HOANG KIM LOAI 2-------------------------

tbConfig[110] = --цi tho筰 Chng Жng Cung N�
{
	nId = 110,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 thu閏 t輓h trang b� s� thay i v� th阨 h筺  s� 頲 Reset l筰 tr筺g th竔 ban u ngi c� mu鑞 th� kh玭g?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"M閚g Long Ch輓h H錸g T╪g M穙",111} },
		{"AddDialogOpt",	{"Ph鬰 Ma Ph� ч T╪g H礽",112} },
		{"AddDialogOpt",	{"T� Kh玭g Nhuy詎 B� H� Uy觧",113} },

	},
}
tbConfig[111] = --一个细节
{
	nId = 111,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M閚g Long Ch輓h H錸g T╪g M穙",{tbProp={0,1},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,1},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[112] = --一个细节
{
	nId = 112,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ph鬰 Ma Ph� ч T╪g H礽",{tbProp={0,10},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,10},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[113] = --一个细节
{
	nId = 113,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T� Kh玭g Nhuy詎 B� H� Uy觧",{tbProp={0,14},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,14},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[114] = --цi tho筰 Chng Жng Cung N�
{
	nId = 114,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" K� Nghi謕 Chu Tc L╪g V﹏ Ngoa",115} },
		{"AddDialogOpt",	{" Ng� Long T蕁 Phong H� y觧",116} },
		{"AddDialogOpt",	{" H竚 Thi猲 Th鮝 Long Chi課 Ngoa",117} },
			
	},
}

tbConfig[115] = --一个细节
{
	nId = 115,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"K� Nghi謕 Chu Tc L╪g V﹏ Ngoa",{tbProp={0,25},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,25},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[116] = --一个细节
{
	nId = 116,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng� Long T蕁 Phong H� y觧",{tbProp={0,29},},1} },
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,29},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[117] = --一个细节
{
	nId = 117,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"H竚 Thi猲 Th鮝 Long Chi課 Ngoa",{tbProp={0,20},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,20},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[118] = --цi tho筰 Chng Жng Cung N�
{
	nId = 118,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" V� Gian C莔 V薾 H� Uy觧",119} },
		{"AddDialogOpt",	{" V� Ma H錸g Truy Nhuy詎 Th竝 H礽",120} },
			
	},
}
tbConfig[119] = --一个细节
{
	nId = 119,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"V� Gian C莔 V薾 H� Uy觧",{tbProp={0,34},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,34},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[120] = --一个细节
{
	nId = 120,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"V� Ma H錸g Truy Nhuy詎 Th竝 H礽",{tbProp={0,40},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,40},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[121] = --цi tho筰 Chng Жng Cung N�
{
	nId = 121,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" T� Ho祅g B╪g Tung C萴 uy觧",122} },
		{"AddDialogOpt",	{" B輈h H秈 H錸g Linh Kim Ti i",123} },
			
	},
}
tbConfig[122] = --一个细节
{
	nId = 122,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T� Ho祅g B╪g Tung C萴 uy觧",{tbProp={0,49},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,49},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[123] = --一个细节
{
	nId = 123,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B輈h H秈 H錸g Linh Kim Ti i",{tbProp={0,53},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,53},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[124] = --цi tho筰 Chng Жng Cung N�
{
	nId = 124,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{" U Lung X輈h Y誸 M藅 trang",125} },
		{"AddDialogOpt",	{" Minh 秓 U чc 竚 Y",126} },
			
	},
}

tbConfig[125] = --一个细节
{
	nId = 125,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"U Lung X輈h Y誸 M藅 trang",{tbProp={0,57},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,57},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[126] = --一个细节
{
	nId = 126,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Minh 秓 U чc 竚 Y",{tbProp={0,62},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,62},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[127] = --цi tho筰 Chng Жng Cung N�
{
	nId = 127,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"B╪g H祅 Huy襫 Y Th骳 Gi竝",128} },
		{"AddDialogOpt",	{"Thi猲 Quang Song B筼 H祅 Thi誸 Tr筩",129} },
		{"AddDialogOpt",	{"S﹎ Hoang Tinh V蒼 Phi L�",130} },		
			
	},
}
tbConfig[128] = --一个细节
{
	nId = 128,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B╪g H祅 Huy襫 Y Th骳 Gi竝",{tbProp={0,72},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,72},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[129] = --一个细节
{
	nId = 129,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Thi猲 Quang Song B筼 H祅 Thi誸 Tr筩",{tbProp={0,79},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,79},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[130] = --一个细节
{
	nId = 130,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"S﹎ Hoang Tinh V蒼 Phi L�",{tbProp={0,85},},1} },
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,85},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[131] = --цi tho筰 Chng Жng Cung N�
{
	nId = 131,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"уng C鮱 Phi Long u Ho祅",132} },
		{"AddDialogOpt",	{"мch Kh竔 Tri襫 M穘g Y猽 Цi",133} },	
			
	},
}
tbConfig[132] = --一个细节
{
	nId = 132,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"уng C鮱 Phi Long u Ho祅",{tbProp={0,91},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,91},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}

tbConfig[133] = --一个细节
{
	nId = 133,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"мch Kh竔 Tri襫 M穘g y猽 i",{tbProp={0,98},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,98},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[134] = --цi tho筰 Chng Жng Cung N�
{
	nId = 134,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Ma S竧 C� H醓 Li猽 Thi猲 uy觧",135} },
		{"AddDialogOpt",	{"Ma Th� Huy誸 Ng鋍 Th蕋 S竧 B閕",136} },	
			
	},
}
tbConfig[135] = --一个细节
{
	nId = 135,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ma S竧 C� H醓 Li猽 Thi猲 uy觧",{tbProp={0,104},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,104},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[136] = --一个细节
{
	nId = 136,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ma Th� Huy誸 Ng鋍 Th蕋 S竧 B閕",{tbProp={0,114},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,114},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[137] = --цi tho筰 Chng Жng Cung N�
{
	nId = 137,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕",138} },
		{"AddDialogOpt",	{"C藀 Phong Th髖 Ng鋍 Huy襫 Ho祅g B閕",139} },	
			
	},
}
tbConfig[138] = --一个细节
{
	nId = 138,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕",{tbProp={0,119},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,119},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[139] = --一个细节
{
	nId = 139,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"C藀 Phong Th髖 Ng鋍 Huy襫 Ho祅g B閕",{tbProp={0,124},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},	
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,124},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[140] = --цi tho筰 Chng Жng Cung N�
{
	nId = 140,
	szMessageType = "CreateDialog",
	szName = "B蕀 v祇 Chng T秓 мa T╪g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={"<npc>Sau khi tr飊g luy謓 ngi c� th� nh薾 頲 trang b� c� thu閏 t輓h t gi韎 h筺. Ngi c� mu鑞 Tr飊g luy謓 lo筰 n祇?"},
	tbCondition = 
	{
	},
	tbActition = 
	{	
		{"AddDialogOpt",	{"Sng Tinh Thi猲 Tinh B╪g Tinh th�",141} },
		{"AddDialogOpt",	{"L玦 Khung Linh Ng鋍 U萵 L玦",142} },	
			
	},
}
tbConfig[141] = --一个细节
{
	nId = 141,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Sng Tinh Thi猲 Tinh B╪g Tinh th�",{tbProp={0,129},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,129},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}
tbConfig[142] = --一个细节
{
	nId = 142,
	szMessageType = "CreateCompose",
	szName = "Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr飊g Luy謓 у Ho祅g Kim M玭 Ph竔",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L玦 Khung Linh Ng鋍 U萵 L玦",{tbProp={0,134},},1} },	
		{"AddOneMaterial",	{"L謓h B礽 Vt 秈",{tbProp={6,1,4655,1,0,0},},100}},
		{"AddOneMaterial",	{"Ti襫 уng",{tbProp={4,417,1,1,0,0,0},},100} },		
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,134},nQuality=1,nExpiredTime=43200, tbParam={60}},1,"[Tr飊g Luy謓 Trang B� Ho祅g Kim M玭 Ph竔]"} },
		
	},
}