-------------------------------------------------------------------------
-- FileName		:	toll_yucixinshi.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-16 15:28:15
-- Desc			:  	信使任务御赐金牌右键触发脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(itemindex)
	local paramvalue = GetItemParam(itemindex, 1)
	if ( paramvalue >= 5 ) then
		Msg2Player("Xin l鏸! Ng� T� l謓h b礽 - v祅g c馻 b筺 s� d鬾g qu� 5 l莕  b� h駓 ho筰.")
	elseif ( nt_getTask(1206) < 5 ) then
		Msg2Player("Xin l鏸! B筺 ch璦 nh薾 頲 danh hi謚 Ng� T� l謓h b礽 - v祅g n猲 kh玭g th� s� d鬾g 頲. H穣 n ch� D辌h Quan nh薾 danh hi謚 n祔, c竚 琻!")
		return 1
	else
		if ( SetSpecItemParam(itemindex, 1, paramvalue+1) == 1 ) then
			SyncItem(itemindex)
			local Realvalue = 5 - GetItemParam(itemindex, 1)
			Msg2Player("Ng� T� l謓h b礽 - v祅g c馻 b筺 sau khi s� d鬾g ph鬰 h錳 30 甶觤 ﹎ trong 1 gi�. Hi謓 t筰 c遪 s� d鬾g 頲"..Realvalue.." l莕.")
		end
		
		if ( GetSeries() == 0 ) then --金系人物被火克 ，631-635，金木水火土
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 634, 5, 1, 64800)
		elseif ( GetSeries() == 1 ) then --木系人物被金克
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 631, 5, 1, 64800)
		elseif ( GetSeries() == 2 ) then --水系人物被土克
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 635, 5, 1, 64800)
		elseif ( GetSeries() == 3 ) then --火系人物被水克
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 633, 5, 1, 64800)
		elseif ( GetSeries() == 4 ) then --土系人物被木克
			AddSkillState( 546, 1, 1, 64800)	
			AddSkillState( 632, 5, 1, 64800)				
		end
		
		return 1
	end
end

function GetDesc( nItem )
	local szDesc;
	local nIssueID, nIDCount;
	local  nPayMonth1
	local nPayMonth1 = GetItemParam( nItem, 1 )
	local Realvalue = 5 - nPayMonth1
	
	szDesc = ""
	szDesc = szDesc..format( "Ng� T� l謓h b礽 - v祅g c馻 b筺 sau khi s� d鬾g ph鬰 h錳 30 甶觤 ﹎ trong 1 gi�. Hi謓 t筰 c遪 s� d鬾g 頲"..Realvalue.." l莕." );
	return szDesc;
end