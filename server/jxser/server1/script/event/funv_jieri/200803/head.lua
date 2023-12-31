--制作物品lib
--by 小浪多多
--2007-09-06

tbclassname = {}
tbclassname.DA_START = 0803080000	--开始时间
tbclassname.DA_END 	= 0803162400	--结束时间
tbclassname.LIMIT_LEVEL = 50		--等级限制

tbclassname.tb_content =
{
	sztalk1 = "L� quan: Qu鑓 t� ph� n� �? Ho箃 ng  k誸 th骳 r錳.",
	sztalk2 = "<dec>L� quan: Ng祔 qu鑓 t� ph� n� 08/03  n r錳, ch骳 t蕋 c� ph� n� trong thi猲 h� s鴆 kh醗 vui v� tr祅 y h筺h ph骳, ho箃 ng l莕 n祔 g錷 c�:\n    <color=yellow>1.G鉯 hoa<color>\n        <color=red>(Th阨 gian ho箃 ng: t� 08-03-2008 n 24:00 ng祔 16-03-2008)<color>\n    <color=yellow>2.T苙g hoa<color>\n        <color=red>(Th阨 gian ho箃 ng: t� 08-03-2008 n 24:00 ng祔 31-03-2008)<color>\n    <color=yellow>3. Nhi謒 v� B綾 u L穙 Nh﹏.<color>\n        <color=red>(Th阨 gian ho箃 ng: t� 08-03-2008 n 24:00 ng祔 16-03-2008)<color> \nTa y r蕋 vui gi髉 c竎 v� g鉯 hoa.",
	nselectsum = 2,
	szselect1 = "Ta mu鑞 g鉯 th祅h b� hoa h錸g./#tbclassname:getmakeitemsign(1)",
	szselect2 = "Ta mu鑞 g鉯 th祅h b� hoa c骳./#tbclassname:getmakeitemsign(2)",
	--szselect3 = "我想做一个普通粽子/#tbclassname:getmakeitemsign(3)",
	--szselect4 = "我想做一个烤猪月饼/#tbclassname:getmakeitemsign(4)",
	--szselect5 = "我想做一个月饼礼盒/#tbclassname:getmakeitemsign(5)",
	szno = "Nh﹏ ti謓 gh� qua th玦/NoChoice",
	szmakeItemUI = " ng! Xin s� ph� tr� t礽!/#tbclassname:makeItemUI(%d)",
	szlevel = "Th藅 ng ti誧, ng c蕄 kh玭g  50, kh玭g th� tham gia ho箃 ng n祔.",
	szmoney = "Th藅 ng ti誧, ng﹏ lng mang theo kh玭g .",
	szpay = "Xin l鏸, b筺 v蒼 ch璦 n筽 th�, kh玭g th� g鉯 hoa.",
	szremake = "Tr� l筰/main",
	szitemfree="Kh玭g  ch� tr鑞g, h穣 s緋 x誴 l筰 h祅h trang.",
}

--制作需要材料
tbclassname.tb_Mareial =
{
	select1 = {
		{G=6,D=1,P=1681,szname="B� hoa h錸g",num=1,nMoney=100000},
		{G=6,D=1,P=1679,szname="C祅h hoa h錸g",num=10},
		},
	select2 = {
		{G=6,D=1,P=1682,szname="B� hoa c骳",num=1,nMoney=50000},
		{G=6,D=1,P=1680,szname="C祅h hoa c骳",num=10},
		},
}

function tbclassname:funmsg(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		local szmsg = format("Ch骳 m鮪g b筺  nh薾 頲 %d <color=yellow>%s<color>.",
							 tbtemp[1].num,
							 tbtemp[1].szname)
		return szmsg
end

function tbclassname:funtalkmake(nsign)
	local sztalkmake = tbclassname:funtalkmareial(nsign)
	sztalkmake = format("%s, b筺 mu鑞 l祄 kh玭g?",sztalkmake)
	return sztalkmake
end

function tbclassname:funtalkmlimit(nsign)
		local sztalkmake = tbclassname:funtalkmareial(nsign)
		sztalkmake = format("%s thi誹 kh玭g th� l祄. H譶h nh� nguy猲 li謚 l祄 b竛h ch璶g kh玭g .",sztalkmake)
		return sztalkmake
end

function tbclassname:funtalkmareial(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		for ni,nitem in tbtemp do
			if ni ==1 then
					sztalkmake = format("L� quan: Mu鑞 g鉯 %d<color=red>%s<color>, c莕 ",
							 	tbtemp[1].num,
							 	tbtemp[1].szname)
			else
				  sztalkmake = format("%s%d <color=red>%s<color>,",
						  	sztalkmake,
						  	tbtemp[ni].num,
						  	tbtemp[ni].szname)
			end
		end
		if tbtemp[1].nMoney > 0 then
					sztalkmake = format("%s<color=red>%d<color>,",
							sztalkmake,
							tbtemp[1].nMoney)
		end
		return sztalkmake
end

function tbclassname:check_event_date()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ( ( ndate > tbclassname.DA_START ) and ( ndate < tbclassname.DA_END ) ) then
		return 1
	end
	return 0
end

function tbclassname:check_level()		--判断等级
	if GetLevel() < tbclassname.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function tbclassname:check_money(nsign)		--判断钱
	szselect = tbclassname:getTaskItemName(nsign)
	if GetCash() < tbclassname.tb_Mareial[szselect][1].nMoney then
		return 0
	end
	return 1
end

function tbclassname:check_pay()		--判断充值用户
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function tbclassname:pack(...)
	return arg
end

function tbclassname:getTaskItemName(nsign)		--获得tb类别名
	return format("select%s",nsign)
end

function tbclassname:checkFreeCount(ncount) --判断身上剩余格数
	if CalcFreeItemCellCount() < ncount then
		return 0
	end
	return 1
end