--by 廖志山 [2006-09-12]
--2006中秋活动之做灯笼活动,普通灯笼放在地上可以得到双倍经验
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

if (not __H_ITEM_LIGHTCAGE__) then
	__H_ITEM_LIGHTCAGE__ = 1;
	
Include([[\script\event\mid_autumn06\head.lua]]);

AU06_MINUTE = 18 * 60;
--nIndex
tab_light = {
	{1241, "L錸g n bm bm", 10},
	{1242, "L錸g n ng玦 sao", 20},
	{1243, "L錸g n 鑞g", 30},
	{1244, "L錸g n tr遪", 40},
	{1245, "L錸g n c� ch衟", 50},
	{1246, "L錸g n k衞 qu﹏", 60}
}
--中秋活动入口函数
function main(sel)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20061021 or nDate < AU06_BEGINDATE or gb_GetTask("midautumn2006_city_all", 1) ~= 0) then --
		Say("Ho箃 ng  k誸 th骳, kh玭g th� s� d鬾g.", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("Ch� c� ngi ch琲 n筽 th� m韎 c� th� th緋 n", 0);
		return 1;
	end;
	
	local nCount = getn(tab_light);
	if (nIndex > nCount) then
		nIndex = nCount;
	elseif (nIndex < 1) then
		nIndex = 1;
	end;
	
	--放一个东西在地上
	w, x, y = GetWorldPos();
	world = SubWorldID2Idx(w);
	DropItem(world, x * 32, y * 32, -1, 6, 1, tab_light[nIndex][1], 1, 0, 0, 0);

	--给予奖励和公告
	szName = tab_light[nIndex][2];
	time = tab_light[nIndex][3];
	if (GetItemParam(sel, 1) == 1) then
		AddSkillState(440, 1, 1, time * AU06_MINUTE);
		Msg2Player("B筺  th緋 <color=yellow>"..szName.."<color>, nh薾 頲 <color=yellow>"..time.."<color> ph髏 nh﹏ i kinh nghi謒.");
	else
		Msg2Player("B筺  th緋 <color=yellow>"..szName.."<color>.");
	end;
	return 0
end


function IsPickable( nItemIndex, nPlayerIndex )
    if (1 == GetItemParam(nItemIndex, 1)) then
       return 1;
    end
    Msg2Player("<color=yellow> s綾 m祏 lung linh r鵦 r�. <color>")
	return 0;
end

function PickUp( nItemIndex, nPlayerIndex )
    return 1;
end


end; --//end of __H_ITEM_LIGHTCAGE__
--AddSkillState(440, 20, 1,32400)--30分钟内获得双倍经验时间。