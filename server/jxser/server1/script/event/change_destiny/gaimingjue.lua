Include("\\script\\event\\change_destiny\\head.lua");

function main(nItemIndex)
	return tbChangeDestiny:onUse(nItemIndex);
end


function tbChangeDestiny:onUse(nItemIndex)
	
--	if self:isCarryOn() ~= 1 then
--		Say("逆天改命诀随风消散了。。。", 0 );
--		return 0;
--	end
	
	if self:canJoin() ~= 1 then
		Say("Ch� c� ngi ch琲 chuy觧 sinh l莕 1 c� c蕄 160 n 179 m韎 c� th� s� d鬾g!", 0 );
		return 1;
	end
	
	local nHasAward	= self:getTask(self.nTask_GaiMing_HasReceive);
	local nHasUsed	= self:getTask(self.nTask_GaiMing_HasUsed);
	
	if nHasAward ~= 1 then
		Say("V藅 n祔 lai l辌h kh玭g r� r祅g, t鑤 nh蕋 l� ngi ng n猲 s� d鬾g.", 0 );
		return 1;
	end
	
	if nHasUsed ~= 0 then
		Say("V藅 ph萴 n祔 ti襪 l鵦 r蕋 m筺h, d飊g nhi襲 s� kh玭g t鑤 cho s鴆 kh醗.", 0 );
		return 1;
	end
	
	local nOldSkill = GetSkillMaxLevelAddons();
	local nNewSkill = nOldSkill + self.nLimit_AddSkill;
	
	SetSkillMaxLevelAddons(nNewSkill);
	self:setTask(self.nTask_GaiMing_HasUsed, 1);
	
	local szMsg = format("[ChangeDestiny]Eat GaiMingJue: %s Use GaiMingJue and add skill from %d to %d.",GetName(), nOldSkill, nNewSkill);
	WriteLog(szMsg);
	
	Say(format("Чi hi謕  s� d鬾g ngh辌h thi猲 c秈 m謓h quy誸, 甶觤 k� n╪g 頲 t╪g th猰 t� %d n %d.", nOldSkill, nNewSkill), 0);
	return 0;
end

