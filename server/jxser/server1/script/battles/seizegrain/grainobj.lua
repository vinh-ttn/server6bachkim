-- 粮食包
IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function main()
	local npcidx = GetLastDiagNpc();
	
	-- 该旗同时被另一个人拿走了，则不再操作
	if (GetNpcParam(npcidx, 4) == 0 ) then
		return
	end;
	
	-- 不是在进行中
	if (GetMissionV(MS_STATE) ~= 2) then
		delnpcsafe(npcidx);
		print("flagobj Event error, because Mission no Start, yet");
		return 
	end
	
	-- 玩家已经在运粮时，不能拿七另一袋
	if (BT_GetData(PL_PARAM3) ~= 0) then
		Msg2Player("B筺 產ng v薾 chuy觧 m閠 bao lng, kh玭g th� mang th猰 bao lng kh竎?");
		return
	end
	
	-- 无论哪方遗留的粮食包，都可以运送——当然是运回本方大营
	BT_SetData(PL_PARAM3, 1);
	
	Msg2Player("B筺 產ng v竎 m閠 bao lng, h穣 mau ch鉵g v薾 chuy觧 n b秐 doanh phe m譶h.");
	if (GetCurCamp() == 1) then
		ChangeOwnFeature(0,0,1341);	-- 改变玩家形象为运粮包的样子
	else
		ChangeOwnFeature(0,0,1342);	-- 改变玩家形象为运粮包的样子
	end
	
	local W,X1,Y1 = GetWorldPos();
	if (GetCurCamp() == 1) then
		Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe T鑞g<color=yellow>%s<color=0x00FFFF> t筰 <color=yellow>%d, %d<color=0x00FFFF> 畂箃 頲 Bao lng, 產ng quay v� <color=yellow>B秐 doanh",
										GetName(),X1,Y1))
		AddSkillState(460, 1, 0, 1000000 ) --颜色光环，分辩敌我
	else
		Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim<color=yellow>%s<color=0x9BFF9B> t筰 <color=yellow>%d, %d<color=0x9BFF9B> 畂箃 頲 Bao lng, 產ng quay v� <color=yellow>B秐 doanh",
										GetName(),X1,Y1))
		AddSkillState(461, 1, 0, 1000000 ) --颜色光环，分辩敌我
	end
		
	AddSkillState(656,30,0,100000) --降玩家的速度
	
	SetNpcParam(npcidx,4,0)
	delnpcsafe(npcidx);
end;
