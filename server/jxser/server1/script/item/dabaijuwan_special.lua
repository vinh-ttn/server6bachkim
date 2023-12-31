--使用特效大白驹丸脚本
--2006.08.29
--80小时离线托管时间
--经验为原白驹的2倍

Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>M閠 vi猲 i b筩h c﹗ ho祅 c bi謙, sau khi s� d鬾g 頲 <color=red>8 ti課g<color> 駓 th竎 r阨 m筺g. Di c蕄 130 thu 頲 kinh nghi謒 g蕄 2 l莕 b筩h c﹗ ho祅 thng, c蕄 130 tr� l猲 thu 頲 kinh nghi謒 g蕄 4 l莕.",
		"<#>S� d鬾g B筩h C﹗ Ho祅 c bi謙/confirmlevel",
		"<#> в ta suy ngh� l筰!/cancel",
		"<#> Tra xem th阨 gian treo m竬 c遪 l筰 c馻 ta/get_left_time",
		"<#> Gi韎 thi謚 chi ti誸 v� c竎h ch琲 treo m竬/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--判断等级再次确认
function confirmlevel()
	str=
	{	"<#>Ъng c蕄 c馻 b筺 th蕄 h琻 <color=red>50<color>. V� th�, � tr筺g th竔 駓 th竎 tr猲 m筺g, b筺 c� th� ti課 h祅h b祔 b竛 giao d辌h v� nh薾 甶觤 ph骳 duy猲, nh璶g kh玭g th� nh薾 頲 <color=red>甶觤 kinh nghi謒<color>. B筺 th藅 s� mu鑞 s� d鬾g B筩h C﹗ Ho祅 c bi謙 kh玭g#�",
		"<#> S� d鬾g/use",
		"<#> в ta suy ngh� l筰!/cancel",
		"<#> V� b筺 kh玭g ph秈 l� kh竎h h祅g n筽 th�, n猲 kh玭g th� s� d鬾g ch鴆 n╪g r阨 m筺g. Vui l遪g n筽 th� r錳 s� d鬾g v藅 ph萴 n祔!"
	};

    -- 充卡用户才能使用大白驹丸
	if (IsCharged()~=1) then
	    Talk(1, "", str[4]);
	    return
	end

	nLevel = GetLevel();
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(str[1], 2,str[2],str[3]);	
	else
		use();
	end
end

--选择使用特效大白驹丸
function use()
	local sparetime = GetTask(AEXP_SPECIAL_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	--showtime = floor(sparetime / (FRAME2TIME * 60));		--给用户提示显示到分钟
	if ((sparetime + AEXP_SPECIALCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("Th阨 gian 駓 th竎 kinh nghi謒 r阨 m筺g c遪 l筰 l�: <color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color> ph髏. Th阨 gian 駓 th竎 kinh nghi謒 t輈h l騳 kh玭g 頲 vt qu� <color=red>10000 gi�<color>.", 0);
	else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		local g, d, p = GetItemProp(itemindex);
		
		if ( g ~= 6
			or d ~= 1
			or p ~= 1157) then
			return --不是特效大白驹
		end 
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_SPECIALCHANGE;
			SetTask(AEXP_SPECIAL_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("S� d鬾g th祅h c玭g! Th阨 gian 駓 th竎 r阨 mang B筩h C﹗ Ho祅 c bi謙 c遪 l筰 l�: <color=red>"..hours.."<color>gi�<color=red>"..minutes.."<color> ph髏",0);
			writeUseBaiJulog("offlineitem_special", hours, minutes);
		else
			Say("Kh玭g c� B筩h C﹗ Ho祅 c bi謙, c� th� s� d鬾g ", 0);	
		end
	end
end

--选择再考虑考虑
function cancel()
	return 0
end