
IncludeLib("FILESYS")
tbEquipTryOn = {}

tbEquipTryOn.tbTemplate = {}

function tbEquipTryOn:GetCalss(szType)
	return self.tbTemplate[szType] or self
end

function tbEquipTryOn:NewTemplate(szType)
	local tb = {}
	for key, value in self do
		tb[key] = value
	end
	self.tbTemplate[szType] = tb
	return tb
end


tbEquipTryOn.nCountPerPage = 5
tbEquipTryOn.szType = ""
tbEquipTryOn.tbData_Male = 
{
}
tbEquipTryOn.tbData_Female = 
{
}

function tbEquipTryOn:DailogMenu(nPage)
	
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	local nTotalCount = getn(tbData)
	
	
	
	local nCountPerPage = self.nCountPerPage
	local nStart = (nPage - 1) * nCountPerPage + 1
	local nEnd = nStart + nCountPerPage - 1
	
	if nStart > nTotalCount then
		return
	end
	if nEnd > nTotalCount then
		nEnd = nTotalCount
	end

	local szTitle = format("�ang xem th� ngo�i h�nh t� %d~%d", nStart, nEnd)
	local tbOpt = {}
	
	
	for i=nStart, nEnd do
		local opt = 
		{
			format("%d\%s", i, tbData[i].szName),
			self.TryOnDailog,
			{self, i}
		}
		tinsert(tbOpt, opt)
	end
	
	if nStart > 1 then
		tinsert(tbOpt, {"Trang tr��c", self.DailogMenu, {self, nPage - 1}})
	end
	
	if nEnd < nTotalCount then
		tinsert(tbOpt, {"Trang k� ", self.DailogMenu, {self, nPage + 1}})
	end
	
	tinsert(tbOpt, {"K�t th�c ��i tho�i"})
	
	CreateNewSayEx(szTitle, tbOpt)
end


