-- 西山村 不醒人士 对话脚本
-- 李欣 2005-01-25

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\xishancun\\xishancun_head.lua")

COUNT_SHENMI_JUANZHOU = 100;

function main()
--	Uworld1064 = nt_getTask(1064) --西山村西山屿任务
--	
--	if ( GetLevel() >= 100) then
--	
--		if ( Uworld1064 == 0 ) then	-- 接任务前对话
--			Describe(DescLink_BuXingRenShi.."<#>：糖葫芦，好吃的糖葫芦啦！便宜又好吃的糖葫芦啦，这位客官，看你很面生，不是我们西山村的人吧！来串糖葫芦吧？<enter>",
--			2,"向他打探西山屿的秘密/task002","还是来串糖葫芦吧/task001");
--		elseif ( Uworld1064 == 1 ) then	--接任务后对话
--			Describe(DescLink_BuXingRenShi..format("<#>：%d个神秘卷轴你已经收集齐了吗？<enter>", COUNT_SHENMI_JUANZHOU),
--			2,"将神秘卷轴交给不醒人士/task004","我还是过阵子再来找你/no")
--		elseif ( Uworld1064 >= 2 ) then  --已经完成任务
--			Say("不醒人士：你去西山屿后，一定要处处留心呀。",0)
--		end;
--		
--	else
		Describe(DescLink_BuXingRenShi.."<#>: H� l� ng鋞 r� y! V� kh竎h quan n祔 nh譶 l� m苩 nh�? Ch綾 kh玭g ph秈 ngi th玭 T﹜ S琻 ch髇g ta. Mua m閠 x﹗ h� l� 甶!<enter>",
		1,"Mua k裲 h� l� /task001");
--	end

end;

function task001()
	local name = GetName()
	Talk(1,"",name..": X﹗ k裲 h� l� n祔 ngon qu� 甶!")
end;
function task002()
	local name = GetName()
	Describe(DescLink_BuXingRenShi.."<#>: Ngi t譵 ta c� vi謈 g� kh玭g v藋?<enter>"
				..name..format("<#>: G莕 y ta nghe n鉯 c� ngi c� bi誸 n v� tr� c馻 T﹜ S琻 Фo. C� th� ch� ta c竎h 甶 Vi S琻 Фo 頲 kh玭g?<enter>B蕋  T豱h Nh﹏ S�: L� n祇 ngi trong th玭 nhi襲 ngi bi誸 th� sao, xem ra chuy謓 n祔  b� l� ra ngo礽 giang h� r錳. Ch� c� 甶襲 y l� vi謈 c馻 h祅g ch鬰 n╩ trc, i hi謕 ph秈 thu th藀  %d m藅  th莕 b� cho ta th� ta m韎 nh� l筰 頲<enter>", COUNT_SHENMI_JUANZHOU),
				2,"Л頲! Ta s� 甶 t譵 ngay/task003","Ta kh玭g h鴑g th� t� n祇/no")
end;

function	task003()
	Uworld1064 = nt_getTask(1064)
	nt_setTask(1064,1)
end;

-- 神秘卷轴交付界面
function	task004()
GiveItemUI( "Giao di謓 giao M藅 ", format("B蕋 T豱h Nh﹏ S�: Ngi h穣 b� %d m藅  th莕 b� v祇 � tr鑞g b猲 di. Ch� �: N誹 nh� b� nhi襲 hay 輙 h琻 s� lng %d m藅  th莕 b� ta s� kh玭g nh薾 u.", COUNT_SHENMI_JUANZHOU,COUNT_SHENMI_JUANZHOU), "juanzhou", "no" );
end;

-- 确定神秘卷轴数量函数
function juanzhou(ncount)
	Uworld1064 = nt_getTask(1064)
	local scrollarray = {}
	local scrollcount = 0
	local scrollidx = {}
	local y = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype ==196) then	
			y = y + 1
			scrollidx[y] = nItemIdx;
			scrollarray[i] = GetItemStackCount(nItemIdx)
			scrollcount = scrollcount + scrollarray[i]
		end
	end
	if (y ~= ncount) then
		Say("M藅  th莕 b� ch璦 , ngi h穣 ki觤 tra l筰 xem!", 2, "�! Th� ra t nh莔  ta th� l筰./task004", "в ta ki觤 tra xem sao/no")
		return
	end
	if (scrollcount > COUNT_SHENMI_JUANZHOU) then
		Say(format("Ta ch� c莕 %d M藅 у Th莕 B�, ngi ng a cho ta nhi襲 nh� v藋.", COUNT_SHENMI_JUANZHOU), 2, "�! Th� ra t nh莔  ta th� l筰./task004", "в ta ki觤 tra xem sao/no")
		return
	end
	if (scrollcount < COUNT_SHENMI_JUANZHOU) then
		Say("M藅  th莕 b� ngi giao cho ta kh玭g  th� ph秈, ki觤 tra l筰 xem!", 2, "�! Th� ra t nh莔  ta th� l筰./task004", "в ta ki觤 tra xem sao/no")
		return
	end
	if (scrollcount == COUNT_SHENMI_JUANZHOU) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i])
		end
		nt_setTask(1064,2)
		task005()
	end;		
end;
	
function task005()
	local name = GetName()
	Describe(DescLink_BuXingRenShi..format("<#>: Th藅 kh玭g ng� ngi  thu th藀 %d m藅  th莕 b�, ta c� 甶nh ninh l� ngi th蕐 kh� v� b� 甶 r錳 ch�. T﹜ S琻 Фo nguy hi觤 kh玭 c飊g, ngi kh玭g 甶 th� t鑤 h琻.<enter>",COUNT_SHENMI_JUANZHOU)
	..name..format("<#>: Ngi ng lo l緉g cho ta, ta  t譵  %d m藅  th莕 b� r錳, ta 阯g 阯g l� m閠 i trng phu sao l筰 甶 s� c竔 Vi S琻 Фo b� t�  頲. Ngi c� ch� cho ta c竎h 甶 Vi S琻 Фo 甶.<enter>B蕋 T豱h Nh﹏ S�: Xem ra ta kh玭g khuy猲 gi秈 頲 ngi. Ngi c� th� t譵 Ti觰 Nh� � T﹜ S琻 (214, 195) trong th玭 n祔 v� n鉯 h緉 l� ta b秓 ngi 甶, h緉 s� bi誸 n猲 l祄 th� n祇.  Nh� l� ph秈 h誸 s鴆 c萵 th薾 nh�!<enter>",COUNT_SHENMI_JUANZHOU),
	1,"K誸 th骳 i tho筰/no")
	end;

function no()
end;
