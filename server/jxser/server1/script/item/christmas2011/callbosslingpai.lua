-- 文件名　：callbosslingpai.lua
-- 创建者　：wangjingjun
-- 内容　　：只可以在各大主城，新手村的野外和帮会地图call
-- 创建时间：2011-11-11 14:56:18
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\functionlib.lua")
function checkfightstate()
	if ( GetFightState() == 0 ) then	--非战斗区禁用
		Msg2Player("Kh玭g � trong tr筺g th竔 chi課 u th� kh玭g th� s� d鬾g");
		return 0
	end
	return 1
end

function checkmap()
	-- 七大城市，八大新手村，帮会地图
	local ACTIVITY_MAP = {1,11,37,176,162,78,80, 174,121,153,101,99,100,20,53, 586,587,588,589,590,591,593,594,595,596,597}
	local W,X,Y = GetWorldPos()
	local nMapId = W
	local nIsInMap = 0
	
	for i = 1, getn(ACTIVITY_MAP) do
		if nMapId == ACTIVITY_MAP[i] and GetFightState() == 1 then
			nIsInMap = 1
			break	
		end
	end
	
	if nIsInMap == 0 then
		lib:ShowMessage("C莕 ph秈 s� d鬾g t筰 c竎 b秐  ngo礽 c竎 th祅h thi l韓, t﹏ th� th玭")
		return 0
	end
	return 1
end


function getbossinfo(nItemIdx)
	local tbBossInfomation = {
		-- bossid, bosslvl, bossname
		[3083] = {1873,95,"Trng Tuy猲",},		
		[3084] = {1874,95,"Kim Th� Lng",},		
		[3085] = {1875,95,"M� Dung To祅",},		
	}
	local G,D,P = GetItemProp(nItemIdx)
	local szBossname = tbBossInfomation[P][3]
	local nBossLevel = tbBossInfomation[P][2]
	local nBossId = tbBossInfomation[P][1]
	return szBossname, nBossLevel, nBossId
end

function callboss(szBossname, nBossLevel, nBossId)
	local nMapId,nPosX,nPosY = GetWorldPos()
	local tbGoldBoss = 
	{
		szName = szBossname, 
		nLevel = nBossLevel,
		nNpcId = nBossId,
		nIsboss = 1,
		tbNpcParam = {nBossId,},
	}
	if basemission_CallNpc(tbGoldBoss, nMapId, nPosX * 32, nPosY * 32) then
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] D飊g l謓h b礽 g鋓 Boss  g鋓 Boss Ho祅g Kim: "..szBossname);
		return 1
	end
	return 0
end

function main(nItemIdx)
	if checkfightstate() ~= 1 then
		return 1
	end
	
	if checkmap() ~= 1 then
		return 1
	end
	
	local szBossname, nBossLevel, nBossId = getbossinfo(nItemIdx)
	
	if callboss(szBossname, nBossLevel, nBossId) ~= 1 then
		Msg2Player("Tri謚 h錳 Boss th蕋 b筰, xin th� l筰")
		return 1
	end
	
	return 0
end