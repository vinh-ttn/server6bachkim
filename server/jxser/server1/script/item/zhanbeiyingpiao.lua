-- 文件名　：zhanbeiyingpiao.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-15 10:27:57
--战备银票
--物品上的说明：“本帮战备基金会增加1万点”
--使用截止时间：2008年05月18日24点00分
--使用方法：右键点击使用
--限制：只有帮主才能使用此物品。
--记录使用战备银票LOG
IncludeLib("SETTING");
if MODEL_GAMESERVER == 1 then
	IncludeLib("TONG")
	Include("\\script\\tong\\tong_header.lua")
end

function  main(nItemIndex)
	
	local nItemData	= GetItemParam(nItemIndex, 1);	
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	
	if nDate >= nItemData then
		Msg2Player("V藅 ph萴 qu� h筺 s� d鬾g, t� ng m蕋 甶.")
		return 0;
	end
	
	
	local nBuildFund = 10000
	local _, nTongID = GetTongName()
	if(nTongID == 0) then
		Msg2Player("Ch璦 gia nh藀 bang h閕, kh玭g th� s� d鬾g o c� n祔.");
		return 1
	end
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_MASTER)then
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t AddTongBuildFund %d.","use zhanbeiyingpiao",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(), nBuildFund))
		TONG_ApplyAddWarBuildFund(nTongID, nBuildFund)
		
		return 0;
	else
		Msg2Player("Kh玭g ph秈 l� bang ch�, kh玭g th� s� d鬾g o c� n祔.");
		return 1
	end
end

function GetDesc(nItemIndex)

end