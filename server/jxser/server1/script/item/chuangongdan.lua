-- 文件名　：chuangongdan.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-02-25 16:25:21
IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
function main(nItemIndex)
	local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
	if (parttype == 30036 or parttype == 30037) then	
			return 1
	end

	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	local nTSKVExp		= GetBeiDouChuanGongExp();
	local nTSKVTime		= GetTask(TSK_BeiDouChuanGong_NIANYUE);
	local nCurTime		= GetCurServerTime()
	if GetLevel() < 50 or IsCharged() ~= 1 then
		Say("Nh﹏ v藅 ng c蕄 tr猲 50  n筽 th� m韎 c� th� s� d鬾g c竎 lo筰 ch﹏ 產n (b筩h ch﹏ 產n, huy誸 ch﹏ 產n, huy襫 ch﹏ 產n).", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("S� d鬾g ch﹏ 產n n祔 kh玭g th� nh薾 頲 kinh nghi謒.", 0)
		return 0
	end
	
	local szTime = 0;
	
	if nTSKVExp >= 30e8 then
		if nTSKVTime + TSKV_BeiDouChuanGong_UseLimit < nCurTime then
			nTSKVExp = 0
			SetBeiDouChuanGongExp(nTSKVExp)
		else
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime)
			nDay		= floor(nTime  / (24*60*60) )
			nTime		= mod( nTime, 24*60*60)
			local nHour	= floor( nTime / (60*60) )
			nTime		= mod(nTime, 60*60)
			local nMin	= floor(nTime / 60 )
			local nSec	= mod(nTime, 60)
			szTime 		= format("%d ng祔 %d gi� %d ph髏 %d gi﹜", nDay, nHour, nMin, nSec);
		end
	end
	
	local nRemnant	= 30e8 - nTSKVExp;
	local nExp = nContainExp
	
	if nRemnant < nContainExp then
		nExp = nRemnant
	end
	
	
	local szTitle
	local tbOpt
	if nExp <= 0 then
		szTitle	= format("Xin ch祇 <color=yellow>%s<color>, i hi謕 s� d鬾g c竎 lo筰 ti猲 n v� nh薾 頲 t鎛g kinh nghi謒 cao nh蕋 l� 3 t� 甶觤, v� v藋 kh玭g th� s� d鬾g th猰 ti猲 n 頲 n鱝. H穣 i <color=yellow>%s<color> r錳 th� l筰.",GetName(),szTime)
		tbOpt = 
		{
			"X竎 nh薾/OnCancel"
		}
	else
		szTitle	= format("Xin ch祇 <color=yellow>%s<color>, i hi謕 s� d鬾g c竎 lo筰 ti猲 n nh薾 頲 <color=yellow>%s<color> kinh nghi謒, c遪 c� th� nh薾 頲 th猰 <color=yellow>%s<color> kinh nghi謒. <enter>Ti猲 n n祔 ch鴄 <color=yellow>%s<color> kinh nghi謒, n誹 s� d鬾g lo筰 ti猲 n n祔 c� th� nh薾 頲 <color=yellow>%s<color> kinh nghi謒, c竎 h� c� mu鑞 s� d鬾g kh玭g?",GetName(), nTSKVExp, nRemnant, nContainExp, nExp)
		tbOpt = 
		{
			format("X竎 nh薾/#BeiDouChuanGong_UseItem(%d)", nItemIndex),
			"H駓 b� /OnCancel"
		}
	end
	Say(szTitle, getn(tbOpt), tbOpt);
	return 1;
end

function BeiDouChuanGong_UseItem(nItemIndex)
	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	local nTSKVExp		= GetBeiDouChuanGongExp();
	local nTSKVTime	= GetTask(TSK_BeiDouChuanGong_NIANYUE);
	local nCurTime	= tonumber(GetLocalDate("%Y%m"));
	if GetLevel() < 50 or IsCharged() ~= 1 then
		Say("Nh﹏ v藅 ng c蕄 tr猲 50  n筽 th� m韎 c� th� s� d鬾g c竎 lo筰 ch﹏ 產n (b筩h ch﹏ 產n, huy誸 ch﹏ 產n, huy襫 ch﹏ 產n).", 0)
		return 1;
	end
	
	
	if nContainExp <= 0 then
		Say("S� d鬾g ch﹏ 產n n祔 kh玭g th� nh薾 頲 kinh nghi謒.", 0)
		return 1
	end
	
	
	local nDay = 0;
	
	if nTSKVExp >= 30e8 then
		if nTSKVTime + TSKV_BeiDouChuanGong_UseLimit <= nCurTime then
			nTSKVExp = 0
			SetBeiDouChuanGongExp(nTSKVExp)
		else
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime)
			nDay		= floor(nTime  / (24*60*60) )
			nTime		= mod( nTime, 24*60*60)
			local nHour	= floor( nTime / (60*60) )
			nTime		= mod(nTime, 60*60)
			local nMin	= floor(nTime / 60 )
			local nSec	= mod(nTime, 60)
			szTime 		= format("%d ng祔 %d gi� %d ph髏 %d gi﹜", nDay, nHour, nMin, nSec);
		end
	end
	
	
	local nRemnant	= 30e8 - nTSKVExp;
	local nExp = nContainExp
	if nRemnant < nContainExp then
		nExp = nRemnant
	end
	local szTitle
	local tbOpt
	if nExp <= 0 then
		szTitle	= format("Xin ch祇 <color=yellow>%s<color>, i hi謕 s� d鬾g c竎 lo筰 ti猲 n v� nh薾 頲 t鎛g kinh nghi謒 cao nh蕋 l� 3 t� 甶觤, v� v藋 kh玭g th� s� d鬾g th猰 ti猲 n 頲 n鱝. H穣 i <color=yellow>%s<color> r錳 th� l筰.",GetName(), szTime)
		tbOpt = 
		{
			"X竎 nh薾/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			tl_addPlayerExp(nExp);
			SetBeiDouChuanGongExp(nTSKVExp+nExp);
			if nTSKVExp+nExp >= 30e8 then 
				SetTask(TSK_BeiDouChuanGong_NIANYUE, GetCurServerTime());
			end
			AddSkillState( 509, 1, 0, 180);
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	local itemgenre, detailtype, parttype = GetItemProp(nItem)
	if (itemgenre == 6 and detailtype == 1 and parttype == 30003 or parttype == 30004) then	
			local nVar = GetItemParam(nItem, 1);
			return format("\nMang m� s� <color=yellow>%s<color>", nVar);
	end
	local nContainExp = GetItemParam(nItem, 1);
	nContainExp = nContainExp + GetItemParam(nItem, 2)*1e8;
	return format("\nCh鴄 <color=yellow>%s<color> kinh nghi謒", nContainExp);
end
