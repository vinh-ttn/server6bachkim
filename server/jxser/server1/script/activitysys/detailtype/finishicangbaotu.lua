
Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("FinishCangBaoTu")


function _Detail:OnMessage(tbParam)
		
	if not self:CheckDate() then
		return
	end
	
	lib:DoFunByPlayer(PlayerIndex, ActivityDetailClass.OnMessage, self, {})
end


