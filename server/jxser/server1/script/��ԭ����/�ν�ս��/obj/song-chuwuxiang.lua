--中原北区 宋金战场 宋方储物箱
-- lixin 2004-10-13

function main(sel)
if (GetCurCamp() == 1) then    --判断如果属于宋方阵营
	OpenBox();		--弹出储物箱物品框和玩家物品框，以便于玩家进行物品和金钱的存取
else
	Talk(1,"","Nh譶 ngi m総 la m祔 lo衪, nh蕋 nh l� Kim qu鑓 gian t�! Ngi u! B総 l蕐 h緉!")
end;
end;