--Create by yfeng 2004-3-15
--Modified by fangjieying 2003-5-17
--《陷阱术·乱环击》
--学会乱环击技能
--唐门，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(351)
	if(party ~= "tangmen") then							-- 不是唐门
		Msg2Player("B筺 nghi猲 c鴘 H穖 T躰h thu藅 - Lo筺 Ho祅 K輈h 頲 n鯽 ng祔, nh璶g v蒼 ch璦 l躰h ng� 頲 g�. ")
		return 1
	elseif(GetLever < 80) then							-- 是唐门但未到80级
		Msg2Player("B筺 nghi猲 c鴘 H穖 T躰h thu藅 - Lo筺 Ho祅 K輈h 頲 n鯽 ng祔, l躰h ng� 頲 r蕋 輙, kh玭g hi謚 qu�. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  nghi猲 c鴘 k� H穖 T躰h thu藅 - Lo筺 Ho祅 K輈h, nh璶g v蒼 ch璦 h鋍 頲 g�. ")
		return 1
	else
		AddMagic(351,0)
		Msg2Player("H鋍 頲 k� n╪g Lo筺 Ho祅 K輈h. ")
		return 0
	end
end