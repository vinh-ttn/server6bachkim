-- 洱海 路人NPC 船家（翠烟门30级任务）
-- by：Dan_Deng(2003-07-26)

function main()
	UTask_cy = GetTask(6)
	if ((UTask_cy == 30*256+40) and (HaveItem(2) == 0)) then		--30级任务进行中
		Talk(5,"L30_pay","H玬 nay th藅 l� b閕 thu, nh b総 頲 nhi襲 t玬 c� qu�! ","Ngi c� c� Ng﹏ Tuy誸 kh玭g?","C� Ng﹏ Tuy誸? H玬 nay ta b総 頲 m蕐 con.","Ngi c� th� b竛 cho ta m閠 輙 頲 kh玭g?","Ngi c莕 th� ta s� b竛 cho m閠 輙, nhi猽 y t輓h cho ngi 1000 lng th玦.")
	else
		Talk(1,"","Thuy襫 Gia: p nc Чi L� u鑞 quanh, anh em ng╪ s玭g c竎h n骾, n骾 s玭g mu玭 tr飊g xa c竎h, mu鑞 g苝 c騨g kh玭g th� g苝 頲.")
--		Talk(1,"","船家：出海捕鱼那个把船航啊，丰收归来那个把家返啊！")
	end
end;

function L30_pay()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(2)
		AddNote("Mua 頲 c� Ng﹏ Tuy誸 ")
		Msg2Player("Mua 頲 c� Ng﹏ Tuy誸 c馻 thuy襫 gia � Nh� H秈 ")
	else
		Talk(1,"","Kh玭g c� ti襫? V藋 sao 頲 ch�?")
	end
end;
