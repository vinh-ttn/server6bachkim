Include("\\script\\missions\\tongwar\\match\\head.lua")


function main()
	--如果处于报名阶段时,玩家不能走到对方的领地中去，所以会将玩家扔到大营内
		if(GetCurCamp() == 2) then
			if (tongwar_check_outmatch()) then
				return
			end
			if( GetFightState() == 1) then
				SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				tongwar_setdata(TONGWAR_RLTASK_LASTDTIME, GetGameTime())
				SetFightState(0)
			else

					file = GetMissionS(2)
					x,y = bt_getadata(file)
					SetPos(floor(x/32), floor(y/32))
					bt_RankEffect(tongwar_getdata(TONGWAR_RLTASK_CURRANK))
					SetFightState(1)
					SetPKFlag(1)
			end;
		elseif (GetCurCamp() == 1) then
				file = GetMissionS(2)
				x,y = bt_getadata(file)
				SetPos(floor(x/32), floor(y/32))
			Msg2Player("Ph輆 trc s琻 c鑓 ch藀 tr飊g, ch綾 ch緉 c� ph鬰 binh! B筺 kh玭g n猲 t� ti謓 x玭g l猲!")
		end;
end;


