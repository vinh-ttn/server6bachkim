-- Created by fangjieying 2003-5-17
-- 《五毒掌法·卷一》
-- 学会技能阴风蚀骨
-- 五毒，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(353)
	if(party ~= "wudu") then							-- 不是五毒
		Msg2Player("B筺 nghi猲 c鴘 Ng� чc Chng Ph竝 - Quy觧 1 頲 n鯽 ng祔, nh璶g v蒼 ch璦 l躰h ng� 頲 g�. ")
		return 1
	elseif(GetLever < 80) then							-- 是五毒但未到80级
		Msg2Player("B筺 nghi猲 c鴘 Ng� чc Chng Ph竝 - Quy觧 1 頲 n鯽 ng祔, l躰h ng� 頲 r蕋 輙. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  nghi猲 c鴘 k� Ng� чc Chng Ph竝 - Quy觧 1, nh璶g v蒼 ch璦 h鋍 頲 g�. ")
		return 1
	else
		AddMagic(353,1)										-- 学会技能
		Msg2Player("H鋍 頲 k� n╪g  Phong Th鵦 C鑤. ")
		return 0
	end
end