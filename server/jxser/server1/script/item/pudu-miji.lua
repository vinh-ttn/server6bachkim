-- Created by fangjieying 2003-5-17
-- 《普渡秘籍》
-- 学会技能普渡众生
-- 峨嵋，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(332)	
	if(party ~= "emei") then							-- 不是峨嵋
		Msg2Player("B筺 nghi猲 c鴘 Ph� ч M藅 T辌h 頲 n鯽 ng祔, nh璶g v蒼 ch璦 l躰h ng� 頲 g�. ")
		return 1
	elseif(GetLever < 80) then							-- 是峨嵋但未到80级
		Msg2Player("B筺 nghi猲 c鴘 Ph� ч M藅 T辌h 頲 n鯽 ng祔, l躰h ng� 頲 r蕋 輙. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  nghi猲 c鴘 k� Ph� ч M藅 T辌h, nh璶g v蒼 ch璦 h鋍 頲 g�. ")
		return 1
	else
		AddMagic(332)										-- 学会技能
		Msg2Player("H鋍 頲 k� n╪g Ph� ч Ch髇g Sinh. ")
		return 0
	end
end