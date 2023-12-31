-- 文件名　：goldboss.lua
-- 创建者　：wangjingjun
-- 内容　　：黄金boss调整，新增boss24小时后自动删除
-- PS	   : 由于在该文件加载的时候需要进行boss死亡注册，重复加载，boss死亡会多给奖励
-- 创建时间：2011-10-02 08:15:46

Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\misc\\eventsys\\type\\npcdeath.lua")
--Change boss award 2012 - Modified By DinhHQ - 20120315
Include("\\script\\lib\\awardtemplet.lua")
--local tbEquiptAward =
--{
--	[1873] = 
--	{
--		
--	},
--	[1874] = 
--	{
--		
--	},
--	[1875] = 
--	{
--		
--	},
--}

local tbDropItem = {
	[1]={{szName="T� M穘g Chi B秓 (N鉵)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={1,0,0,0,0,0}, },},
	[2]={{szName="T� M穘g Chi B秓 (竜)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={5,0,0,0,0,0}, },},
	[3]={{szName="T� M穘g Chi B秓 (H筺g Li猲)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={0,0,0,0,0,0}, },},
	[4]={{szName="T� M穘g Chi B秓 (Ng鋍 B閕)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={8,0,0,0,0,0}, },},
	[5]={{szName="T� M穘g Chi B秓 (Gi莥)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={7,0,0,0,0,0}, },},
	[6]={{szName="T� M穘g Chi B秓 (Bao Tay)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={3,0,0,0,0,0}, },},
	[7]={{szName="T� M穘g Chi B秓 (Nh蒼 Tr猲)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=5,tbParam={2,0,0,0,0,0}, },},
	[8]={{szName="T� M穘g Chi B秓 (Nh蒼 Di)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=5,tbParam={9,0,0,0,0,0}, },},
	[9]={{szName="T� M穘g Chi B秓 (i L璶g)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={4,0,0,0,0,0}, },},
	[10]={{szName="T� M穘g Chi B秓 (V� Kh�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=3,tbParam={6,0,0,0,0,0}, },},
	[11]={{szName="Lam Th駓 Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=80},},
	[12]={{szName="L鬰 Th駓 Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=80},},
	[13]={{szName="T� Th駓 Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=80},},
	[14]={{szName="Tinh H錸g B秓 Th筩h",tbProp={4,353,1,1,0,0},nCount=1,nRate=80},},
	[15]={{szName="Ti猲 Th秓 L� c bi謙",tbProp={6,1,1181,1,0,0},nCount=1,nRate=60},},
	[16]={{szName="Ho祅g Kim 蕁 (Cng h鉧)",tbProp={0,3210},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[17]={{szName="Ho祅g Kim 蕁 (Nhc h鉧)",tbProp={0,3220},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[18]={{szName="у Ph� B筩h H� Kh玦",tbProp={6,1,3173,1,0,0},nCount=1,nRate=1},},
	[19]={{szName="у Ph� B筩h H� Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=1},},
	[20]={{szName="у Ph� B筩h H� H礽",tbProp={6,1,3175,1,0,0},nCount=1,nRate=1},},
	[21]={{szName="у Ph� B筩h H� Y猽 Цi",tbProp={6,1,3176,1,0,0},nCount=1,nRate=1},},
	[22]={{szName="у Ph� B筩h H� H� Uy觧",tbProp={6,1,3177,1,0,0},nCount=1,nRate=1},},
	[23]={{szName="у Ph� B筩h H� H筺g Li猲",tbProp={6,1,3178,1,0,0},nCount=1,nRate=1},},
	[24]={{szName="у Ph� B筩h H� B閕",tbProp={6,1,3179,1,0,0},nCount=1,nRate=1},},
	[25]={{szName="у Ph� B筩h H� Thng Gi韎",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1},},
	[26]={{szName="B筩h H� у Ph� H� Gi韎",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1},},
	[27]={{szName="у Ph� B筩h H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.5},},
	[28]={{szName="B筩h H� L謓h",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.3},},
	[29]={{szName="у Ph� Kim � Kh玦",tbProp={6,1,2982,1,0,0},nCount=1,nRate=4},},
	[30]={{szName="у Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=6},},
	[31]={{szName="у Ph� Kim � H礽",tbProp={6,1,2984,1,0,0},nCount=1,nRate=2},},
	[32]={{szName="у Ph� Kim � Y猽 Цi",tbProp={6,1,2985,1,0,0},nCount=1,nRate=2},},
	[33]={{szName="у Ph� Kim � H� Uy觧",tbProp={6,1,2986,1,0,0},nCount=1,nRate=2},},
	[34]={{szName="у Ph� Kim � H筺g Li猲",tbProp={6,1,2987,1,0,0},nCount=1,nRate=6},},
	[35]={{szName="у Ph� Kim � B閕",tbProp={6,1,2988,1,0,0},nCount=1,nRate=5},},
	[36]={{szName="у Ph� Kim � Thng Gi韎",tbProp={6,1,2989,1,0,0},nCount=1,nRate=3},},
	[37]={{szName="у Ph� Kim � H� Gi韎",tbProp={6,1,2990,1,0,0},nCount=1,nRate=3},},
	[38]={{szName="у Ph� Kim � Kh� Gi韎",tbProp={6,1,2991,1,0,0},nCount=1,nRate=2},},
	[39]={{szName="Kim � L謓h",tbProp={6,1,2349,1,0,0},nCount=1,nRate=1.8},},
	[40]={{szName="Kim � Kim B礽",tbProp={6,1,3001,1,0,0},nCount=1,nRate=1},},
	[41]={{szName="Anh H飊g Thi誴",tbProp={6,1,1604,1,0,0},nCount=1,nRate=70,nExpiredTime=10080},},
	[42]={{szName="B秓 Rng Kim � Kh玦",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.9, },},
	[43]={{szName="B秓 Rng Kim � Y",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.9, },},
	[44]={{szName="B秓 Rng Kim � H礽",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.8, },},
	[45]={{szName="B秓 Rng Kim � Y猽 Цi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.8, },},
	[46]={{szName="B秓 Rng Kim � H� Uy觧",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.8, },},
	[47]={{szName="B秓 Rng Kim � H筺g Li猲",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.9, },},
	[48]={{szName="B秓 Rng Kim � B閕",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0},nRate=0.8, },},
	[49]={{szName="B秓 Rng Kim � Thng Gi韎",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.6, },},
	[50]={{szName="B秓 Rng Kim � H� Gi韎",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.6, },},
	[51]={{szName="B秓 Rng Kim � V� Kh�",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.4, },},
}
local tbNpcInfo = 
{
	[1] = {1873,"Trng Tuy猲",},		
	[2] = {1874,"Kim Th� Lng",},		
	[3] = {1875,"M� Dung To祅",},		
}

function checkNpc(nNpcIndex)
	local nNpcId = GetNpcSettingIdx(nNpcIndex)
	local szName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		if (szNpcName == szName) and (nNpcId == %tbNpcInfo[i][1]) then
			return 1
		end
	end
	return 0
end

function addNews(nNpcIndex, nPlayerIndex)
	local szName = GetName(nPlayerIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local szNews = format("Чi hi謕 <color=yellow>%s<color> t筰 <color=yellow>%s<color>  ti猽 di謙 th祅h c玭g <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),szNpcName)
	AddGlobalNews(szNews)
end

function goldbossdeath(nNpcIndex, nPlayerIndex)
--	print("boss 死亡 " .. GetNpcName(nNpcIndex))
	if checkNpc(nNpcIndex) ~= 1 then
		return 
	end
	
	addNews(nNpcIndex, nPlayerIndex)
	--Thay i ph莕 thng - Modified by DinhHQ - 20111009
	local tbItemAward = 
	{
		[1873] = {szName="Thi猲 Linh Кn",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1874] = {szName="Thi猲 Linh Кn",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1875] = {szName="Thi猲 Linh Кn",tbProp={6,1,3022,1,0,0},nCount = 30, nExpiredTime = 7 * 24 * 60},
	}
	--B�  ph莕 thng Thi猲 Chi Rng - Modified by DinhHQ - 20111009
--	local tbOtherAward = 
--	{
--		[1873] = {90, 30},
--		[1874] = {94.825, 30},
--		[1875] = {94.825, 40},
--	}
	
	local nKind = GetNpcParam(nNpcIndex, 1)
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,tbItemAward[nKind],format("killed_%s",szNpcName))
	--B�  ph莕 thng Thi猲 Chi Rng - Modified by DinhHQ - 20111009
--	local nRate = random(1,10000) / 100
--	if nRate <= tbOtherAward[nKind][1] then
--		local tbTeam = getPlayerTeam()
--		addTianzhibaoxiang(tbOtherAward[nKind][2], nNpcIndex, tbTeam)
--	else
--		tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
--	end
	--Change boss award 2012- Modified by DinhHQ - 20120315
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbDropItem,format("killed_%s",szNpcName))	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
	--Ph莕 thng exp
	local tbAwardExp = {
		["Killer"] = {nExp = 20e6, szName = "觤 kinh nghi謒"},
		["Around"] = {nExp = 10e6, szName = "觤 kinh nghi謒"},
	}
	nOldPlayer = PlayerIndex	
	local nTeamSize = GetTeamSize();	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "Ph莕 thng exp cho t� i ti猽 di謙 "..szNpcName})
		end
	else		
		tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "Ph莕 thng exp cho ngi ti猽 di謙 "..szNpcName})
	end
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);	
	for i=1,nCount do	
		PlayerIndex = tbRoundPlayer[i]
		tbAwardTemplet:Give(tbAwardExp["Around"], 1, {"DCPhanThuongBoss", "Ph莕 thng exp cho ngi ng g莕 "..szNpcName})
	end
	PlayerIndex = nOldPlayer
end

function getPlayerTeam()
	local tbTeam = {}
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 then
		tinsert(tbTeam, PlayerIndex)
	else
		for i = 1, nTeamSize do
			local nPlayerIndex = GetTeamMember(i)
			tinsert(tbTeam, nPlayerIndex)
		end
	end
	return tbTeam
end

function addTianzhibaoxiang(nCount, nNpcIndex, tbTeam)
	local tbTianzhibaoxiang = 
	{
		szName = "Rng Thi猲 Chi", 
		nLevel = 95,
		nNpcId = 1876,
		nIsboss = 0,
		nTime = 5 * 60,		-- 存在时间 5 分钟
		szScriptPath = "\\script\\missions\\boss\\goldboss_adjust_2011\\tianzhibaoxiang.lua",
	}
	local nNpcX,nNpcY,nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	tbTianzhibaoxiang.tbNpcParam = tbTianzhibaoxiang.tbNpcParam or {}
	tbTianzhibaoxiang.tbNpcParam[1] = GetLocalTime()		-- 得到创建的时间
	tbTianzhibaoxiang.tbNpcParam[2] = getn(tbTeam)
	for i=1, getn(tbTeam) do
		tbTianzhibaoxiang.tbNpcParam[i+2] = tbTeam[i]
	end
	
	local nRow = 6
	local nOffset = 3 * 32
	-- 中间预留一个位置放置天灵丹，所以在计算可显示行数时，在总数上需要+1
	local nClow = floor(nCount / nRow) + 1
	local nMidRow = floor(nRow / 2)
	local nMidClow = floor(nClow / 2)
	local nStartX = nNpcX - nMidRow * nOffset
	local nStartY = nNpcY - nMidClow * nOffset
	
	-- 每行6个宝箱，以boss死亡的位置为中心成矩阵排列
	for j=1, nClow do
		for i=1, nRow do
			if nCount > 0 then
				-- 中心位置显示天灵丹，不放置宝箱
				if j ~= nMidClow or i ~= nMidRow then
					local x = nStartX + i * nOffset
					local y = nStartY + j * nOffset
					basemission_CallNpc(tbTianzhibaoxiang, nMapId, x, y)
					nCount = nCount - 1
				end
			else
				break
			end
		end
	end	
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end

function register()
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		EventSys:GetType("NpcDeath"):Reg(szNpcName, goldbossdeath)
	end
end

register()