-- 天山雪莲
-- By: Feimingzhi(2007-05-08)
-- Content:90级以下玩家使用天山雪莲直接升到120级。

IncludeLib("SETTING");
Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数
Include("\\script\\lib\\pay.lua")


function main( nItemIndex )
    
    local nPLev = GetLevel()
    if nPLev > 90  or nPLev < 50 or IsCharged() < 1 then
        Say("Ch� c� nh﹏ v藅 c蕄  t� 50 n 90 (bao g錷 c蕄 50 v� 90) m韎 c� th� s� d鬾g.", 0)
        return 1
    end
	
    tl_addPlayerExp(1433042000)	--90级0%升到120级0%的总经验值
	nPLev = GetLevel()
	Msg2Player(format("Ch骳 m鮪g b筺, ng c蕄 hi謓 t筰 c馻 b筺 l� %d.",nPLev))
	WriteLog(format("[S� d鬾g Thi猲 S琻 Tuy誸 Li猲]\t%s\tName:%s\tAccount:%s\t v鮝 ╪ 頲 1 Thi猲 S琻 Tuy誸 Li猲.",
			GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
end
--
