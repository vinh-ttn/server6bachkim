--武神赐福
--wushenbless.lua
--使用后可获得2小时(系统时间)在宋金、信使、闯关、联赛、野叟、辉煌之夜中贡献度双倍状态
--Task2509

function main(nItemIdx)
	local nItemTime = GetItemParam(nItemIdx,1);
	local nCurTime = GetCurServerTime();	--秒
	if (nItemTime < nCurTime) then
		Msg2Player("V藅 ph萴 n祔  qu� h筺 s� d鬾g.");
		return 0;
	end;
	local nEndTime = nCurTime + 2*60*60;
	SetTask(2509, nEndTime);
	Msg2Player("Trong v遪g 2 gi� b筺 s� 頲 nh﹏ i ph莕 thng khi tham gia T鑞g Kim, nhi謒 v� t輓 s�, th竎h th鴆 th阨 gian, v� l﹎ li猲 u, nhi謒 v� D� T萿, Иm huy ho祅g")
end;

function GetDesc(nItemIdx)

	local nYear = GetItemParam(nItemIdx, 2) + 2000;
	local nMonth = GetItemParam(nItemIdx, 3);
	local nDate = GetItemParam(nItemIdx, 4);

	return "Th阨 h筺 s� d鬾g: <color=blue>"..nYear.."n╩"..nMonth.."nguy謙 "..nDate.."nh藅 "
end

