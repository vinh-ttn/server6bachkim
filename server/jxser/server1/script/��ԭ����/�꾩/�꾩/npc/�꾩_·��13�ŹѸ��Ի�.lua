--description: 中原北区 汴京府 路人13张寡妇对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
--	UTask_tr = GetTask(4)		--没必要理会大任务状态
--	if (UTask_tr == 62) then
	UTask_trsub60 = GetByte(GetTask(28),1)
	if (UTask_trsub60 == 1) and (HaveItem(63) == 1) then
		Talk(2, "", " Зy l� Ng﹏ tr﹎ c馻 Kh骳 Th� r蘮 trong th祅h nh� ta a cho c�, 玭g ta c� t譶h � v韎 c�, ch� l� kh玭g  d騨g c秏  t� b祔, kh玭g bi誸 c�.....", "Th藅 ra, ta  c� c秏 t譶h v韎 huynh 蕐, nh璶g l� m閠 qu� ph�, l祄 sao m� mi謓g 頲 ch�? T骾 Hng Nang n祔 t� tay ta l祄, phi襫 ngi a cho 玭g ta, ch輓h l� t輓 v藅 n祔!")
		DelItem(63)
		AddEventItem(64)
		SetTask(28, SetByte(GetTask(28),1,2))
		AddNote("竛 ng t蕋 c� nh鱪g c﹗  c馻 t玭 t� t礽, 頲 t苙g cho c﹜ 產o畂秐 th駓 ")
		Msg2Player("Nh薾 頲 m閠 t骾 hng ")
	elseif (UTask_trsub60 == 2) and (HaveItem(64) == 0) then
		AddEventItem(64)
		Talk(1,"","Ngi ! T筰 sao t骾 hng kh玭g l蕐 v� ngi c騨g kh玭g th蕐?")
	elseif (UTask_trsub60 >= 2) then 
		Talk(1,""," t� ngi  se duy猲 gi鱝 ta v� l穙 Kh骳! N誹 kh玭g ta ch綾 ph秈 s鑞g c� n t韎 ch誸! ")
	else
		if (random(0,1) == 0) then
			Talk(1,"","N╩ trc, ch錸g ta b� b謓h  ch誸, ta s鑞g c� c m閠 m譶h n nay!")
		else
			Talk(1,"","Ph輆 B綾 th祅h c� Phng l穙 th竔 b� m蕋 ch錸g, s鑞g c� c  30 n╩ r錳! Th藅 l� ng thng!")
		end
	end
end;
