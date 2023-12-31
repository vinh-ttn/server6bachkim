-- 装备维修

IncludeLib( "ITEM" );
Include( "\\script\\item\\itemvalue\\magicattriblevel.lua" );

-- 临时任务变量ID: 101~110
TTID_ItemIndex 	= 101;
TTID_OrgMaxDur 	= 102;
TTID_CurMaxDur 	= 103;
-- TTID_CurDur 	= 104;
TTID_LostDur 	= 105;
TTID_CheapPrice	= 106;
TTID_CostlyPrice= 107;

-- 可镶嵌装备维修费用表
ENCHASABLE_EQUIP_PRICE =
{
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- 明1位置10级魔法属性的费用值
	{ 100, 220, 360, 520, 700, 900, 1120, 1360, 1620, 1900 },		-- 暗1位置10级魔法属性的费用值
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- 明2位置10级魔法属性的费用值
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- 暗2位置10级魔法属性的费用值
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- 明3位置10级魔法属性的费用值
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- 暗3位置10级魔法属性的费用值
}

-- RPGE_RESTORMAX = 25;
function repair_goldequip(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice)
	-- 不是黄金装备，不在脚本中处理(由程序处理)
	if (nQuality ~= 1 and nQuality ~= 4) then
		return -1;
	end
	
	szAboutMsg = get_repair_qualityname(nQuality).."Hng d蒼 s鯽 ch鱝 trang b�.../RePairGE_About";

	if (nQuality == 4 and GetPlatinaLevel(nItemIndex) >= 6) then
		Say("Ch� ti謒: T筰 ti謒 c馻 ta y kh玭g th� s鯽 trang b� b筩h kim +6 tr� l猲", 0);
		return 1
	end
	-- 不需维修
	nFixDur = nCurMaxDur - nCurDur;
	if (nFixDur <= 0) and (nCurMaxDur == nOrgMaxDur) then
		Say("Ch� ti謒: Trang b� "..get_repair_qualityname(nQuality).." n祔 t筸 th阨 kh玭g c莕 s鯽. Mu鑞 s鯽 ch鯽 "..get_repair_qualityname(nQuality).." th� n祇", 2, szAboutMsg, "Х bi誸 r錳/RepairGE_Cancel")
		return 1;
	end;
	
	SetTaskTemp(TTID_ItemIndex, nItemIndex);
	SetTaskTemp(TTID_OrgMaxDur, nOrgMaxDur);
	SetTaskTemp(TTID_CurMaxDur, nCurMaxDur);
	-- SetTaskTemp(TTID_CurDur, nCurDur);

	-- 简单维修要下调的耐久度上限点数(至少一点)
	nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end
	
	--nCheapPrice =  nFixDur * 10000; -- 一点一万两 (nFixDur - nLostDur)
	--nCostlyPrice = nFixDur * 30000; -- -- 一点三万两
	
	-- 黄金装备修理价格公式调整为：100*(装备等级^2)/每点耐久度
	-- 越南版本的修理价格降10倍
	nItemLevel = GetItemLevel(nItemIndex);
	nCheapPrice = 10 * nItemLevel * nItemLevel * nFixDur;
	nCostlyPrice = nCheapPrice * 3; -- 简修的三倍

	SetTaskTemp(TTID_LostDur, nLostDur);
	SetTaskTemp(TTID_CheapPrice, nCheapPrice);
	SetTaskTemp(TTID_CostlyPrice, nCostlyPrice);

	-- 以万两作显示单位
	_nCheapW = floor(nCheapPrice / 10000);
	_nCheap = mod(nCheapPrice, 10000);
	_nCostlyW = floor(nCostlyPrice / 10000);
	_nCostly = mod(nCostlyPrice, 10000);
	
	szFixMsg = 
	{
		"S鯽 n gi秐 [".._nCheapW.." v筺".._nCheap.." lng,  b襫 l韓 nh蕋 gi秏 xu鑞g"..nLostDur.."甶觤]/RePairGE_Cheap", -- 1	
		"S鯽 k� [".._nCostlyW.." v筺".._nCostly.." lng]/RePairGE_Costly",  -- 2
		"S� d鬾g Th駓 Tinh s鯽 ch鱝 c�  b襫 l韓 nh蕋/RepairGE_ReStoreMax", --3
		"S� d鬾g Tu Ph鬰 Th莕 Du s鯽 ch鱝  b襫 t鑙 產/RepairGE_ReStoreMax_Oil", --4
	}
	szCancelMsg = "T筸 th阨 kh玭g s鯽/RepairGE_Cancel";
	
	szSayMsg = 
	{
		"Ch� ti謒:  "..get_repair_qualityname(nQuality).."trang b� n祔 l� b竨 v藅 v� l﹎, s鯽 ch鱝 kh玭g d� d祅g, i hi謕 mu鑞 s鯽 n gi秐 h穣 l� s鯽 k�?",	
		"Ch� ti謒: ч b襫 "..get_repair_qualityname(nQuality).." tr猲 trang b� i hi謕  b� hao m遪, c� mu鑞 s鯽 kh玭g?",		
	}
	
	--print("黄金包装备维修(FixDur, CurMaxDur, OrgMaxDur): "..nFixDur..","..nCurMaxDur..","..nOrgMaxDur);
	if (nFixDur > 0) and (nCurMaxDur == nOrgMaxDur) then
		-- 只能修耐久度
		--print("只能修耐久度");
		Say(szSayMsg[1], 4, szFixMsg[1], szFixMsg[2], szAboutMsg, szCancelMsg)
	elseif (nFixDur <= 0) and (nCurMaxDur < nOrgMaxDur) then
		-- 只能修耐久度上限
		--print("只能修耐久度上限");
		Say(szSayMsg[2], 4, szFixMsg[3], szFixMsg[4], szAboutMsg, szCancelMsg)
	else
		-- 修精修、简修、上限
		--print("修精修、简修、上限");
		Say(szSayMsg[1], 6, szFixMsg[1], szFixMsg[2], szFixMsg[3], szFixMsg[4],szAboutMsg, szCancelMsg)
	end
	
	return 1;
