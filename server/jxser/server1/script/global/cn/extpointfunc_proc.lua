COIN=100

function OnExtPointChange_Proc(nExtPointIndex, nChangeValue)
	if (ExtFunTab[nExtPointIndex + 1] == nil) then
		--print("Error!!!!!!!!, No ExtPoint Fun On"..nExtPointIndex)
		--WriteGoldLog("Importacne Error!!!!!!!!, No ExtPoint CallFun On"..nExtPointIndex..", "..GetAccount().." "..GetName().." nExtPointIndex"..nExtPointIndex.." nChangeValue"..nChangeValue, 0, 0, 0, 0)
		return 0;
	end
	ExtFunTab[nExtPointIndex + 1](nChangeValue)
	return 1;
end

function OnPayYuanBao(nChangeValue)
	nValue = -nChangeValue
	if (nValue == 10) then
	--����Ԫ��
		 AddStackItem(COIN,4,417,1,1,0,0,0)--add tien dong
		AddItem(4,1326,1,0,0,0)
		SaveNow(); -- ��������
		WriteGoldLog( GetAccount().."("..GetName()..") MAKE a SILVER with a LOW CARD", 0, 1, 0, 0 );
		local nCurValue = GetExtPoint(1)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."R�t Ti�n ��ng"..GetAccount().."\t"..GetName().."\t".."R�t "..COIN.." Ti�n ��ng c�n l�i "..nCurValue*20)
 		Say("�ng ch� ti�n trang: ��y l� "..COIN.." Ti�n ��ng c�a kh�ch quan! Xin nh�n l�y!", 0)
		Msg2Player( "B�n nh�n ���c <color=green>"..COIN.."<color> Ti�n ��ng ! v� <color=yellow>1 Ng�c Linh Ch�u<color>");
 	elseif( nValue > 10) then
			WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO , MUST PAY(1) BUT PAY("..nValue..")!!!!", 0,0,0,0)
			Msg2Player("Thao t�c Ti�n ��ng  b� l�i, xin li�n h� GM �� gi�i quy�t!")
	else
			WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO PAYVALUE <= 0", 0,0,0,0)
			Say("Xin l�i! Kh�ch quan kh�ng c� g�i Ti�n ��ng  t�i b�n ti�m. ", 0)
	end
end

ExtFunTab=
{
	nil,
 	OnPayYuanBao,
 	nil,
 	nil,
 	nil,
 	nil,
 	nil,
 	nil
};
