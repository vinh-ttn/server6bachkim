-- 文件名　：event.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-01-16 10:57:44
--领取地点: 村镇的礼官。不能在七大城市的礼官领取
--要求：每日每账号只能领取4次
--领取时间: 每天21点00 – 22点00
--领取时限: 从 2008年02月02号 – 2008年03月02号 24点00
--使用时限: 从 2008年02月02号 – 2008年03月02号 24点00
Include("\\script\\event\\springfestival08\\luckplanting\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\pay.lua")

local _FormatTimeHMToSring = function(nTimeHM)
	local nMinute = floor(nTimeHM / 100)
	local nSecond = mod(nTimeHM , 100)
	szMsg = format("%02d:%02d", nMinute, nSecond)
	return szMsg
end
function luckplanting_0801_main()
	local nDate		= tonumber(GetLocalDate("%y%m%d"))
	local nTimeHM	= tonumber(GetLocalDate("%H%M"))
	local nTSKV		= GetTask(TSK_luckplanting_0801)
	local nWeek		= tonumber(GetLocalDate("%w"))
	local tbWeek = {[5] = 1, [6] = 1, [0] = 1}
	if luckplanting_0801_CheckMap() ~= 1 then
		Say("Xin l鏸, vi謈 n祔 ta kh玭g r�, i hi謕 h穣 n t﹏ th� th玭 h醝 th╩.", 0)
		return 0;
	end
	
	--每天21点00 – 22点00
	if nTimeHM < luckplanting_0801_GiveTime_S or nTimeHM > luckplanting_0801_GiveTime_E then
		Say(format("M鏸 ng祔 v祇 th阨 甶觤 %s - %s m韎 ph﹏ ph竧 m莔 c﹜.",%_FormatTimeHMToSring(luckplanting_0801_GiveTime_S), %_FormatTimeHMToSring(luckplanting_0801_GiveTime_E)),  0)
		return 0;
	end
	
	if GetLevel() < 80 or IsCharged() == 0 then
		Say("Xin l鏸, ng c蕄 c馻 b筺 ch璦 t 80 c蕄 v�/ho芻 ch璦 n筽 th�.", 0)
		return 0;
	end
	
	
	if not luckplanting_0801_IsActDay() then
		Say(format("Ho箃 ng <color=yellow>%s<color> v蒼 ch璦 b総 u.",luckplanting_0801_szActName), 0)
		return 0;
	end
	if nDate ~= floor(nTSKV/256) then
		nTSKV = nDate * 256 --清零并更新时间
	end
	if mod(nTSKV,256) >= TSKV_luckplanting_0801 then --次数
		Say(format("B筺 h玬 nay  nh薾 l蕐 <color=yellow>%d<color> l莕, ng祔 mai h穣 quay l筰 nh�.", TSKV_luckplanting_0801), 0)
		return 0;
	end
	local tbItem = {szName="C﹜ con", tbProp={6, 1, 1642, 1, 0, 0}, nExpiredTime = 20090105}
	tbAwardTemplet:GiveAwardByList(tbItem, "luckplanting")
	
	SetTask(TSK_luckplanting_0801, nTSKV+1);
end

function luckplanting_0801_IsActDay()
	local nDate		= tonumber(GetLocalDate("%y%m%d"))
	
	local nWeek		= tonumber(GetLocalDate("%w"))
	local tbWeek = {[5] = 1, [6] = 1, [0] = 1}
	return nDate >= luckplanting_0801_Time_S and nDate <= luckplanting_0801_Time_E and tbWeek[nWeek]
end

function luckplanting_0801_CheckMap()
	local tbCityMap = 
	{
		[174]	=1,
		[121]	=1,
		[153]	=1,
		[101]	=1,
		[99]	=1,
		[100]	=1,
		[20]	=1,
		[53]	=1,
	}
	return tbCityMap[SubWorldIdx2ID(SubWorld)]
end
         