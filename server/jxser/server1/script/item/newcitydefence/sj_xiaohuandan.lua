
function add463()
		level = random(2,10);
		AddSkillState(463, level, 0, 12 )	--增加玩家内力
		Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7> h錳 ph鬰 n閕 l鵦 trong n鯽 gi﹜"..(level*500).."<#> 甶觤")	
end

function add465()
		level = random(1,10);
		AddSkillState(465, level, 0, 540 )	--增加玩家内力持续回复
		Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7> 30 gi﹜ h錳 ph鬰 n閕 l鵦, h錳 ph鬰 m鏸 n鯽 gi﹜"..(level*100).."<#> 甶觤")	
end

function add489()
		level = random(10,20);
		AddSkillState(489, level, 0, 540 )	--增加玩家内力上限
		Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7> 30 gi﹜ m鴆 n閕 l鵦 t╪g::"..(level*100).."<#> 甶觤")	
end

Tab={add463,add465,add489}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		return 0;	-- 删除物品
	end
end