end;

-- 精修 - 不掉耐久度上限
function RePairGE_Costly()
	nCostlyPrice = GetTaskTemp(TTID_CostlyPrice);
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	if (GetCash() >= nCostlyPrice) then
		Pay(nCostlyPrice)
		-- Msg2Player("修复装备！")
		SetCurDurability(nItemIndex, nCurMaxDur);
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d鬾g ("..nCostlyPrice..") lng b筩, s鯽 k�  "..get_repair_qualityname(nQuality).."trang b�(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..nCurMaxDur..")");
	else
		-- 以万两作显示单位
		_nCostlyW = floor(nCostlyPrice / 10000);
		_nCostly = mod(nCostlyPrice, 10000);
		Talk(1,"","g ch�: S鯽 ch鱝 c莕".._nCostlyW.." v筺".._nCostly.." lng, ng﹏ lng tr猲 ngi b筺 kh玭g !")
	end

end;

-- 简修 - 掉耐久度上限
function RePairGE_Cheap()
	nCheapPrice = GetTaskTemp(TTID_CheapPrice);
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	nLostDur = GetTaskTemp(TTID_LostDur);
	
	if (GetCash() >= nCheapPrice) then
		Pay(nCheapPrice)
		-- Msg2Player("修复装备！")
		
		-- 修复后的最大上限
		nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIndex, nFixMaxDur);
		SetCurDurability(nItemIndex, nFixMaxDur);
		
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d鬾g ("..nCheapPrice..") lng b筩, s鯽 n gi秐 "..get_repair_qualityname(nQuality).."trang b�(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..nFixMaxDur..") ,  b襫 l韓 nh蕋 gi秏 xu鑞g, "..nLostDur.."甶觤");
		
	else
		-- 以万两作显示单位
		_nCheapW = floor(nCheapPrice / 10000);
		_nCheap = mod(nCheapPrice, 10000);
		Talk(1,"","g ch�: Ph� s鯽 ch鱝 c莕 [".._nCheapW.." v筺".._nCheap.." lng]tr猲 ngi b筺 mang kh玭g  ng﹏ lng!")
	end
