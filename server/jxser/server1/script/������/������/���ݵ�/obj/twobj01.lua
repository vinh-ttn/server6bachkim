--description: 天王帮出师任务 青螺岛宝箱
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 60*256+20) and (HaveItem(101) == 1) then
		DelItem(101)
		Talk(2,"","Rng b竨 tr鑞g kh玭g, 'Thi猲 Vng Di Th�'  b� ngi Kim l蕐 甶 ","Tr猲 t c� m閠 s� d蕌 ch﹏ hng v� S琻 чng Thanh La Фo, xem ra b鋘 s竧 th� r阨 kh醝 ch璦 bao l﹗. ")
		SetTask(3, 60*256+40)
		AddNote("M� rng b竨 ph輆 B綾 h�, m韎 bi誸 Thi猲 Vng Di Th�  b� b鋘 s竧 th� ngi nc Kim l蕐 甶. ")
	elseif (UTask_tw == 60*256+40) then
		Talk(1,"","Rng b竨 tr鑞g kh玭g. ")
	else
		Talk(1,"","Kh玭g c� ch譨 kh鉧, kh玭g m� 頲 rng.")
	end
end;
