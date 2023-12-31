-- 文件名　：sapling.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-01-16 10:54:26
--从 2008年02月02号 – 2008年03月02号 24点00
--性质:
--- 可交易, 摆摊, 废弃, 卖 shop = 0 两.
--- 不可以叠加

--界限: 
--- 使用道具时不限制角色等级.
--- 每角色每天只可种8棵.
--使用方法: 右健点击


--Include("\\script\\event\\springfestival08\\luckplanting\\head.lua")
Include("\\script\\event\\springfestival08\\luckplanting\\treehead.lua")
Include("\\script\\global\\judgeoffline_limit.lua")
IncludeLib("ITEM")
--Event tr錸g c﹜ may m緉 - Modified by DinhHQ - 20110518

nTSK_USE_COUNT_LIMIT = 2728
nUSE_COUNT_LIMIT = 500

function main(nItemIndex)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		Msg2Player("V藅 ph萴  qu� h筺, kh玭g th� s� d鬾g.")
		return 1;
	end
	
	if (GetTask(nTSK_USE_COUNT_LIMIT) >= nUSE_COUNT_LIMIT) then
		Talk(1, "", "Tr錸g c﹜ t n gi韎 h筺, kh玭g th� tr錸g th猰!")
		return 1
	end
	
	if not sapling_checkmap() then
		Msg2Player("Ch� c� th� s� d鬾g � t﹏ th� th玭 v� th祅h th�.")
		return 1
	end
	
	if offlineCheckPermitRegion() == 0 then
		Msg2Player("T鑤 nh蕋 kh玭g n猲 tr錸g c﹜ g莕 khu v鵦 ng ngi.")
		return 1;
	end
	
	SetTask(nTSK_USE_COUNT_LIMIT, GetTask(nTSK_USE_COUNT_LIMIT) + 1)
	local _, nX, nY = GetWorldPos();
	if (plantTree_0801(1, SubWorld, nX*32, nY*32, format("C﹜ c馻 %s",GetName()), FileName2Id(GetName()), GetRoleCreateTimeData() ) == 0) then
		return 1;
	end;
	return 0
end

function bak_main(nItemIndex)
do return end
	local nData_E			= GetItemParam(nItemIndex, 1);
	local nUseCountLimit	= 8
	local nDate				= tonumber(GetLocalDate("%y%m%d"))
	local nDateYmd			= tonumber(GetLocalDate("%Y%m%d"))
	local nTSKV				= GetTask(TSK_sapling_UseCountLimit)
	
	if nData_E <= nDateYmd then
		Msg2Player("V藅 ph萴 n祔  qu� h筺, kh玭g th� s� d鬾g.", 0)
		return 0;
	end
	if not sapling_checkmap() then
		Msg2Player("Ch� c� th� s� d鬾g � khu v鵦 phi chi課 u c馻 c竎 th玭 tr蕁.")
		return 1
	end
	
	if offlineCheckPermitRegion() == 0 then
		Msg2Player("T鑤 nh蕋 kh玭g n猲 tr錸g c﹜ g莕 khu v鵦 ng ngi.")
		return 1;
	end
	
	if nDate ~= floor(nTSKV/256) then
		nTSKV = nDate * 256 --清零并更新时间
	end
	if mod(nTSKV,256) >= nUseCountLimit then --次数
		Say(format("B筺 h玬 nay  tr錸g <color=yellow>%d<color> c﹜, ng祔 mai h穣 tr錸g ti誴 nh�!", nUseCountLimit), 0)
		return 1;
	end
	
	--产生
	local _, nX, nY = GetWorldPos();
	--local nNpcIdx = AddNpc(711, 1, SubWorld, (nX-1)*32, (nY-1)*32, 1, format("%s的树",GetName()));
	if (plantTree_0801(1, SubWorld, (nX+random(-2,2))*32, (nY+random(-2,2))*32, format("C﹜ c馻 %s",GetName()), FileName2Id(GetName()), GetRoleCreateTimeData() ) == 0) then
		return 1;
	end;
	
	SetTask(TSK_sapling_UseCountLimit, nTSKV+1);
end

function sapling_checkmap()
	local tbCityMap = 
	{
		[174]	= 1,--Long tuy襫
		[121]	= 1, --Long M玭
		[153]	= 1, --Th筩h C�
		[101]	= 1,--o hng th玭
		[99]	= 1, --V躰h L筩
		[100]	= 1,--Chu Ti猲 Tr蕁
		[20]	= 1, --giang t﹏
		[53]	= 1, --Ba L╪g
		[11]	= 1,
		[1]		= 1,
		[37]	= 1,
		[176]	= 1,
		[162]	= 1,
		[78]	= 1,
		[80]	= 1,
	}
	return tbCityMap[SubWorldIdx2ID(SubWorld)] and (GetFightState() == 0)
end