
// START: soulja gunz

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m1911"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m1911_mag",RANGE(3,6)));
_mil_1911 = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_mx991_m1911"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m1911_mag",RANGE(3,6)));
_mil_1911_light = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_hp"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_hp_mag",RANGE(3,6)));
_mil_hpauto = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_mk22"));
ADD_TO_LOOTGROUP(_group, ITEM("vn_s_mk22"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_mk22_mag",RANGE(3,6)));
_mil_mk22 = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m2carbine"));
ADD_TO_LOOTGROUP(_group, ITEM("vn_b_carbine"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_carbine_30_mag",RANGE(4,6)));
_mil_m2carbine = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m1carbine_gl"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_carbine_15_mag",RANGE(6,8)));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_22mm_m17_frag_mag",RANGE(2,4)));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_22mm_m19_wp_mag",RANGE(2,4)));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_22mm_lume_mag",RANGE(2,4)));
_mil_m1carbine_gl = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m14"));
ADD_TO_LOOTGROUP(_group, ITEM("vn_b_m14"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m14_mag",RANGE(6,8)));
_mil_m14 = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m16"));
ADD_TO_LOOTGROUP(_group, ITEM("vn_b_m16"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m16_20_mag",RANGE(6,8)));
_mil_m16 = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m16_xm148"));
ADD_TO_LOOTGROUP(_group, ITEM("vn_b_m16"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m16_20_mag",RANGE(6,8)));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_40mm_m406_he_mag",RANGE(6,8)));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_40mm_m680_smoke_w_mag",RANGE(4,6)));
_mil_m16_gl = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_xm177_camo"));
ADD_TO_LOOTGROUP(_group, ITEM("vn_o_4x_m16"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m16_20_mag",RANGE(3,4)));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m16_30_mag",RANGE(4,6)));
_mil_xm177 = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m60"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m60_100_mag",RANGE(4,6)));
_mil_m60 = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m63a_lmg"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m63a_100_t_mag",RANGE(4,6)));
_mil_m63a = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m45"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m45_mag",RANGE(4,6)));
_mil_m45 = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m79"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_40mm_m406_he_mag",RANGE(12,18)));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_40mm_m397_ab_mag",RANGE(4,6)));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_40mm_m680_smoke_w_mag",RANGE(4,6)));
_mil_m79 = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m1897"));
ADD_TO_LOOTGROUP(_group, ITEM("vn_b_m1897"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m1897_buck_mag",RANGE(6,8)));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m1897_fl_mag",RANGE(2,4)));
_mil_shotgun = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEM("vn_m40a1"));
ADD_TO_LOOTGROUP(_group, ITEM("vn_o_9x_m40a1"));
ADD_TO_LOOTGROUP(_group, ITEM("ACE_RangeCard"));
ADD_TO_LOOTGROUP(_group, ITEM("vn_s_m14"));
ADD_TO_LOOTGROUP(_group, ITEM("vn_b_camo_m40a1"));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m40a1_mag",RANGE(7,10)));
ADD_TO_LOOTGROUP(_group, ITEMS("vn_m40a1_t_mag",RANGE(7,10)));
_mil_sniper = _group;

// END: soulja gunz




// START: gun lists

_list = LOOTLIST(1);
ADD_TO_LOOTLIST(_list, _mil_1911, WHITE);
ADD_TO_LOOTLIST(_list, _mil_1911_light, GREEN);
ADD_TO_LOOTLIST(_list, _mil_hpauto, GREEN);
ADD_TO_LOOTLIST(_list, _mil_mk22, BLUE);
_mil_pistol = _list;

_list = LOOTLIST(1);
ADD_TO_LOOTLIST(_list, _mil_m16, WHITE);
ADD_TO_LOOTLIST(_list, _mil_m16_gl, BLUE);
ADD_TO_LOOTLIST(_list, _mil_xm177, BLUE);
ADD_TO_LOOTLIST(_list, _mil_m45, BLUE);
_mil_assaultRifle = _list;

_list = LOOTLIST(1);
ADD_TO_LOOTLIST(_list, _mil_m14, WHITE);
_mil_battleRifle = _list;

_list = LOOTLIST(1);
ADD_TO_LOOTLIST(_list, _mil_m60, WHITE);
ADD_TO_LOOTLIST(_list, _mil_m63a, BLUE);
_mil_autoRifle = _list;

_list = LOOTLIST(1);
ADD_TO_LOOTLIST(_list, _mil_shotgun, WHITE);
ADD_TO_LOOTLIST(_list, _mil_sniper, WHITE);
ADD_TO_LOOTLIST(_list, _mil_m79, WHITE);
_mil_specialGun = _list;

// END: gun lists




//START: Mashup lists

_list = LOOTLIST(1);
ADD_TO_LOOTLIST(_list, _mil_assaultRifle, WHITE);
ADD_TO_LOOTLIST(_list, _mil_battleRifle, GREEN);
ADD_TO_LOOTLIST(_list, _mil_specialGun, PURPLE);
_mil_combatRifle = _list;

_list = LOOTLIST(1);
ADD_TO_LOOTLIST(_list, _mil_battleRifle, WHITE);
ADD_TO_LOOTLIST(_list, _mil_autoRifle, BLUE);
ADD_TO_LOOTLIST(_list, _mil_specialGun, PURPLE);
_mil_heavyRifle = _list;

_list = LOOTLIST(1);
ADD_TO_LOOTLIST(_list, _mil_assaultRifle, WHITE);
ADD_TO_LOOTLIST(_list, _mil_battleRifle, GREEN);
ADD_TO_LOOTLIST(_list, _mil_autoRifle, BLUE);
ADD_TO_LOOTLIST(_list, _mil_specialGun, BLUE);
_mil_guns = _list;

//END: Mashup lists
