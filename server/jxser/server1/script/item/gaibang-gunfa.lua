--Created by fangjieying 2003-5-17
--《丐帮棍法》
--学会天下无狗技能
--丐帮，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(359)
	if(party ~= "gaibang") then							-- 不是丐帮
		Msg2Player("B筺 nghi猲 c鴘 quy觧 C竔 Bang C玭 Ph竝 頲 n鯽 ng祔, nh璶g v蒼 ch璦 l躰h ng� 頲 g�. ")
		return 1
	elseif(GetLever < 80) then							-- 是丐帮但未到80级
		Msg2Player("B筺 nghi猲 c鴘 quy觧 C竔 Bang C玭 Ph竝 頲 n鯽 ng祔, l躰h ng� 頲 r蕋 輙. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  nghi猲 c鴘 k� quy觧 C竔 Bang C玭 Ph竝, nh璶g v蒼 ch璦 h鋍 頲 g�. ")
		return 1
	else
		AddMagic(359,1)
		Msg2Player("H鋍 頲 k� n╪g Thi猲 H� V� C萿 ")
		return 0
	end
end