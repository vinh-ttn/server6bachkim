-- ====================== 文件信息 ======================

-- 剑侠情缘网络版一“带艺投师”重置角色生命内力基础值

-- Edited by 子非魚
-- 2008/02/28 12:10

-- ======================================================
IncludeLib("NPCINFO")
Include("\\script\\global\\login_head.lua")

TSK_TOUSHI_COUNT			= 1883					-- “带艺投师”转职的次数
TSK_TOUSHI_RESETBASE		= 1982
TB_TOUSHI_PLAYERBASE	= 
	{
		[0]	=	
			{
				ipower		=35,
				iagility	=25,
				iouter		=25,
				iinside		=15,
				imaxlife	=204,
				imaxinner	=16,
				lifeperlvl	=4,
				manaperlvl	=1,
				lifepervit	=8,
				manapereng	=1,
			},
		[1]	=	
			{
				ipower		=20,
				iagility	=35,
				iouter		=20,
				iinside		=25,
				imaxlife	=103,
				imaxinner	=77,
				lifeperlvl	=3,
				manaperlvl	=2,
				lifepervit	=5,
				manapereng	=3,
			},
		[2]	=	
			{
				ipower		=25,
				iagility	=25,
				iouter		=25,
				iinside		=25,
				imaxlife	=153,
				imaxinner	=77,
				lifeperlvl	=3,
				manaperlvl	=2,
				lifepervit	=6,
				manapereng	=3,
			},
		[3]	=	
			{
				ipower		=30,
				iagility	=20,
				iouter		=30,
				iinside		=20,
				imaxlife	=213,
				imaxinner	=41,
				lifeperlvl	=3,
				manaperlvl	=1,
				lifepervit	=7,
				manapereng	=2,
			},
		[4]	=	
			{
				ipower		=20,
				iagility	=15,
				iouter		=25,
				iinside		=40,
				imaxlife	=76,
				imaxinner	=163,
				lifeperlvl	=1,
				manaperlvl	=3,
				lifepervit	=3,
				manapereng	=4,
			},
	}

function toushiResetBase()
	local nLevel	= GetLevel();
	local nSeries	= GetSeries();
	if (GetTask(TSK_TOUSHI_COUNT) > 0 and GetTask(TSK_TOUSHI_RESETBASE) ~= 1) then
		local nCurVit	= GetVit(1) - GetByte(GetTask(88),3);
		local nCurEng	= GetEng(1) - GetByte(GetTask(88),4);
		
		AddVit(TB_TOUSHI_PLAYERBASE[nSeries].iouter - nCurVit);
		AddEng(TB_TOUSHI_PLAYERBASE[nSeries].iinside - nCurEng);
		
		Msg2Player("Gi韎 h筺 sinh l鵦 v� n閕 l鵦 cao nh蕋 c馻 i hi謕  b� ch豱h s鯽, xin h穣 甶襲 ch豱h l筰 甶觤 ti襪 n╪g");
		Say("Gi韎 h筺 sinh l鵦 v� n閕 l鵦 cao nh蕋 c馻 i hi謕  b� ch豱h s鯽, xin h穣 甶襲 ch豱h l筰 甶觤 ti襪 n╪g", 0);
		
		local nCurLift	= GetLife();
		local nCurMana	= GetMana();
		
		local nBaseLife = toushiResetMaxLife(nSeries, nLevel);
		local nBaseMana = toushiResetMaxMana(nSeries, nLevel);
		
		SetTask(TSK_TOUSHI_RESETBASE, 1);
		
		AddVit(nCurVit - TB_TOUSHI_PLAYERBASE[nSeries].iouter);
		AddEng(nCurEng - TB_TOUSHI_PLAYERBASE[nSeries].iinside)
		
		WriteLog(format("[Sua chua dai nghe dau su]\t%s\tName:%s\tAccount:%s\t Chinh sua gioi han sinh luc noi luc cao nhat: oldLife(%d)oldMana(%d)newLife(%d)newMana(%d)",
							GetLocalDate("%Y-%m-%d %H:%M%S"),
							GetName(),
							GetAccount(),
							nCurLift, nCurMana, nBaseLife, nBaseMana
							));
		KickOutSelf();
	end
end

function toushiResetMaxLife(nSeries, nLevel, nExtProp)
	if (TB_TOUSHI_PLAYERBASE[nSeries] and nLevel > 1) then
		local tb = TB_TOUSHI_PLAYERBASE[nSeries];
		local nBaseLife	= (nLevel - 1) * tb.lifeperlvl + tb.imaxlife;
		

		NPCINFO_SetMaxLife(nBaseLife);
		return nBaseLife;
	end
end

function toushiResetMaxMana(nSeries, nLevel)
	if (TB_TOUSHI_PLAYERBASE[nSeries] and nLevel > 1) then
		local tb = TB_TOUSHI_PLAYERBASE[nSeries];
		local nBaseMana	= (nLevel - 1) * tb.manaperlvl + tb.imaxinner;
		

		NPCINFO_SetMaxMana(nBaseMana);
		return nBaseMana;
	end
end

if login_add then login_add(toushiResetBase, 1) end

--toushiResetMaxMana(0,130)
