--唐门帮助NPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "Qu秐 Gia"

function main(sel)

UTask_tm = GetTask(2)

if (UTask_tm < 10*256) then						--未接唐门入门任务，未入唐门
	if (GetFaction() ~= "") then				--如果玩家已经属于另一门派
		Say("Ta  � Л阯g m玭 mi m蕐 n╩ nay, kh玭g chuy謓 g� kh玭g bi誸! Ngi mu鑞 h醝 g�?", 3, "T譵 hi觰 qu� ph竔/org", "T譵 hi觰 c竎 v� cao th� Л阯g M玭/member", "T譵 hi觰 b� c鬰 n琲 n祔/config")
		return
	else
		Say("Ta  � Л阯g m玭 mi m蕐 n╩ nay, kh玭g chuy謓 g� kh玭g bi誸! Ngi mu鑞 h醝 g�?", 4, "T譵 hi觰 qu� ph竔/org", "T譵 hi觰 c竎 v� cao th� Л阯g M玭/member", "T譵 hi觰 b� c鬰 n琲 n祔/config", "L祄 sao  nh藀 m玭?/task1")
		return	
	end
end;
	
if (UTask_tm == 70*256) then					--唐门已经出师		
	Say("Th� ra l� ng m玭 trc y, c� chuy謓 g� th�?", 6, "T譵 hi觰 l筰 Л阯g M玭/org", "T譵 hi觰 l筰 ng m玭 trc kia/member", "T譵 hi觰 l筰 b� c鬰 n琲 n祔/config", "C遪 nhi謒 v� n祇  l祄 n鱝/task3","T譵 hi觰 s� trng luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help")
	return
end;	

