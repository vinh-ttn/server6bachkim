-- 120级技能任务，120级技能书

Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\item\\skillbook.lua")

function main(idxItem)
	
	if GetLastFactionNumber()==-1 then	
		Msg2Player("<color=yellow>Ch璦 gia nh藀 m玭 ph竔, kh玭g th� h鋍 k� n╪g n祔!<color>");
		return 1;
	end;
	
	if GetLevel()<120 then
		Msg2Player("<color=yellow>Ъng c蕄 ch璦  120, kh玭g th� h鋍 k� n╪g n祔!<color>");
		return 1;
	end;
	
	if GetTask(LV120_SKILL_ID)>0 then
		Msg2Player("<color=yellow>Х l躰h h閕 頲 k� n╪g 120 r錳, c遪 mu鑞 h鋍 th猰 n鱝 sao?<color>");
		return 1;
	end;
	
	if (LearnSkillByBook(GetLastFactionNumber(), LV120SKILL_LIST) == 0) then
		SetTask(LV120_SKILL_ID, LV120SKILL_LIST[GetLastFactionNumber()][1])
		WriteLog("[Ghi l筰 vi謈 h鋍 k� n╪g c蕄 120]"..date(" [%y n╩ %m th竛g %d ng祔  %H gi� %M ph髏]").." [m藅 m�:"..GetAccount().."] [nh﹏ v藅:"..GetName().."] S� d鬾g s竎h k� n╪g c蕄 120, h鋍 頲 k� n╪g:"..GetLastFactionNumber());
		return 0
	end
	return 1
end
