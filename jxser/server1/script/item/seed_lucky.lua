--��������ʹ�ú����call��һ������ʥ����
--renbin


IncludeLib("SETTING"); --����SETTING�ű�ָ���
Include("\\script\\global\\forbidmap.lua")

function main()
	
	if ( GetFightState() == 1 ) then
		local w,x,y = GetWorldPos()
		local mapindex = SubWorldID2Idx(w)
		if ( mapindex < 0 ) then
			Msg2Player("Get MapIndex Error.")
			return 1
		end
		if ( CheckAllMaps(w) == 1 ) then
			Msg2Player("��t �ai � ��y kh�ng th�ch h�p gieo tr�ng, ra ngo�i r�ng tr�ng th� xem!")
			return 1
		end
		local posx = x*32
		local posy = y*32
		bossid = 603
		bosslvl = 1
		i = random (1,5) - 1
		AddNpc(bossid,bosslvl,mapindex,posx,posy,1,GetName().."C�y th�ng may m�n",1)
--		CallNpc(i,603 + i,10,GetName().."������ʥ����",0,1)
		Msg2Player("B�n �� tr�ng th�nh c�ng m�t c�y Gi�ng Sinh may m�n. H�y mau l�c n� �� nh�n ���c b�o v�t!")
		return 0
	else
		Msg2Player("C�m �n b�n �� nu�i d��ng t�i! Nh�ng t�i ch� c� th� s�ng ���c ngo�i ��ng m� th�i! Xin h�y mang t�i �i!")
		return 1
	end
		
end