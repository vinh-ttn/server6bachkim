--中原北区 伏牛山2to天心洞2
--Trap ID：中原北区 18

function main(sel)
	if (GetTask(129) == 50) then			-- 周云泉任务
		Say("V鮝 n c鯽 ng, t nhi猲 b筺 nghe ti課g k猽 th秏 thng, h譶h nh� l� ti課g c馻 Chu V﹏ Tuy襫..",2," c鴘 ngi /U129_50","Kh玭g ch� � n, 甶 v祇 ng Thi猲 T﹎. /enter_cave")
	elseif (GetTask(129) == 55) then		-- 战斗未结束，强迫进入天心洞
		Talk(1,"go_Zhome","ng l筰! Ti誴 chi猽 y! ")
	else
		enter_cave()
	end
end;

function enter_cave()
	SetFightState(1)
	NewWorld(42, 1619, 2894);
	AddTermini(108)
end

function U129_50()
	SetTask(129,55)
	Talk(4,"go_Zhome","T筰 sao c竎 ngi t筰 sao l祄 h筰 Chu huynh? ","Ngi t� u n? ng c� nhi襲 chuy謓!","Xem ra b鴆 th� gi� m筼 n祔, th� ra l� m璾 ma chc qu� c馻 b鋘 ngi!","H�! Thi猲 Nh蒼 b鋘 ta h祅h s�, kh玭g ai c� th� bi誸 頲. Nh璶g ngi  bi誸 頲 chuy謓 n祔, th� b鋘 ta nh ti詎 ngi c飊g h緉 v� b猲 kia th� gi韎 v藋. ")
end

function go_Zhome()
	SetFightState(1)
	NewWorld(232,1612,3204)
end
