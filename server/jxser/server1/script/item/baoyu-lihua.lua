--Create by yfeng 2004-3-15
--Modified by fangjieying 2003-5-17
--《袖箭术·暴雨梨花》
--学会暴雨梨花技能
--唐门，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(302)
	if(party ~= "tangmen") then							-- 不是唐门
		Msg2Player("B筺 c莔 quy觧 T� Ti詎 Thu藅, B筼 V� L� Hoa nghi猲 c鴘  n鯽 ng祔, k誸 qu� ch糿g l躰h ng� 頲 g�. ")
		return 1
	elseif(GetLevel() < 80) then							-- 是唐门但未到80级
		Msg2Player("B筺 c莔 quy觧 T� Ti詎 Thu藅, B筼 V� L� Hoa nghi猲 c鴘  n鯽 ng祔, k誸 qu� l躰h ng� ch髏 輙. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  nghi猲 c鴘 k� quy觧 T� Ti詎 Thu藅, B筼 V� L� Hoa, nhung kh玭g r髏 ra 頲 g�. ")
		return 1
	else
		AddMagic(302,1)										-- 学会技能
		Msg2Player("H鋍 頲 k� n╪g 'B筼 V� L� Hoa'. ")
		return 0
	end
end