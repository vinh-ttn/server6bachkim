IncludeLib("SETTING"); --载入SETTING脚本指令库
IncludeLib("FILESYS")
IncludeLib("TONG")
IncludeLib("ITEM")

Include("\\script\\global\\forbidmap.lua")
TSK_MAXCOUNT = 1574;				-- 记录最后一次使用日期Byte1
									-- 记录最后日期使用的次数Byte2
local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		--特殊地图禁用
		if( %tbUseOnlyInMap[i] == nMapId ) then
			return 1
		end
	end
	return 0
end

function main(nItemIndex)
	local n_cur_date = tonumber(GetLocalDate("%d"));
	local n_my_value = GetTask(TSK_MAXCOUNT);
	local n_my_date = GetByte(n_my_value, 1);
	local n_my_count = GetByte(n_my_value, 2);
	
	if (n_cur_date ~= n_my_date) then						-- 最后使用时不是今天，初始化使用次数计数
		n_my_date =  n_cur_date;
		n_my_value = SetByte(n_my_value, 1, n_cur_date);
		
		n_my_count = 0;
		n_my_value = SetByte(n_my_value, 2, 0);
		
		SetTask(TSK_MAXCOUNT, n_my_value);
	end
	
	
	if %checkOnlyUseInMap() ~= 1 then
		Msg2Player("Kh玭g th� s� d鬾g v藅 ph萴 n祔 t筰 y.")
		return 1
	end
	
	
	
	if (n_my_count >= 100) then
		Msg2Player("M鏸 ngi ch琲 m鏸 ng祔 ch� 頲 s� d鬾g nhi襲 nh蕋 100 Tu luy謓 m閏 nh﹏.");
		return 1;
	end
	
	if (GetFightState() == 1) then
		local w,x,y = GetWorldPos()
		local mapindex = SubWorldID2Idx(w)
		if ( mapindex < 0 ) then
			Msg2Player("Get MapIndex Error.")
			return 1
		end
		if ( CheckAllMaps(w) == 1 ) then
			Msg2Player("� y l祄 sao m� t藀 luy謓 頲 ch�? H穣 ra b猲 ngo礽 kia.")
			return 1
		end
		local nParam1 = GetItemParam(nItemIndex, 2)	--购买木人时作坊的使用等级
		--local nParam2 = GetItemParam(nItemIndex, 3)
		local posx = x*32
		local posy = y*32
		bossid = 1161
		bosslvl = 100
		--local key = random(1,100000)
		local npcindex = AddNpc(bossid,bosslvl,mapindex,posx,posy,1,GetName().."M閏 nh﹏",2)
		if (npcindex > 0) then
			SetNpcParam(npcindex, 2, nParam1)
			local playerid = String2Id(GetName())
			SetNpcParam(npcindex, 3, floor( playerid/100000 ) )
			SetNpcParam(npcindex, 4, mod( playerid, 100000 ) )
			SetNpcDeathScript(npcindex, "\\script\\tong\\npc\\muren_death.lua")
			Msg2Player("M閏 nh﹏  xu蕋 hi謓, h穣 mau 甶 luy謓 t藀.")
			
			SetTask(TSK_MAXCOUNT, SetByte(n_my_value, 2, n_my_count+1));		-- 今天使用次数计数
			--SetTask(1740, key)
		end
		return 0
	else
		Msg2Player("M閏 nh﹏ ch� c� th� s� d鬾g � khu v鵦 chi課 u.")
		return 1
	end
end