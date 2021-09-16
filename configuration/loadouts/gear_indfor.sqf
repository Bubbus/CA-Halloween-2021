
#define FACTION indfor

BEGIN_LOADOUTS;


/*

    Gearscript configuration - INDEPENDENT faction.

    Instructions on how to use this file can be found in the "gearscript_readme.txt" file.
    Commands are described in the "gearscript_readme.txt" file.  They are repeated here without the descriptions for your convenience.

    -------------------------------------------------

    Available commands FOR UNIT LOADOUTS:

    CREATE_LOADOUT(UNIT_NAME,<ACE Arsenal code>);
    COPY_LOADOUT(TO,FROM);

    ADD_HAT(UNIT_NAME,"Hat Classname");
    ADD_UNIFORM(UNIT_NAME,"Uniform Classname");
    ADD_VEST(UNIT_NAME,"Vest Classname");
    ADD_BACKPACK(UNIT_NAME,"Backpack Classname");

    COPY_ADDONS(TO,FROM);

    CLEAR_HATS(UNIT_NAME);
    CLEAR_UNIFORM(UNIT_NAME);
    CLEAR_VEST(UNIT_NAME);
    CLEAR_BACKPACK(UNIT_NAME);

    CLEAR_ADDONS(UNIT_NAME);

    ADD_VARIANT(UNIT_NAME,<ACE Arsenal code>);

    -------------------------------------------------

    Available commands FOR RE-SUPPLY CRATES:

    CREATE_CRATE(NAME);

    ADD_ITEMS_TO_CRATE(CRATE,"Item Name",AMOUNT);

    ADD_RIFLE_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_RIFLE_AMMO_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_RIFLE_GRENADES_TO_CRATE(CRATE,NAME,AMOUNT);

    ADD_PISTOL_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_PISTOL_AMMO_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);

    ADD_LAUNCHER_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_LAUNCHER_AMMO_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);

    ADD_BANDAGES_TO_CRATE(CRATE,AMOUNT);
    ADD_SPLINTS_TO_CRATE(CRATE,AMOUNT);
    ADD_MEDS_TO_CRATE(CRATE,AMOUNT);
    ADD_BLOOD_TO_CRATE(CRATE,AMOUNT);

    ADD_BACKPACKS_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);

    FINALIZE_CRATE(NAME);

    -------------------------------------------------

    INFO: All lines should end with a semi-colon (;).  When copy-pasting and adding new commands, make sure you do not accidentally delete or forget to add semi-colons.
    For examples on how to use the gearscript system, see the "gear_blufor.sqf" file for a default "NATO 2035" loadout.  There are extra details in that file to explain things.

*/

// US Army

// Rifleman Loadout

_baseLoadout = [["vn_m16_bayo","","vn_b_m16","",["vn_m16_20_t_mag",18],[],""],[],[],["vn_b_uniform_macv_06_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m16_20_t_mag",3,18]]],["vn_b_vest_usarmy_02",[]],["vn_b_pack_lw_01_m16_pl",[["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m61_grenade_mag",4,1],["vn_mine_m18_mag",1,1]]],"vn_b_helmet_m1_05_01","vn_b_aviator",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(us_rif,_baseLoadout);

_baseLoadout = [["vn_m16","","","",["vn_m16_20_t_mag",18],[],""],[],[],["vn_b_uniform_macv_04_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m18_yellow_mag",1,1],["vn_m18_red_mag",1,1],["vn_m16_20_t_mag",1,18]]],["vn_b_vest_usarmy_02",[["vn_m16_20_t_mag",2,18]]],["vn_b_pack_lw_01_m16_pl",[["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m61_grenade_mag",4,1],["vn_mine_m18_mag",1,1]]],"vn_b_helmet_m1_07_01","vn_b_scarf_01_03",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

ADD_VARIANT(us_rif,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["vn_xm177","","","",["vn_m16_20_t_mag",18],[],""],["vn_m72","","","",["vn_m72_mag",1],[],""],["vn_p38s","","","",["vn_m10_mag",6],[],""],["vn_b_uniform_macv_02_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_m10_mag",1,6],["vn_m16_20_t_mag",1,18]]],["vn_b_vest_usarmy_02",[]],["vn_b_pack_lw_06_m16_pl",[["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m61_grenade_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",2,1]]],"vn_b_helmet_m1_03_01","vn_b_scarf_01_03",["vn_m19_binocs_grey","","","",[],[],""],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(us_ftl,_baseLoadout);


// Squad lead Loadout

COPY_LOADOUT(us_sl,us_ftl);


