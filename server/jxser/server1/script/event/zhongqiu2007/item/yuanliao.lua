--中秋节活动2007 原料包

function IsPickable( nItemIndex, nPlayerIndex )
	if GetExtPoint(0) <= 0 then
			Msg2Player("Ch� c� ngi ch琲  n筽 th� m韎 c� th� nh苩 頲 t骾 nguy猲 li謚.")
			return 0
	end
	return 1;
end
tb_Mareial = 
{
	100000,
	{
		{G=6,D=1,P=1503,nrate=0.3		,szname="T骾 b閠"},
		{G=6,D=1,P=1504,nrate=0.3		,szname="T骾 阯g"},
		{G=6,D=1,P=1505,nrate=0.3		,szname="T骾 tr鴑g"},
		{G=6,D=1,P=1506,nrate=0.05	,szname="T骾 u xanh"},
		{G=6,D=1,P=1507,nrate=0.025	,szname="T骾 h箃 sen"},
		{G=6,D=1,P=1508,nrate=0.015	,szname="T骾 th辴 g�"},
		{G=6,D=1,P=1509,nrate=0.01	,szname="T骾 th辴 heo"}
	}
}
function PickUp( nItemIndex, nPlayerIndex )
		if GetExtPoint(0) <= 0 then
			Msg2Player("Ch� c� ngi ch琲  n筽 th� m韎 c� th� nh苩 頲 t骾 nguy猲 li謚.")
			return 0
		end
		local nrate = random(1,tb_Mareial[1]);
		local nsum = 0
		for nkey,nitem in tb_Mareial[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local nidx = AddItem(g,d,p,1,0,0)
				local szitemname = nitem["szname"]
				Msg2Player(format("B筺 nh薾 頲 1 <color=yellow>%s<color>",szitemname))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szitemname));
				return 0
			end
		end
		return 0;	-- 删除物品

end