CurWharf = 4;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
Include("\\script\\global\\pgaming\\configserver\\configall.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("Nh� ta m�y ��i l�nh ��nh tr�n Tr��ng Giang, ��ng th�y thuy�n ta nh� m� xem th��ng, ch� 4,5 ng��i c�ng kh�ng h� h�n g�!", 3, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel", "�i ��o Hoa ��o (3) /go_thd");
	else
		Say("Nh� ta m�y ��i l�nh ��nh tr�n Tr��ng Giang, ��ng th�y thuy�n ta nh� m� xem th��ng, ch� 4,5 ng��i c�ng kh�ng h� h�n g�!", 2, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel");
	end

	if (GetLevel() >= 50) and CauCa == 1 then
		Say("Nh� ta m�y ��i l�nh ��nh tr�n Tr��ng Giang, ��ng th�y thuy�n ta nh� m� xem th��ng, ch� 4,5 ng��i c�ng kh�ng h� h�n g�!", 4,"��a ta ��n ��a �i�m c�u c�/dendiadiemcauca", "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel", "�i ��o Hoa ��o (3) /go_thd");
	end
end;
---------------------------------------------------------------
function dendiadiemcauca()
local nRanDom = random(1,2)
if nRanDom == 1 then
NewWorld(1009, 1241, 3081)
SetFightState(0)
else
NewWorld(1009, 1566, 2511)
SetFightState(0)
end
end
---------------------------------------------------------------
function  OnCancel()

   Say("Kh�ng c� ti�n ng�i thuy�n th� ng��i �i b� v�y! ",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(237);
	-- if (nRet == 1) then
	--	Msg2Player("�������ȥ�һ������˿���ࡣ�ðɣ�������ඣ�")
	if (nRet == -1) then
		Talk(1,"","Ph� �i thuy�n ��n ��o Hoa ��o "..AEXP_TICKET.."L��ng, ng��i c� �� kh�ng? ")
	end
end
---------------------------------------------------------------
