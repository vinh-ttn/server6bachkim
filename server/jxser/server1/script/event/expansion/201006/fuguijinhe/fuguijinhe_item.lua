Include("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua")

-- return 1: 不删除当前的物品， return 0: 删除当前物品
-- 襲 Ch豱h Ph� Qu� C萴 H閜 - Created by AnhHH  20110919
tbMapList =
{
	[11]	=	1,	
	[1]		=	1,	
	[37]	=	1,	
	[176]	=	1,	
	[162]	=	1,	
	[78]	=	1,	
	[80]	=	1,	
}
function main(itemidx)
	-- 襲 Ch豱h Ph� Qu� C萴 H閜 - Created by AnhHH  20110919
	if (IsCityMap() ~=1) then
		Talk(1, "", "Khu v鵦 th祅h th� phi chi課 u m韎 c� th� s� d鬾g")
		return 1
	end

	if (tbBetInfo:IsActive() ~= 1 or tbBetInfo:UseJinhe() ~= 1) then
		return 1;
	else
		return 0;
	end
end    

	-- 襲 Ch豱h Ph� Qu� C萴 H閜 - Created by AnhHH  20110919
function IsCityMap()
 	local nMapID =GetWorldPos()
	if (tbMapList[nMapID] == 1 and GetFightState() == 0) then
		return 1
	else
		return 0
	end
end       
                                                  