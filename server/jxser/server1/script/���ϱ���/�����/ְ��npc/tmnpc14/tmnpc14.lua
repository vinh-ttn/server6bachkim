--description: 唐门江津村唐元舅舅 50级任务 
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2)
	if (UTask_tm == 50*256+40) then
		Talk(1,"","�.Kh芻卥h芻�.a ch竨 n祔 th藅 hi誹 th秓, ta v鮝 l﹎ b謓h,  l藀 t鴆 t韎 th╩!")
	else
		Talk(1,"","Ta kh玭g c� con c竔, ch� c� 1 a ch竨 ngo筰 產ng h鋍 v� t筰 Л阯g M玭 ")
	end
end;