// Medic Loadout

_baseLoadout = [["vn_m16","","","",["vn_m16_20_t_mag",18],[],""],[],[],["vn_b_uniform_macv_03_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m18_red_mag",2,1],["vn_m16_20_t_mag",3,18]]],["vn_b_vest_usarmy_07",[]],["vn_b_pack_m5_01_medic_m16_pl",[["vn_b_item_medikit_01",1],["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m61_grenade_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",2,1]]],"vn_b_helmet_m1_04_01","vn_b_scarf_01_01",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(us_med,_baseLoadout);

// Autorifleman Loadout

_baseLoadout = [["vn_m60","","","",["vn_m60_100_mag",100],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["vn_b_uniform_macv_05_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m1911_mag",1,7]]],["vn_b_vest_usarmy_06",[["vn_m60_100_mag",1,100]]],["vn_b_pack_lw_02_m60_pl",[["vn_b_item_firstaidkit",2],["vn_m60_100_mag",6,100],["vn_m61_grenade_mag",4,1],["vn_m18_yellow_mag",2,1],["vn_mine_m14_mag",2,1]]],"vn_b_helmet_m1_08_01","vn_b_aviator",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(us_ar,_baseLoadout);


// Light anti-tank Loadout

_baseLoadout = [["vn_m16","","","",["vn_m16_20_t_mag",18],[],""],["vn_m72","","","",["vn_m72_mag",1],[],""],[],["vn_b_uniform_macv_05_01",[["vn_b_item_firstaidkit",1],["vn_m67_grenade_mag",2,1],["vn_m16_20_t_mag",3,18]]],["vn_b_vest_usarmy_02",[]],["vn_b_pack_trp_03_02_m16_pl",[["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m67_grenade_mag",4,1],["vn_mine_m18_mag",2,1]]],"vn_b_bandana_01","vn_b_aviator",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(us_lat,_baseLoadout);


// Marksman Loadout

_baseLoadout = [["vn_m21","","","vn_o_9x_m14",["vn_m14_t_mag",20],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["vn_b_uniform_macv_01_01",[["vn_b_item_firstaidkit",1],["vn_m67_grenade_mag",2,1],["vn_m18_purple_mag",2,1],["vn_m14_t_mag",1,20]]],["vn_b_vest_usarmy_08",[["vn_m14_t_mag",2,20],["vn_m1911_mag",1,7]]],["vn_b_pack_lw_01_m21_pl",[["vn_b_item_firstaidkit",2],["vn_m1911_mag",4,7],["vn_m14_t_mag",12,20],["vn_m61_grenade_mag",4,1]]],"vn_b_bandana_01","vn_b_scarf_01_03",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(us_mk,_baseLoadout);

// Engineer/logi Loadout

_baseLoadout = [["vn_m1897","","","",["vn_m1897_buck_mag",6],[],""],["vn_m72","","","",["vn_m72_mag",1],[],""],[],["vn_b_uniform_macv_04_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",1,1],["vn_m34_grenade_mag",1,1],["vn_m1897_buck_mag",2,6]]],["vn_b_vest_usarmy_11",[["vn_m1897_buck_mag",1,6]]],["vn_b_pack_lw_04_eng_m1897_pl",[["vn_b_item_toolkit",1],["vn_b_item_firstaidkit",2],["vn_m1897_buck_mag",8,6],["vn_m1897_fl_mag",8,6],["vn_m61_grenade_mag",4,1],["vn_m18_yellow_mag",2,1],["vn_m72_mag",1,1],["vn_mine_m16_mag",2,1],["vn_mine_tripwire_m49_04_mag",4,1],["vn_mine_m112_remote_mag",2,1]]],"vn_b_helmet_m1_05_01","vn_b_aviator",["vn_m19_binocs_grn","","","",[],[],""],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(us_eng,_baseLoadout);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,us_rif,2);
ADD_LAUNCHER_TO_CRATE(small,us_lat,2);
ADD_PISTOL_TO_CRATE(small,us_rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,us_rif,6);
ADD_RIFLE_AMMO_TO_CRATE(small,us_rif,30);
ADD_RIFLE_AMMO_TO_CRATE(small,us_ar,4);
ADD_RIFLE_AMMO_TO_CRATE(small,us_mk,5);
ADD_RIFLE_GRENADES_TO_CRATE(small,us_ftl,4);

ADD_ITEMS_TO_CRATE(small,"30Rnd_556x45_Stanag_Tracer_Yellow",10);
ADD_ITEMS_TO_CRATE(small,"ACE_20Rnd_762x51_Mag_Tracer",6);
ADD_ITEMS_TO_CRATE(small,"200Rnd_65x39_cased_Box_Tracer",3);

ADD_ITEMS_TO_CRATE(small,"1Rnd_Smoke_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(small,"1Rnd_SmokeRed_Grenade_shell",5);
ADD_ITEMS_TO_CRATE(small,"1Rnd_SmokeBlue_Grenade_shell",5);

ADD_ITEMS_TO_CRATE(small,"SmokeShellRed",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShellBlue",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShell",6);

ADD_ITEMS_TO_CRATE(small,"HandGrenade",8);
ADD_ITEMS_TO_CRATE(small,"ACE_SpareBarrel",1);

ADD_BANDAGES_TO_CRATE(small,40);
ADD_SPLINTS_TO_CRATE(small,30);
ADD_MEDS_TO_CRATE(small,30);
ADD_BLOOD_TO_CRATE(small,15);

ADD_BACKPACKS_TO_CRATE(small,us_rif,2);

ADD_ITEMS_TO_CRATE(small,"Binocular",2);
ADD_ITEMS_TO_CRATE(small,"Toolkit",1);

FINALIZE_CRATE(small);


// Medium crate loadout
CREATE_CRATE(med);

ADD_RIFLE_TO_CRATE(med,us_rif,4);
ADD_LAUNCHER_TO_CRATE(med,us_lat,4);
ADD_PISTOL_TO_CRATE(med,us_rif,4);

ADD_PISTOL_AMMO_TO_CRATE(med,us_rif,12);
ADD_RIFLE_AMMO_TO_CRATE(med,us_rif,60);
ADD_RIFLE_AMMO_TO_CRATE(med,us_ar,8);
ADD_RIFLE_AMMO_TO_CRATE(med,us_mk,10);
ADD_RIFLE_GRENADES_TO_CRATE(med,us_ftl,8);

ADD_ITEMS_TO_CRATE(med,"30Rnd_556x45_Stanag_Tracer_Yellow",10);
ADD_ITEMS_TO_CRATE(med,"ACE_20Rnd_762x51_Mag_Tracer",6);
ADD_ITEMS_TO_CRATE(med,"200Rnd_65x39_cased_Box_Tracer",3);

ADD_ITEMS_TO_CRATE(med,"1Rnd_Smoke_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeRed_Grenade_shell",5);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeBlue_Grenade_shell",5);

ADD_ITEMS_TO_CRATE(med,"SmokeShellRed",2);
ADD_ITEMS_TO_CRATE(med,"SmokeShellBlue",2);
ADD_ITEMS_TO_CRATE(med,"SmokeShell",6);

ADD_ITEMS_TO_CRATE(med,"HandGrenade",8);
ADD_ITEMS_TO_CRATE(med,"ACE_SpareBarrel",1);

ADD_BANDAGES_TO_CRATE(med,80);
ADD_SPLINTS_TO_CRATE(med,40);
ADD_MEDS_TO_CRATE(med,50);
ADD_BLOOD_TO_CRATE(med,30);

ADD_BACKPACKS_TO_CRATE(med,us_rif,4);

ADD_ITEMS_TO_CRATE(med,"Binocular",4);
ADD_ITEMS_TO_CRATE(med,"Toolkit",1);

FINALIZE_CRATE(med);

// ARVN

// Rifleman Loadout

_baseLoadout = [["vn_m16_bayo","","vn_b_m16","",["vn_m16_20_t_mag",18],[],""],[],[],["vn_b_uniform_macv_06_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m16_20_t_mag",3,18]]],["vn_b_vest_usarmy_02",[]],["vn_b_pack_lw_01_m16_pl",[["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m61_grenade_mag",4,1],["vn_mine_m18_mag",1,1]]],"vn_b_helmet_m1_05_01","vn_b_aviator",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(arvn_rif,_baseLoadout);

_baseLoadout = [["vn_m16","","","",["vn_m16_20_t_mag",18],[],""],[],[],["vn_b_uniform_macv_04_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m18_yellow_mag",1,1],["vn_m18_red_mag",1,1],["vn_m16_20_t_mag",1,18]]],["vn_b_vest_usarmy_02",[["vn_m16_20_t_mag",2,18]]],["vn_b_pack_lw_01_m16_pl",[["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m61_grenade_mag",4,1],["vn_mine_m18_mag",1,1]]],"vn_b_helmet_m1_07_01","vn_b_scarf_01_03",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

