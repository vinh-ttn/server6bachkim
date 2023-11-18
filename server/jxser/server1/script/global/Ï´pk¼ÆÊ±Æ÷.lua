-- 洗PK计时器.lua
-- Update: Dan_Deng(2003-11-27)
-- Timer: 9

Include("\\Script\\Global\\TimerHead.lua")

function OnTimer()
	Uworld96 = GetTask(96)
	PK_value = GetPK()
	StopTimer()
	if (Uworld96 > 0) then			-- 只有在牢房中才允许减PK值
		if (PK_value > 1) then		-- 尚未洗完PK值
			Msg2Player("Sau th阨 gian th祅h t﹎ h鑙 c秈, t閕 nghi謙 c馻 ngi  頲 gi秏 nh�!")
			SetPK(PK_value - 1)
			SetTask(96,Uworld96 - 1)
			SetTimer(12 * CTime * FramePerSec, 9)						--重新开始计时（12个时辰==120分钟）
		else							-- 洗完PK了
			Msg2Player("Sau th阨 gian th祅h t﹎ h鑙 c秈, ngi r鑤 cu閏  r鯽 s筩h t閕 l鏸 c馻 m譶h!")
			SetPK(0)
			SetTask(96,100)
		end
	end
end;
