--Created by fangjieying 2003-5-17
--《驭雷术》
--学会缠字诀技能
--昆仑，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(375)
	if(party ~= "kunlun") then							-- 不是昆仑
		Msg2Player("B筺 nghi猲 c鴘 Ng� L玦 Thu藅 頲 n鯽 ng祔, nh璶g v蒼 ch璦 l躰h ng� 頲 g�. ")
		return 1
	elseif(GetLever < 80) then							-- 是昆仑但未到80级
		Msg2Player("B筺 nghi猲 c鴘 Ng� L玦 Thu藅 頲 n鯽 ng祔, l躰h ng� 頲 r蕋 輙. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  nghi猲 c鴘 k� Ng� L玦 Thu藅, nh璶g v蒼 ch璦 h鋍 頲 g�. ")
		return 1
	else
		AddMagic(375,1)
		Msg2Player("H鋍 頲 k� n╪g L玦 чng C鰑 Thi猲. ")
		return 0
	end
end