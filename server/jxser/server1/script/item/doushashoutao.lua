--剑网三周年活动
--豆沙寿桃
--使用后获得300w经验
--最多可获得1亿
--限 80级及以上 并 冲值玩家使用

Include("\\script\\event\\jxanniversary3\\head.lua");

function main(nItemIndex)
	str=
	{	"<#> m閠 tr竔 o v筺 th�, c� th� nh薾 頲 <color=red>"..tostring(JXANNIVERSARY3_ONCEEXP).."<color> 甶觤 kinh nghi謒, 甶觤 kinh nghi謒 t鑙 產 t 頲 l� <color=red>"..tostring(JXANNIVERSARY3_MAXOWNEXP).."<color>.",
		"<#>S� d鬾g Уo v筺 th�/#_UseDoushaShoutao("..nItemIndex..")",
		"<#> в ta suy ngh� l筰!/OnCancel",
	};
	Say(str[1], 2, str[2], str[3]);
	return 1;
end

function _UseDoushaShoutao(nItemIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 
	end;
	
	if (GetTask(TASKID_DOUSHASHOUTAO_EXP) >= JXANNIVERSARY3_MAXOWNEXP) then 
		Msg2Player("B筺  ╪ qu� nhi襲 Уo v筺 th�, kh玭g th� ti誴 t鬰 ╪  t╪g kinh nghi謒.");
		return
	end 
	
	if (RemoveItemByIndex(nItemIndex) == 1 ) then
		local nAddExp = 0;
		if ( (GetTask(TASKID_DOUSHASHOUTAO_EXP) + JXANNIVERSARY3_ONCEEXP) > JXANNIVERSARY3_MAXOWNEXP) then
			nAddExp = JXANNIVERSARY3_MAXOWNEXP - GetTask(TASKID_DOUSHASHOUTAO_EXP);
		else
			nAddExp = JXANNIVERSARY3_ONCEEXP;
		end
		
		--增加经验
		SetTask(TASKID_DOUSHASHOUTAO_EXP, GetTask(TASKID_DOUSHASHOUTAO_EXP) + nAddExp);
		AddOwnExp(nAddExp);
		Msg2Player(" m閠 tr竔 o v筺 th�, nh薾 頲 "..JXANNIVERSARY3_ONCEEXP.."kinh nghi謒 ");
	else
		Msg2Player("Kh玭g c� Уo v筺 th� n祇!");
	end
end

function OnCancel()
	return 0;
end

