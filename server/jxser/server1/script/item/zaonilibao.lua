--剑网三周年活动
--枣泥寿桃
--使用后获得8小时打怪经验双倍，不可与仙草露叠加
--限 80级及以上 并 冲值玩家使用

Include("\\script\\event\\jxanniversary3\\head.lua");

function main(nItemIndex)
	str=
	{	"<#>S� d鬾g Уo v筺 th�, nh薾 頲 <color=red>8<color> gi� nh﹏ i kinh nghi謒, nh璶g kh玭g th� c飊g s� d鬾g v韎 Ti猲 Th秓 L�.",
		"<#>S� d鬾g Уo v筺 th�/#_UseZaoNiShoutao("..nItemIndex..")",
		"<#> в ta suy ngh� l筰!/OnCancel",
	};
	Say(str[1], 2, str[2], str[3]);
	return 1;
end

function _UseZaoNiShoutao(nItemIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 
	end;
	
	if RemoveItemByIndex(nItemIndex) == 1 then
		AddSkillState(440, 1, 1, 64800 * 8);
		Msg2Player("S� d鬾g Уo v筺 th�, c� th� nh﹏ i kinh nghi謒 trong 8 gi�.")
	end;
end;

function OnCancel()
end;