end;

-- 修复上限
function RepairGE_ReStoreMax()
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nOrgMaxDur = GetTaskTemp(TTID_OrgMaxDur);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	-- if (nCurMaxDur > nOrgMaxDur) then
	--	WriteLog(GetLoop()..date("%m%d-%H:%M").."黄金装备耐久度上限有错!")
	--	return -1;
	-- end
	
	if (nCurMaxDur == nOrgMaxDur) then
		Talk(1, "", "B� trang b� n祔 t筸 th阨 kh玭g c莕 s鯽!")
		return 1;
	end
	
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)

	-- 扣技能宝石(水晶)
	if (j238 > 0) then
		DelItemEx(238)
	elseif (j239 > 0) then
		DelItemEx(239)
	elseif (j240 > 0) then
		DelItemEx(240)
	else
		Talk(1,"","Kh竎h quan kh玭g c� Th駓 Tinh")
		return -1;
	end

	-- 加耐久度上限
	nAddMaxDur = 25; -- 一颗水晶，加25点上限
	nDelta = nOrgMaxDur - nCurMaxDur;
	if (nDelta < nAddMaxDur) then
		nAddMaxDur = nDelta;
	end
	
	SetMaxDurability(nItemIndex, nCurMaxDur + nAddMaxDur);
	WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d鬾g 1 vi猲 th駓 tinh,  "..get_repair_qualityname(nQuality).."trang b�(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..GetCurDurability(nItemIndex)..")  b襫 l韓 nh蕋 t╪g l猲"..nAddMaxDur.."甶觤");
	Msg2Player("B筺 s� d鬾g m閠 vi猲 Th駓 Tinh,  b襫 l韓 nh蕋 tr猲 trang b�  t╪g l猲."..nAddMaxDur.."甶觤");
end;

function RepairGE_ReStoreMax_Oil()
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nOrgMaxDur = GetTaskTemp(TTID_OrgMaxDur);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	-- if (nCurMaxDur > nOrgMaxDur) then
	--	WriteLog(GetLoop()..date("%m%d-%H:%M").."黄金装备耐久度上限有错!")
	--	return -1;
	-- end
	
	if (nCurMaxDur == nOrgMaxDur) then
		Talk(1, "", "B� trang b� n祔 t筸 th阨 kh玭g c莕 s鯽!")
		return 1;
	end
	
	local nBindState = GetItemBindState(nItemIndex);
	if (nBindState == 0) then
		Talk(1, "", "Ch� ti謒: <color=yellow> Tu Ph鬰 Th莕 Du<color> ch� c� th� s鯽 ch鱝<color=red> trang b� � tr筺g th竔 kh鉧 <color>")
		return 1;
	end
	
	local nOilCount = CalcEquiproomItemCount(6, 1, 2565, -1);

	-- 扣技能宝石(水晶)
	if (nOilCount > 0) then
		ConsumeEquiproomItem(1, 6, 1, 2565, -1);
	else
		Talk(1,"","Ch� ti謒: Ngi kh玭g mang theo Tu Ph鬰 Th莕 Du")
		return -1;
	end

	-- 加耐久度上限
	nAddMaxDur = 25; -- 一颗水晶，加25点上限
	nDelta = nOrgMaxDur - nCurMaxDur;
	if (nDelta < nAddMaxDur) then
		nAddMaxDur = nDelta;
	end
	
	SetMaxDurability(nItemIndex, nCurMaxDur + nAddMaxDur);
	WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..")S� d鬾g 1 c竔 Tu Ph鬰 Th莕 Du"..get_repair_qualityname(nQuality).."trang b�(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..GetCurDurability(nItemIndex)..")  b襫 l韓 nh蕋 t╪g l猲"..nAddMaxDur.."甶觤");
	Msg2Player("Ngi  s� d鬾g m閠 c竔 Tu Ph鬰 Th莕 Du,  b襫 t鑙 產 c馻 trang b�  頲 t╪g l猲"..nAddMaxDur.."甶觤");
