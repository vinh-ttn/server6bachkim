--冰穴迷宫 冰牢入口 trap
-- by：Dan_Deng(2003-07-31)

function main(sel)
	UTask_kl = GetTask(9)
	if (UTask_kl == 50*256+64) and (HaveItem(213) == 1) and (HaveItem(10) == 0) then		-- 昆仑50级任务中
		SetTask(9,50*256+128)
		DelItem(213)		-- 钥匙应使用ID号
		Msg2Player("B筺 d飊g ch譨 kh鉧 m� 頲 c竛h c鯽 b╪g lao ")
		AddNote("B筺 d飊g ch譨 kh鉧 m� 頲 c竛h c鯽 b╪g lao ")
	elseif (UTask_kl == 50*256+128) then
--		SetPos()
		Msg2Player("B筺 甶 v祇 trong b╪g lao ")
	else
		Msg2Player("C鯽 nh� lao 產ng b� kh鉧 ")
	end
end;
