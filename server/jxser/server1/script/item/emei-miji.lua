--Create by yfeng 2004-3-9
--Modified by fangjieying 2003-5-16
--峨嵋秘籍，作用80级以上的峨嵋弟子使用之后，可以加1点技能点
--包括出师，不包括转门派以前的
--该物品最多只能使用15次
--任务变量80低4位表示使用该物品的次数
function main(sel)
	times = mod(GetTask(80),16)
	party = GetLastAddFaction()
	str={
		"B筺 c莔 quy觧Nga Mi M藅 T辌hnghi猲 c鴘  n鯽 ng祔, k誸 qu� kh玭g l躰h ng� 頲 g�. ",
		"B筺 c莔 quy觧Nga Mi M藅 T辌hnghi猲 c鴘  n鯽 ng祔, k誸 qu� l躰h ng� ch髏 輙. ",
		"B筺 c莔 quy觧Nga Mi M藅 T辌hnghi猲 c鴘  n鯽 ng祔, k誸 qu� t 頲 m閠 v礽 甶襲 t﹎ c ",
		"B筺  cNga Mi M藅 T辌hr蕋 k�, ng� ra 頲 m閠 v礽 甶襲 t﹎ c. "
		}
	if(party ~= "emei") then     -- 不是峨嵋派 
		Msg2Player(str[1])
		return 1
	elseif (GetLevel()<80) then    -- 是峨嵋派，但等级小于80
		Msg2Player(str[2])
		return 1
	elseif(times > 14) then        -- 使用次数已达到上限
			Msg2Player(str[4])
		return 1
	else
		AddMagicPoint(1)            -- 加技能点1
		SetTask(80,times+1)
		Msg2Player(str[3])
		return 0
	end
end