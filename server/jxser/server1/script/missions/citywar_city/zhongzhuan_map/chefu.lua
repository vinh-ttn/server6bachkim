--攻城战 车夫对话
CurStation = 1;
Include("\\script\\global\\station.lua")

function main(sel)
	SetCurCamp(GetCamp())
	SetFightState(0)
	BT_LeaveBattle()
	Say("Nh鱪g ngi xa phu chi課 trng ch髇g t玦 v祇 sinh ra t�, ki誱 ti襫 b籲g sinh m筺g m譶h! Xin gi髉 cho v礽 lng b筩!", 5, "Nh鱪g n琲  甶 qua/WayPointFun", "Nh鱪g th祅h th�  甶 qua/StationFun", "Quay l筰 a 甶觤 c� /TownPortalFun","R阨 kh醝 u trng /LeaveChefu","Kh玭g c莕 u/OnCancel");
end;

function OnCancel()
end;

function LeaveChefu()
	w,x,y = RevID2WXY(GetPlayerRev());
	NewWorld(w,x/32, y/32);
end;