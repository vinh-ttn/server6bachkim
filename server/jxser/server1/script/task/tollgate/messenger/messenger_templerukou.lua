-------------------------------------------------------------------------
-- FileName		:	messenger_templerukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   山神庙入口
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的赖
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"B総 u nhi謒 v� /temple_starttask", 
                "R阨 甶 khu v鵦 /temple_movecity", 
                "Sau n祔 tr� l筰 /no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 3, "Nhi謒 v� b秐  S琻 Th莕 Mi誹 /birthday0905_temple");
	end
	 Describe(DescLink_YiGuan..": Х m� m韎 t輓h to竛 x玭g quan th阨 gian, c� g緉g l猲 nha ! B﹜ gi� ngi ngh� l祄 c竔 g�?",getn(tbDialog), unpack(tbDialog))
end

function temple_starttask()
	if ( nt_getTask(1202) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:设置任务开始时间
		nt_setTask(1202,20)
		DisabledUseTownP(1)--禁用回城符				--1：禁用	--0：启用
		SetFightState(1);--打开战斗状态				--1：打开	--0：关闭
		SetLogoutRV(1);--断线和死亡不为一个重生点		--1：断线和死亡为一个重生点	--0：断线和死亡不为一个重生点
		SetPunish(0);--关闭死亡惩罚					--1：有死亡惩罚		--0：没有死亡惩罚
		SetCreateTeam(1);--允许组队				--1：允许组队		--0：不允许组队
		ForbidChangePK(1);   --不能更改pk状态		--1：不能更改pk状态		--0:可以更改pk状态
		SetPKFlag(0);        --设置为练功模式        
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1340,3148);
		Msg2Player("Х m� m韎 t輓h to竛 th阨 gian l祄 nhi謒 v�")
	elseif ( nt_getTask(1202) == 20 ) then
		Describe(DescLink_YiGuan.."Ngi  ho祅 th祅h nhi謒 v�, kh玭g c莕 ti誴 t鬰 nh薾!",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		Describe(DescLink_YiGuan..": Ngi  ho祅 th祅h nhi謒 v�, th� n祇 c遪 mu鑞 ti誴 t鬰 ti誴 nh薾 ? nhanh l猲 m閠 ch髏 r阨 kh醝 c竔 n祔 甶!",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1202) == 0 ) then
		Describe(DescLink_YiGuan..": Ngi  ho祅 th祅h nhi謒 v� t輓 s�, xin nhanh l猲 m閠 ch髏 r阨 甶 甶!",1,"K誸 th骳 i tho筰/no")
	end
end

function temple_movecity()
	local name = GetName()
	if ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("Mi誹 s琻 th莕 d辌h tr筸 cung ti詎 "..name.." i nh﹏ n "..citygo[i][4].." d辌h tr筸 !")
			end
		end	
	elseif ( nt_getTask(1202) == 10 ) or ( nt_getTask(1202) == 0 ) then
		SetLogoutRV(0);
		NewWorld(1,1561,3114)
	end	  	
end

function birthday0905_temple()
	tbBirthday0905.tbTask:reset_task();
	Say("D辌h quan : t� 19/06/2009 n 19/07/2009 24 l骳 , th玭g qua ph輆 di nhi謒 v� c� th� t 頲 m颽 h� cung, i hi謕 mu鑞 tham gia sao ?", 6, 
              "Nh薾 ti猽 di謙 2 c� 產o y猽 nhi謒 v�./#birthday0905_settask_message(7)", 
              "Nh薾 ti猽 di謙 100 c� mi誹 s琻 th莕 ngi c莔 產o nhi謒 v�./#birthday0905_settask_message(8)", 
              "Ta  ho祅 th祅h ti猽 di謙 2 c� 產o y猽 nhi謒 v�./#birthday0905_gettask_message(7)", 
              "Ta  ho祅 th祅h ti猽 di謙 100 c� mi誹 s琻 th莕 ngi c莔 產o nhi謒 v�./#birthday0905_gettask_message(8)", 
              "Ta mu鑞 bu玭g tha cho b﹜ gi� nhi謒 v� /birthday0905_cancel_message", 
              "Ta c� vi謈 g蕄 , ch� m閠 ch髏 tr� l筰./no");
end

function no()
end
