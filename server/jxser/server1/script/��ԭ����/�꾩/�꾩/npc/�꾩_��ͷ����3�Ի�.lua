--中原北区 汴京府 码头船夫3对话
--suyu
--200306015

CurWharf = 3;
Include("\\script\\global\\station.lua")
---------------------------------------------------------------
function main(sel)

	Say("Thuy襫 phu ch髇g t玦 ch� bi誸 d鵤 v祇 s玭g Ho祅g H�  s鑞g. S鑞g tr猲 s玭g Ho祅g H�, ch誸 b猲 s玭g Ho祅g H�, n� gi鑞g nh� t輓h m筺g c馻 ch髇g t玦 v藋. Ngi c� l猲 kh玭g? ", 2, "Ng錳 thuy襫/WharfFun", "Kh玭g ng錳/OnCancel");

end;

---------------------------------------------------------------
function  OnCancel()

   Say("Kh玭g ti襫 kh玭g th� l猲 thuy襫! ",0)

end;

---------------------------------------------------------------