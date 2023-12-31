-- 各门派武功路线（无需入门便可了解）
-- BY:xiaoyang (2004-11-30)
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")

function Uworld1000_knowmagic()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:  V� h鋍 kh玭g c� c秐h gi韎 t鑙 cao. Th藅 ra v� c玭g c竎 m玭 ph竔 quan tr鋘g nh蕋 v蒼 l� si猲g n╪g luy謓 t藀.",11,
	"Nga My ph竔/Uworld1000_emei",
	"Л阯g M玭/Uworld1000_tangmen",
	"Thi猲 Vng Bang/Uworld1000_tianwang",
	"Thi猲 Nh蒼 Gi竜/Uworld1000_tianren",
	"V� ng ph竔/Uworld1000_wudang",
	"Th髖 Y猲 m玭/Uworld1000_cuiyan",
	"Thi誹 L﹎ ph竔/Uworld1000_shaolin",
	"C竔 Bang/Uworld1000_gaibang",
	"C玭 L玭 ph竔/Uworld1000_kunlun",
	"Ng� чc Gi竜/Uworld1000_wudu",
	"Sau s� h醝 ti誴/no")
end

function Uworld1000_emei()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:Nga Mi l� m玭 ph竔 do n� nhi s竛g l藀.'Nga Mi' v鮝 l� t猲 g鋓 c馻 v� s� t� s竛g l藀 m玭 ph竔 v鮝 l� th竛h a n骾 Nga Mi ",4,
	"Ki誱 T玭g/Uworld1000_emeijianzong",
	"Kh� T玭g/Uworld1000_emeiqizong",
	"H� tr� /Uworld1000_emeifuzhu",
	"Sau s� h醝 ti誴/no")
end

function Uworld1000_tangmen()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Л阯g m玭 h飊g c� Xuy猲 Th鬰, 竚 kh� v� h醓 kh�  l鮪g danh thi猲 h�. Ngi trong giang h� nghe n Л阯g m玭 th秠 u bi課 s綾.",5,
	"Phi o/Uworld1000_tangmenfeidao",
	"N� ti詎/Uworld1000_tangmennujian",
	"Phi Ti猽/Uworld1000_tangmenfeibiao",
	"C筸 b蓎/Uworld1000_tangmenxianjing",
	"Sau s� h醝 ti誴/no")
end

function Uworld1000_tianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ng祔 trc S� Vng Chung Tng kh雐 binh t筰 чng ёnh h�, kh竛g Kim ch鑞g T鑞g! V� sau S� Vng b� s竧 h筰, ngh躠 qu﹏ t玭 Dng Y猽 l祄 th� l躰h, x璶g l� Чi Th竛h Thi猲 Vng! Ngh躠 qu﹏ ph竧 tri觧 th莕 t鑓. V� sau b� Nh筩 Phi ti猽 di謙. Sau n祔 con g竔 Dng y猽 l� Dng Anh tr� l筰 n琲 y, chi猽 t藀 ngh躠 qu﹏, n鑙 ti誴 nghi謕 l韓!",5,
	"o Thi猲 Vng/Uworld1000_daotianwang",
	"Thng Thi猲 Vng/Uworld1000_qiangtianwang",
	"Ch飝 Thi猲 Vng/Uworld1000_chuitianwang",
	"H� tr� /Uworld1000_fuzhutianwang",
	"Sau s� h醝 ti誴/no")
end

function Uworld1000_tianren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi猲 Nh蒼 Gi竜 l� t� ch鴆 c馻 Kim Qu鑓 nh籱 i ph� v韎 V� L﹎ Nh﹏ s� c馻 T鑞g Qu鑓, 頲 phong l� T竧 M穘 Gi竜 Qu鑓 gi竜 c馻 Чi Kim, gi竜 ch� l� Kim Qu鑓 Qu鑓 s� Ho祅 Nhan H飊g Li謙, cao th� trong gi竜 nhi襲 v� s�, c遪 chi猽 m� th猰 ph秐  Ch輓h ph竔 v� T� ph竔 c馻 T鑞g Qu鑓",4,
	"Chi課 Nh蒼/Uworld1000_zhanren",
	"Ma Nh蒼/Uworld1000_moren",
	"Ch� Nh蒼/Uworld1000_zuzhouren",
	"Sau s� h醝 ti誴/no")
end

