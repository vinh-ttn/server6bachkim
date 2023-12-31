if (not _H_DIALOG_FESTIVAL2006_H_) then
	_H_DIALOG_FESTIVAL2006_H_ = 1;
Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\springfestival\award.lua]]);
Include([[\script\missions\springfestival\signin.lua]]);

--	对换函数主入口
function sf06_mainentrance()
	local tab_Content = {
	"Kh玭g th祅h v蕁 !/signin_temp",
	"Ta  畊鎖 'g Ba Mi' 甶 r錳!/sf07_getaward",
	"Li猲 quan n ho箃 ng 畊鎖 'g Ba Mi'/sf07_detail",
	"D筼 n祔 ta b薾 qu�, t譵 ngi kh竎 甶!/no"
	}
	Describe("C� m鏸  xu﹏ v� l� <color=yellow>g Ba Mi<color> u n g﹜ h筰 d﹏ l祅g. в gi髉 d﹏ l祅g gi秈 quy誸 tai h鋋 n祔, V� L﹎ Minh Ch�  t藀 h鋚 c竎 v� v� l﹎ nh﹏ s� gi髉 d﹏ l祅g 畊鎖 <color=yellow>g Ba Mi<color>, gi髉 h� c� m閠 n╩ m韎 y猲 b譶h. в p t� ngh躠 c� cao qu� c馻 Minh ch�, quan ph�  d竛 c竜 th� treo thng cho nhi謒 v� 畊鎖 <color=yellow>g Ba Mi<color>. � nhi謒 v� n祔, ngi ch琲 s� ph秈 s� d鬾g o c� Ph竜 hoa T誸  nh 畊鎖 g ba mi, g ba mi c騨g c� th� s� d鬾g o c�  t蕁 c玭g l筰 ngi ch琲. C竎 nh﹏ s� c� th� n y  b竜 danh nhi謒 v� <color=yellow>鎖 玭g ba mi<color>. Ngi c� mu鑞 tham gia kh玭g?", getn(tab_Content), tab_Content);
end;

function signin_temp()
	Say("鎖 玭g ba mi c鴘 gi髉 d﹏ l祅g l� m閠 ngh躠 c� cao qu�, l筰 v鮝 th� hi謓 tinh th莕 y猽 qu� ng v藅.", 2, "Ha ha, mau a ta n n琲 c� 'g Ba Mi'./signin", "ьi m閠 l竧! Ta ph秈 chu萵 b�./no");
end;

--	介绍函数
function sf07_detail()
	Describe("M鏸 t ho箃 ng '鎖 玭g ba mi' s� di詎 ra trong v遪g <color=yellow>15 ph髏<color>, trong  c� <color=yellow>5 ph髏<color>  chu萵 b�. Sau khi b竜 danh, b筺 s� 頲 a n khu v鵦 chu萵 b�, khi ho箃 ng b総 u th� b筺 s� 頲 a n khu v鵦 ho箃 ng. <color=yellow>15 gi﹜<color> sau khi ho箃 ng b総 u, trong s� nh鱪g ngi tham gia s� c� 1 n 2 ngi ch琲 h鉧 th﹏ th祅h 'g ba mi'. Ngi ch琲 bi課 th祅h 'g ba mi' s� ph秈 b総 <color=yellow>Heo r鮪g<color> xu蕋 hi謓 trong khu v鵦. Nh鱪g ngi ch琲 c遪 l筰 s� ph秈 d飊g <color=yellow>ph竜 vi猲<color>  '畊鎖' g ba mi, ng╪ kh玭g cho 'g ba mi' b総 heo r鮪g. Sau khi ho箃 ng k誸 th骳, <color=yellow>Nha m玭 sai d辌h<color> s� c╪ c� v祇 s� l莕 d飊g <color=yellow>ph竜<color> n衜 tr髇g 'g ba mi' c馻 ngi ch琲  t苙g thng.", 1, "Ta bi誸 r錳./sf06_mainentrance");
end;

--	给予奖励主函数
function sf07_getaward()
	local nCount = GetTask(TK_CO_COUNT_ONETIME);
	local nRank = GetTask(TK_CO_RANK);
	
	if (nCount == 0 or nRank == 0) then
		Say("H譶h nh� ngi ch璦 甶 '畊鎖 g ba mi'. Mu鑞 nh薾 thng h穣 mau ch鉵g g鉷 s鴆."..CO_ANIMALNAME.."Ch箉 甶.", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 2) then
		Say("Kh玭g  ch� ch鴄, h穣 mau s緋 x誴 l筰 h祅h trang.", 0);
		return
	end;
	SetTask(TK_CO_COUNT_ONETIME, 0);
	SetTask(TK_CO_RANK, 0);
	nRank1 = festival_award_rank(nRank);
    festival_expaward(nRank1);
	festival_goodsaward(nRank1);
	if (GetTask(TK_CO_GROUPID) > CO_SMALLMAPCOUNT) then
		Say("Haha, l祄 t鑤 l緈! V鮝 r錳 ngi  t譵 th蕐 <color=yellow>"..nCount.."c竔<color>"..CO_MOUSENAME..", x誴 h筺g th� <color=yellow>"..nRank.."<color>,y l� ph莕 thng c馻 ngi, h穣 nh薾 l蕐!", 0)
	else
		Say("Ha ha, l祄 t鑤 l緈! Ngi nh tr髇g t鎛g c閚g <color=yellow>"..nCount.." l莕<color>"..CO_ANIMALNAME..", x誴 h筺g th� <color=yellow>"..nRank.."<color>,y l� ph莕 thng c馻 ngi, h穣 nh薾 l蕐!", 0)
	end;
end;

end;	--	end of _H_DIALOG_FESTIVAL2006_H_