ADD_VARIANT(arvn_rif,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["vn_xm177","","","",["vn_m16_20_t_mag",18],[],""],["vn_m72","","","",["vn_m72_mag",1],[],""],["vn_p38s","","","",["vn_m10_mag",6],[],""],["vn_b_uniform_macv_02_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_m10_mag",1,6],["vn_m16_20_t_mag",1,18]]],["vn_b_vest_usarmy_02",[]],["vn_b_pack_lw_06_m16_pl",[["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m61_grenade_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",2,1]]],"vn_b_helmet_m1_03_01","vn_b_scarf_01_03",["vn_m19_binocs_grey","","","",[],[],""],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(arvn_ftl,_baseLoadout);


// Squad lead Loadout

COPY_LOADOUT(arvn_sl,arvn_ftl);


// Medic Loadout

_baseLoadout = [["vn_m16","","","",["vn_m16_20_t_mag",18],[],""],[],[],["vn_b_uniform_macv_03_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m18_red_mag",2,1],["vn_m16_20_t_mag",3,18]]],["vn_b_vest_usarmy_07",[]],["vn_b_pack_m5_01_medic_m16_pl",[["vn_b_item_medikit_01",1],["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m61_grenade_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",2,1]]],"vn_b_helmet_m1_04_01","vn_b_scarf_01_01",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(arvn_med,_baseLoadout);

