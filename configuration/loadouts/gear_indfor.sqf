
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


// Rifleman Loadout

_baseLoadout = [["vn_sten_sd","vn_s_sten","","",["vn_sten_t_mag",32],[],""],[],[],["vn_b_uniform_macv_04_02",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_m7_grenade_mag",1,1],["vn_sten_t_mag",1,32]]],["vn_b_vest_usarmy_02",[["vn_sten_t_mag",2,32]]],["vn_b_pack_04_02_sten_pl",[["vn_b_item_firstaidkit",2],["vn_sten_t_mag",12,32],["vn_m61_grenade_mag",4,1],["vn_m7_grenade_mag",2,1],["vn_m14_grenade_mag",1,1],["vn_m18_red_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_mine_m112_remote_mag",1,1],["vn_mine_m14_mag",3,1],["vn_mine_m18_range_mag",1,1]]],"vn_b_boonie_03_02","vn_b_scarf_01_01",["vn_m19_binocs_grey","","","",[],[],""],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(rif,_baseLoadout);

_baseLoadout = [["vn_m1897","","","",["vn_m1897_fl_mag",6],[],""],[],[],["vn_b_uniform_macv_04_02",[["vn_b_item_firstaidkit",1],["vn_m1897_buck_mag",4,6]]],["vn_b_vest_usarmy_02",[["vn_m1897_fl_mag",3,6],["vn_m61_grenade_mag",2,1],["vn_m7_grenade_mag",1,1],["vn_m14_grenade_mag",1,1]]],["vn_b_pack_05_02_m1897_pl",[["vn_b_item_firstaidkit",2],["vn_m1897_buck_mag",8,6],["vn_m1897_fl_mag",8,6],["vn_m61_grenade_mag",4,1],["vn_m18_yellow_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_mine_m14_mag",6,1]]],"vn_b_boonie_02_02","vn_b_scarf_01_01",["vn_m19_binocs_grn","","","",[],[],""],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

ADD_VARIANT(rif,_baseLoadout);

// Commander Loadout

_baseLoadout = [["vn_m14","","","",["vn_m14_mag",20],[],""],[],["vn_welrod","","","",["vn_welrod_mag",8],[],""],["vn_b_uniform_macv_01_02",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_m7_grenade_mag",1,1],["vn_m14_grenade_mag",1,1]]],["vn_b_vest_usarmy_02",[["vn_welrod_mag",1,8],["vn_m14_mag",6,20]]],["vn_b_pack_03_02_type56_pl",[["vn_b_item_firstaidkit",2],["vn_m61_grenade_mag",4,1],["vn_m18_red_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_mine_m112_remote_mag",1,1],["vn_mine_m14_mag",3,1],["vn_mine_m18_range_mag",1,1],["vn_m14_mag",9,20]]],"vn_b_boonie_04_02","vn_b_scarf_01_03",["vn_m19_binocs_grn","","","",[],[],""],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["vn_m14","","","",["vn_m14_mag",20],[],""],[],["vn_welrod","","","",["vn_welrod_mag",8],[],""],["vn_b_uniform_macv_01_02",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_m7_grenade_mag",1,1],["vn_m14_grenade_mag",1,1]]],["vn_b_vest_usarmy_02",[["vn_welrod_mag",1,8],["vn_m14_mag",6,20]]],["vn_b_pack_03_02_type56_pl",[["vn_b_item_firstaidkit",2],["vn_m61_grenade_mag",4,1],["vn_m18_red_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_mine_m112_remote_mag",1,1],["vn_mine_m14_mag",3,1],["vn_mine_m18_range_mag",1,1],["vn_m14_mag",9,20]]],"vn_b_boonie_04_02","vn_b_scarf_01_03",["vn_m19_binocs_grn","","","",[],[],""],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);


// Medic Loadout

_baseLoadout = [["vn_mat49","","","",["vn_mat49_t_mag",32],[],""],[],[],["vn_b_uniform_macv_02_02",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_mat49_t_mag",3,32]]],["vn_b_vest_usarmy_02",[["vn_mine_m18_mag",1,1]]],["vn_b_pack_m5_medic_mat49_pl",[["vn_b_item_medikit_01",1],["vn_b_item_firstaidkit",2],["vn_mat49_t_mag",10,32],["vn_m67_grenade_mag",6,1],["vn_m34_grenade_mag",2,1],["vn_m18_yellow_mag",4,1]]],"vn_b_bandana_01","vn_b_scarf_01_01",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);

// Autorifleman Loadout

_baseLoadout = [["vn_rpd","","","",["vn_rpd_100_mag",100],[],""],[],["vn_m10","","","",["vn_m10_mag",6],[],""],["vn_b_uniform_macv_01_02",[["vn_b_item_firstaidkit",1],["vn_m10_mag",3,6]]],["vn_b_vest_usarmy_03",[["vn_rpd_100_mag",1,100],["vn_m61_grenade_mag",2,1],["vn_m7_grenade_mag",1,1],["vn_m14_grenade_mag",1,1]]],["vn_b_pack_02_02_rpd_pl",[["vn_b_item_firstaidkit",2],["vn_rpd_100_mag",4,100],["vn_m61_grenade_mag",4,1],["vn_m18_yellow_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_mine_m14_mag",6,1],["vn_mine_m18_range_mag",2,1]]],"vn_b_bandana_02","vn_b_scarf_01_01",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [["vn_m14","","","",["vn_m14_mag",20],[],""],[],["vn_welrod","","","",["vn_welrod_mag",8],[],""],["vn_b_uniform_macv_01_02",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_m7_grenade_mag",1,1],["vn_m14_grenade_mag",1,1]]],["vn_b_vest_usarmy_02",[["vn_welrod_mag",1,8],["vn_m14_mag",6,20]]],["vn_b_pack_03_02_type56_pl",[["vn_b_item_firstaidkit",2],["vn_m61_grenade_mag",4,1],["vn_m18_red_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_mine_m112_remote_mag",1,1],["vn_mine_m14_mag",3,1],["vn_mine_m18_range_mag",1,1],["vn_m14_mag",9,20]]],"vn_b_boonie_04_02","vn_b_scarf_01_03",["vn_m19_binocs_grn","","","",[],[],""],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,rif);

// Marksman Loadout

_baseLoadout = [["vn_m21","","","vn_o_9x_m14",["vn_m14_t_mag",20],[],""],[],[],["vn_b_uniform_macv_06_02",[["vn_b_item_firstaidkit",1],["vn_m61_grenade_mag",2,1],["vn_m14_t_mag",2,20]]],["vn_b_vest_usarmy_03",[["vn_m14_t_mag",1,20],["vn_mine_m18_mag",1,1]]],["vn_b_pack_01_02_m14_pl",[["vn_b_item_firstaidkit",2],["vn_m14_t_mag",10,20],["vn_m61_grenade_mag",2,1],["vn_m18_yellow_mag",2,1],["vn_m18_purple_mag",2,1]]],"vn_b_boonie_02_02","vn_b_scarf_01_01",[],["vn_b_item_map","","vn_b_item_radio_urc10","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,rif,2);
ADD_PISTOL_TO_CRATE(small,rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,rif,6);
ADD_RIFLE_AMMO_TO_CRATE(small,rif,30);
ADD_RIFLE_AMMO_TO_CRATE(small,ar,4);
ADD_RIFLE_AMMO_TO_CRATE(small,mk,5);
ADD_RIFLE_GRENADES_TO_CRATE(small,ftl,4);

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

ADD_BACKPACKS_TO_CRATE(small,rif,2);

ADD_ITEMS_TO_CRATE(small,"Binocular",2);
ADD_ITEMS_TO_CRATE(small,"Toolkit",1);

FINALIZE_CRATE(small);


// Medium crate loadout
CREATE_CRATE(med);

ADD_RIFLE_TO_CRATE(med,rif,4);
ADD_PISTOL_TO_CRATE(med,rif,4);

ADD_PISTOL_AMMO_TO_CRATE(med,rif,12);
ADD_RIFLE_AMMO_TO_CRATE(med,rif,60);
ADD_RIFLE_AMMO_TO_CRATE(med,ar,8);
ADD_RIFLE_AMMO_TO_CRATE(med,mk,10);
ADD_RIFLE_GRENADES_TO_CRATE(med,ftl,8);

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

ADD_BACKPACKS_TO_CRATE(med,rif,4);

ADD_ITEMS_TO_CRATE(med,"Binocular",4);
ADD_ITEMS_TO_CRATE(med,"Toolkit",1);

FINALIZE_CRATE(med);


// Default loadout.
// If Gearscript tries to use an invalid loadout, it will fall-back to this default loadout instead.

COPY_LOADOUT(default,rif);