function Uworld1000_wudang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: V� ng s琻 c遪 g鋓 l� Th竔 H遖 s琻, 頲 m謓h danh l�:'Trung Qu鑓 o gi竜 danh s琻'. V� ng ph竔 頲 phong l� 'Huy襫 Thi猲 Tr蕁 V� Чi д'. V� ng ph竔  c� l辌h s� l﹗ i. S竛g l藀 m玭 ph竔 l� t� s� 'L筽 Th竝 o nh﹏' Trng Tam Phong",4,
	"Ki誱 T玭g/Uworld1000_wudangjianzong",
	"Kh� T玭g/Uworld1000_wudangqizong",
	"H� tr� /Uworld1000_wudangfuzhu",
	"Sau s� h醝 ti誴/no")
end

function Uworld1000_cuiyan()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:L� 1 m玭 ph竔 th莕 b� � V﹏ Nam, tng truy襫 T� s� l藀 ph竔 l� 1 v� n� hi謕 b� t譶h nh﹏ ph� r蓎, b� 甶 萵 c�  qu猲 h誸 s� i? n v飊g n骾 bi猲 th飝 V﹏ Nam xa x玦 h蝟 l竛h,tr猲 阯g 甶 Ngi g苝 nhi襲 c� nhi b� b� r琲 甧m v� nu玦 dng v� truy襫 th� v� c玭g.Th髖 Y猲 m玭 v� Л阯g M玭 c飊g x璶g l� 'V� L﹎ Nh� M玭', ch� ti誧 l� h祅h tung th莕 b� n猲 x璦 nay 輙 Nam t� h竛 n祇 頲 th醓 ni襪 mong c.Th髖 Y猲 m玭 cu鑙 c飊g l� Thi猲 阯g hay мa ng鬰.",4,
	"Кn o/Uworld1000_cuiyandandao",
	"Song 產o/Uworld1000_cuiyanshuangdao",
	"H� tr� /Uworld1000_cuiyanfuzhu",
	"в ta suy ngh� l筰!/no")
end

function Uworld1000_shaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi誹 L﹎ T� s竛g l藀 t� th阨 B綾 Ng魕 Hi誹 V╪ д N╩ Th竔 H遖 th� 19 (C玭g Nguy猲 n╩ 495) ",5,
	"Quy襫 Thi誹 L﹎/Uworld1000_quanshaolin",
	"C玭 Thi誹 L﹎/Uworld1000_gunshaolin",
	"o Thi誹 L﹎/Uworld1000_daoshaolin",
	"H� tr� /Uworld1000_shaolinfuzhu",
	"в ta suy ngh� l筰!/no")
end

function Uworld1000_gaibang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: L辌h s� c馻 C竔 Bang n鉯 ra r蕋 d礽, 頲 m謓h danh Thi猲 H� е Nh蕋 Bang. C竔 Bang bang ch髇g nh� Ng鋋 h� t祅g long nh﹏ t礽 v� s�.",4,
	"Chng C竔/Uworld1000_zhanggai",
	"C玭 C竔/Uworld1000_gungai",
	"H� tr� /Uworld1000_gaibangfuzhu",
	"в ta suy ngh� l筰!/no")
end

function Uworld1000_kunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: C玭 L玭 ph竔 � t薾 T﹜ V鵦, tuy 頲 s竛g l藀  l﹗ nh璶g sau khi S� T� khai ph竔 qua i, trong ph竔 kh玭g c� ai l� xu蕋 ch髇g. M穒 cho n h琻 tr╩ n╩ trc, C玭 Lu﹏ ph竔 xu蕋 hi謓 m閠 v� k� nh﹏. Ngi n祔 kh玭g nh鱪g t筼 頲 uy danh l鮪g l蓎 trong v� l﹎ Trung Nguy猲 m� c遪 gi髉 t猲 tu鎖 c馻 C玭 Lu﹏ b総 u lan r閚g kh緋 v� l﹎.",5,
	"o C玭 L玭/Uworld1000_daokunlun",
	"Ki誱 C玭 L玭/Uworld1000_jiankunlun",
	"B颽 ch� /Uworld1000_zuzhoukunlun",
	"H� tr� /Uworld1000_kunlunfuzhu",
	"в ta suy ngh� l筰!/no")
end

function Uworld1000_wudu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: B鎛 gi竜 ch� m韎 th祅h l藀 v礽 n╩ nay nh璶g ph竧 tri觧 r蕋 m筺h. Ng� чc gi竜 t� ch鴆 nghi猰 ng苩, Gi竜 ch� s竛g l藀 ph竔 H綾 Di謓 Lang Qu﹏. Ng� чc gi竜 l� 1 t� ch鴆 th莕 b�, ngi trong giang h� nghe n u bi課 s綾. T玭 ch� c馻 Ng� чc gi竜 l� 'L頸 輈h quy誸 nh b筺 th�', c� l頸 m韎 l祄, kh玭g qu秐 b蕋 k� chuy謓 th� phi ch輓h t�. Ng� чc gi竜 c遪 c� 1 甶襲 l� 'K� c t閕 v韎 Ng� чc gi竜, s� ch誸 kh玭g to祅 th﹜'.",5,
	"Chng c/Uworld1000_zhangdu",
	"o c/Uworld1000_daodu",
	"B颽 ch� /Uworld1000_zuzhouwudu",
	"H� tr� /Uworld1000_wudufuzhu",
	"в ta suy ngh� l筰!/no")
