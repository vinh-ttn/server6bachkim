IncludeLib("SETTING")

m_CauCa = {
	Timer = {
		Idx = 0,
		CallNpc1 = 0,
		reCall = 5*60,
	},
	
	State = {
		ID = 0,
		Mes = {
			[1] = "'Giun ��t' l� m�t trong nh�ng m�i c�u c�c k� h�u hi�u, nghe ��n g�n ��y su�t hi�n r�t nhi�u � Chu Ti�n Tr�n.",
			[2] = "M�t l��ng l�n c� �ang h��ng v� th��ng ngu�n, nghe ng� d�n ��n ��i chu�n b� �i qua v�ng s�ng su�i � Chu Ti�n Tr�n.",
			[8] = "V�i s� n�o nhi�t c�a ng� d�n v� c�n th�, ��n c� t�i Chu Ti�n Tr�n ...�� b� �i h�t!!!",
		},
	},
	
	Pos = {
		Map = {100},
		NPC = {
			Name = "C�n Th� L�o Nh�n",
			Pos = {{1625, 3167}},
		},
		GiunDat = {
			Name = "Giun ��t",
			Pos = {{100, 1625, 3186},{100, 1633, 3190}, {100, 1637, 3210}, {100, 1648, 3231}, {100, 1661, 3241}, {100, 1677, 3243}, {100, 1687, 3244}, {100, 1695, 3247}, {100, 1707, 3241}, {100, 1696, 3219}, {100, 1725, 3226}, {100, 1710, 3206}, {100, 1696, 3193}, {100, 1688, 3205}, {100, 1694, 3215}, {100, 1678, 3237}, {100, 1640, 3230}, {100, 1648, 3237}, {100, 1655, 3248}, {100, 1630, 3219}, {100, 1623, 3214}, {100, 1620, 3207}, {100, 1632, 3187}, {100, 1614, 3172}, {100, 1626, 3142}, {100, 1631, 3149}, {100, 1617, 3135}, {100, 1609, 3128}, {100, 1599, 3118}, {100, 1595, 3114}, {100, 1606, 3097}, {100, 1621, 3109}, {100, 1634, 3126}, {100, 1654, 3127}, {100, 1650, 3170}, {100, 1642, 3161}, {100, 1644, 3163}, {100, 1653, 3174}, {100, 1655, 3169}, {100, 1659, 3171}, {100, 1660, 3174}, {100, 1661, 3182}, {100, 1664, 3184}, {100, 1668, 3183}, {100, 1670, 3181}, {100, 1681, 3171}, {100, 1683, 3132}, {100, 1680, 3095}, {100, 1676, 3095}, {100, 1704, 3120}, {100, 1706, 3120}, {100, 1708, 3123}, {100, 1716, 3135}, {100, 1720, 3133}, {100, 1725, 3145}, {100, 1707, 3150}, {100, 1709, 3155}, {100, 1708, 3154}, {100, 1712, 3159}, {100, 1717, 3161}, {100, 1718, 3165}, {100, 1721, 3165}, {100, 1721, 3168}, {100, 1723, 3170}, {100, 1742, 3165}, {100, 1745, 3164}, {100, 1748, 3164}, {100, 1750, 3164}, {100, 1752, 3165}, {100, 1751, 3169}, {100, 1748, 3170}, {100, 1746, 3172}, {100, 1743, 3175}, {100, 1741, 3178}, {100, 1734, 3180}, {100, 1882, 3196}, {100, 1875, 3193}, {100, 1871, 3188}, {100, 1863, 3180}, {100, 1849, 3166}, {100, 1842, 3159}, {100, 1834, 3156}, {100, 1825, 3163}, {100, 1821, 3170}, {100, 1815, 3175}, {100, 1808, 3182}, {100, 1803, 3186}, {100, 1788, 3203}, {100, 1783, 3209}, {100, 1775, 3218}, {100, 1769, 3215}, {100, 1764, 3208}, {100, 1758, 3191}, {100, 1744, 3231}, {100, 1750, 3237}, {100, 1756, 3240}, {100, 1760, 3248}, {100, 1760, 3255}, {100, 1772, 3250}, {100, 1781, 3241}, {100, 1797, 3228}, {100, 1803, 3228}, {100, 1808, 3215}, {100, 1817, 3205}, {100, 1823, 3197}, {100, 1830, 3190}, {100, 1832, 3189}, {100, 1836, 3186}, {100, 1839, 3188}, {100, 1848, 3198}, {100, 1856, 3207}, {100, 1860, 3211}, {100, 1867, 3219}, {100, 1871, 3222}, {100, 1874, 3225}, {100, 1872, 3233}, {100, 1880, 3239}, {100, 1886, 3222}, {100, 1890, 3220}, {100, 1896, 3213}, {100, 1909, 3202}, {100, 1915, 3194}, {100, 1931, 3190}, {100, 1929, 3191}, {100, 1934, 3191}, {100, 1934, 3196}, {100, 1933, 3200}, {100, 1568, 3180}, {100, 1562, 3186}, {100, 1571, 3179}, {100, 1575, 3181}, {100, 1577, 3185}, {100, 1565, 3195}, {100, 1544, 3204}, {100, 1538, 3215}, {100, 1531, 3210}, {100, 1534, 3208}, {100, 1527, 3218}, {100, 1523, 3215}, {100, 1517, 3217}, {100, 1512, 3219}, {100, 1509, 3212}, {100, 1506, 3213}, {100, 1504, 3205}, {100, 1500, 3204}, {100, 1497, 3200}, {100, 1494, 3199}, {100, 1491, 3204}, {100, 1485, 3197}, {100, 1476, 3187}, {100, 1472, 3185}, {100, 1466, 3181}, {100, 1462, 3172}, {100, 1458, 3170}, {100, 1452, 3150}, {100, 1449, 3142}, {100, 1467, 3120}, {100, 1486, 3125}, {100, 1488, 3137}, {100, 1492, 3139}, {100, 1495, 3144}, {100, 1499, 3150}, {100, 1504, 3151}, {100, 1505, 3156}, {100, 1504, 3157}, {100, 1507, 3160}, {100, 1516, 3151}, {100, 1517, 3159}, {100, 1517, 3164}, {100, 1522, 3161}, {100, 1527, 3159}, {100, 1532, 3152}, {100, 1536, 3147}, {100, 1537, 3153}, {100, 1541, 3153}, {100, 1546, 3149}, {100, 1548, 3145}, {100, 1548, 3141}, {100, 1556, 3133}, {100, 1561, 3122}, {100, 1569, 3118}, {100, 1576, 3113}, {100, 1646, 2998}, {100, 1647, 3013}, {100, 1680, 3011}, {100, 1673, 3020}, {100, 1671, 3025}, {100, 1666, 3031}, {100, 1658, 3037}, {100, 1653, 3032}, {100, 1647, 3023}, {100, 1647, 3015}, {100, 1645, 3012}, {100, 1643, 3010}, {100, 1643, 3005}, {100, 1645, 3003}, {100, 1647, 3006}, {100, 1646, 3000}, {100, 1646, 2995}, {100, 1769, 2877}, {100, 1768, 2876}, {100, 1763, 2876}, {100, 1764, 2879}, {100, 1766, 2883}, {100, 1768, 2889}, {100, 1768, 2891}, {100, 1767, 2895}, {100, 1771, 2897}, {100, 1772, 2903}, {100, 1772, 2908}, {100, 1774, 2912}, {100, 1776, 2914}, {100, 1778, 2920}, {100, 1778, 2923}, {100, 1777, 2924}, {100, 1776, 2929}, {100, 1778, 2933}, {100, 1777, 2938}, {100, 1785, 2943}, {100, 1789, 2942}, {100, 1793, 2954}, {100, 1804, 2945}, {100, 1805, 2946}, {100, 1804, 2948}, {100, 1802, 2982}, {100, 1799, 2986}, {100, 1801, 2986}, {100, 1801, 2988}, {100, 1803, 2990}, {100, 1802, 2993}, {100, 1804, 2991}, {100, 1804, 2995}, {100, 1805, 2993}, {100, 1805, 2997}, {100, 1808, 2998}, {100, 1811, 3000}, {100, 1812, 3002}, {100, 1811, 3004}, {100, 1814, 3004}, {100, 1818, 3006}, {100, 1818, 3002}, {100, 1819, 2998}, {100, 1821, 3000}, {100, 1821, 2995}, {100, 1823, 2993}, {100, 1825, 2992}, {100, 1824, 2988}, {100, 1824, 2983}, {100, 1822, 2981}, {100, 1821, 2982}, },
		},
		ThaCau = {{100, 1557, 3166}, {100, 1593, 3132}, {100, 1605, 3143}, {100, 1615, 3154}, {100, 1646, 3188}, {100, 1659, 3199}, {100, 1677, 3194}, {100, 1694, 3180}, {100, 1706, 3172}, {100, 1714, 3180}, {100, 1726, 3195}},
		ThaCau_Feature = {{1619, 3155, 5},{1629, 3164, 5},{1638, 3175, 5},{1669, 3182, 5},{1682, 3170, 4},{1720, 3180, 8},},
	}
}

