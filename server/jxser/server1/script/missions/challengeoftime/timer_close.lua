-- description	: 关闭比赛定时器
-- author		: wangbin
-- datetime		: 2005-07-13

Include("\\script\\missions\\challengeoftime\\include.lua")

function timeout()
	Msg2MSAll(MISSION_MATCH, "<#> Th阨 gian l祄 nhi謒 v�  k誸 th骳, i ng� c馻 b筺 khi猽 chi課 th蕋 b筰");
end

function OnTimer()
	timeout();
	close_close_timer();
	close_match();
	close_board_timer();
end