end

function Uworld1000_emeijianzong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ki誱 T玭g: Nh蕋 Di謕 Tri Thu (Nh藀 m玭) , Nga Mi Ki誱 Ph竝 (c蕄 10) , Th玦 Song V鋘g Nguy謙 (c蕄 30) , B蕋 Di謙 B蕋 Tuy謙 (c蕄 60) , Ph藅 Ph竝 V� Bi猲 (tr蕁 ph竔) , Tam Nga T� Tuy誸 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_emeiqizong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Kh� T玭g: Phi猽 Tuy誸 Xuy猲 V﹏ (Nh藀 m玭) , Nga Mi Chng Ph竝 (c蕄 10) , T� Tng уng Quy (c蕄 30) , Ph藅 Quang Ph� Chi誹 (c蕄 60) , Ph藅 Ph竝 V� Bi猲 (tr蕁 ph竔) , Phong Sng To竔 秐h (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_emeifuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: V� c玭g h� tr�: T� H祅g Ph� ч (c蕄 20) , M閚g 謕 (c蕄 30) , L璾 Th駓 (c蕄 40) , Ph藅 T﹎ T� H鱱 (c蕄 50) , Thanh  Ph筺 Xng (c蕄 60) , Ph� ч Ch髇g Sinh (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_tangmenfeidao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Phi 產o: T輈h L辌h Кn (Nh藀 m玭) , Л阯g M玭 竚 Kh� (c蕄 10) , Truy T﹎ Ti詎 (c蕄 30) , Ti觰 L� Phi 產o (c蕄 60) , T﹎ Nh穘 (tr蕁 ph竔) , Nhi誴 H錸 Nguy謙 秐h (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_tangmennujian()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: T� Ti詎: T輈h L辌h Кn (Nh藀 m玭) , Л阯g M玭 竚 Kh� (c蕄 10) , M筺 Thi猲 Hoa V� (c蕄 30) , Thi猲 La мa V鈔g (c蕄 60) , T﹎ Nh穘 (tr蕁 ph竔) , B筼 V� L� Hoa (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_tangmenfeibiao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Phi Ti猽: T輈h L辌h Кn (Nh藀 m玭) , Л阯g M玭 竚 Kh� (c蕄 10) , 箃 H錸 Ti猽 (c蕄 30) , T秐 Hoa Ti猽 (c蕄 60) , T﹎ Nh穘 (tr蕁 ph竔) , C鰑 Cung Phi Tinh (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_tangmenxianjing()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: C筸 b蓎: мa Di謒 H醓 (c蕄 10) , чc Th輈h C鑤 (c蕄 20) , Xuy猲 T﹎ Th輈h (c蕄 30) , H祅 B╪g Th輈h (c蕄 40) , L玦 K輈h Thu藅 (c蕄 50) , Lo筺 ho祅 K輈h (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_daotianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi猲 Vng o: Kinh L玦 Tr秏 (Nh藀 m玭) , Thi猲 Vng o ph竝 (c蕄 10) , B竧 Phong Tr秏 (c蕄 30) , V� T﹎ Tr秏 (c蕄 60) , Thi猲 Vng Chi課 � (tr蕁 ph竔) , Ph� Thi猲 Tr秏 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_qiangtianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi猲 Vng Thng: H錳 Phong L筩 Nh筺 (Nh藀 m玭) , Thi猲 Vng Thng ph竝 (c蕄 10) , Dng Quan Tam 謕 (c蕄 30) , Huy誸 Chi課 B竧 Phng (c蕄 60) , Thi猲 Vng Chi課 � (tr蕁 ph竔) , Truy Tinh Tr鬰 Nguy謙 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_chuitianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi猲 Vng Ch飝: Tr秏 Long Quy誸 (Nh藀 m玭) , Thi猲 Vng Ch飝 ph竝 (c蕄 10) , H祅g V﹏ Quy誸 (c蕄 30) , Th鮝 Long Quy誸 (c蕄 60) , Thi猲 Vng Chi課 � (tr蕁 ph竔) , Truy Phong Quy誸 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_fuzhutianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: H� tr�: T躰h T﹎ Quy誸 (c蕄 20) , 筺 H錸 Th輈h (c蕄 40) , Kim Chung Tr竜 (c蕄 50) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_zhanren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Chi課 Nh蒼: T祅 Dng Nh� Huy誸 (Nh藀 m玭) , Thi猲 Nh蒼 M﹗ Ph竝 (c蕄 10) , Li謙 H醓 T譶h Thi猲 (c蕄 30) , Th﹗ Thi猲 Ho竛 Nh藅 (c蕄 60) , Thi猲 Ma Gi秈 Th� (tr蕁 ph竔) , V﹏ Long K輈h (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_moren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:Ma Nh蒼: Кn Ch� Li謙 Di謒 (Nh藀 m玭) , Thi猲 Nh蒼 o Ph竝 (c蕄 10) , Th玦 S琻 襫 H秈 (c蕄 30) , Ma Di謒 Th蕋 S竧 (c蕄 60) , Thi猲 Ma Gi秈 Th� (tr蕁 ph竔) , Thi猲 Ngo筰 L璾 Tinh (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_zuzhouren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: B颽 Ch�: H醓 Li猲 Ph莕 Hoa (c蕄 10) , 秓 秐h Phi H� (c蕄 20) , Phi H錸g V� T輈h (c蕄 30) , Bi T� Thanh Phong (c蕄 40) , L辌h Ma 箃 H錸 (c蕄 50) , Nhi誴 H錸 Lo筺 T﹎ (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_wudangjiancong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ki誱 T玭g: Thng H秈 Minh Nguy謙 (Nh藀 m玭) , V� ng Ki誱 Ph竝 (c蕄 10) , Ki誱 Phi Kinh Thi猲 (c蕄 30) , Tam Ho祅 Thao Nguy謙 (c蕄 60) , Th竔 C鵦 Th莕 C玭g (tr蕁 ph竔) , Nh﹏ Ki誱 H頿 Nh蕋 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_wudangqizong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Kh� T玭g: N� L玦 Ch� (Nh藀 m玭 ) , V� ng Quy襫 Ph竝 (c蕄 10) , B竎 C蕄 Nhi Ph鬰 (c蕄 30) , V� Ng� V� Ki誱 (c蕄 60) , Th竔 C鵦 Th莕 C玭g (tr蕁 ph竔) , Thi猲 мa V� C鵦 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_wudangfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: V� c玭g H� tr�:  Th蕋 Tinh Tr薾 (c蕄 20) , Th� V﹏ Tung (c蕄 40) , T鋋 V鋘g V� Ng� (c蕄 50) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_cuiyandandao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Кn o: Phong Hoa Tuy誸 Nguy謙 (Nh藀 m玭) , Th髖 Y猲 o Ph竝 (c蕄 10) , V� Ф L玦 Hoa (c蕄 30) , M鬰 D� L璾 Tinh (c蕄 60) , B╪g C鑤 Tuy誸 T﹎ (tr蕁 ph竔) , B╪g Tung V� 秐h (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_cuiyanshuangdao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Song o: Phong Quy觧 T祅 Tuy誸 (Nh藀 m玭) , Th髖 Y猲 Song o (c蕄 10) , Ph� V﹏ T竛 Tuy誸 (c蕄 30) , B輈h H秈 Tri襲 Sinh (c蕄 60) , B╪g C鑤 Tuy誸 T﹎?tr蕁 ph竔) , B╪g T﹎ Ti猲 T�  c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_cuiyanfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: H� tr�: B╪g T﹎ Tr竔 秐h (c蕄 20) , H� Th� H祅 B╪g (c蕄 40) , Tuy誸 秐h (c蕄 50) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_quanshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi誹 L﹎ Quy襫: H祅g Long B蕋 V� (Nh藀 m玭) , Thi誹 L﹎ Quy襫 Ph竝 (c蕄 10) , La H竛 Tr薾 (c蕄 30) , Long Tr秓 H� Tr秓 (c蕄 50) , Nh� Lai Thi猲 Di謕 (tr蕁 ph竔) , Чt Ma ч Giang (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_gunshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi誹 L﹎ C玭: Kim Cang Ph鬰 Ma (Nh藀 m玭) , Thi誹 L﹎ C玭 Ph竝 (c蕄 10) , La H竛 Tr薾 (c蕄 30) , Ho祅h T秓 L鬰 H頿 (c蕄 50) , Nh� Lai Thi猲 Di謕 (tr蕁 ph竔) , Ho祅h T秓 Thi猲 Qu﹏ (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_daoshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi誹 L﹎ o: Kim Cang Ph鬰 Ma (Nh藀 m玭) , Thi誹 L﹎ o Ph竝 (c蕄 10) , La H竛 Tr薾 (c蕄 30) , Ma Ha V� Lng (c蕄 50) , Nh� Lai Thi猲 Di謕 (tr蕁 ph竔) , V� Tng Tr秏 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_shaolinfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: H� tr�: B蕋 ng Minh Vng (c蕄 20) , S� T� H鑞g (c蕄 40) , D辌h C﹏ Kinh (c蕄 60) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_zhanggai()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Chng C竔: Ki課 Nh﹏ Th莕 Th� (Nh藀 m玭) , C竔 Bang Chng Ph竝 (c蕄 10) , Gi竛g Long Chng (c蕄 30) , Kh竛g Long H鱱 H鑙 (c蕄 50) , T髖 謕 Cu錸g V� (tr蕁 ph竔) , Phi Long T筰 Thi猲 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_gungai()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: C玭 C竔: Duy猲 M玭 Th竎 B竧 (Nh藀 m玭) , C竔 Bang B鎛g Ph竝 (c蕄 10) , Ф C萿 Tr薾 (c蕄 30) , B鎛g Ф 竎 C萿 (c蕄 50) , T髖 謕 Cu錸g V� (tr蕁 ph竔) , Thi猲 H� V� C萿 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_gaibangfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: H� tr�: H鉧 Hi觤 Vi Di (c蕄 20) , Ho箃 B蕋 L璾 Th� (c蕄 40) , Ti猽 Di猽 C玭g (c蕄 60) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_daokunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: o C玭 L玭: H� Phong Ph竝 (Nh藀 m玭) , o C玭 L玭 ph竝 (c蕄 10) , Nh蕋 Kh� Tam Thanh (c蕄 30) , Cu錸g Phong S藆 謓 (c蕄 50) , Sng Ng筼 C玭 L玭 (tr蕁 ph竔) , Ng筼 Tuy誸 Ti猽 Phong (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_jiankunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ki誱 C玭 L玭: Cu錸g L玦 Ch蕁 мa (Nh藀 m玭) , Ki誱 C玭 L玭 Ph竝 (c蕄 10) , Thi猲 T� T蕁 L玦 (c蕄 30) , Ng� L玦 Ch輓h Ph竝 (c蕄 60) , Sng Ng筼 C玭 L玭 (tr蕁 ph竔) , L玦 ng C鰑 Thi猲 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_zuzhoukunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: B颽 Ch�: Th骳 Phc Ch� (c蕄 10) , Ky B竛 Ph� (c蕄 20) , B綾 Minh Цo H秈 (c蕄 30) , Khi H祅 Ng筼 Tuy誸 (c蕄 40) , M� Tung 秓 秐h (c蕄 50) , T髖 Ti猲 T� C鑤 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_kunlunfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: H� tr�: Thanh Phong Ph� (c蕄 10) , Thi猲 Thanh мa Tr鋍 (c蕄 30) , Kh� T﹎ Ph� (c蕄 40) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_zhangdu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Chng чc: чc Sa Chng (Nh藀 m玭) , Ng� чc Chng Ph竝 (c蕄 10) , U Minh Kh� L﹗ (c蕄 30) , Thi猲 Cng мa S竧 (c蕄 60) , Ng� чc K� Kinh (tr蕁 ph竔) ,  Phong Th鵦 C鑤 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_daodu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: o чc: Huy誸 o чc S竧 (Nh藀 m玭) , Ng� чc o Ph竝 (c蕄 10) , B竎h чc Xuy猲 T﹎ (c蕄 30) , Chu C竝 Thanh Minh (c蕄 60) , Ng� чc K� Kinh (tr蕁 ph竔) , Huy襫  Tr秏 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_zuzhouwudu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: B颽 Ch�: C鰑 Thi猲 Cu錸g L玦 (c蕄 10) , X輈h Di謒 Th鵦 Thi猲 (c蕄 20) , B╪g Lam Huy襫 Tinh (c蕄 30) , Xuy猲 Y Ph� Gi竝 (c蕄 40) , Xuy猲 T﹎ чc Th輈h (c蕄 50) , 筺 C﹏ H� C鑤 (c蕄 90) .",1,"Sau s� quay l筰/no")
end

function Uworld1000_wudufuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: V� c玭g H� tr�:  T筽 Nan Dc Kinh (c蕄 20) , V� H譶h чc (c蕄 30) , V筺 чc Th鵦 T﹎ (c蕄 40) .",1,"Sau s� quay l筰/no")
end



function no()
end