// Autorifleman Loadout

_baseLoadout = [["vn_m60","","","",["vn_m60_100_mag",100],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["vn_b_uniform_macv_05_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m1911_mag",1,7]]],["vn_b_vest_usarmy_06",[["vn_m60_100_mag",1,100]]],["vn_b_pack_lw_02_m60_pl",[["vn_b_item_firstaidkit",2],["vn_m60_100_mag",6,100],["vn_m61_grenade_mag",4,1],["vn_m18_yellow_mag",2,1],["vn_mine_m14_mag",2,1]]],"vn_b_helmet_m1_08_01","vn_b_aviator",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(arvn_ar,_baseLoadout);


// Light anti-tank Loadout

_baseLoadout = [["vn_m16","","","",["vn_m16_20_t_mag",18],[],""],["vn_m72","","","",["vn_m72_mag",1],[],""],[],["vn_b_uniform_macv_05_01",[["vn_b_item_firstaidkit",1],["vn_m67_grenade_mag",2,1],["vn_m16_20_t_mag",3,18]]],["vn_b_vest_usarmy_02",[]],["vn_b_pack_trp_03_02_m16_pl",[["vn_b_item_firstaidkit",2],["vn_m16_20_t_mag",10,18],["vn_m67_grenade_mag",4,1],["vn_mine_m18_mag",2,1]]],"vn_b_bandana_01","vn_b_aviator",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(arvn_lat,_baseLoadout);
COPY_ADDONS(arvn_lat,arvn_rif);


// Marksman Loadout

_baseLoadout = [["vn_m21","","","vn_o_9x_m14",["vn_m14_t_mag",20],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["vn_b_uniform_macv_01_01",[["vn_b_item_firstaidkit",1],["vn_m67_grenade_mag",2,1],["vn_m18_purple_mag",2,1],["vn_m14_t_mag",1,20]]],["vn_b_vest_usarmy_08",[["vn_m14_t_mag",2,20],["vn_m1911_mag",1,7]]],["vn_b_pack_lw_01_m21_pl",[["vn_b_item_firstaidkit",2],["vn_m1911_mag",4,7],["vn_m14_t_mag",12,20],["vn_m61_grenade_mag",4,1]]],"vn_b_bandana_01","vn_b_scarf_01_03",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(arvn_mk,_baseLoadout);
COPY_ADDONS(arvn_mk,arvn_rif);

// Engineer/logi Loadout

_baseLoadout = [["vn_m1897","","","",["vn_m1897_buck_mag",6],[],""],["vn_m72","","","",["vn_m72_mag",1],[],""],[],["vn_b_uniform_macv_04_01",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",1,1],["vn_m34_grenade_mag",1,1],["vn_m1897_buck_mag",2,6]]],["vn_b_vest_usarmy_11",[["vn_m1897_buck_mag",1,6]]],["vn_b_pack_lw_04_eng_m1897_pl",[["vn_b_item_toolkit",1],["vn_b_item_firstaidkit",2],["vn_m1897_buck_mag",8,6],["vn_m1897_fl_mag",8,6],["vn_m61_grenade_mag",4,1],["vn_m18_yellow_mag",2,1],["vn_m72_mag",1,1],["vn_mine_m16_mag",2,1],["vn_mine_tripwire_m49_04_mag",4,1],["vn_mine_m112_remote_mag",2,1]]],"vn_b_helmet_m1_05_01","vn_b_aviator",["vn_m19_binocs_grn","","","",[],[],""],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(arvn_eng,_baseLoadout);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,arvn_rif,2);
ADD_LAUNCHER_TO_CRATE(small,arvn_lat,2);
ADD_PISTOL_TO_CRATE(small,arvn_rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,arvn_rif,6);
ADD_RIFLE_AMMO_TO_CRATE(small,arvn_rif,30);
ADD_RIFLE_AMMO_TO_CRATE(small,arvn_ar,4);
ADD_RIFLE_AMMO_TO_CRATE(small,arvn_mk,5);
ADD_RIFLE_GRENADES_TO_CRATE(small,arvn_ftl,4);

ADD_ITEMS_TO_CRATE(small,"30Rnd_556x45_Stanag_Tracer_Yellow",10);
ADD_ITEMS_TO_CRATE(small,"ACE_20Rnd_762x51_Mag_Tracer",6);
ADD_ITEMS_TO_CRATE(small,"200Rnd_65x39_cased_Box_Tracer",3);

ADD_ITEMS_TO_CRATE(small,"1Rnd_Smoke_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(small,"1Rnd_SmokeRed_Grenade_shell",5);
ADD_ITEMS_TO_CRATE(small,"1Rnd_SmokeBlue_Grenade_shell",5);

ADD_ITEMS_TO_CRATE(small,"SmokeShellRed",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShellBlue",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShell",6);

ADD_ITEMS_TO_CRATE(small,"HandGrenade",8);
ADD_ITEMS_TO_CRATE(small,"ACE_SpareBarrel",1);

ADD_BANDAGES_TO_CRATE(small,40);
ADD_SPLINTS_TO_CRATE(small,30);
ADD_MEDS_TO_CRATE(small,30);
ADD_BLOOD_TO_CRATE(small,15);

ADD_BACKPACKS_TO_CRATE(small,arvn_rif,2);

ADD_ITEMS_TO_CRATE(small,"Binocular",2);
ADD_ITEMS_TO_CRATE(small,"Toolkit",1);

FINALIZE_CRATE(small);


// Medium crate loadout
CREATE_CRATE(med);

ADD_RIFLE_TO_CRATE(med,arvn_rif,4);
ADD_LAUNCHER_TO_CRATE(med,arvn_lat,4);
ADD_PISTOL_TO_CRATE(med,arvn_rif,4);

ADD_PISTOL_AMMO_TO_CRATE(med,arvn_rif,12);
ADD_RIFLE_AMMO_TO_CRATE(med,arvn_rif,60);
ADD_RIFLE_AMMO_TO_CRATE(med,arvn_ar,8);
ADD_RIFLE_AMMO_TO_CRATE(med,arvn_mk,10);
ADD_RIFLE_GRENADES_TO_CRATE(med,arvn_ftl,8);

ADD_ITEMS_TO_CRATE(med,"30Rnd_556x45_Stanag_Tracer_Yellow",10);
ADD_ITEMS_TO_CRATE(med,"ACE_20Rnd_762x51_Mag_Tracer",6);
ADD_ITEMS_TO_CRATE(med,"200Rnd_65x39_cased_Box_Tracer",3);

ADD_ITEMS_TO_CRATE(med,"1Rnd_Smoke_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeRed_Grenade_shell",5);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeBlue_Grenade_shell",5);

ADD_ITEMS_TO_CRATE(med,"SmokeShellRed",2);
ADD_ITEMS_TO_CRATE(med,"SmokeShellBlue",2);
ADD_ITEMS_TO_CRATE(med,"SmokeShell",6);

ADD_ITEMS_TO_CRATE(med,"HandGrenade",8);
ADD_ITEMS_TO_CRATE(med,"ACE_SpareBarrel",1);

ADD_BANDAGES_TO_CRATE(med,80);
ADD_SPLINTS_TO_CRATE(med,40);
ADD_MEDS_TO_CRATE(med,50);
ADD_BLOOD_TO_CRATE(med,30);

ADD_BACKPACKS_TO_CRATE(med,arvn_rif,4);

ADD_ITEMS_TO_CRATE(med,"Binocular",4);
ADD_ITEMS_TO_CRATE(med,"Toolkit",1);

FINALIZE_CRATE(med);

// Default loadout.
// If Gearscript tries to use an invalid loadout, it will fall-back to this default loadout instead.

COPY_LOADOUT(default,arvn_rif);
