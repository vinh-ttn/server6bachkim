--越南两周年活动蛋糕
--fmz
--200705
--
--2007-06-02
--edit by Fmz,增加获得经验的上限
TSK_ACT2YEARS_EXP_MAX = 1919
function main(nItemIndex)    
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > 70731 then
        Say("B竛h n祔  qu� h筺, kh玭g d飊g 頲 n鱝!",0)
        return 0
    end
    local nCurAddExp = GetTask(TSK_ACT2YEARS_EXP_MAX)
    if nCurAddExp >= 400000000 then
        Say("Х t gi韎 h筺 t鑙 產, kh玭g th� s� d鬾g v藅 ph萴 n祔 n鱝.",0)
        return 1
    end
    local szItemName = GetItemName(nItemIndex)
    local nExpNum,nItemID = 0
    local g, d, p = GetItemProp( nItemIndex )
    if p == 1442 then
        nExpNum = 200000
    elseif p == 1443 then
        nExpNum = 500000
    elseif p == 1444 then
        nExpNum = 1000000
    end
    if (IsMyItem(nItemIndex) ~= 1) then
        return 1
    end
    
    RemoveItemByIndex(nItemIndex);    
    AddOwnExp( nExpNum )
    WriteLog(format("[S� d鬾g %s]\t%s\tName:%s\tAccount:%s\t t╪g %s 甶觤 kinh nghi謒.",szItemName,
    GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),nExpNum));
    SetTask(TSK_ACT2YEARS_EXP_MAX,nCurAddExp+nExpNum)
    return 0
end
--