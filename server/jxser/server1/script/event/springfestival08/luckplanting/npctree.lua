-- 文件名　：npctree.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-01-16 14:27:13
--种树方法: 右健点击来种树
--条件: 
--- 树苗只可种在城市, 村镇
--成长时间: 120 秒
-- 1 秒至40秒: 树苗形状
--41秒至60秒: 树苗长大 
--61秒至90秒: 大树有花
--91秒至120秒: 待领取奖品
--领取礼物时间: 120 秒
--121秒至240秒: 右健点击大树可获得奖品
--241秒开始大树自动消失.

--可获得随机经验，有概率
--序号	经验	概率
--1	500,000	35%
--2	1,000,000	30%
--3	1,500,000	25%
--4	2,000,000	10%
--- 可获得奖励物品，有概率
--序号	物品	概率
--1	中福缘露	75%
--2	大福缘露	20%
--3	仙草露	5%

Include("\\script\\event\\springfestival08\\luckplanting\\treehead.lua")
--Include("\\script\\event\\springfestival08\\luckplanting\\head.lua")
--Include("\\script\\event\\springfestival08\\lib\\addaward.lua")
Include("\\script\\lib\\awardtemplet.lua")
function isTree0801Master(nNpcIdx, ntask)

	
	local nMaster = GetNpcParam(nNpcIdx, PRM_TREE_0801_PLAYID);
	local nGameTime = GetNpcParam(nNpcIdx, PRM_TREE_0801_GAMETIME);
	
	if (nMaster < 0) then
		nMaster = nMaster + 4294967296;	-- id+2^32
	end;
	if (FileName2Id(GetName()) == nMaster and GetRoleCreateTimeData() == nGameTime) then
		return 1;
	end;
	return nil
end;

function main()	--对话入口
	local nNpcIdx = GetLastDiagNpc();
	
	if (isTree0801Master(nNpcIdx)) then
		local nEvent = GetNpcParam(nNpcIdx, PRM_TREE_0801_EVENT);
		if nEvent == 1 then
			Msg2Player("C﹜ con 產ng l韓.")
		elseif nEvent == 2 then
			Msg2Player("C﹜ 產ng m ch錳 n秠 l閏.")
		elseif nEvent == 3 then
			Msg2Player("C﹜ b総 u ra hoa.")
		elseif nEvent == 4 then
			Msg2Player("Th藅 hay qu�,hoa th琺 ng祇 ng箃, c竎 v� i hi謕 ng n鉵g l遪g r蕋 nhanh s� nh薾 頲 ph莕 thng.")
		elseif nEvent == 5 then
			Msg2Player("Цp t� s� ch╩ ch� vun tr錸g, xin nh薾 ph莕 thng n祔.")
			SetNpcParam(nNpcIdx, PRM_TREE_0801_EVENT, 6);
			luckplanting_0801_GiveAward()
		elseif nEvent == 6 then
			Msg2Player("C﹜ n祔 ta  nh薾 ph莕 thng, nh蕄 ch鋘 kh玭g c� t竎 d鬾g g�! Sau k� v藋 k�?")
		end
	else
		Msg2Player("C﹜ n祔 kh玭g ph秈 b筺 tr錸g.")
	end;
end;

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0 ) then
		DelNpc(nNpcIdx)
		return 0;
	end;
	local nPlayerId = GetNpcParam(nNpcIdx, PRM_TREE_0801_PLAYID);
	if (nPlayerId < 0) then
		nPlayerId = nPlayerId + 4294967296;	-- id+2^32
	end;
	
	local nEvent = GetNpcParam(nNpcIdx, PRM_TREE_0801_EVENT);
	if nEvent >= 5 then		
		if nEvent == 5 then			
			local strOwnerName = gsub(GetNpcName(nNpcIdx), "C﹜ c馻 ", "")
			local nOwnerIndex = SearchPlayer(strOwnerName)
			local nOldPlayer = PlayerIndex
			if nOwnerIndex > 0 then
				PlayerIndex = nOwnerIndex
			end
			local nPosX, nPosY = GetNpcPos(nNpcIdx)
			tbLog:PlayerActionLog("EventUomMamMayMan","CayBienMat", "ChuaThuHoach", SubWorld, nPosX, nPosY)
			PlayerIndex = nOldPlayer
		end
		DelNpc(nNpcIdx)
		return
	end
	
	
	local nGameTime = GetNpcParam(nNpcIdx, PRM_TREE_0801_GAMETIME);
	
	local nX, nY = GetNpcPos(nNpcIdx);	--树坐标
	local szName = GetNpcName(nNpcIdx);
	if plantTree_0801(nEvent+1, SubWorld, nX, nY, szName, nPlayerId, nGameTime) == 0 then
		SetNpcTimer(nNpcIdx, 18);
	else
		DelNpc(nNpcIdx)
	end
end;

function luckplanting_0801_GiveAward()
	local tbAward = 
		{
			{szName="у Ph� T� M穘g Kh玦",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.4},
			{szName="у Ph� T� M穘g Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.4},
			{szName="у Ph� T� M穘g Y猽 Цi",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.4},
			{szName="у Ph� T� M穘g H� Uy觧",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.4},
			{szName="у Ph� T� M穘g H筺g Li猲",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.4},
			{szName="у Ph� T� M穘g B閕",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.4},
			{szName="у Ph� T� M穘g H礽",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.4},
			{szName="у Ph� T� M穘g Thng Gi韎 Ch�",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.01},
			{szName="у Ph� T� M穘g H� Gi韎 Ch�",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.01},
			{szName="у Ph� T� M穘g Kh� Gi韎",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.01},
			{szName="T� M穘g L謓h",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.01},
			{szName="Huy襫 Vi猲 L謓h",tbProp={6,1,2351,1,0,0},nCount=1,nRate=1},
			{szName = "觤 Kinh Nghi謒", nExp=6000000,nRate=31.86},
			{szName = "觤 Kinh Nghi謒", nExp=8000000,nRate=25},
			{szName = "觤 Kinh Nghi謒", nExp=10000000,nRate=10},
			{szName = "觤 Kinh Nghi謒", nExp=15000000,nRate=5},
			{szName = "觤 Kinh Nghi謒", nExp=20000000,nRate=3},
			{szName = "觤 Kinh Nghi謒", nExp=30000000,nRate=2},
			{szName = "觤 Kinh Nghi謒", nExp=50000000,nRate=1},
			{szName="C萴 nang thay i tr阨 t",tbProp={6,1,1781,1,0,0},nCount=1,nRate=15,tbParam={60}},
			{szName="Ho祅g Kim 蕁 (Cng h鉧)",tbProp={0,3209},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="Ho祅g Kim 蕁 (Cng h鉧)",tbProp={0,3210},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="Ho祅g Kim 蕁 (Cng h鉧)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="Ho祅g Kim 蕁 (Nhc h鉧)",tbProp={0,3219},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="Ho祅g Kim 蕁 (Nhc h鉧)",tbProp={0,3220},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="Ho祅g Kim 蕁 (Nhc h鉧)",tbProp={0,3221},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="C祅 Kh玭 Song Tuy謙 B閕",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
			{szName="B綾 u truy襫 c玭g thu藅",tbProp={6,1,1672,1,0,0},nCount=1,nRate=1},
		}
	tbAwardTemplet:Give(tbAward, 1, {"EventUomMamMayMan", "ThuHoach"})
end