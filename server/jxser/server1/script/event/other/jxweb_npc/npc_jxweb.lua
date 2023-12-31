-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - JxWeb沟通使者
-- 文件名　：npc_jxweb.lua
-- 创建者　：子非魚
-- 创建时间：2009-04-13 15:24:37

-- ======================================================
IncludeLib("ITEM");
Include("\\script\\event\\other\\jxweb_npc\\jxweb_head.lua");		-- 头文件

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local tb_Msg = {};
	
	if (n_date >= JxWeb_Start_Date and n_date <= JxWeb_End_Date) then
		tb_Msg = {"<dec><npc>".."Hi謓 產ng trong th阨 gian di詎 ra ho箃 ng Open Beta c馻 JX WebC竎 v� i hi謕 nhanh ch﹏ tham gia v祇 th� gi韎 c馻 JX Web  nh薾 l蕐 nhi襲 ph莕 thng h蕄 d蒼."};
		tinsert(tb_Msg, "Ho箃 ng H� tr� t﹏ th�/jxweb_take_bag_1");
		tinsert(tb_Msg, "Ho箃 ng a TOP ph錸 vinh/jxweb_other_dec");
	else
		jxweb_other_dec()
		return 0;
	end
	
	tinsert(tb_Msg, "K誸 th骳 i tho筰/OnCancel");
	
	CreateTaskSay(tb_Msg);
end

function OnCancel()
end


function jxweb_take_bag_1()
	CreateTaskSay({"<dec><npc>".."Ho箃 ng {{H� tr� t﹏ th駗}:di詎 ra t� ng祔 01-05-2009 n 24:00 22-05-2009. Trong th阨 gian ho箃 ng, ng祔 h玬 trc ho祅 th祅h 1 nhi謒 v� thu th藀 th� b総 u 10h-24h ng祔 h玬 sau i hi謕 s� c� th� nh薾 頲 {{Li猲 T﹎ n}}.", 
					format("Nh薾 %s/jxweb_take_bag_2", "Li猲 T﹎ Кn"), 
					"K誸 th骳 i tho筰/OnCancel"});
end

function jxweb_take_bag_2()
	local ext_pointid = 5;
	local ext_value = GetExtPoint(ext_pointid);
	
	if (ext_value ~= 1) then
		CreateTaskSay({"<dec><npc>C竎 h� ch璦 th� nh薾 thng l莕 n祔.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end
	
	if (CalcFreeItemCellCount() < 2) then
		Talk(1, "", "H祅h trang ph秈 c� hai � tr鑞g.");
		return
	end
	
	PayExtPoint(ext_pointid, 1);
	
	local nIdx = AddItem(6,1,2023,1,1,0);
	ITEM_SetExpiredTime(nIdx, JxWeb_Item_Expire_Date);
	SyncItem(nIdx);
	SetItemBindState(nIdx, -2);
	
	local szMsg = format("Thu 頲 1 %s",GetItemName(nIdx))
	
	Msg2Player(szMsg);
	CreateTaskSay({"<dec><npc>"..szMsg, " t� huynh ".."/OnCancel"});
	
	WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
			GetLocalDate("%Y-%m-%d_%X"),
			GetName(),
			GetAccount(),
			szMsg	));
end


function jxweb_other_dec()
	CreateTaskSay({"<dec><npc>".."Ho箃 ng {{a Top 甶觤 ph錸 vinh}}:di詎 ra t� ng祔 01-05-2009 n 24:00 22-05-2009. 10 ngi c� 甶觤 ph錸 vinh cao nh蕋 s� c� th� nh薾 頲 ph莕 thng h蕄 d蒼.", 
					"K誸 th骳 i tho筰/OnCancel"});
end