function m_CauCa:ChangeFeature()
	local a_w, a_x, a_y = GetWorldPos()
	local b = 0
	
	for _i = 1, getn(self.Pos.ThaCau_Feature) do
		if ((self.Pos.ThaCau_Feature[_i][1] + self.Pos.ThaCau_Feature[_i][3]) < a_x or (self.Pos.ThaCau_Feature[_i][1] - self.Pos.ThaCau_Feature[_i][3]) > a_x) 
			or ((self.Pos.ThaCau_Feature[_i][2] + self.Pos.ThaCau_Feature[_i][3]) < a_y or (self.Pos.ThaCau_Feature[_i][2] - self.Pos.ThaCau_Feature[_i][3]) > a_y) then
			b = b + 1
		else
			b = 0
			break
		end
	end

end

function m_CauCa:isCantBegin()
	local a_w, a_x, a_y = GetWorldPos()
	local b, c = 14, 0
	
	if self.State.ID <= 1 then
		Talk(1, "", "C�u c� ph�i ��ng th�i gian v� ��a �i�m, gi� n�y �i c�u s� kh�ng c� c�, t�t nh�t n�n � nh�!")
		return 1
	end
	
	if self.Pos.Map[1] ~= a_w then
		Talk(1, "","Nh�n quanh khu v�c n�y l� bi�t kh�ng c� c�, l� m�t c�n th� ph�i bi�t c�ch quan s�t!")
		return 1
	end
	
	for _i = 1, getn(self.Pos.ThaCau) do
		if ((self.Pos.ThaCau[_i][2] + b) < a_x or (self.Pos.ThaCau[_i][2] - b) > a_x) or ((self.Pos.ThaCau[_i][3] + b) < a_y or (self.Pos.ThaCau[_i][3] - b) > a_y) then
			c = c + 1
		else
			c = 0
			break
		end
	end
	
	if c ~= 0 then
		Talk(1, "", "Khu v�c n�y kh�ng c� c�, �ang ti�n h�nh di chuy�n ��n khu v�c �ang c� nhi�u c� nh�t �� ti�n h�nh c�u!")
		local d = random(1, getn(self.Pos.ThaCau))
		ST_SyncMiniMapObj(self.Pos.ThaCau[d][2]*32, self.Pos.ThaCau[d][3]*32)
		return 1
	end
	
	return nil
end







