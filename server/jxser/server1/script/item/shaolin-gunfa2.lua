--Created by fangjieying 2003-5-17
--《少林棍法·卷二》
--学会横扫千军技能
--少林，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(319)
	if(party ~= "shaolin") then							-- 不是少林
		Msg2Player("B筺 nghi猲 c鴘 Thi誹 L﹎ C玭 Ph竝 - Quy觧 2 頲 n鯽 ng祔, nh璶g v蒼 ch璦 l躰h ng� 頲 g�. ")
		return 1
	elseif(GetLever < 80) then							-- 是少林但未到80级
		Msg2Player("B筺 nghi猲 c鴘 Thi誹 L﹎ C玭 Ph竝 - Quy觧 2 頲 n鯽 ng祔, l躰h ng� 頲 r蕋 輙. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  nghi猲 c鴘 k� Thi誹 L﹎ C玭 Ph竝 - Quy觧 2, nh璶g v蒼 ch璦 h鋍 頲 g�. ")
		return 1
	else
		AddMagic(319,1)										-- 学会技能
		Msg2Player("H鋍 頲 k� n╪g Ho祅h T秓 Thi猲 Qu﹏. ")
		return 0
	end
end