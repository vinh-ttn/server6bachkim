--中原北区 朱仙镇 路人酒店掌柜的对话
--朱仙镇新手任务: 找手环
--by Dan_Deng(2003-07-21)

--使用变量: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if ((UTask_world40 == 3) or (UTask_world40 == 4)) then
		Talk(1,"sele_buy","C� u h� Ng� Hng kh玭g?")
	else
		i = random(0,1)
		if (i==0) then
			Talk(1,"","е nh蕋 c s秐 � Chu Ti猲 tr蕁 n祔 ch輓h l� u h� Ng� Hng c馻 ti觰 qu竛.")
		else
			Talk(1,"","M阨 kh竎h quan v祇 trong.")
		end
	end
end;

function sele_buy()
	Say("Зy l� c s秐 � Chu Ti猲 tr蕁, 琻g nhi猲 l� c� nh璶g gi� h琲 m綾,100 lng b筩.",2,"Mua/yes","Ьt qu�. /no")
end;

function yes()
	if(GetCash() >= 100)then
		Talk(1,"","Л頲! M閠 ph莕 u h� Ng� Hng!")
		Pay(100);
		AddEventItem(187);
		Msg2Player("B筺 nh薾 頲 m閠 ph莕 u ph� Ng� Hng ");
		AddNote("Mua 頲 m閠 ph莕 u ph� Ng� Hng ")
--		SetTask(68,4);
	else
		Talk(1,"","B鎛 qu竛 kh玭g mua b竛 l� v鑞 u, khi n祇  ti襫 h穣 quay l筰.")
	end
end;

function no()
end;
