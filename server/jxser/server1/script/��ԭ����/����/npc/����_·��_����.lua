--中原南区 扬州府 婉娘

function main(sel)
	Say("B竛 l� ph鬰 t誸 n╩ kh�, thi謕 ch骳 t誸 y!",2,"Ta ch鋘 xem. /yes","Kh玭g mua/no")
end;

function yes()
	Say("Trang ph鬰 nam n xu﹏, trang ph鬰 n� m鮪g tu鎖, ng gi� l� 88888 lng!",3,"Nh薾 竜 m韎 /male","竜 m鮪g tu鎖 /female","Kh玭g mua/no")
end;

function no()
	Say("Kh玭g mua c騨g kh玭g sao! Ch骳 kh竎h quan n╩ m韎 vui v�!",0)
end;

function male()
	if(GetCash()>=88888)then
		AddItem(0,2,28,7,0,0,0)
		Pay(88888)
	else
		Say("Ti襫 c馻 kh竎h quan kh玭g , l蕐  ti襫 r錳 h穣 n mua!",0)
	end
end;

function female()
	if(GetCash()>=88888)then
		AddItem(0,2,28,8,0,0)
		Pay(88888)
	else
		Say("Ti襫 c馻 kh竎h quan kh玭g , l蕐  ti襫 r錳 h穣 n mua!",0)
	end
end;
