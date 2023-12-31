Include("\\script\\global\\login_head.lua")
-- 子母袋

DAY_SECOND_SUM			=	60 * 60 * 24;
WEEK_SECOND_SUM			=	DAY_SECOND_SUM * 7;

TASKID_ZMD_EXPIRE_TIME	=	2558;					-- 子母袋有效日期任务变量


function main(nItemIdx)
	local szMsg = "<#>T骾 t� m蓇 c� th阨 h筺 s� d鬾g l�: <color=yellow>"..zmd_get_expire_date().."<color>";
	Say(szMsg, 2, "N筽 1 tu莕/#recharge("..nItemIdx..")", "H駓 b� /cancel");
	return 1;
end

-- 子母袋充值
function recharge(nItemIdx)
	if (RemoveItemByIndex(nItemIdx) ~= 1) then
		return
	end
	zmd_add_expire_date(1);
	if (GetPartnerBagLevel() ~= 10) then
		SetPartnerBagLevel(10);
	end
	Say("<#>N筽 th祅h c玭g, t骾 t� m蓇 c馻 i hi謕 c� th阨 h筺 s� d鬾g l�: <color=yellow>"..zmd_get_expire_date().."<color>", 0);
end

-- 子母袋定时检查
function zmd_check_expire_timer()
	local nExpireState = zmd_check_expire();
	if (nExpireState == 2) then
		if (GetPartnerBagLevel() ~= 0) then
			SetPartnerBagLevel(0);
			Msg2Player("T骾 t� m蓇 c馻 i hi謕  qu� h筺 r錳");
		end
	elseif (nExpireState == 1) then
		if (random(1, 3) == 1) then
			Msg2Player("T骾 t� m蓇 c馻 i hi謕 s� h誸 h筺 trong v遪g h玬 nay");
		end
	end
end

-- 增加子母袋有效日期（单位为周）
function zmd_add_expire_date(nRechargeWeek)
	local nExpireTime = GetTask(TASKID_ZMD_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	if (nExpireFmtDate < nNowFmtDate) then
		nExpireTime = nNowTime + nRechargeWeek * WEEK_SECOND_SUM;
	else
		nExpireTime = nExpireTime + nRechargeWeek * WEEK_SECOND_SUM;
	end
	SetTask(TASKID_ZMD_EXPIRE_TIME, nExpireTime);
	return FormatTime2String("%Y-%m-%d", nExpireTime);
end

-- 检查子母袋是否已过有效日期
function zmd_check_expire()
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	local nExpireTime = GetTask(TASKID_ZMD_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	if (nNowFmtDate >= nExpireFmtDate) then
		return 2;			-- 已过期
	else
		local nRemindTime = nExpireTime - DAY_SECOND_SUM * 1;			-- 1天内提示即将过期
		local nRemindFmtDate = tonumber(FormatTime2String("%Y%m%d", nRemindTime));
		if (nNowFmtDate >= nRemindFmtDate) then
			return 1;		-- 即将过期
		else
			return 0;		-- 正常
		end
	end
end

-- 获取子母袋有效日期
function zmd_get_expire_date()
	local nExpireTime = GetTask(TASKID_ZMD_EXPIRE_TIME);
	if (nExpireTime ~= 0) then
		return FormatTime2String("%Y-%m-%d", nExpireTime - DAY_SECOND_SUM);
	else
		return "Ch璦 kh雐 ng";
	end
end

function cancel()
end

if (GetProductRegion() == "cn_ib") then
	login_add(zmd_check_expire_timer, 2)
end
