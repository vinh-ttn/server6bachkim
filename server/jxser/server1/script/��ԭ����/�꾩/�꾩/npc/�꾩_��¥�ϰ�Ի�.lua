--中原北区 汴京府 酒楼老板对话（少林50级任务）
-- Update: Dan_Deng(2003-10-25)

function main(sel)
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+20) and (HaveItem(123) == 0) then		-- 50级任务进行中
		Say("е nh蕋 Thi猽 K� t鰑 y! Kinh th祅h  nh蕋 t鰑 y! Ch� c� 500 lng th玦!",2,"Mua/buy","Kh玭g m祅g /no")
	else
		Talk(1,"","Kh竎h quan mu鑞 u鑞g ru �? U鑞g ru th� 頲, nh璶g ta n鉯 trc, n y ch� 頲 u鑞g ru, kh玭g n鉯 chuy謓 qu鑓 s�. N誹 nh� mu鑞 n鉯 chuy謓 qu鑓 s� th� xin m阨 n n琲 kh竎! ")
	end
end;

function buy()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(123)
		Msg2Player("Mua 頲 m閠 con g� nng � t鰑 l莡 ")
		AddNote("Mua 頲 m閠 con g� nng � t鰑 l莡 ")
	else
		Talk(1,"","Kh竎h quan! G鰅 con g� n祔 � y! Xin h穣 v� mang ti襫 n ! ")
	end
end

function no()
end
