--description: 武当派40级任务 伏牛山鸡冠洞五只白玉虎5　武当40级任务
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	if (GetTask(5) == 40*256+20) then
		UTask_wd40tmp = SetBit(GetTaskTemp(16),5,1)
		if (UTask_wd40tmp == 31) then
			SetTask(5,40*256+40)
			AddNote("Thu ph鬰 頲 n╩ con  B筩h Ng鋍 H� c馻 Nhu薾 Nng. ")
			Msg2Player("Thu ph鬰 頲 n╩ con  B筩h Ng鋍 H� c馻 Nhu薾 Nng. ")
		else
			SetTaskTemp(16, UTask_wd40tmp)
		end
	end
end;
