--中秋节2007 月饼礼盒
--by 小浪多多
--2007-09-07

Include("\\script\\event\\zhongqiu2007\\head.lua")

function mainzhongqiu2007_entry()
	Describe("L� Quan: V﹏ Du v� Ti猲 V� l� hai b鴆 danh h鋋 v鑞 頲 c蕋 gi� t筰 ho祅g cung, do chi課 tranh li猲 mi猲 n猲 b� v� th祅h nhi襲 m秐h v� th蕋 l筩 kh緋 n琲. Nghe n鉯 <color=yellow>Hoa vi猲 ngo筰 t筰 L﹎ An (169/194)<color> v� <color=yellow>Qu竎h vi猲 ngo筰 th祅h Tng Dng (198/208) <color>產ng c蕋 c玭g t譵 ki誱 2 b鴆 tranh n祔, ai c� th� gi髉 h� t譵 頲 hai b鴆 tranh n祔 s� nh薾 頲 ph莕 thng x鴑g ng. Trung Thu s緋 n r錳, trong ho祅g cung c騨g c莕 l祄 nhi襲 b竛h Trung Thu. T� <color=red>22-09-2007<color> n <color=red>24h00 ng祔 31-10-2007<color>, m鏸 h閜 b竛h u c� x竎 su蕋 nh薾 頲 <color=red>m秐h tranh V﹏ Du<color> ho芻 <color=red>m秐h tranh Ti猲 V�<color>, i hi謕 mu鑞 i g�?",2,"Зy l� h閜 b竛h Trung Thu, xin h穣 nh薾 l蕐./zhongqiu2007_getlihe","Ta s� quay l筰 sau!/NoChoice")
end

function zhongqiu2007_getlihe()
	if check_level() == 0 then
		Say(tb_content["szlevel"],0)
		return 1
	end
	if check_pay() == 0 then
		Say(tb_content["szpay"],0)
		return 1
	end
	if CalcEquiproomItemCount(6,1,1514,-1) < 1 then
		Say("L� Quan: Чi hi謕 kh玭g mang theo h閜 b竛h Trung Thu, c� ph秈   qu猲 trong rng r錳 kh玭g?",0)
		return 1
	end
	if CalcFreeItemCellCount() < 4 then
		Say("L� Quan: H祅h trang kh玭g  ch� tr鑞g, h穣 s緋 x誴 l筰 h祅h trang.",0)
		return 1
	end

	local ncurexp = GetTask(TSK_ZHONGQIU2007_LIHE)
	local nexp = 8000000
	if ncurexp >= NZHONGQIU2007_MAX then
		Msg2Player("觤 kinh nghi謒 nh薾 頲  vt gi韎 h筺.")
		return 1
	else
		if(ncurexp + nexp) >= NZHONGQIU2007_LIHE_MAX then
			nexp = NZHONGQIU2007_LIHE_MAX - ncurexp
		end
		SetTask(TSK_ZHONGQIU2007_LIHE,(ncurexp+nexp))
		AddOwnExp(nexp)
		Msg2Player(format("Nh薾 頲 <color=yellow>%s<color> 甶觤 kinh nghi謒",nexp))
		WriteLog(format("[zhongqiu2007_lihe]\t Date:%s\t Account:%s\t Name:%s\t GetExp:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nexp));
	end
	ConsumeEquiproomItem(1,6,1,1514,-1)
	local nrate = random(1,tb_Mareial_LIHE[1]);
	local nsum = 0
	for nkey,nitem in tb_Mareial_LIHE[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial_LIHE[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local nidx = AddItem(g,d,p,1,0,0)
				Msg2Player(format("B筺 nh薾 頲 1 <color=yellow>%s<color>",GetItemName(nidx)))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
				return 0
			end
	end
end
