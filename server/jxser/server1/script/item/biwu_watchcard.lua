IncludeLib("ITEM")
function main( nItemIdx )
	local nMon =  GetItemParam(nItemIdx,1)
	local nDay =  GetItemParam(nItemIdx,2)
	--Say("你的观众券的使用日期为<color=yellow>2005年"..nMon.."月"..nDay.."日<color>。观众券只能使用一次，使用后，即可在观众券的日期时段内登入武林大会总决赛服务器，观战。逾期无效。你确定要现在使用吗？", 2, "我要现在使用/#sure2usewatchcard("..nItemIdx..")", "还是稍等吧/OnCancel")
	Say("Xin l鏸! V� c馻 b筺 s�  qu� h筺 s� d鬾g!",0);
end

function sure2usewatchcard(nItemIdx)
	local count = CalcEquiproomItemCount( 6, 1, 443, 1 )
	if ( count == 0 ) then
		Say("V� c馻 b筺 u? Kh玭g c� th� kh玭g d飊g 頲!", 0)
		return
	end
	local nMon =  GetItemParam(nItemIdx,1)
	local nDay =  GetItemParam(nItemIdx,2)
	local nDate = nMon * 100 + nDay
	AddExtPoint(1,nDate)
	Say("V� theo d鈏 c� h筺 s� d鬾g l� <color=yellow>2005-"..nMon.."nguy謙 "..nDay.." ng祔<color>, Xin ng k� m竬 d辌h v� thi u Чi h閕 V� l﹎ trong ng祔 c� hi謚 l鵦  xem thi u!", 0)
	DelCommonItem(6,1,443)
end

function GetDesc( nItem )
	local szDesc;
	local nIssueID, nIDCount;
	local nPayYear1, nPayMonth1, nPayDay1, nPayYear2, nPayMonth2, nPayDay2;
		
	nPayYear1 = 2005
	nPayMonth1 = GetItemParam( nItem, 1 )
	nPayDay1 = GetItemParam( nItem, 2 )

	szDesc = ""
	szDesc = szDesc..format( "\nV� tham quan v� l﹎ i h閕: <color=yellow>%04d-%02d-%02d<color=>, c� ng祔", nPayYear1, nPayMonth1, nPayDay1 );
	return szDesc;
end

