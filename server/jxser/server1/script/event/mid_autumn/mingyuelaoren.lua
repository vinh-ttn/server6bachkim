--明月老人对话
--月饼换对应礼品
--mingyuelaoren.lua
--2005-09-07


tbCAKE2GIFT = {
		[891] = { "<#> B竛h trung thu nh﹏ u ", "<#> 1 Ti猲 Th秓 l� ",			{ 6, 1, 71, 1, 0, 0, 0 } },
		[893] = { "<#> B竛h Trung Thu u Tr鴑g", "<#> 1 Ph骳 Duy猲 l� (i) ",		{ 6, 1, 124, 1, 0, 0, 0 } },
		[895] = { "<#> B竛h Trung thu H筺h nh﹏", "<#> Th莕 B� Чi H錸g Bao",			{ 6, 1, 402, 1, 0, 0, 0 } },
		[896] = { "<#> B竛h trung thu th藀 c萴 ", "shijin_ex_goldequip()" }
}

tbSHIJIN2GOLDEQUIP = {
		{ "<#> у ph� Ho祅g Kim - мnh Qu鑓 Thanh Sa Trng Sam", { 0, 159 }, 0.12 },
		{ "<#> у ph� Ho祅g Kim - мnh Qu鑓 � Sa Ph竧 Qu竛", { 0, 160 }, 0.12 },
		{ "<#> у ph� Ho祅g Kim - мnh Qu鑓 X輈h Quy猲 Nhuy詎 Ngoa", { 0, 161 }, 0.12 },
		{ "<#> у ph� Ho祅g Kim - мnh Qu鑓 T� Щng H� uy觧", { 0, 162 }, 0.12 },
		{ "<#> у ph� Ho祅g Kim - мnh Qu鑓 Ng﹏ T祄 Y猽 i", { 0, 163 }, 0.12 },
		{ "<#> у ph� Ho祅g Kim - An Bang B╪g Tinh Th筩h H筺g Li猲", { 0, 164 }, 0.1 },
		{ "<#> у ph� Ho祅g Kim - An Bang C骳 Hoa Th筩h Ch� ho祅", { 0, 165 }, 0.1 },
		{ "<#> у ph� Ho祅g Kim - An Bang 襫 Ho祅g Th筩h Ng鋍 B閕", { 0, 166 }, 0.1 },
		{ "<#> у ph� Ho祅g Kim - An Bang K� Huy誸 Th筩h Gi韎 Ch� ", { 0, 167 }, 0.1 },
}

function main()
	local tbOpp = {
				"<#> Зy l� B竛h trung thu nh﹏ u, xin m阨 d飊g th�!/#cake_ex_gift(891)",
				"<#> Зy l� b竛h trung thu u tr鴑g, xin m阨 d飊g th�!/#cake_ex_gift(893)",
				"<#> Зy l� B竛h Trung thu H筺h nh﹏, xin m阨 d飊g th�!/#cake_ex_gift(895)",
				"<#> Зy l� b竛h trung thu th藀 c萴, xin m阨 d飊g th�!/#cake_ex_gift(896)",
				"<#> Kh玭g c� g�! Ta ch� n th╩ l穙 th玦!/OnCancel",
	}
	Say("<#> Tay ngh� l祄 b竛h c馻 c竎 v� s� ph� � y u v祇 h筺g thng th鮝. M鏸 n╩ ta u tr玭g i d辮 trung thu n祔. B筺 tr� c� chuy謓 g� kh玭g?", getn(tbOpp), tbOpp )
end

function OnCancel()
end

function cake_ex_gift(dtype)
	local count = CalcEquiproomItemCount( 6, 1, dtype, -1 )
	if ( count <= 0 ) then
		Say("<#> B筺 tr�! B竛h trung thu c馻 ngi u? мnh tr猽 ch鋍 gi� n祔 �?", 1, "<#> Xin l鏸! Ta sai r錳!/OnCancel" )
		return
	end
	Say("<#> A! X璦 gi� ta ch璦 bao gi� 頲 ╪ b竛h ngon nh� v莥! Зy l� ch髏 th祅h �! C� b竛h ngon nh� quay l筰 t苙g cho ta nh�!", 1, "Nh薾 l� ph萴!/#take_ex_gift("..dtype..")")

end

function take_ex_gift(dtype)
	local dpass = ConsumeEquiproomItem(1, 6, 1, dtype, -1)
	if ( dpass ~= 1 ) then
		print("delete item cake error dtype = "..dtype)
		return
	end
	Msg2Player("<#> B筺 m蕋 1 "..tbCAKE2GIFT[dtype][1])
	
	if ( dtype == 896 ) then
		shijin_ex_goldequip()
	else
		AddItem(tbCAKE2GIFT[dtype][3][1], tbCAKE2GIFT[dtype][3][2], tbCAKE2GIFT[dtype][3][3], tbCAKE2GIFT[dtype][3][4], tbCAKE2GIFT[dtype][3][5], tbCAKE2GIFT[dtype][3][6], tbCAKE2GIFT[dtype][3][7] )
		Msg2Player("<#> B筺 nh薾 頲 "..tbCAKE2GIFT[dtype][2])
		WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", give "..tbCAKE2GIFT[dtype][1].." in exchange for "..tbCAKE2GIFT[dtype][2])
	end
end

function shijin_ex_goldequip()
	local base = 0
	for i = 1, getn( tbSHIJIN2GOLDEQUIP ) do
		base = base + tbSHIJIN2GOLDEQUIP[ i ][ 3 ]
	end
	base = 100 * base
	
	local sum = 0
	local num = random(1, base)

	for i = 1, getn( tbSHIJIN2GOLDEQUIP ) do
		sum = sum + tbSHIJIN2GOLDEQUIP[i][3] * 100
		if( sum >= num ) then
			AddGoldItem( tbSHIJIN2GOLDEQUIP[i][2][1], tbSHIJIN2GOLDEQUIP[i][2][2] )
			Msg2Player("<#> B筺 nh薾 頲 1 b� "..tbSHIJIN2GOLDEQUIP[i][1])
			WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", give "..tbCAKE2GIFT[896][1].." in exchange for "..tbSHIJIN2GOLDEQUIP[i][1])
			break
		end
	end
end