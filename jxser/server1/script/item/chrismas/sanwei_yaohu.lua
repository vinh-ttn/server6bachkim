----------------------------------------------------------------
	--FileName:	sanwei_yaohu.lua
	--Creater:	firefox
	--Date:		2005-12-19
	--Comment:	ʥ���ڻ����������ζҩ��
	--			���ܣ�ÿ���ʹ��10�Σ�ÿʹ��һ�α��ܻ��һ����ζ�ɵ������ÿ���2���飩
-----------------------------------------------------------------
Uworld0001 = 2000
MAX_USETIME = 10
--��һ�ֽ�Ϊ����ʹ�ô���
--�ڶ��ֽ�Ϊ���ʹ�õ�����
function main()
	use_day = GetByte(GetTask(Uworld0001), 2)
	
	nDay = tonumber(date("%d"))
	if (use_day ~= nDay) then
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, 0))
	end
	use_time = GetByte(GetTask(Uworld0001), 1)
	if (use_time >= MAX_USETIME) then
		Talk(1, "", "B�nh Tam V� D��c m�i ng�y ch� c� th� tinh luy�n"..MAX_USETIME.."vi�n ��n d��c.")
	else
		--AddItem()��ζ�ɵ�
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, use_time + 1))
		Msg2Player("B�n nh�n ���c 1 vi�n Tam V� Ti�n ��n")
	end
	return 1
end