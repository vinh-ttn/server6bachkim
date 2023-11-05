--使用技能大白驹丸脚本
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>Чi B筩h C﹗ Ho祅 k� n╪g. S� d鬾g s� nh薾 頲 <color=red>8 gi�<color> 駓 th竎. Hi謚 qu� s� d鬾g g蓀 ri so v韎 B筩h C﹗ Ho祅 k� n╪g thng.",
		"<#> S� d鬾g Чi B筩h C﹗ ho祅 (k� n╪g) /use",
		"<#> в ta suy ngh� l筰!/cancel",
		"<#> Tra xem th阨 gian treo m竬 c遪 l筰 c馻 ta/get_left_time",
		"<#> Ch鋘 k� n╪g r阨 m筺g v蒼 treo m竬/#selectofflineskill('cancel')",
		"<#> Gi韎 thi謚 chi ti誸 v� c竎h ch琲 treo m竬/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--选择使用技能大白驹丸
function use()
	local sparetime = GetTask(AEXP_SKILL_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	if ((sparetime + AEXP_SKILLCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("Th阨 gian r阨 m筺g v蒼 treo m竬 c遪 l筰 c馻 b筺 l� <color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color>ph髏, th鑞g k� th阨 gian r阨 m筺g v蒼 treo m竬 c馻 b筺 kh玭g 頲 vt qu� <color=red>10000gi�<color>, m閠 th阨 gian sau m阨 b筺 s� d鬾g l筰 Чi B筩h C﹗ ho祅 (k� n╪g) .", 0);
    else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_SKILLCHANGE;
			SetTask(AEXP_SKILL_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("Th祅h c玭g s� d鬾g, th阨 gian r阨 m筺g v蒼 treo m竬 c馻 b筺 l� <color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color> ph髏",0);
			writeUseBaiJulog("skillofflineitem_normal", hours, minutes);
		else
			Say("Kh玭g c� Чi B筩h C﹗ ho祅 (k� n╪g) c� th� s� d鬾g", 0);	
		end
	end
end

--选择再考虑考虑
function cancel()
	return 0
end