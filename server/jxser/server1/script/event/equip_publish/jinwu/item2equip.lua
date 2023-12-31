Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\jinwu\\equiptable.lua")
Include("\\script\\event\\equip_publish\\jinwu\\zimang_name.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
tbItem2Jinwu = tbActivityCompose:new()

function tbItem2Jinwu:GetSuccessRate()
	local tbAdditive = self.tbFormula.tbAdditive
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	
	-- 获取成功率
	local nSuccessRate = 0	
	for k, v in tbAdditive do
		local nCount = self:CalcItemCount(tbRoomItems, v)	
		local nSR = nCount * v.nSuccessRate
		if nSR > v.nMaxSuccessRate then
			nSR = v.nMaxSuccessRate
		end
		nSuccessRate = nSuccessRate + nSR;				
	end
	return nSuccessRate
end

function tbItem2Jinwu:Compose(nComposeCount, nProductId)
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local tbAdditive = self.tbFormula.tbAdditive
	if not tbProduct then
		return 
	end
	
	nComposeCount = nComposeCount or 1
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	-- 检查背包空间
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g %d %dx%d h祅h trang", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	-- 计算成功率
	local nSuccessRate = self:GetSuccessRate()	
	
	-- 检查材料是否充足
	local tbMaterialEx = {{szName = tbAdditive[1].szName, tbProp = tbAdditive[1].tbProp, nCount = 1},}
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 or 
			self:CheckMaterial(tbMaterialEx, nComposeCount) ~= 1	then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>Чi hi謕 mang nguy猲 li謚 kh玭g  r錳!<color>"
		Talk(1, "", szMsg)
		print("CheckMaterial value ~= 1")
		return 0;
	end	
	
	--thay T� M穘g Th筩h = trang b� T� M穘g
	local nMatId = tbProduct.tbProp[2] - 230
	local strZimangName = %tbZimang_Name[nMatId]
	if not strZimangName then
		return 0
	end
	local tbVnMaterial = {{szName = strZimangName, tbProp={0, nMatId}, nCount = 1},}
	
	if self:CheckMaterial(tbVnMaterial, nComposeCount) ~=1 then
		local szMsg = format("<color=red>Ch� t筼 <color=yellow>%s<color=red> c莕 c� <color=yellow>%s<color=red>  l祄 nguy猲 li謚!<color>", tbProduct.szName, strZimangName)
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- 组合合成必须消耗的物品
	local tbBMaterial = self.tbFormula.tbBMaterial
	local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  每次都重新获取，以防止有变化
	local nMapCount = 0;
	tbMaterialEx = {}
	for i = 1, getn(tbAdditive) do
		local nn = self:CalcItemCount(tbRoomItems, tbAdditive[i])
		if nn * tbAdditive[i].nSuccessRate > tbAdditive[i].nMaxSuccessRate then
			nn = tbAdditive[i].nMaxSuccessRate / tbAdditive[i].nSuccessRate
		end 
		if i == 1 then
			nMapCount = nn
			if nn == 0 then
				local szMsg = self.tbFormula.szFailMsg or "<color=red>Чi hi謕 mang nguy猲 li謚 kh玭g  r錳!<color>"
				Talk(1, "", szMsg)
				print("CalcItemCount")
				return 0;			
			end
			nn = floor((nn+1)/2)
			nMapCount = nMapCount - nn 
		end
		
		if nn > 0 then
			local tbM = {szName = tbAdditive[i].szName, tbProp = tbAdditive[i].tbProp, nCount = nn}
			tinsert(tbMaterialEx, tbM)	
		end		
	end	
	
	-- 扣除合成必须消耗的物品
	if self:ConsumeMaterial(tbBMaterial, nComposeCount, self.szLogTitle) ~= 1 or 
			self:ConsumeMaterial(tbMaterialEx, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("Ch� t筼 th蕋 b筰, m蕋 甶 m閠 s� nguy猲 li謚.")
		return 0;
	end	
	
		-- 扣除合成成功后扣除的物品
	local tbMEx = self.tbFormula.tbAdditiveEx
	if tbMEx[1] then 
		tbMEx[1].nCount = nMapCount
	end
	
	self:ConsumeMaterial(tbMEx, nComposeCount, self.szLogTitle)

	if random(1, 100) > nSuccessRate then
		Msg2Player("Th藅 ng ti誧 ch� t筼  th蕋 b筰")
		%tbVngTransLog:Write("201110_CheTaoKimO/", 15, "CheTaoKimO", "N/A", 0)
		return 0
	end

	if self:ConsumeMaterial(tbVnMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("Ch� t筼 th蕋 b筰, m蕋 甶 m閠 s� nguy猲 li謚.")
		return 0;
	end

	if type(tbProduct) == "table" then
	--	tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
		local tbTranslog = {strFolder = "201110_CheTaoKimO/", nPromID = 15, nResult = 1}
		tbAwardTemplet:Give(tbProduct, 1, {self.szLogTitle, "CheTaoKimO", tbTranslog})
	--	AddStatData("zimang_jx1hechengzongshu", 1)	--数据埋点第一期
	end

	return 1;
end

function tbItem2Jinwu:GiveUIOk(nComposeCount, nProductId, nCount)
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbAdditive = self.tbFormula.tbAdditive
	
	--thay T� M穘g Th筩h = trang b� T� M穘g
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local nMatId = tbProduct.tbProp[2] - 230	
	local strZimangName = %tbZimang_Name[nMatId]
	if not strZimangName then
		return 0
	end
	local tbVnMaterial = {{tbProp={0, nMatId}, nCount = 1},}
	
	if self:CheckMaterial(tbVnMaterial, nComposeCount) ~=1 then
		local szMsg = format("<color=red>Ch� t筼 <color=yellow>%s<color=red> c莕 c� <color=yellow>%s<color=red>  l祄 nguy猲 li謚!<color>", tbProduct.szName, strZimangName)
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- 检查材料是否充足
	local tbMaterialEx = {{szName = tbAdditive[1].szName, tbProp = tbAdditive[1].tbProp, nCount = 1},}
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 or 
			self:CheckMaterial(tbMaterialEx, nComposeCount) ~= 1	then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>Чi hi謕 mang nguy猲 li謚 kh玭g  r錳!<color>"
		Talk(1, "", szMsg)
		print("GiveUIOk check material fail")
		return 0;
	end	
	
	local nSuccessRate = self:GetSuccessRate()
	local msg = "H頿 th祅h trang b� Kim � c莕 ph秈 c� 1 Kim � Kim B礽, 5 vi猲 Thanh C﹗ Th筩h, 4 vi猲 V﹏ L閏 Th筩h, 3 vi猲 Thng Lang Th筩h, 2 vi猲 Huy襫 Vi猲 Th筩h, 1 Kim � L謓h v� 1 trang b� T� M穘g tng 鴑g v韎 m玭 ph竔 v� h� t蕁 c玭g ch� o c馻 trang b� ch� t筼, y猽 c莡 輙 nh蕋 c莕 ph秈 c� 1 Kim � у Ph� tng 鴑g, 5000 v筺 ng﹏ lng, v� nguy猲 li謚 l祄 t╪g th猰 t� l� th祅h c玭g n誹 c莕."
	local szMsg = format("%s, c╪ c� theo nguy猲 li謚 m� ngi b� v祇 th� nh薾 頲 t� l� th祅h c玭g l� %d%%, ngi c� mu鑞 ti誴 t鬰 ch� t筼 kh玭g?", msg, nSuccessRate)
	local tbOpt = 
	{
		{"Ti誴 t鬰 ch� t筼", self.Compose, {self, nComposeCount, nProductId}},
		{"t v祇 l莕 n鱝", self.ComposeGiveUI, {self, nComposeCount, nProductId}},
		{"H駓 b� "},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2Jinwu:ComposeGiveUI(nComposeCount, nProductId)
	local tbMaterial = self.tbFormula.tbMaterial
	local tbProduct = self.tbFormula.tbProduct 
	
	local szTitle = self.tbFormula.szComposeTitle or format("фi %s", tbProduct.szName)
	local szContent = self:GetMaterialList(tbMaterial)
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self, nComposeCount, nProductId}}, nil, self.bAccessBindItem)
end

function tbItem2Jinwu:SelectEquip(nId, nCount)
	
	local tbProduct = self.tbFormula.tbProduct
	local msg = "H頿 th祅h trang b� Kim � c莕 ph秈 c� 1 Kim � Kim B礽, 5 vi猲 Thanh C﹗ Th筩h, 4 vi猲 V﹏ L閏 Th筩h, 3 vi猲 Thng Lang Th筩h, 2 vi猲 Huy襫 Vi猲 Th筩h, 1 Kim � L謓h, v� 1 trang b� T� M穘g tng 鴑g v韎 m玭 ph竔 v� h� t蕁 c玭g ch� o c馻 trang b� ch� t筼, y猽 c莡 輙 nh蕋 c莕 ph秈 c� 1 Kim � у Ph� tng 鴑g, 5000 v筺 ng﹏ lng, v� nguy猲 li謚 l祄 t╪g th猰 t� l� th祅h c玭g n誹 c莕."
	local szMsg = format("%s,l鵤 ch鋘 m閠 %s", msg, tbProduct.szName)
	local nProductCount = getn(tbProduct)
	local nEndId = nCount + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {%tbRepresentName[i], self.ComposeGiveUI, {self, 1, i}})
	end
	if nId >= nCount + 1  then
		tinsert(tbOpt, {"Trang trc", self.SelectEquip, {self, nId-nCount, nCount}})
	end
	if nEndId < nProductCount then
		tinsert(tbOpt, {"Trang k� ", self.SelectEquip, {self, nId+nCount, nCount}})
	end
	tinsert(tbOpt, {"H駓 b� "})
	CreateNewSayEx(szMsg, tbOpt)
