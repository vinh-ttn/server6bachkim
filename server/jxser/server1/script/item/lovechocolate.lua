function main()
	local eatexp = GetTask(1563)
	local randomexp = {500000, 1000000, 1500000}
	if(eatexp > 100000000)  then   --使用经验大于20,000,000，不能再吃
		Msg2Player("B筺  ╪ qu� nhi襲 S玞玪a, coi ch鮪g b� s﹗ r╪g !")
		return 1
	else			
		local i = random(1, 3)
		AddOwnExp(randomexp[i]) 
		SetTask(1563,eatexp+randomexp[i])
		if(GetTask(1563) >= 100000000) then
		Msg2Player("B筺  ╪ qu� nhi襲 S玞玪a, coi ch鮪g b� s﹗ r╪g !")
		end
		return 0	
	end
end