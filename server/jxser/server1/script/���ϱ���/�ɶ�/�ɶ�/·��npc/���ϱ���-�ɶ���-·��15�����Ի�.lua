--西南北区 成都府 路人15书生对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(186) == 1 then
		allbrother_0801_FindNpcTaskDialog(186)
		return 0;
	end
i = random(0,1)

if (i == 0) then
Talk(2, "", "Ngi kh玭g bi誸 h�? Зy ch輓h l� V鋘g Giang l莡  k� ni謒 m閠 i t礽 n� Huy誸 Уo m� x﹜ n猲, truy襫 thuy誸 k� r籲g  c� t鮪g l蕐 nc gi課g � y, t� tay  th�,  l璾 l筰 nh鱪g c﹗ th� bu錸 l祄 ng l遪g ngi.", "Huy誸 Уo l骳 s鑞g r蕋 y猽 th輈h tr骳, n猲 quanh y m鋓 ngi tr玭g r蕋 nhi襲 tr骳, phng v� th﹎ th﹎, long ng﹎ t� t�, t� qu� thng th髖,t 譶h h鴑g v� c飊g, thng dng k� gi竛, khi課 nhi襲 ngi truy襫 t鬾g.")
return
end;

if (i == 1) then
Say("L猲 V鋘g Giang L莡 m� nh譶 ra xa, dung th祅h t� m筼, c萴 giang xu﹏ s綾, thu v祇 t莔 m総, khi課 cho l遪g ngi tho� th輈h.",0)
end;

end;
