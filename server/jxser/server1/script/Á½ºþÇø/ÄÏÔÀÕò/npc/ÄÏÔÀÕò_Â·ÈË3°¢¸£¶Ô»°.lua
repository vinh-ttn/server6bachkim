-- A Ph�c � Nam Nh�c Tr�n - Editor by AloneScript (Linh Em)

Include("\\script\\lib\\alonelib.lua");

function main(sel)
	if ( GetTask(1256) == 1) then
		SetTaskTemp(111,GetTaskTemp(111)+1)
		if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		 	SetTask(1256, 2);
		else
			Talk(1,"","Ng��i ��n th�t ��ng l�c. Ch�ng ta mau �i t�m c�n nguy�n c�a d�ch b�nh n�y �i! �i�n B� B� kh�ng xong r�i, l�m ng��i ta lo l�ng qu�.")	 	
		end
	return elseif ( GetTask(1256) == 2) then
		Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
	return end
	Say("<color=green>A Ph�c<color>: Ta mu�n l�n Ho�nh S�n h�c v�, mu�n l�m ng��i nh� ��c C� ��i Hi�p, di�t tr� c��ng b�o, gi�p �� k� y�u, thay tr�i h�nh ��o, uy phong l�m li�t!"..Note("aphuc_namnhactran"),0)
end;

