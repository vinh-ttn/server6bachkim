--description: 唐门50级任务 青城山响水洞唐禾
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if (UTask_tm == 50*256+60) then
		Talk(1,"","H�! D� ta  th﹏ b筰 danh li謙, c� nh b筰 ta th� ngi c騨g ng h遪g l蕐 頲 '竚 kh� ph�'! Ta  gi蕌 n� trong s琻 ng r錳, c� i ngi c騨g ng mong t譵 頲!")
		SetTask(2, 50*256+80)
		Msg2Player("Цnh b筰 Л阯g H遖 t筰 ng Hng Th駓 Thanh Th祅h s琻, bi誸 頲 '竚 kh� ph�' 頲 c蕋 gi蕌 trong s琻 ng ")
		AddNote("Цnh b筰 Л阯g H遖 t筰 ng Hng Th駓 Thanh Th祅h s琻, bi誸 頲 '竚 kh� ph�' 頲 c蕋 gi蕌 trong s琻 ng ")
	end
end;