end;

-- 取消
function RepairGE_Cancel()
end;

-- 关于黄金装备的修理
function RePairGE_About()
	_szInfo = 
	{
		"<color=green>S鯽 n gi秐:<color> gi� r� h琻, sau khi s鯽 ch鱝  b襫 trang b� l韓 nh蕋 s� gi秏 xu鑞g<enter>",	
		"<color=green>S鯽 k�:<color> gi� cao h琻, sau khi s鯽 ch鱝  b襫 l韓 nh蕋 trang kh玭g b� gi秏 xu鑞g<enter>",		
		"<color=green>Kh玦 ph鬰 gi韎 h筺  b襫: <color>S� d鬾g th駓 tinh  kh玦 ph鬰 l筰 gi韎 h筺 "..get_repair_qualityname(nQuality).." b襫 tr猲 trang b�.",
		" <enter>Tu Ph鬰 Th莕 Du ch� c� th� s鯽 ch鱝 trang b� kh鉧",
	}
	szInfo = _szInfo[1].._szInfo[2].._szInfo[3].._szInfo[4];

	Talk(1, "", szInfo)
end;

-- 关于黄金装备磨损上限的修复
--function RePairGE_AboutRestorMax()
--	Talk(1, "", "使用<color=red>水晶<color>可以修复黄金装备的部分耐久度上限")
--end;

-----------------------------------------------------------------------------
-- 计算装备维修价格 --
-- 返回值：-1 表示出错; >=0 表示修理所需的银两数
function get_repair_price(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice, nPriceScale, nMagicScale, nSumMagic)
	if( nCurMaxDur <= 0 or nCurMaxDur <= nCurDur ) then
		return 0;
	end
	local nRepairPrice = 0;
	if( nQuality == 0 ) then		-- 普通装备（蓝/白色装备）
		nRepairPrice = nEquipPrice * nPriceScale / 100 * ( nCurMaxDur - nCurDur ) / nCurMaxDur * ( nMagicScale + nSumMagic ) / nMagicScale;
	elseif( nQuality == 2 ) then	-- 可镶嵌装备（紫色装备）
		local arynMagLvl = GetItemAllParams( nItemIndex );
		local nItemVer = ITEM_GetItemVersion( nItemIndex );
		for i = 1, 6 do
			if( arynMagLvl[i] == 0 ) then
				break;
			elseif( arynMagLvl[i] < 0 or arynMagLvl[i] == 65535 ) then					-- MagicLevel传到客户端是用WORD传输的，(WORD)(-1) == 65535
				nRepairPrice = nRepairPrice + ENCHASABLE_EQUIP_PRICE[i][4];				-- 空孔按4级魔法等级属性计算
			else
				local nCurMagLvl = getMagAttrLvlLevel( nItemVer, arynMagLvl[i] );
				nRepairPrice = nRepairPrice + ENCHASABLE_EQUIP_PRICE[i][nCurMagLvl];	-- 按魔法等级属性计算
			end			
		end
		nRepairPrice = nRepairPrice * ( nCurMaxDur - nCurDur )
	end
	return nRepairPrice;
end;

-- 维修装备 --
-- 返回值：-1  表示出错，= 0 表示数据未被修改(不同步客户端); >0 表示成功(通知客户端)
function repair_equip(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice)
	-- SetMaxDurability(nItemIndex, 10);
	-- SetCurDurability(nItemIndex, 10);
	return -1;
end;

function get_repair_qualityname(nQ)
	if (nQ == 1) then
		return "Ho祅g Kim";
	elseif (nQ == 4) then
		return "B筩h Kim";
	else
		return "";
	end;
end;