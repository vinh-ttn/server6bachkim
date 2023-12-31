--中秋2007活动 绿豆月饼
--by 小浪多多
--2007-09-07

--给予界面
TSK_TEMP = 51					--类别临时变量
function makeItemUI()
	--如果经验达到上限
	GiveItemUI("Giao tranh", "C竎h gh衟: x誴 theo ng v� tr�, d飊g � u ti猲 b猲 tr竔 l祄 chu萵  gh衟 tranh.", "pic_award", "oncancel");
end;

tab_boxcheck = 
{	
	{1207, 1208, 1209, 1210, 1211, 1212},
	{1213, 1214, 1215, 1216, 1217, 1218}
}
--判断是否给奖励
function pic_award(nCount)
	local bCorrectItem = 0
	local idxItem = 0

	if (nCount ~= 6) then
		Describe("Vi猲 ngo筰: B鴆 tranh g錷 c� 6 m秐h tranh, ngi giao ch璦  s�.", 1, "V藋 ta xin c竜 t�./oncancel");
		return
	end
	
	bFull = 1;
	idxItem = GetGiveItemUnit(1);
	local g, d, p = GetItemProp(idxItem);
	local nIndex = 0;
	local nsign = GetTaskTemp(TSK_TEMP)
	local nitem = 0
	if nsign == 1 then 
		if (p <= 1212 and p >= 1207 and d == 1 and g == 6) then
			nIndex = 1;
			nitem = 128;
		end
	elseif nsign == 2 then
		if(p <= 1218 and p >= 1213 and d == 1 and g == 6) then
			nIndex = 2;
			nitem = 127;
		end
	end
	if (0 == nIndex) then
		Describe("Vi猲 ngo筰: Nh鱪g m秐h tranh n祔 kh玭g th� gh衟 th祅h 1 b鴆 tranh ho祅 ch豱h, h穣 t譵 ng c竎 m秐h gh衟 r錳 h穣 n t譵 ta.", 1, "V藋 ta xin c竜 t�./oncancel");
		return
	end

	tab_items = {};
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxItem)
		if (d ~= 1 or g ~= 6) then
			bFull = 0;
			break
		end
		tab_items[i] = p;
	end
	
	tab_items = au06_sort(tab_items); -- 升序排序
	
	for i = 1, getn(tab_items) do
		if (tab_items[i] ~= tab_boxcheck[nIndex][i]) then
			bFull = 0;
			break;
		end;
	end;
	
	if (0 == bFull) then
		Describe("Vi猲 ngo筰: Nh鱪g m秐h tranh n祔 kh玭g th� gh衟 th祅h 1 b鴆 tranh ho祅 ch豱h, h穣 t譵 ng c竎 m秐h gh衟 r錳 h穣 n t譵 ta.", 1, "V藋 ta xin c竜 t�./oncancel");
		return
	end
	
	--删除画
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--给奖励
	local nidx = AddItem(6,1,nitem,1,0,0)
	Msg2Player(format("B筺 nh薾 頲 1 <color=yellow>%s<color>",GetItemName(nidx)));
	WriteLog(format("[zhongqiu2007_qiannenyuebing]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	SetTaskTemp(9,0)
	SetTaskTemp(10,0)
end;

function au06_sort(table)
	if (not table or type(table) ~= "table") then
		return {};
	end;
	
	local nCount = getn(table);
	for i = 2, nCount do	--采用一个冒泡排序
		for j = nCount, i, -1 do
			if (table[j] < table[j - 1]) then	--采用降升序排序
				temptab = table[j];
				table[j] = table[j - 1];
				table[j - 1] = temptab;
			end;
		end;
	end;
	
	return table;
end