Say("Ta  � Л阯g m玭 mi m蕐 n╩ nay, kh玭g chuy謓 g� kh玭g bi誸! Ngi mu鑞 h醝 g�?", 7, "цi tho筰 v韎 Long Ng� /Uworld1000_word","T譵 hi觰 b鎛 m玭/org", "T譵 hi觰 ng m玭/member", "T譵 hi觰 b� c鬰 n琲 n祔/config", "T譵 hi觰 nhi謒 v� /task3","T譵 hi觰 s� trng luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("Mu鑞 t譵 hi觰 phng di謓 n祇?", 4, "Kh雐 nguy猲 m玭 ph竔/o1", "V� tr� a l� /o2", "мa v� giang h� /o3", "c s綾 m玭 ph竔/o4")
end;


function member()
Say("Mu鑞 t譵 hi觰 ai?", 10, "Chng m玭 Л阯g C鮱/m1", "Truy H錸 T萿 Л阯g Nh祅/m2", "Ti猽 Nhi猰 T萿 Л阯g V﹏/m3", "Tuy謙 Xu﹏ T萿 Л阯g D� /m4", "B筩h B祇 T萿 Л阯g H筩/m5", "Л阯g Nh蕋 Tr莕/m6", "Л阯g B蕋 Nhi詍/m7", "Л阯g Khuy誸/m8", "Л阯g Khinh/m9", "Л阯g чc/m10")
end;


function config()
Say("Mu鑞 t譵 hi觰 phng di謓 n祇?", 3, "C竎 v飊g l﹏ c薾/c1",  "Л阯g Gia B秓/c2", "Xung quanh Л阯g Gia B秓/c3")
end;


function task1()
Say("B鎛 m玭 ch� thu nh薾 е t� h� M閏, kh玭g ph﹏ nam n�. Mu鑞 nh藀 m玭 h鋍 ngh�, c莕 th玭g qua nhi謒 v� nh藀 m玭.", 1, "T譵 hi觰 c� th� nhi謒 v� nh藀 m玭/v1")
end;


function task2()
Say("<#> Ngi  xu蕋 s�, kh玭g c莕 l祄 nhi謒 v� b鎛 m玭 n鱝,  k� hi謚 nhi謒 v� l� "..UTask_tm.."<#>.", 0)
end;


function task3()

UTask_tm = GetTask(2)

if (UTask_tm < 10*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, nhi謒 v� 產ng ti課 h祅h l�:", 1, "Nhi謒 v� nh藀 m玭/v1")
end;

if (UTask_tm == 10*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, gi�  nh藀 m玭, ti誴 theo c� th� ti課 h祅h:", 1, "Nhi謒 v� Ma V� Ch﹎/v2")
end;

if (UTask_tm > 10*256) and (UTask_tm < 20*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, nhi謒 v� 產ng ti課 h祅h l�:", 1, "Nhi謒 v� Ma V� Ch﹎/v2")
end;

if (UTask_tm == 20*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, ti誴 theo c� th� ti課 h祅h:", 1, "Nhi謒 v� Л阯g U/v3")
end;

if (UTask_tm > 20*256) and (UTask_tm < 30*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, nhi謒 v� 產ng ti課 h祅h l�:", 1, "Nhi謒 v� Л阯g U/v3")
end;

if (UTask_tm == 30*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, ti誴 theo c� th� ti課 h祅h:", 1, "Nhi謒 v� H醓 Kh� Ph� /v4")
end;

if (UTask_tm > 30*256) and (UTask_tm < 40*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, nhi謒 v� 產ng ti課 h祅h l�:", 1, "Nhi謒 v� H醓 Kh� Ph� /v4")
end;

if (UTask_tm == 40*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, ti誴 theo c� th� ti課 h祅h:", 1, "Nhi謒 v� C秐h T� K� /v5")
end;

if (UTask_tm > 40*256) and (UTask_tm < 50*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, nhi謒 v� 產ng ti課 h祅h l�:", 1, "Nhi謒 v� C秐h T� K� /v5")
end;

if (UTask_tm == 50*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, ti誴 theo c� th� ti課 h祅h:", 1, "Nhi謒 v� 竚 Kh� Ph� /v6")
end;

if (UTask_tm > 50*256) and (UTask_tm < 60*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, nhi謒 v� 產ng ti課 h祅h l�:", 1, "Nhi謒 v� 竚 Kh� Ph� /v6")
end;

if (UTask_tm == 60*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, ti誴 theo c� th� ti課 h祅h:", 1, "Nhi謒 v� xu蕋 s� /v7")
end;

if (UTask_tm > 60*256) and (UTask_tm < 70*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, nhi謒 v� 產ng ti課 h祅h l�:", 1, "Nhi謒 v� xu蕋 s� /v7")
end;

if (UTask_tm >= 70*256) and (UTask_tm < 80*256) then	
Say("<#> Mu鑞 nh藀 m玭 h鋍 ngh�, ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau khi nh藀 m玭, l莕 lt ho祅 th祅h 5 nhi謒 v� c馻 m玭 ph竔, s� h鋍 頲 v� c玭g, 頲 phong danh hi謚. Ho祅 th祅h nhi謒 v� xu蕋 s� th� c� th� xu蕋 s�. Hi謓 "..UTask_tm.."<#>, nhi謒 v� 產ng ti課 h祅h l�:", 1, "Tr飊g ph秐 s� m玭/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("Trong con m総 c馻 ngi ngo礽, b鎛 m玭 l� 1 gia t閏 th莕 b�, 竚 kh� v� ho� kh� uy ch蕁 thi猲 h�, danh ch蕁 giang h�  h琻 tr╩ n╩ nay", 4, "Bi誸 r錳/ok", "V� tr� a l� /o2", "мa v� giang h� /o3", "c s綾 m玭 ph竔/o4")
end;

function o2()
Say("B鎛 m玭 � Nam Tr骳 H秈, b猲 ngo礽 tuy u nh祅 thanh t辬h, nh璶g b猲 trong c筸 b蓎 tr飊g tr飊g. Kh玭g c� ngi hng d蒼, ngi ngo礽 kh� m� v祇 頲!", 4, "Bi誸 r錳/ok", "Kh雐 nguy猲 m玭 ph竔/o1", "мa v� giang h� /o3", "c s綾 m玭 ph竔/o4")
end;

function o3()
Say("B鎛 m玭 v� Th髖 Y猲 M玭 頲 xem l� 'V� L﹎ Nh� m玭'. 竚 kh�, h醓 kh�, y dc, c筸 b蓎 u t n t鑙 cao. Giang h� ch� c莕 nh綾 n t猲 b鎛 m玭 l� m苩  bi課 s綾", 4, "Bi誸 r錳/ok", "Kh雐 nguy猲 m玭 ph竔/o1", "V� tr� a l� /o2", "c s綾 m玭 ph竔/o4")
end;

function o4()
Say(" t� b鎛 m玭 h祅h s� b� hi觤. Kh玭g m祅g th� phi. K� t錸 t筰 m韎 l� anh h飊g!", 4, "Bi誸 r錳/ok", "Kh雐 nguy猲 m玭 ph竔/o1", "V� tr� a l� /o2", "мa v� giang h� /o3")
end;

--------------------------------

function m1()
Say("V� tr�: <color=blue>ph遪g kh竎h<color>  T鋋 : <color=blue>202,199<color>  ph� tr竎h: <color=blue>nhi謒 v�<color><enter> Ki猽 c╪g ng筼 m筺 nh璶g r蕋 quy誸 畂竛!", 10, "Bi誸 r錳/ok", "Truy H錸 T萿 Л阯g Nh祅/m2", "Ti猽 Nhi猰 T萿 Л阯g V﹏/m3", "Tuy謙 Xu﹏ T萿 Л阯g D� /m4", "B筩h B祇 T萿 Л阯g H筩/m5", "Л阯g Nh蕋 Tr莕/m6", "Л阯g B蕋 Nhi詍/m7", "Л阯g Khuy誸/m8", "Л阯g Khinh/m9", "Л阯g чc/m10")
end;

function m2()
Say("V� tr�: <color=blue>ph遪g 竚 kh�<color>  T鋋 : <color=blue>199,200<color>  ph� tr竎h: <color=blue>nhi謒 v�<color><enter> T礽 ngh� ch� t筼 ra 竚 kh� thi猲 h� v� ch. T輓h c竎h th﹎ tr莔, vui bu錸 kh玭g th� hi謓 ra ngo礽", 10, "Bi誸 r錳/ok", "Chng m玭 Л阯g C鮱/m1", "Ti猽 Nhi猰 T萿 Л阯g V﹏/m3", "Tuy謙 Xu﹏ T萿 Л阯g D� /m4", "B筩h B祇 T萿 Л阯g H筩/m5", "Л阯g Nh蕋 Tr莕/m6", "Л阯g B蕋 Nhi詍/m7", "Л阯g Khuy誸/m8", "Л阯g Khinh/m9", "Л阯g чc/m10")
end;

function m3()
Say("V� tr�: <color=blue>ph遪g H醓 kh�<color>  T鋋 : <color=blue>200,200<color>  ph� tr竎h: <color=blue>nhi謒 v�<color><enter> B薱 th莥 v� ch� t筼 h醓 kh�, khi課 ngi trong v� l﹎ nh綾 n t猲  bi課 s綾. T輓h t譶h n鉵g nhu l鯽, nh璶g r蕋 trung th祅h, sau khi a con ch誸 甶 t﹎ t竛h thay i ", 10, "Bi誸 r錳/ok", "Chng m玭 Л阯g C鮱/m1", "Truy H錸 T萿 Л阯g Nh祅/m2", "Tuy謙 Xu﹏ T萿 Л阯g D� /m4", "B筩h B祇 T萿 Л阯g H筩/m5", "Л阯g Nh蕋 Tr莕/m6", "Л阯g B蕋 Nhi詍/m7", "Л阯g Khuy誸/m8", "Л阯g Khinh/m9", "Л阯g чc/m10")
end;

function m4()
Say("V� tr�: <color=blue>ph遪g Y dc<color>  T鋋 : <color=blue>200,200<color>  ph� tr竎h: <color=blue>nhi謒 v�<color><enter>tinh th玭g y thu藅 v� c dc, t竛h t譶h qu竔 l�, c� ch蕄", 10, "Bi誸 r錳/ok", "Chng m玭 Л阯g C鮱/m1", "Truy H錸 T萿 Л阯g Nh祅/m2", "Ti猽 Nhi猰 T萿 Л阯g V﹏/m3", "B筩h B祇 T萿 Л阯g H筩/m5", "Л阯g Nh蕋 Tr莕/m6", "Л阯g B蕋 Nhi詍/m7", "Л阯g Khuy誸/m8", "Л阯g Khinh/m9", "Л阯g чc/m10")
end;

function m5()
Say("V� tr�: <color=blue>ph遪g V� c玭g<color>  T鋋 : <color=blue>200,200<color>  ph� tr竎h: <color=blue>nhi謒 v�<color><enter> T輓h t譶h nhu nh� v� 玭 ho�,tuy l� 1 trong 4 ngi v� tr� cao trong Л阯g M玭, nh璶g lu玭 甶襪 m khi猲 t鑞.", 10, "Bi誸 r錳/ok", "Chng m玭 Л阯g C鮱/m1", "Truy H錸 T萿 Л阯g Nh祅/m2", "Ti猽 Nhi猰 T萿 Л阯g V﹏/m3", "Tuy謙 Xu﹏ T萿 Л阯g D� /m4", "Л阯g Nh蕋 Tr莕/m6", "Л阯g B蕋 Nhi詍/m7", "Л阯g Khuy誸/m8", "Л阯g Khinh/m9", "Л阯g чc/m10")
end;

function m6()
Say("V� tr�: <color=blue>ph遪g Ngh� s�<color>  T鋋 : <color=blue>199,200<color>  ph� tr竎h: <color=blue>nhi謒 v�<color><enter> con trng c馻 Л阯g C鮱, th玭g minh lanh l頸, v╪ v� song to祅.", 10, "Bi誸 r錳/ok", "Chng m玭 Л阯g C鮱/m1", "Truy H錸 T萿 Л阯g Nh祅/m2", "Ti猽 Nhi猰 T萿 Л阯g V﹏/m3", "Tuy謙 Xu﹏ T萿 Л阯g D� /m4", "B筩h B祇 T萿 Л阯g H筩/m5", "Л阯g B蕋 Nhi詍/m7", "Л阯g Khuy誸/m8", "Л阯g Khinh/m9", "Л阯g чc/m10")
end;

function m7()
Say("V� tr�: <color=blue>T� t� 阯g<color>  T鋋 : <color=blue>199,199<color>  ph� tr竎h: <color=blue>nhi謒 v�<color><enter> con th� c馻 Л阯g C鮱, t輓h t譶h h祇 ph鉵g, b竎 竔 hi襫 lng", 10, "Bi誸 r錳/ok", "Chng m玭 Л阯g C鮱/m1", "Truy H錸 T萿 Л阯g Nh祅/m2", "Ti猽 Nhi猰 T萿 Л阯g V﹏/m3", "Tuy謙 Xu﹏ T萿 Л阯g D� /m4", "B筩h B祇 T萿 Л阯g H筩/m5", "Л阯g Nh蕋 Tr莕/m6", "Л阯g Khuy誸/m8", "Л阯g Khinh/m9", "Л阯g чc/m10")
end;

function m8()
Say("V� tr�: <color=blue>Qu穘g trng<color>  T鋋 : <color=blue>508,323<color>  ph� tr竎h: <color=blue>Giao d辌h binh kh�<color>", 10, "Bi誸 r錳/ok", "Chng m玭 Л阯g C鮱/m1", "Truy H錸 T萿 Л阯g Nh祅/m2", "Ti猽 Nhi猰 T萿 Л阯g V﹏/m3", "Tuy謙 Xu﹏ T萿 Л阯g D� /m4", "B筩h B祇 T萿 Л阯g H筩/m5", "Л阯g Nh蕋 Tr莕/m6", "Л阯g B蕋 Nhi詍/m7", "Л阯g Khinh/m9", "Л阯g чc/m10")
end;

function m9()
Say("V� tr�: <color=blue>Qu穘g trng<color>  T鋋 : <color=blue>506,322<color>  ph� tr竎h: <color=blue>Giao d辌h trang b�<color>", 10, "Bi誸 r錳/ok", "Chng m玭 Л阯g C鮱/m1", "Truy H錸 T萿 Л阯g Nh祅/m2", "Ti猽 Nhi猰 T萿 Л阯g V﹏/m3", "Tuy謙 Xu﹏ T萿 Л阯g D� /m4", "B筩h B祇 T萿 Л阯g H筩/m5", "Л阯g Nh蕋 Tr莕/m6", "Л阯g B蕋 Nhi詍/m7", "Л阯g Khuy誸/m8", "Л阯g чc/m10")
end;

function m10()
Say("V� tr�: <color=blue>Qu穘g trng<color>  T鋋 : <color=blue>504,322<color>  ph� tr竎h: <color=blue>Giao d辌h dc ph萴<color>", 10, "Bi誸 r錳/ok", "Chng m玭 Л阯g C鮱/m1", "Truy H錸 T萿 Л阯g Nh祅/m2", "Ti猽 Nhi猰 T萿 Л阯g V﹏/m3", "Tuy謙 Xu﹏ T萿 Л阯g D� /m4", "B筩h B祇 T萿 Л阯g H筩/m5", "Л阯g Nh蕋 Tr莕/m6", "Л阯g B蕋 Nhi詍/m7", "Л阯g Khuy誸/m8", "Л阯g Khinh/m9")
end;

--------------------------------

function c1()
Say("Ph輆 nam ti誴 v韎 Th祅h Й.", 3, "Bi誸 r錳/ok", "Л阯g Gia B秓/c2", "Xung quanh Л阯g Gia B秓/c3")
end;

function c2()
Say("Trung t﹎ g錷: ph遪g kh竎h (508,322) , Ph遪g Ch輓h (511,319) , T� t� 阯g (514,318) .<enter> ph輆 Йng c�: ph遪g H醓 kh� (512,324) , ph遪g Y dc (515,322) .<enter>ph輆 T﹜ c� Ph遪g Ngh� s� (507,319) , ph遪g 竚 kh� (504,317) , ph遪g V� c玭g (509,317) ", 3, "Bi誸 r錳/ok", "C竎 v飊g l﹏ c薾/c1", "Xung quanh Л阯g Gia B秓/c3")
end;

function c3()
Say("Ph輆 nam th玭g qua Tr骳 H秈 Tam Quan.<enter> ph輆 Йng n Tr骳 T� ng (522,326) .<enter>ph輆 T﹜ n Ph� Th髖 h� (495,314) .<enter>ph輆 B綾 n V� T﹎ c鑓 (527,292) .", 3, "Bi誸 r錳/ok", "C竎 v飊g l﹏ c薾/c1", "Л阯g Gia B秓/c2")
end;

--------------------------------

function v1()							
Talk(6, "", "Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi c� th� gia nh藀 Л阯g M玭, tr� th祅h <color=blue>T筽 D辌h<color>, h鋍 頲 v� c玭g <color=blue>T輈h L辌h n<color>.<enter>Ti誴 nh薾 nhi謒 v�, c莕 ph秈 t 甶襲 ki謓 sau: Ng� h祅h thu閏 t輓h: h� M閏, ng c蕄 t n 10, kh玭g l祄 nhi謒 v� nh藀 m玭 c馻 b蕋 k� m玭 ph竔 n祇","Bc 1: дn <color=blue>l鑙 v祇 Tr骳 H秈 Tam Quan<color> g苝 1 <color=blue>Л阯g M玭 Tr竛g nh (453,358)<color>, ti誴 nh薾 nhi謒 v�, qua Tr骳 H秈 Tam Quan.", "Bc 2: дn c鯽 th� nh蕋 nh b筰 <color=blue>Чi M� h莡<color>, l蕐 頲 <color=red>g藋 tr骳 m祏 xanh<color>.", "Bc 3: дn c鯽 th� hai tr� l阨 c﹗ h醝 c馻 <color=blue>Л阯g M玭 Tr竛g nh (468,350)<color> v� C鰑 Cung , l蕐 頲 <color=red>g藋 tr骳 m祏 tr緉g<color>. C莕 ph秈 nh b筰 <color=blue>Чi M� h莡, Чi D� h莡<color>m韎 l蕐 頲 p 竛!", "Bc 4: дn c鯽 th� ba tr� l阨 c﹗ h醝 c馻<color=blue>Л阯g M玭 Tr竛g nh (473,343)<color> v� B竧 qu竔, l蕐 頲 <color=red>g藋 tr骳 m祏 t輒<color>.C莕 ph秈 nh b筰 <color=blue>Чi M� h莡, Чi D� h莡, Чi H綾 Di謕 H莡<color> m韎 l蕐 頲 p 竛!", "Bc 5: дn <color=blue>l鑙 ra Tr骳 H秈 Tam Quan<color>, giao 3 c﹜ g藋 tr骳 cho <color=blue>Л阯g M玭 Tr竛g nh (479,339)<color>, ho祅 th祅h nhi謒 v�.")
end;


function v2()
Talk(7, "", "Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� <color=blue>Tr竛g nh <color>, h鋍 頲 v� c玭g <color=blue>Л阯g M玭 竚 kh�, Л阯g M玭 o ph竝<color>.<enter>Ti誴 nh薾 nhi謒 v� n祔 c莕 ph秈 l�  t� tr猲 c蕄 10","Bc 1: дn <color=blue>ph遪g V� c玭g<color> g苝 <color=blue>Л阯g H筩 <color>, ti誴 nh薾 nhi謒 v�, 甶 <color=blue>Th祅h Й <color> t譵 <color=red>Ma V� ch﹎<color>.", "Bc 2: дn <color=blue>Th祅h Й <color>, g苝 <color=blue>Mai Nng (389,315)<color> bi誸 頲 c莕 ph秈 甶 t譵 <color=blue>T玭 Uy觧<color>.", "Bc 3: дn ph輆 ng nam Th祅h Й Йng Nam t譵 <color=blue>T玭 Uy觧 (394,323)<color>, ti誴 nh薾 nhi謒 v�, d飊g <color=red>Nh蒼 M� N穙<color> i Ma V� ch﹎.", "Bc 4: n <color=blue>ti謒 T筽 h鉧<color> mua <color=red>Nh蒼 M� N穙<color>.", "Bc 5: Tr� l筰 g苝 T玭 Uy觧, giao Nh蒼 M� N穙, l蕐 頲 <color=red>Ma V� ch﹎<color>.", "Bc 6: Tr� v� <color=blue>ph遪g V� c玭g<color>, giao <color=red>Ma V� ch﹎<color> cho <color=blue>Л阯g H筩 <color>, ho祅 th祅h nhi謒 v�.")
end;


function v3()
Talk(8, "", "Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� <color=blue>H� Vi謓<color>, h鋍 頲 v� c玭g <color=blue>箃 H錸 Ti猽, T﹎ Nh穘 <color>.<enter>Ti誴 nh薾 nhi謒 v� c莕 ph秈 l�  t� c蕄 20 v�  ho祅 th祅h nhi謒 v� Ma V� ch﹎","Bc 1: дn <color=blue>ph遪g Ngh� s�<color> g苝 <color=blue>Л阯g Nh蕋 Tr莕<color>, ti誴 nh薾 nhi謒 v�, n <color=blue>V� T﹎ c鑓<color> khuy猲 nh� <color=blue>Л阯g U<color>.", "Bc 2: дn <color=blue>ph輆 b綾 V� T﹎ c鑓<color>, nh蕄 v祇 <color=blue>c鯽 g� (528,291)<color>, ti誴 nh薾 nhi謒 v�, n V� T﹎ c鑓 t譵 <color=blue>4 ch� kh萿 quy誸<color>.", "Bc 3: дn V� T﹎ c鑓 nh b筰 4 con <color=blue>X� L� tinh<color> v� <color=blue>Ho竛 h飊g tinh<color>, l蕐 頲 <color=red>4 chi誧 kh╪ t�<color>tr猲  c� 4 c﹗ kh萿 quy誸", "Bc 4: Quay l筰 i tho筰 v韎 Л阯g U, ti誴 nh薾 nhi謒 v�, n ph輆 t﹜ <color=blue>Ph� Th髖 h�<color> t譵 <color=red>Kim H筺g khuy猲<color>.", "Bc 5: дn <color=blue>Ph� Th髖 h�<color>, nh b筰 <color=blue>X輈h Di謒 Ng筩<color>, l蕐 頲 <color=red>Kim H筺g khuy猲<color>", "Bc 6: Tr� l筰 <color=blue>V� T﹎ c鑓<color>, Л阯g U s� b秓 ngi mang <color=red>Kim H筺g khuy猲<color> cho <color=blue>Chng m玭 Л阯g C鮱<color>.", "Bc 7: Quay v� <color=blue>ph遪g kh竎h<color>, giao <color=red>Kim H筺g khuy猲<color> cho <color=blue>Л阯g C鮱 <color>, ho祅 th祅h nhi謒 v�. N誹 Kim H筺g khuy猲 b� m蕋, ph秈 th鵦 hi謓 nhi謒 v� l筰 t� u.")
end;


function v4()
Talk(6, "", "Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� <color=blue>Gi韎 Ti襫 H� v�<color>, h鋍 頲 v� c玭g <color=blue>Truy T﹎ Ti詎<color>.<enter>Ti誴 nh薾 nhi謒 v� c莕 ph秈 l�  t� c蕄 30 v�  ho祅 th祅h nhi謒 v� Л阯g U","Bc 1: дn <color=blue>T� t� 阯g<color> g苝 <color=blue>Л阯g B蕋 Nhi詍<color>, ti誴 nh薾 nhi謒 v�, 甶 l蕐<color=red>H醓 Kh� ph�<color>.", "Bc 2: дn <color=blue>B筩h V﹏ ng<color>, nh b筰 th� ph� <color=blue>Чi u m鬰 Cu錸g Sa<color>, ti誴 nh薾 nhi謒 v�, v祇 trong ng t譵 <color=red>Ch譨 kh鉧 b秓 rng<color>.", "Bc 3: V祇 ng nh b筰 4 t猲 <color=blue>ti觰 u m鬰 чc Nh�, Thi誸 T�, Qu� 秐h, L� Quy襫<color> s� l蕐 頲 <color=red>Ch譨 kh鉧<color>.", "Bc 4: M� <color=blue>B秓 rng (230,199)<color>, l蕐 頲 <color=red>H醓 Kh� ph�<color>.", "Bc 5: Tr� v� <color=blue>ph遪g H醓 kh�<color>, giao <color=red>H醓 Kh� ph�<color> cho <color=blue>Л阯g V﹏ <color>, ho祅 th祅h nhi謒 v�.")
end;


function v5()
Talk(7, "", "Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� <color=blue>Nh藀 C竎  t�<color>, h鋍 頲 v� c玭g <color=blue>M筺 Thi猲 Hoa V�, Th鑙 чc Thu藅<color>.<enter>Ti誴 nh薾 nhi謒 v� c莕 ph秈 l�  t� c蕄 40 v�  ho祅 th祅h nhi謒 v� H醓 Kh� ph� ","Bc 1: дn <color=blue>ph遪g Y dc<color> g苝 <color=blue>Л阯g D�<color>, ti誴 nh薾 nhi謒 v�, h鉧 gi秈 ﹏ o竛 gi鱝 Л阯g D� v� C秐h T� K� ", "Bc 2: дn ph輆 t﹜ <color=blue>Thanh Th祅h s琻<color> t譵 <color=blue>C秐h T� K� (230,245)<color>. Trc ti猲 nh b筰 5 con d� th�: <color=blue>S鉯 x竚<color>, <color=blue>M穘h h�<color>, <color=blue>Kim Ti襫 b竜<color>, <color=blue>Heo r鮪g<color> v� <color=blue>G蕌 n﹗<color>, sau  ti誴 nh薾 nhi謒 v�, gi髉 con g竔 C秐h T� K� tr� b謓h", "Bc 3: Tr� l筰 <color=blue>ph遪g Y dc<color>, h醝 <color=blue>Л阯g D�<color> v� <color=blue>b礽 thu鑓<color>.", "Bc 4: дn ng b綾 <color=blue>Thanh Th祅h s琻<color>, l猲 <color=blue>Thanh Dng phong<color>, nh b筰 <color=blue>H綾 g, Hung Th鴘, Linh 猽<color>, l蕐 頲 5 Dc li謚: <color=red>Da c鉩, gan r緉 c, h箃 Anh t骳, 畊玦 r誸 c, u Thi猲 t祄<color>.", "Bc 5: Giao dc li謚 C秐h T� K�, h鉧 gi秈 頲 ﹏ o竛", "Bc 6: Tr� v� ph遪g Y dc g苝 Л阯g D�, ho祅 th祅h nhi謒 v�.")
end;


function v6()
Talk(7, "", "Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� <color=blue>T� L穙 m玭 nh﹏<color>, h鋍 頲 v� c玭g <color=blue>Thi猲 La мa V鈔g<color>.<enter>Ti誴 nh薾 nhi謒 v� c莕 ph秈 l�  t� c蕄 50 v�  ho祅 th祅h nhi謒 v� C秐h T� K� ","Bc 1: дn <color=blue>ph遪g 竚 kh�<color> g苝 <color=blue>Л阯g Nh祅<color>, ti誴 nh薾 nhi謒 v�, 甶 t譵 <color=red>'竚 kh� ph�'<color>.", "Bc 2: дn <color=blue>ph遪g Ngh� s�<color>,g苝 <color=blue>Л阯g Nh蕋 Tr莕<color>, bi誸 頲 <color=blue>Tam s� huynh Л阯g H遖<color> v� <color=blue>Ng� s� huynh Л阯g Nguy猲 <color>  甶 ngang ph遪g 竚 kh�, h祅h ng c馻 2 ngi r蕋 kh� nghi", "Bc 3: дn <color=blue>Giang T﹏ th玭 <color> t譵 <color=blue>Л阯g Nguy猲 <color>, bi誸 頲 <color=blue>Л阯g H遖<color> 產ng � <color=blue>Hng Th駓 ng<color>.", "Bc 4: дn <color=blue>Hng Th駓 ng<color>, nh b筰 <color=blue>Л阯g H遖<color>, bi誸 頲 <color=red>'竚 kh� ph�'<color> 產ng 頲 gi蕌 trong ng", "Bc 5: Ti誴 t鬰 nh b筰 <color=blue>Thi誸 Ch飝 Ma Vng<color> ho芻 <color=blue>Thi誸 Quy襫 Di猰 La<color>, s� l蕐 頲 <color=red>'竚 kh� ph�'<color>.", "Bc 6: Tr� v� <color=blue>ph遪g 竚 kh�<color>, giao <color=red>'竚 kh� ph�'<color> cho <color=blue>Л阯g Nh祅<color>, ho祅 th祅h nhi謒 v�. N誹 竚 kh� ph� b� m蕋, ph秈 th鵦 hi謓 nhi謒 v� l筰 t� u.")
end;


function v7()
Talk(6, "", "Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� <color=blue>Thi猲 Th� Th莕 V�<color>, thu薾 l頸 xu蕋 s�.<enter>Ti誴 nh薾 nhi謒 v� c莕 ph秈 l�  t� c蕄 50 v�  ho祅 th祅h nhi謒 v� 竚 kh� ph� ","Bc 1: дn <color=blue>ph遪g kh竎h<color> g苝 <color=blue>Chng m玭 Л阯g C鮱<color>, ti誴 nh薾 nhi謒 v�, n <color=blue>Tr骳 T� ng<color> 畂箃 l筰 <color=red>Th蕋 Tinh Tuy謙 M謓h ki誱<color>.", "Bc 2: дn <color=blue>t莕g 1 Tr骳 T� ng<color> nh b筰 <color=blue>M穘g H竛 u l躰h<color>, s� l蕐 頲 <color=red>Ch譨 kh鉧 l猲 t莕g 2<color>.", "Bc 3: дn <color=blue>t莕g 2 Tr骳 T� ng<color> nh b筰 <color=blue>M穘g H竛 u l躰h<color> ho芻 <color=blue>觤 T譶h h�<color>, s� l蕐 頲 <color=red>Ch譨 kh鉧 l猲 t莕g 3<color>.", "Bc 4: дn <color=blue>t莕g 3 Tr骳 T� ng<color>, c� 2 chi誧 <color=blue>B秓 rng <color>, trong  c� 1 chi誧 ch鴄 <color=red>Th蕋 Tinh Tuy謙 M謓h ki誱<color>.", "Bc 5: Tr� l筰 <color=blue>ph遪g kh竎h<color>, giao <color=red>Th蕋 Tinh Tuy謙 M謓h ki誱<color> cho <color=blue>Chng m玭 Л阯g C鮱<color>, ho祅 th祅h nhi謒 v�. N誹 Th蕋 Tinh Tuy謙 m謓h ki誱 b� m蕋, ph秈 th鵦 hi謓 nhi謒 v� l筰 t� u.")
end;

function v8()
Talk(3,"","Sau khi tr飊g ph秐 s� m玭, ngi 頲 phong l� <color=blue>L鬰 C竎 Trng L穙<color>, h鋍 頲 tuy謙 h鋍 tr蕁 ph竔 <color=blue>Ti觰 L� Phi o, Thi猲 La мa V鈔g, T竛 Hoa Ti猽<color>.","Bc 1: Sau khi ng c蕄 t h琻 60,  n <color=blue> Ph遪g kh竎h <color> g苝 <color=blue>Chng m玭 Л阯g C鮱<color>, xin 頲 tr飊g ph秐 Л阯g M玭.","Bc 2: Th玭g qua giao n閜 <color=red>50000 lng<color>, tr飊g ph秐 Л阯g M玭.")
end;

--------------------------------

function ok()
end;
