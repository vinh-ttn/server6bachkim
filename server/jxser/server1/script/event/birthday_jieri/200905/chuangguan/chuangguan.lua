-- 越南资料片生日活动
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function guoguan_xunbao()
	Say("Nhi誴 Th� Tr莕: T� 19/06/2009 n 24:00 19/07/2009 i hi謕 c� th� ti誴 nh薾 nhi謒 v� 換u� quan t莔 b秓� t� ta.Sau khi nh薾 nhi謒 v�, khi i hi謕 tham gia 揤t 秈 cao c蕄� s� c� th� nh薾 頲 t輓 v藅 khai m玭 揌飊g T﹎ Ki誱�, 揌飊g T﹎ Ki誱� nh薾 頲 n祔  c� s� lng nhi襲 hay 輙 t飝 thu閏 v祇 vi謈 i hi謕 c� th� vt qua 頲 秈 15, 20, 25 hay 29.", 3,
		"Nh薾 nhi謒 v� 換u� quan t莔 b秓�/gettask_chuangguan",
		"Ta n tr� nhi謒 v� 換u� quan t莔 b秓�/fullfilltask_chuangguan",
		"Ta ch� n xem./OnCancel");
end

function gettask_chuangguan()
	if (GetLevel() < 90) then
		Say("Nhi誴 Th� Tr莕: Чi hi謕 ch璦  甶襲 ki謓  nh薾 nhi謒 v� n祔.", 0);
		return
	end
	
	if (GetTask(tbBirthday0905.tbTask.tsk_toll_cg_state) == 1) then
		Say("Nhi誴 Th� Tr莕: Чi hi謕  nh薾 nhi謒 v� n祔 r錳.", 0);
		return
	end
	
	Say("Nhi誴 Th� Tr莕: T鑤 qu�, ch骳 i hi謕 tham gia vt 秈 th祅h c玭g.", 0);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_state, 1);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, 0);
end

function fullfilltask_chuangguan()
	if (GetTask(tbBirthday0905.tbTask.tsk_toll_cg_state) == 0) then
		Say("Nhi誴 Th� Tr莕: Чi hi謕 v蒼 ch璦 nh薾 nhi謒 v� \"Qu� quan t莔 b秓\".", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		Say("Nhi誴 Th� Tr莕: в b秓 m s� an to祅 cho v藅 ph萴, xin m阨 h穣  h祅h trang th鮝 10 � tr鑞g.", 0);
		return
	end
	
	local nToll = GetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount);
	if (nToll < 15) then
		Say("Nhi誴 Th� Tr莕: Ngi kh玭g th� ho祅 th祅h nhi謒 v� n祔 �?", 0);
		return
	end
	
	local nAwardCount = 0;
	if (nToll >= 29) then
		nAwardCount = 5;
	elseif (nToll >= 25) then
		nAwardCount = 3;
	elseif (nToll >= 20) then
		nAwardCount = 2;
	else
		nAwardCount = 1;
	end
	Say("Nhi誴 Th� Tr莕: T鑤 l緈, y l� ph莕 thng x鴑g ng d祅h cho i hi謕!", 0);
	Msg2Player(format("Nh薾 頲 %d H飊g T﹎ Ki誱.", nAwardCount));
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_state, 0);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, 0);
	for i = 1, nAwardCount do
		AddItem(6, 1, 2070, 1, 0, 0);
	end
end

function OnCancel()

end