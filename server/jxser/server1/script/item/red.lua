-- 洗属性点用的猩红宝石，可以洗五个属性点
-- By Asmik(2004-02-26)

function main()
	Say("L鵤 ch鋘 lo筰 甶觤 mu鑞 t葃:",5,"S鴆 m筺h/tune_str","Th﹏ ph竝/tune_dex","Vi謈 n祔. ta c遪 ph秈 v� suy ngh� l筰 /tune_vit","N閕 c玭g/tune_eng","V蒼 ch璦 ngh� ra /no")
end


function tune_str()
	base_str = {35,20,25,30,20}			-- 五行人物的天生力量，洗潜能时不允许低于此值
	i = GetSeries() + 1
	if (GetStrg(1) < base_str[i] + 5) then		-- 洗完后力量会低于天生力量，不允许洗
		Say("S鴆 m筺h c馻 b筺  t m鴆 t鑙 產!",1,"ta 產ng suy ngh� /no")
	else											-- 开始洗潜能，完成后自动踢下线
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddStrg(-5)
--		AddProp(5)				-- AddStrg()函数已经加了未分配潜能
	end
end

function tune_dex()
	base_dex = {25,35,25,20,15}
	i = GetSeries() + 1
	if (GetDex(1) < base_dex[i] + 5) then		-- 洗完后身法会低于天生身法，不允许洗
		Say("S鴆 m筺h c馻 b筺  t m鴆 t鑙 產!",1,"ta 產ng suy ngh� /no")
	else											-- 开始洗潜能，完成后自动踢下线
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddDex(-5)
--		AddProp(5)				-- AddStrg()函数已经加了未分配潜能
	end
end

function tune_vit()
	base_vit = {25,20,25,30,25}
	i = GetSeries() + 1
	if (GetVit(1) < base_vit[i] + 5) then		-- 洗完后外功会低于天生，不允许洗
		Say("S鴆 m筺h c馻 b筺  t m鴆 t鑙 產!",1,"ta 產ng suy ngh� /no")
	else											-- 开始洗潜能，完成后自动踢下线
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddVit(-5)
--		AddProp(5)				-- AddStrg()函数已经加了未分配潜能
	end
end

function tune_eng()
	base_eng = {15,25,25,20,40}
	i = GetSeries() + 1
	if (GetEng(1) < base_eng[i] + 5) then		-- 洗完后内功会低于天生，不允许洗
		Say("S鴆 m筺h c馻 b筺  t m鴆 t鑙 產!",1,"ta 產ng suy ngh� /no")
	else											-- 开始洗潜能，完成后自动踢下线
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddEng(-5)
--		AddProp(5)				-- AddStrg()函数已经加了未分配潜能
	end
end

function no()
	AddItem(6, 1, 21, 1, 0, 0, 0)
end