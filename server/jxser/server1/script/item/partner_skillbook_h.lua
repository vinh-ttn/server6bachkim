--partner_skillbook.lua (技能书脚本)
--create by luobaohang @20050802
--last edit by luobaohang @20050816

IncludeLib("FILESYS");
IncludeLib("PARTNER");

Include("\\script\\lib\\string.lua");

TabFile_Load("\\settings\\partner\\skill_requirement.txt", "skill_require")
--randomseed(GetCurrentTime())

function SkillBookScript(iItem, nType)
	local partner_index = PARTNER_GetCurPartner()
	if (partner_index == nil or partner_index <= 0) then
		Msg2Player("<#> B筺 ch璦 ch鋘 ng h祅h!")
		return 1 
	end
	local id1,id2,id3,item_level = GetItemProp(iItem)
	local index = TabFile_Search("skill_require", 1, tostring(id3))
	local base_level = tonumber(TabFile_GetCell("skill_require", index, 2))
	local level_increment = tonumber(TabFile_GetCell("skill_require", index, 3))
	local series_limit = tonumber(TabFile_GetCell("skill_require", index, 4))
	local skill_id = tonumber(TabFile_GetCell("skill_require", index, 5))
		--判断五行属性
	if (series_limit ~= -1) then
		--Msg2Player(series_limit); 调试
		--Msg2Player(PARTNER_GetSeries(partner_index));
		if (series_limit ~= PARTNER_GetSeries(partner_index)) then
			Msg2Player("<#> уng h祅h c馻 b筺 ng� h祅h kh玭g h頿 v韎 s竎h n祔, ch璦 th� t譵 hi觰 b� quy誸 b猲 trong");
			return 1
		end
	end
		--判断同伴需求等级
	local level_require = base_level + (item_level - 1) * level_increment;
	local partner_level = PARTNER_GetLevel(partner_index);
	if (level_require > partner_level) then
		Msg2Player("<#> уng h祅h c馻 b筺 ng c蕄 kh玭g h頿 v韎 s竎h n祔, ch璦 th� t譵 hi觰 b� quy誸 b猲 trong");
		return 1
	end
		--判断是否高于同伴当前技能等级
	local skill_level, skill_exp = PARTNER_GetSkillInfo(partner_index, skill_id);
	if (skill_level >= item_level) then
		Msg2Player("<#> уng h祅h c馻 b筺 s韒  bi誸 頲 k� n╪g n祔, c秏 th蕐 kh玭g c遪 g� d� h鋍 n鱝.");
		return 1
	elseif (skill_level ~= item_level-1) then --不能跳级
		Msg2Player("<#> уng h祅h c馻 b筺 k� n╪g c╪ b秐 c遪 k衜, ng n猲 v閕 qu�!");
		return 1
	elseif (skill_level == 0) then	--当前技能未学习过
		if (nType == 2) then
			--判断是否有技能空位
			local skill_can_learn = {1, 2, 3, 5, 7, 9, 11, 13, 15, 16} --可学习技能数等级需求
			local skills_learn = PARTNER_GetAllSkill(partner_index, 2);
			local nIndexTmp = floor(partner_level/10) + 1;
			if (nIndexTmp < 0) then 
				nIndexTmp = 0;
			elseif (nIndexTmp > 10) then 
				nIndexTmp = 10;
			end
			local nSkillsLearn;
			if (skills_learn == nil) then
				nSkillsLearn = 0;
			else
				nSkillsLearn = getn(skills_learn);
			end
			if (nSkillsLearn >= skill_can_learn[nIndexTmp]) then
				Msg2Player("<#> Ъng c蕄 ng h祅h hi謓 t筰 c馻 b筺 kh玭g th� h鋍 th猰 k� n╪g ph� tr� m韎, mu鑞 h鋍 k� n╪g ph� tr� ng c蕄 ph秈 cao h琻.");
				return 1
			end
		elseif (nType == 3)	then
			local skills_learn = PARTNER_GetAllSkill(partner_index, 3);
			if (skills_learn ~= nil and getn(skills_learn) > 0) then--已学过绝技
			 	Msg2Player("<#> уng h祅h c馻 b筺  n緈 b総 頲 m閠 tuy謙 k�, kh玭g th� h鋍 th猰 n鱝");
			 	return 1
			 end
		else	--不是附加技能或绝技不能学习
			Msg2Player("<#> уng h祅h c馻 b筺 tham kh秓 m藅 t辌h  n鯽 ng祔, ch璦 th� t譵 ra b� quy誸 b猲 trong");
		end
	end
	if (nType == 0) then
		local nTaskValue = PARTNER_GetTaskValue(partner_index, 11)
		if (nTaskValue >= 20) then
			Msg2Player("<#> уng h祅h c馻 b筺 kh玭g th� h鋍 k� n╪g n祔 n鱝!")
			return 1
		end
		PARTNER_SetTaskValue(partner_index, 11, nTaskValue + 1)
	end
	--学习技能书
	--local skills_add = random(skill_level + 1, item_level)
	PARTNER_AddSkill(partner_index, nType, skill_id, item_level)
	Msg2Player("<#> уng h祅h c馻 b筺  l穘h ng� 頲 k� n╪g c蕄 "..tostring(item_level).." "..GetSkillName(skill_id))
	return 0
end

function GetDesc(iItem)
	local id1,id2,id3,item_level = GetItemProp(iItem)
	local index = TabFile_Search("skill_require", 1, tostring(id3))
	local base_level = tonumber(TabFile_GetCell("skill_require", index, 2))
	local level_increment = tonumber(TabFile_GetCell("skill_require", index, 3))
	local series_limit = tonumber(TabFile_GetCell("skill_require", index, 4))
	local skill_id = tonumber(TabFile_GetCell("skill_require", index, 5))
	--同伴需求等级
	local skill_name = GetSkillName(skill_id);
	local level_require = base_level + (item_level - 1) * level_increment
	local level_skillrequire = item_level - 1;
	local strDesc = format("<color=yellow> quy觧 th� %d", item_level)
	strDesc = strDesc.."\n Ъng c蕄 ng h祅h c莕:"..level_require;
	if (series_limit >= 0) then
		strDesc = strDesc.."\n Ng� h祅h ng h祅h c莕:"..toSeries(series_limit);
	end
	if(level_skillrequire > 0) then
		strDesc= strDesc.."\n C莕<"..skill_name..">"..level_skillrequire.."c蕄";
	end
	return strDesc;
end