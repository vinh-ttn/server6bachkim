Include("\\script\\battles\\singlefight\\dt_head.lua")
Include("\\script\\battles\\battlehead.lua")

function OnTimer()
	t = GetMissionV(MS_TIME1_ACC) + 1
	SetMissionV(MS_TIME1_ACC , t)

	if (t == EXPRETIME) then  --如果到了结束前10秒钟则提示将要退出
		Msg2MSAll(GetMissionV(MS_DTMISSION), "<#> Khu v鵦 Кn u sau 10 gi﹜ n鱝 s� k誸 th骳!")
	else
		RestTime = (TIMER_2 - t * TIMER_1)/FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime)
		if (RestSec == 0) then
			str = "<#> Th阨 gian n u c遪 l筰:"..RestMin.."ph髏"
		else
			str = "<#> Th阨 gian n u c遪 l筰:"..RestMin.."ph髏"..RestSec.." gi﹜"
		end
		Msg2MSAll(GetMissionV(MS_DTMISSION),str)
	end
end  