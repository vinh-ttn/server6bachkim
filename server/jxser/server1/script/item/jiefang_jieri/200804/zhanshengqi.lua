-- 文件名　：zhanshengqi.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-15 11:51:30

--限制：
--- 50级以上的充值玩家才能使用。
--- 活动期间，每个玩家只能通过使用战胜旗获得最多1.200.000.000经验值。
---升级以后经验不叠加
--使用战胜旗马上获得2.000.000经验值。

--SetSpecItemParam(nItemIndex, 1, tonumber(GetLocalDate("%Y%m%d")) )
--SetSpecItemParam(nItemIndex, 2, tonumber(GetLocalDate("%Y")) )
--SetSpecItemParam(nItemIndex, 3, tonumber(GetLocalDate("%m")) )
--SetSpecItemParam(nItemIndex, 4, tonumber(GetLocalDate("%d")) )

IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\event\\jiefang_jieri\\200804\\taskctrl.lua")
function main(nItemIndex)
	jiefang_0804_ResetTask()
	local nItemData	= 20080531
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	
	if nDate > nItemData then
		Msg2Player("V藅 ph萴 qu� h筺 s� d鬾g, t� ng m蕋 甶.")
		return 0;
	end
	
	
	
	if IsCharged() == 0 or GetLevel() < 50 then
		Say("Ch� c� ngi ch琲 c蕄 tr猲 50  n筽 th� m韎 c� th� s� d鬾g.", 0)
		return 1;
	end
	
	local nExp = 2000000
	local nCurFlagExp = GetTask(jiefang_0804_TSK_FlagExpLimit)
	if nCurFlagExp >= jiefang_0804_TSKV_FlagExpLimit then
		Say(format("Trong th阨 gian ho箃 ng, th玭g qua vi謈 s� d鬾g l� c� chi課 th緉g ch� c� th� nh薾 頲 t鑙 產 %d 甶觤 kinh nghi謒.", jiefang_0804_TSKV_FlagExpLimit), 0)
		return 1
	end
	AddOwnExp(nExp)
	SetTask(jiefang_0804_TSK_FlagExpLimit, nCurFlagExp + nExp)
	
end