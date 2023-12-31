-- ====================== 文件信息 ======================

-- 剑侠情缘网络版一追寻秘谱张先生NPC对话脚本

-- Edited by 子非魚
-- 2008/07/24 13:43

-- ======================================================

Include("\\script\\task\\system\\task_string.lua");				-- 对话处理头文件
Include("\\script\\event\\guoqing_jieri\\200808\\head.lua");	-- 活动相关信息文件
Include("\\script\\lib\\common.lua");							-- 
Include("\\script\\lib\\awardtemplet.lua")						-- 奖励共用函数集


function main()
	zxmp_reset_vertsk();
	
	-- 不在活动期间内
	if (zxmp_200808_checkdate() ~= 1) then
		CreateTaskSay({format("<dec><npc>Ch祇 %s!", GetName()), "K誸 th骳 i tho筰/OnCancel"});
		return 
	end
	
	local sz_msg = "";
	
	for i = 1, getn(TB_ZHUIXUNMIPU_COMPLIST) do
		if (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 1) then
			sz_msg = sz_msg.."<enter>"..TB_ZHUIXUNMIPU_COMPLIST[i].sz_name.." "..TB_ZHUIXUNMIPU_COMPLIST[i].n_count.."c竔";
		elseif (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 4) then
			sz_msg = sz_msg.."<enter>"..TB_ZHUIXUNMIPU_COMPLIST[i].sz_name.." "..TB_ZHUIXUNMIPU_COMPLIST[i].n_money.." lng";
		else
			print("ZXMP TB_ZHUIXUNMIPU_COMPLIST Invalid");
			return 0;
		end
	end
	
	CreateTaskSay({format("<dec><npc>H頿 th祅h Dng sinh b� ph� c莕 ph秈 chu萵 b�: <enter>%s<enter>, n誹 kh玭g  nguy猲 li謚 th� ta kh玭g th� gi髉 ngi.", sz_msg), 
					format("H頿 th祅h %s/zxmp_compound", "Dng sinh b� ph�"), 
					"K誸 th骳 i tho筰/OnCancel"});
end

function OnCancel()
end

-- CalcItemCount
-- ConsumeItem

function zxmp_compound()
	for i = 1, getn(TB_ZHUIXUNMIPU_COMPLIST) do
		
		if (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 1) then
			local ng, nd, np, nl =  unpack(TB_ZHUIXUNMIPU_COMPLIST[i].tb_itemid);
			local n_count, sz_name =	TB_ZHUIXUNMIPU_COMPLIST[i].n_count,
										TB_ZHUIXUNMIPU_COMPLIST[i].sz_name;
			
			local n_curcnt = CalcItemCount(3, ng, nd, np, nl);
			
			if (n_curcnt < n_count) then
				CreateTaskSay({format("<dec><npc>%s mang tr猲 ngi kh玭g  %d, h穣 ki觤 tra l筰.", sz_name, n_count), "K誸 th骳 i tho筰/OnCancel"});
				return
			end
			
		elseif (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 4) then
			local n_money = TB_ZHUIXUNMIPU_COMPLIST[i].n_money;
			local n_curmon = GetCash();
			
			if (n_curmon < n_money) then
				CreateTaskSay({format("<dec><npc>Ti襫 mang tr猲 ngi kh玭g , h穣 ki觤 tra l筰.", n_money), "K誸 th骳 i tho筰/OnCancel"});
				return
			end
		else
			print("ZXMP TB_ZHUIXUNMIPU_COMPLIST Invalid");
			return 0;
		end
	end
	
	local b_succeed = 0;
	
	for i = 1, getn(TB_ZHUIXUNMIPU_COMPLIST) do
		
		if (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 1) then
			local ng, nd, np, nl =  unpack(TB_ZHUIXUNMIPU_COMPLIST[i].tb_itemid);
			local n_count, sz_name =	TB_ZHUIXUNMIPU_COMPLIST[i].n_count,
										TB_ZHUIXUNMIPU_COMPLIST[i].sz_name;
			b_succeed = ConsumeItem(3, n_count, ng, nd, np, nl);
			
			if (b_succeed ~= 1) then
				return
			end
			
		elseif (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 4) then
			local n_money = TB_ZHUIXUNMIPU_COMPLIST[i].n_money;
			
			b_succeed = Pay(n_money);
			
			if (b_succeed ~= 1) then
				return
			end
		else
			print("ZXMP TB_ZHUIXUNMIPU_COMPLIST Invalid");
			return 0;
		end
	end
	
	local nItemIdx = AddItem(6, 1, 1791, 1, 1, 0);
	-- tbAwardTemplet:ITEM_SetExpiredTime(nItemIdx, 20080827);
	-- SyncItem(nItemIdx);
	Msg2Player(format("Nh薾 頲 %s", "Dng sinh b� ph�"));
end
