--description: 永乐镇_牛牛妈
--author: wangzg
--date: 2003/7/18
--modify 2003/7/21 wangzg
--update 2003/7/22 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main(sel)
	UTask_world37=GetTask(65)
	if ((UTask_world37==0) and (GetLevel() >= 2)) then		-- 要求等级超过2级
		Say("Th籲g Ng璾 Ng璾 nh� ta c� th輈h l祄 i hi謕, b﹜ gi� l筰 kh玭g bi誸  ch箉 甶 u r錳� ",2,"ng lo l緉g, ta gi髉 t萿 t譵 /yes", "T譵 kh玭g ra /no")
	elseif (UTask_world37==2) then
		Talk(1,"","ng lo l緉g, ta gi髉 t萿 t譵 n�!")
	else
		Talk(1,"","Kh緋 n琲 ng祔 c祅g kh玭g y猲 b譶h, con ta l筰 kh玭g nghe l阨, th藅 l� bu錸 l遪g!")
	end
end;

function yes()
	Talk(1,"","Ngi th藅 l� ngi t鑤, v藋 th� l祄 phi襫 gi髉 ta nh�!")
	SetTask(65,2)
	AddNote("Nh薾 nhi謒 v�: gi髉 m� Ng璾 Ng璾 t譵 con trai ")
	Msg2Player("Nh薾 nhi謒 v�: gi髉 m� Ng璾 Ng璾 t譵 con trai ")
end

function no()
end
