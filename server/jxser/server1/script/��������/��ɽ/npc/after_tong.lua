-- after_tong.lua 创建帮会成功后的处理
-- By Dan_Deng(2003-11-10)

function main()
	if (GetTask(97) < 1) then		-- 只有以前没买过马才行
		SetTask(97,1)
	end
	Talk(3,"","Ch骳 m鮪g h蕺p kh竎h th祅h l藀 bang h閕, h穣 th鵦 hi謓 ho礽 b穙 c馻 b秐 th﹏ 甶!","Nh璶g c騨g c莕 nh綾 th猰 m閠 ch髏: Ngi ph秈 c� n╪g l鵦 l穘h o v� uy t輓 giang h�. Trong v遪g 3 ng祔 ph秈 t譵 頲 16 ngi c飊g ch� hng gi髉 . N誹 kh玭g tr猲 giang h� s� kh玭g th鮝 nh薾 bang h閕 c馻 ngi. Th阨 h筺 3 ng祔 c� th� xem l� 'Th阨 k� kh秓 nghi謒'","Sau khi bang h閕 c馻 ngi 頲 輙 nh蕋 16 ngi, tr猲 giang h� s� ti課 h祅h kh秓 nghi謒. N誹 sau 3 ng祔 v蒼 ch璦  16 ngi th� giang h� v蒼 ch璦 th鮝 nh薾 bang h閕 n祔")
end
