--------------------------------------------------------------------
-- 玩家操作脚本，主要响应界面操作
--------------------------------------------------------------------
TIME_2000_1_1 = 946656000;
function BIND_ITEM(itemIdx)
	local g = GetItemProp(itemIdx)
	--必须是装备或损坏的装备
	if g ~= 0 and g ~= 7 then
		Say("Ch� c� th� kh鉧 b秓 hi觤 cho trang b�!", 0)
		return
	end
	--生成回调参数
	local szFunStep2 = "/#BIND_ITEM_2("..itemIdx..","..GetItemGenTime(itemIdx)..")"
	local nBindState = GetItemBindState(itemIdx)
	if nBindState < 0 then
		Say("V藅 ph萴 n祔  � tr筺g th竔 kh鉧 b秓 hi觤, kh玭g c莕 ph秈 kh鉧 n鱝!", 0)
	elseif nBindState > 0 then
		
		if (nBindState > (floor((GetCurServerTime() - TIME_2000_1_1) / 3600)) ) then
			Say("Th阨 gian i kh鉧 c馻 v藅 ph萴 n祔 <color=green> vt qua 168 ti課g <color>, t筸 th阨 kh玭g th� m� kh鉧 l筰!", 0)
			return
		end
		
		Say("V藅 ph萴 n祔 產ng trong giai 畂筺  m� kh鉧 b秓 hi觤, c� mu鑞 kh鉧 ti誴 t鬰 kh玭g?", 2, "уng �"..szFunStep2, "Kh玭g mu鑞/cancel")
	else
		Say("Khi trang b� 頲 kh鉧 th� kh玭g th� giao d辌h, b祔 b竛, v鴗 b� ho芻 t v祇 h閜 i tho筰. уng th阨 kh玭g cho ph衟 ch� t筼, kh秏 n筸, c bi謙 l� khi PK s� kh玭g b� r琲 ra. Trang b� 頲 kh鉧 b秓 hi觤 v蒼 c� t竎 d鬾g nh� b譶h thng, vi謈 m芻 v祇, c雐 b�, s鯽 ch鱝 ph秈 th玭g qua vi謈 <color=yellow>m� kh鉧 b秓 hi觤<color> (n髏 'Th竜' tr猲 giao di謓 trang b�). Tuy nhi猲, sau <color=green>168 gi� <color> m韎 c� th� ho祅 to祅 頲 m� kh鉧.", 
			2, "Ta mu鑞 kh鉧 b秓 hi觤 trang b� n祔"..szFunStep2, "в ta xem l筰/cancel")
	end
end

function BIND_ITEM_2(itemIdx, nGenTime)
	--校验是否先前的物品
	if GetItemGenTime(itemIdx) ~= nGenTime then
		return
	end
	if IsMyItem(itemIdx) ~= 1 then
		
		return 
	end
	if BindItem(itemIdx) == 1 then
		WriteLog("ITEM_BIND\t"..date("%Y-%m-%d %X\t")..GetItemName(itemIdx).."\tBind\t"..GetAccount().."\t"..GetName())
		Msg2Player("B筺  kh鉧 b秓 hi觤 th祅h c玭g m閠 trang b�!")
	end
end

function UNBIND_ITEM(itemIdx)
	--生成回调参数
	local szFunStep2 = "/#UNBIND_ITEM_2("..itemIdx..","..GetItemGenTime(itemIdx)..")"
	local nBindState = GetItemBindState(itemIdx)
	if nBindState == 0 then
		Say("V藅 ph萴 n祔 ch璦 頲 kh鉧 b秓 hi觤!", 0)
	elseif nBindState > 0 then
		Say("V藅 ph萴 n祔 產ng � tr筺g th竔 m� kh鉧 b秓 hi觤, kh玭g c莕 ph秈 m� kh鉧 n鱝!", 0)
	elseif nBindState == -1 then
		Say("Sau khi nh蕄 n髏 'Th竜'  m� kh鉧 b秓 hi觤, c莕 ph秈 i <color=green>168 gi�<color> sau th� kh鉧 m韎 c� th� ho祅 to祅 頲 m�.", 
			2, "Ta ng � m� kh鉧 b秓 hi觤"..szFunStep2, "в ta xem l筰/cancel")
	else
		Say("V藅 ph萴 n祔 頲 kh鉧 b秓 hi觤 v躰h vi詎, kh玭g th� m� kh鉧!", 0)
	end
end

function UNBIND_ITEM_2(itemIdx, nGenTime)
	--校验是否先前的物品
	if GetItemGenTime(itemIdx) ~= nGenTime then
		return
	end
	if IsMyItem(itemIdx) ~= 1 then
		return 
	end
	if UnBindItem(itemIdx) == 1 then
		WriteLog("ITEM_BIND\t"..date("%Y-%m-%d %X\t")..GetItemName(itemIdx).."\tUnBind\t"..GetAccount().."\t"..GetName())
		Msg2Player("Y猽 c莡 m� kh鉧 b秓 hi觤  頲 g雐 甶. Sau 168 gi� kh鉧 s� t� ng 頲 m� ho祅 to祅.")
	end
end

function cancel()
end