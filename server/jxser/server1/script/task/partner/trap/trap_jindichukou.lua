trap_jindi_trans = { 
{1, 1557, 3112}, {1, 1537, 3237}, {1, 1649, 3287}, {1, 1656, 3167}, 
{11, 3193, 5192}, {11, 3266, 5004}, {11, 3011, 5101}, {11, 3031, 4969}, 
{162, 1669, 3129}, {162, 1696, 3280}, {162, 1472, 3273}, 
{37, 1598, 3000}, {37, 1866, 2930}, {37, 1701, 3224}, {37, 1636, 3191}, 
{78, 1592, 3377}, {78, 1704, 3225}, {78, 1508, 3147}, {78, 1440, 3219}, 
{80, 1670, 2996}, {80, 1598, 3201}, {80, 1722, 3210}, {80, 1834, 3063}, 
{176, 1603, 2917}, {176, 1692, 3296}, {176, 1375, 3337}, {176, 1356, 3017}, 
} 


function main() 
local dpos = random( getn(trap_jindi_trans) ) 
SetFightState(0) 
NewWorld( trap_jindi_trans[dpos][1], trap_jindi_trans[dpos][2], trap_jindi_trans[dpos][3] ) 
end