end


tbCommonMaterial = 
{
	{szName="Kim � Kim B礽", tbProp={6, 1, 3001}, nCount = 1},
	{szName="Thanh C﹗ Th筩h", tbProp={6, 1, 2710}, nCount = 5},
	{szName="V﹏ L閏 Th筩h", tbProp={6, 1, 2711}, nCount = 4},
	{szName="Thng Lang Th筩h", tbProp={6, 1, 2712}, nCount = 3},
	{szName="Huy襫 Vi猲 Th筩h", tbProp={6, 1, 2713}, nCount = 2},
	--{szName="T� M穘g Th筩h", tbProp={6, 1, 3000}, nCount = 1},
	{szName="Kim � L謓h", tbProp={6, 1, 2349}, nCount = 1},	
	{szName=" lng", nJxb=1, nCount = 50000000},	
}

tbBaseMaterial = 
{
	{szName="Kim � Kim B礽", tbProp={6, 1, 3001}, nCount = 1},
	{szName="Thanh C﹗ Th筩h", tbProp={6, 1, 2710}, nCount = 5},
	{szName="V﹏ L閏 Th筩h", tbProp={6, 1, 2711}, nCount = 4},
	{szName="Thng Lang Th筩h", tbProp={6, 1, 2712}, nCount = 3},
	{szName="Huy襫 Vi猲 Th筩h", tbProp={6, 1, 2713}, nCount = 2},
	--{szName="T� M穘g Th筩h", tbProp={6, 1, 3000}, nCount = 1},
	{szName=" lng", nJxb=1, nCount = 50000000},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "Kim � H筺g Li猲",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "у Ph� Kim � H筺g Li猲", tbProp = {6,1,2987}, nSuccessRate = 10, nMaxSuccessRate = 80},
					{szName = "Kim Hoa Chi B秓", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th髖 Chi B秓", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V﹏ Chi B秓", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
			},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "у Ph� Kim � H筺g Li猲", tbProp = {6,1,2987}, nCount = 1},
				  {szName="Kim � L謓h", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{				
		szName = "Kim � Kh玦",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "у Ph� Kim � Kh玦", tbProp = {6,1,2982}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B秓", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th髖 Chi B秓", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V﹏ Chi B秓", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "у Ph� Kim � Kh玦", tbProp = {6,1,2982}, nCount = 1},
				  {szName="Kim � L謓h", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,		
	},
	[3] = 
	{
		szName = "Kim � Thng Gi韎 Ch�",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "у Ph� Kim � Thng Gi韎", tbProp = {6,1,2989}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B秓", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th髖 Chi B秓", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V﹏ Chi B秓", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "у Ph� Kim � Thng Gi韎", tbProp = {6,1,2989}, nCount = 1},
				  {szName="Kim � L謓h", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "Kim � H� Uy觧",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "у Ph� Kim � H� Uy觧", tbProp = {6,1,2986}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B秓", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th髖 Chi B秓", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V﹏ Chi B秓", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "у Ph� Kim � H� Uy觧", tbProp = {6,1,2986}, nCount = 1},
				  {szName="Kim � L謓h", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "Kim � Y猽 Цi",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "у Ph� Kim � Y猽 Цi", tbProp = {6,1,2985}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B秓", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th髖 Chi B秓", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V﹏ Chi B秓", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "у Ph� Kim � Y猽 Цi", tbProp = {6,1,2985}, nCount = 1},
				  {szName="Kim � L謓h", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "Kim � Y Ph鬰",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "у Ph� Kim � Y", tbProp = {6,1,2983}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B秓", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th髖 Chi B秓", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V﹏ Chi B秓", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "у Ph� Kim � Y", tbProp = {6,1,2983}, nCount = 1},
				  {szName="Kim � L謓h", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "Kim � V� Kh�",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "у Ph� Kim � Kh� Gi韎", tbProp = {6,1,2991}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B秓", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th髖 Chi B秓", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V﹏ Chi B秓", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "у Ph� Kim � Kh� Gi韎", tbProp = {6,1,2991}, nCount = 1},
				  {szName="Kim � L謓h", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 4,
		nFreeItemCellLimit = 1,		
	},
	[8] = 
	{
		szName = "Kim � H礽",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "у Ph� Kim � H礽", tbProp = {6,1,2984}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B秓", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th髖 Chi B秓", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V﹏ Chi B秓", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "у Ph� Kim � H礽", tbProp = {6,1,2984}, nCount = 1},
				  {szName="Kim � L謓h", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "Kim � B閕",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "у Ph� Kim � B閕", tbProp = {6,1,2988}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B秓", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th髖 Chi B秓", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V﹏ Chi B秓", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "у Ph� Kim � B閕", tbProp = {6,1,2988}, nCount = 1},
				  {szName="Kim � L謓h", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "Kim � H� Gi韎 Ch�",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "у Ph� Kim � H� Gi韎", tbProp = {6,1,2990}, nSuccessRate = 10, nMaxSuccessRate = 80},		
					{szName = "Kim Hoa Chi B秓", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th髖 Chi B秓", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V﹏ Chi B秓", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},		
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "у Ph� Kim � H� Gi韎", tbProp = {6,1,2990}, nCount = 1},
				  {szName="Kim � L謓h", tbProp={6, 1, 2349}, nCount = 1},			
		},				

		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
}


local tbOpt = {}

--for i=1, getn(tbFormulaList) do
--	tbEquip_jinwu[i].szName = tbFormulaList[i].szName
--	tbFormulaList[i].tbProduct = tbEquip_jinwu[i]
--	
--	local p = tbItem2Jinwu:new(tbFormulaList[i], "Item2Jinwu", INVENTORY_ROOM.room_giveitem)
--	
--	local szOpt = format("Ch� t筼 %s", tbFormulaList[i].tbProduct.szName)
--	tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
--end
--tinsert(tbOpt, {"H駓 b� "})

for i=1, getn(tbFormulaList) do
	tbEquip_jinwu[i].szName = tbFormulaList[i].szName
	tbFormulaList[i].tbProduct = tbEquip_jinwu[i]
	
	local p = tbItem2Jinwu:new(tbFormulaList[i], "Item2Jinwu", INVENTORY_ROOM.room_giveitem)
	
	local szOpt = format("Ch� t筼 %s", tbFormulaList[i].tbProduct.szName)
	tinsert(tbOpt, {szOpt, p.SelectEquip, {p, 1, 5}})
end
tinsert(tbOpt, {"H駓 b� "})

local msg = "H頿 th祅h trang b� Kim � c莕 ph秈 c� 1 Kim � Kim B礽, 5 vi猲 Thanh C﹗ Th筩h, 4 vi猲 V﹏ L閏 Th筩h, 3 vi猲 Thng Lang Th筩h, 2 vi猲 Huy襫 Vi猲 Th筩h, 1 Kim � L謓h v� 1 trang b� T� M穘g tng 鴑g v韎 m玭 ph竔 v� h� t蕁 c玭g ch� o c馻 trang b� ch� t筼, y猽 c莡 輙 nh蕋 c莕 ph秈 c� 1 Kim � у Ph� tng 鴑g, 5000 v筺 ng﹏ lng, v� nguy猲 li謚 l祄 t╪g th猰 t� l� th祅h c玭g n誹 c莕."
--nItem2EquipRegId = pEventType:Reg("Th� r蘮 trong th祅h", "Ch� t筼 trang b� Kim �", CreateNewSayEx, {format("%s, l鵤 ch鋘 trang b� m� ngi mu鑞 ch� t筼:", msg), tbOpt})

