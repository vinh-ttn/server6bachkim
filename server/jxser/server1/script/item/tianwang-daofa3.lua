-- Created by fangjieying 2003-5-17
-- 《天王刀法·卷三》
-- 学会技能追风诀
-- 天王，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(322)	
	if(party ~= "tianwang") then							-- 不是天王
		Msg2Player("B筺 nghi猲 c鴘 Thi猲 Vng o ph竝 - Quy觧 3 頲 n鯽 ng祔, nh璶g v蒼 ch璦 l躰h ng� 頲 g�. ")
		return 1
	elseif(GetLever < 80) then							-- 是天王但未到80级
		Msg2Player("B筺 nghi猲 c鴘 Thi猲 Vng o ph竝 - Quy觧 3 頲 n鯽 ng祔, l躰h ng� 頲 r蕋 輙. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  nghi猲 c鴘 k� Thi猲 Vng o ph竝 - Quy觧 3, nh璶g v蒼 ch璦 h鋍 頲 g�. ")
		return 1
	else
		AddMagic(322,1)										-- 学会技能 
		Msg2Player("H鋍 頲 k� n╪g Ph� Thi猲 Tr秏. ")
		return 0
	end
end