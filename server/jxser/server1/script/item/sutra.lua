-- 小红包功能		红包使用
-- By Spe(2004-01-01)

NUM20E = 2000000000;

function main(nItemIdx)
	local ng, _, np = GetItemProp(nItemIdx);
	
	local exp=GetExp();
	
	if (exp < 0) then
		exp = exp*-1;
		if (ng == 6 and np == 12) then
			if (exp >= NUM20E) then
				exp = NUM20E;
			end
		elseif (ng == 6 and np == 2392) then
			exp = floor (exp / 2);
--		elseif (ng == 6 and np == 2393) then		-- 大般若心经 给 100%经验
		end
		
		sutra_addexp(exp)
		Msg2Player("Sau khi nghi猲 c鴘 k� B竧 Nhc T﹎ Kinh, b筺 c秏 th蕐 to祅 th﹏ khoan kho竔, kinh nghi謒 th鵦 chi課 h錳 ph鬰 kh玭g 輙. ")
		return 0
	end 
	
	Msg2Player("B筺 nghi猲 c鴘 B竧 Nhc T﹎ Kinh 頲 n鯽 ng祔, nh璶g v蒼 ch璦 l躰h ng� 頲 g�. ")
	return 1;
end


function sutra_addexp(n_exp)
	local n_count = 100;
	while (n_exp > 0) do
		if (n_exp >= 20e8) then
			AddOwnExp(20e8);
			n_exp = n_exp - 20e8;
		else
			AddOwnExp(n_exp);
			n_exp = 0;
			break
		end
	end
end
