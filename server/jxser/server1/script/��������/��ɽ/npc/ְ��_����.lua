--华山　职能　车夫
-- by：Dan_Deng(2003-09-16)

CurStation = 7
Include("\\script\\global\\station.lua")

function main(sel)
	Say("Thi u xong r錳 �? C� c莕 ta a v� kh玭g?", 4, "Nh鱪g n琲  甶 qua/WayPointFun", "Nh鱪g th祅h th�  甶 qua/StationFun","Tr� l筰 a 甶觤 c� /TownPortalFun", "Kh玭g c莕 u/OnCancel")
end;

function  OnCancel()
   Talk(1,"","C� ti襫 th� h穣 quay l筰 nh�! ")
end;