function tbEquipTryOn:TryOnDailog(nIdx)
	
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	
	self:TryOn(tbData[nIdx].nFeature)
	
	local szTitle = format("C�c h� c�m th�y th� n�o? C� v�a l�ng kh�ng? Mu�n luy�n ngo�i h�nh n�y c�n <color=yellow>%d<color> ti�n ��ng.", tbData[nIdx].nPrice)
	local nPage = ceil(nIdx/self.nCountPerPage)
	local tbOpt = 
	{
		{"R�t v�a v�n, h�y l�m nhanh cho ta.", self.GiveEquip, {self, nIdx}},
		{"�� ta xem l�i.", self.DailogMenu, {self, nPage}}
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbEquipTryOn:ChangeFeature(nNewHelmType, nNewArmorType, nNewWeaponType, nNewHorseType)
	local nHelmType, nArmorType, nWeaponType, nHorseType = GetPlayerFeature(PlayerIndex)
	
	local nSettingsIdx = -1 - GetSex()
	
	if nNewHelmType == -1 then
		nNewHelmType = nHelmType
	end
	if nNewArmorType == -1 then
		nNewArmorType = nArmorType
	end
	if nNewWeaponType == -1 then
		nNewWeaponType = nWeaponType
	end
	if nNewHorseType == -1 then
		nNewHorseType = nHorseType
	end
	
	ChangeOwnFeature( 0, -1, nSettingsIdx,  nNewHelmType, nNewArmorType, nNewWeaponType, nNewHorseType)
end

function tbEquipTryOn:TryOn(nNo)
	
end

function tbEquipTryOn:InjectToItem(nItemIndex, nNo)
	SetItemNewFeature(nItemIndex, nNo)
end

function tbEquipTryOn:RestoreItem(nItemIndex)
	SetItemNewFeature(nItemIndex, -1)
end

function tbEquipTryOn:GiveEquip(nIdx)
	
	g_GiveItemUI("Thay ��i ngo�i h�nh trang b�", "Xin h�y b� v�o trang b� c�n thay ��i ngo�i h�nh", {self.Proc, {self, nIdx}})
	
end

function tbEquipTryOn:GiveEquip2(nIdx)
	local nIdx = 1
	
	g_GiveItemUI("Tr� v� ngo�i h�nh ban ��u", "Xin h�y b� v�o trang b� c�n thay ��i ngo�i h�nh", {self.Proc2, {self, nIdx}})
	
end

function tbEquipTryOn:Proc(nIdx, nCount)
	if nCount ~= 1 then
		Talk(1, "", "Ch� ���c b� 1 m�n trang b� c�n thay ��i ngo�i h�nh.")
		return
	end
	
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	local pData =  tbData[nIdx]
	if not pData then
		Talk(1, "", "Ch�n ngo�i h�nh l�i.")
		return 
	end
	
	local nItemIndex = GetGiveItemUnit(1)
	
	if self:CheckEquip(nItemIndex) ~= 1 then
		return 
	end
	local nCount = pData.nPrice
	if CalcEquiproomItemCount(4, 417, 1, 1) < nCount then
		Talk(1, "", format("C�c h� v�n ch�a mang �� ti�n ��ng, c�n %d ti�n ��ng", nCount))
		return
	end

	ConsumeEquiproomItem(nCount, 4, 417, 1, 1)
	
	
	if pData.nFeature then
		self:InjectToItem(nItemIndex, pData.nFeature)
		Msg2Player(format("Ngo�i h�nh trang b� %s �� ���c ��i", GetItemName(nItemIndex)))
	end
	
end

function tbEquipTryOn:Proc2(nIdx, nCount)
	if nCount ~= 1 then
		Talk(1, "", "Ch� ���c b� 1 m�n trang b� c�n thay ��i ngo�i h�nh.")
		return
	end
	
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	local pData =  tbData[nIdx]
	if not pData then
		Talk(1, "", "Ch�n ngo�i h�nh l�i.")
		return 
	end
	
	local nItemIndex = GetGiveItemUnit(1)
	
	if self:CheckEquip(nItemIndex) ~= 1 then
		return 
	end
	local nCount = pData.nPrice
	if CalcEquiproomItemCount(4, 417, 1, 1) < nCount then
		Talk(1, "", format("C�c h� v�n ch�a mang �� ti�n ��ng, c�n %d ti�n ��ng", nCount))
		return
	end

	ConsumeEquiproomItem(nCount, 4, 417, 1, 1)
	
	
	if pData.nFeature then
		self:RestoreItem(nItemIndex, pData.nFeature)
		Msg2Player(format("Ngo�i h�nh trang b� %s �� ���c ��i l�i nh� ban ��u", GetItemName(nItemIndex)))
	end
	
end

function tbEquipTryOn:CheckEquip()
	
end

function tbEquipTryOn:AskFeatureNo()
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	
	local nMaxCount = getn(tbData)
	g_AskClientNumberEx(1, nMaxCount, "Xin h�y ch�n s� hi�u ngo�i h�nh", {self.GiveEquip, {self}})
end

function tbEquipTryOn:AskFeatureNo2()
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	
	local nMaxCount = getn(tbData)
	g_AskClientNumberEx(1, nMaxCount, "Xin h�y ch�n s� hi�u ngo�i h�nh", {self.GiveEquip2, {self}})
end


function tbEquipTryOn:LoadFile()
	self.tbData_Male = {}
	self.tbData_Female = {}
	self:LoadOneFile( self.tbData_Male, self.szFile_Male)
	self:LoadOneFile( self.tbData_Female, self.szFile_Female)
	
end

function tbEquipTryOn:LoadOneFile( tbData, szFile)
	
	if TabFile_Load(szFile, szFile) == 0 then
		WriteLog(format("Load %s is fail", szFile))
		return 0;
	end
	local nRowCount = TabFile_GetRowCount(szFile)
	for i=2, nRowCount do
		local szName	= TabFile_GetCell(szFile, i, "Name")
		local nFeature	= tonumber(TabFile_GetCell(szFile, i, "Feature"))
		local nPrice	= tonumber(TabFile_GetCell(szFile, i, "Price"))
		
		local tb = {nFeature = nFeature, szName = szName, nPrice = nPrice}
		
		tinsert(tbData, tb)
		
	end
end