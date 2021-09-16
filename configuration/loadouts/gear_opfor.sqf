
#define FACTION opfor

BEGIN_LOADOUTS;


/*

    Gearscript configuration - OPFOR faction.

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

_baseLoadout = [["vn_type56","","","",["vn_type56_t_mag",30],[],""],[],["vn_tt33","","","",["vn_tt33_mag",8],[],""],["vn_o_uniform_nva_army_04_03",[["vn_o_item_firstaidkit",1],["vn_type56_t_mag",3,30]]],["vn_o_vest_01",[["vn_tt33_mag",2,8],["vn_rdg2_mag",1,1],["vn_t67_grenade_mag",2,1]]],["vn_o_pack_05_type56_pl",[["vn_o_item_firstaidkit",2],["vn_type56_t_mag",8,30],["vn_rdg2_mag",2,1],["vn_rgd5_grenade_mag",2,1],["vn_rkg3_grenade_mag",2,1],["vn_mine_satchel_remote_02_mag",1,1],["vn_mine_punji_01_mag",1,1]]],"vn_o_helmet_nva_04","vn_b_scarf_01_03",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(nva_rif,_baseLoadout);

_baseLoadout = [["vn_sks_bayo","","vn_b_sks","",["vn_sks_t_mag",10],[],""],[],[],["vn_o_uniform_nva_army_03_03",[["vn_o_item_firstaidkit",1],["vn_sks_t_mag",3,10],["vn_rdg2_mag",1,1],["vn_t67_grenade_mag",2,1]]],["vn_o_vest_02",[]],["vn_o_pack_02_sks_pl",[["vn_o_item_firstaidkit",2],["vn_sks_t_mag",10,10],["vn_rdg2_mag",2,1],["vn_t67_grenade_mag",2,1]]],"vn_o_helmet_nva_02","vn_b_scarf_01_03",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

ADD_VARIANT(nva_rif,_baseLoadout);



// Commander Loadout

_baseLoadout = [["vn_ppsh41","","","",["vn_ppsh41_35_t_mag",35],[],""],[],["vn_pm","","","",["vn_pm_mag",8],[],""],["vn_o_uniform_nva_army_01_03",[["vn_o_item_firstaidkit",1],["vn_ppsh41_35_t_mag",3,35],["vn_pm_mag",2,8]]],["vn_o_vest_07",[["vn_rdg2_mag",1,1],["vn_t67_grenade_mag",2,1]]],["vn_o_pack_01_ppsh_pl",[["vn_o_item_firstaidkit",2],["vn_ppsh41_35_t_mag",6,35],["vn_rdg2_mag",2,1],["vn_t67_grenade_mag",2,1]]],"vn_o_helmet_nva_01","vn_g_glasses_01",["vn_m19_binocs_grn","","","",[],[],""],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(nva_co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["vn_ppsh41","","","",["vn_ppsh41_35_t_mag",35],[],""],[],["vn_pm","","","",["vn_pm_mag",8],[],""],["vn_o_uniform_nva_army_01_03",[["vn_o_item_firstaidkit",1],["vn_ppsh41_35_t_mag",3,35],["vn_pm_mag",2,8]]],["vn_o_vest_07",[["vn_rdg2_mag",1,1],["vn_t67_grenade_mag",2,1]]],["vn_o_pack_01_ppsh_pl",[["vn_o_item_firstaidkit",2],["vn_ppsh41_35_t_mag",6,35],["vn_rdg2_mag",2,1],["vn_t67_grenade_mag",2,1]]],"vn_o_helmet_nva_01","vn_g_glasses_01",["vn_m19_binocs_grn","","","",[],[],""],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(nva_ftl,_baseLoadout);
COPY_ADDONS(nva_ftl,nva_rif);


// Squad lead Loadout

COPY_LOADOUT(nva_sl,nva_ftl);


// Medic Loadout

_baseLoadout = [["vn_pps43","","","",["vn_pps_t_mag",35],[],""],[],[],["vn_o_uniform_nva_army_08_03",[["vn_o_item_firstaidkit",1],["vn_pps_t_mag",3,35],["vn_rdg2_mag",1,1]]],["vn_o_vest_06",[["vn_rdg2_mag",2,1]]],["vn_o_pack_02_medic_pps_pl",[["vn_b_item_medikit_01",1],["vn_o_item_firstaidkit",2],["vn_pps_t_mag",6,35],["vn_rdg2_mag",2,1]]],"vn_o_helmet_nva_02","vn_g_spectacles_01",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(nva_med,_baseLoadout);
COPY_ADDONS(nva_med,nva_rif);

// Autorifleman Loadout

_baseLoadout = [["vn_rpd","","","",["vn_rpd_100_mag",100],[],""],[],[],["vn_o_uniform_nva_army_11_03",[["vn_o_item_firstaidkit",1],["vn_rdg2_mag",1,1]]],["vn_o_vest_03",[["vn_rpd_100_mag",2,100],["vn_t67_grenade_mag",2,1]]],["vn_o_pack_04_rpd_pl",[["vn_o_item_firstaidkit",2],["vn_rpd_100_mag",3,100],["vn_rdg2_mag",2,1],["vn_rg42_grenade_mag",2,1]]],"vn_o_helmet_nva_03","vn_b_scarf_01_03",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(nva_ar,_baseLoadout);
COPY_ADDONS(nva_ar,nva_rif);

// Marksman Loadout

_baseLoadout = [["vn_sks_sniper","","","vn_o_3x_m9130",["vn_sks_t_mag",10],[],""],[],[],["vn_o_uniform_nva_army_04_01",[["vn_o_item_firstaidkit",2],["vn_sks_t_mag",3,10],["vn_rdg2_mag",1,1]]],["vn_o_vest_02",[["vn_t67_grenade_mag",2,1]]],["vn_o_pack_06_sks_pl",[["vn_o_item_firstaidkit",2],["vn_sks_t_mag",10,10],["vn_rdg2_mag",2,1],["vn_f1_grenade_mag",2,1],["vn_rkg3_grenade_mag",2,1]]],"vn_o_helmet_nva_06","vn_g_spectacles_01",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(nva_mk,_baseLoadout);
COPY_ADDONS(nva_mk,nva_rif);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,nva_rif,2);
ADD_PISTOL_TO_CRATE(small,nva_rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,nva_rif,8);
ADD_RIFLE_AMMO_TO_CRATE(small,nva_rif,40);
ADD_RIFLE_AMMO_TO_CRATE(small,nva_ar,8);
ADD_RIFLE_AMMO_TO_CRATE(small,nva_mk,12);
ADD_RIFLE_GRENADES_TO_CRATE(small,nva_ftl,15);

ADD_ITEMS_TO_CRATE(small,"30Rnd_65x39_caseless_green_mag_Tracer",15);
ADD_ITEMS_TO_CRATE(small,"ACE_10Rnd_762x54_Tracer_mag",12);
ADD_ITEMS_TO_CRATE(small,"150Rnd_762x54_Box_Tracer",4);

ADD_ITEMS_TO_CRATE(small,"1Rnd_HE_Grenade_shell",15);
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

ADD_BACKPACKS_TO_CRATE(small,nva_rif,2);

ADD_ITEMS_TO_CRATE(small,"Binocular",2);
ADD_ITEMS_TO_CRATE(small,"Toolkit",1);

FINALIZE_CRATE(small);


// Medium crate loadout
CREATE_CRATE(med);

ADD_RIFLE_TO_CRATE(med,nva_rif,4);
ADD_PISTOL_TO_CRATE(med,nva_rif,4);

ADD_PISTOL_AMMO_TO_CRATE(med,nva_rif,12);
ADD_RIFLE_AMMO_TO_CRATE(med,nva_rif,60);
ADD_RIFLE_AMMO_TO_CRATE(med,nva_ar,12);
ADD_RIFLE_AMMO_TO_CRATE(med,nva_mk,24);
ADD_RIFLE_GRENADES_TO_CRATE(med,nva_ftl,30);

ADD_ITEMS_TO_CRATE(med,"30Rnd_65x39_caseless_green_mag_Tracer",20);
ADD_ITEMS_TO_CRATE(med,"ACE_10Rnd_762x54_Tracer_mag",24);
ADD_ITEMS_TO_CRATE(med,"150Rnd_762x54_Box_Tracer",6);

ADD_ITEMS_TO_CRATE(med,"1Rnd_Smoke_Grenade_shell",20);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeRed_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeBlue_Grenade_shell",10);

ADD_ITEMS_TO_CRATE(med,"SmokeShellRed",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShellBlue",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShell",15);

ADD_ITEMS_TO_CRATE(med,"HandGrenade",15);
ADD_ITEMS_TO_CRATE(med,"ACE_SpareBarrel",25);

ADD_BANDAGES_TO_CRATE(med,80);
ADD_SPLINTS_TO_CRATE(med,40);
ADD_MEDS_TO_CRATE(med,50);
ADD_BLOOD_TO_CRATE(med,30);

ADD_BACKPACKS_TO_CRATE(med,nva_rif,4);

ADD_ITEMS_TO_CRATE(med,"Binocular",4);
ADD_ITEMS_TO_CRATE(med,"Toolkit",1);

FINALIZE_CRATE(med);

// Vietcong


// Rifleman Loadout

_baseLoadout = [["vn_mat49_vc","","","",["vn_mat49_vc_mag",32],[],""],[],["vn_m1895","","","",["vn_m1895_mag",7],[],""],["vn_o_uniform_vc_mf_04_07",[["vn_o_item_firstaidkit",1],["vn_mat49_vc_mag",3,32]]],["vn_o_vest_vc_01",[["vn_m1895_mag",2,7],["vn_rdg2_mag",1,1],["vn_t67_grenade_mag",2,1]]],["vn_o_pack_02_mat49_pl",[["vn_o_item_firstaidkit",2],["vn_mat49_vc_mag",6,32],["vn_rdg2_mag",2,1],["vn_f1_grenade_mag",2,1]]],"vn_o_helmet_vc_03","vn_o_scarf_01_04",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(vc_rif,_baseLoadout);

_baseLoadout = [["vn_type56","","","",["vn_type56_t_mag",30],[],""],[],[],["vn_o_uniform_vc_mf_10_07",[["vn_o_item_firstaidkit",1],["vn_type56_t_mag",3,30]]],["vn_o_vest_01",[["vn_rdg2_mag",1,1],["vn_rgd33_grenade_mag",1,1],["vn_t67_grenade_mag",1,1]]],["vn_o_pack_05_type56_pl",[["vn_o_item_firstaidkit",2],["vn_type56_t_mag",8,30],["vn_rdg2_mag",2,1],["vn_rgd5_grenade_mag",2,1],["vn_rkg3_grenade_mag",2,1],["vn_mine_satchel_remote_02_mag",1,1],["vn_mine_punji_01_mag",1,1]]],"vn_o_helmet_vc_03","vn_o_scarf_01_04",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

ADD_VARIANT(vc_rif,_baseLoadout);



// Commander Loadout

_baseLoadout =[["vn_k50m","","","",["vn_ppsh41_35_t_mag",35],[],""],[],["vn_m1895","","","",["vn_m1895_mag",7],[],""],["vn_o_uniform_vc_mf_01_07",[["vn_o_item_firstaidkit",1],["vn_ppsh41_35_t_mag",3,35],["vn_m1895_mag",2,7]]],["vn_o_vest_vc_05",[["vn_rdg2_mag",1,1],["vn_t67_grenade_mag",2,1]]],["vn_o_pack_01_ppsh_pl",[["vn_o_item_firstaidkit",2],["vn_ppsh41_35_t_mag",6,35],["vn_rdg2_mag",2,1],["vn_t67_grenade_mag",2,1]]],"vn_o_helmet_vc_01","vn_o_scarf_01_04",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(vc_co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["vn_k50m","","","",["vn_ppsh41_35_t_mag",35],[],""],[],["vn_m1895","","","",["vn_m1895_mag",7],[],""],["vn_o_uniform_vc_mf_01_07",[["vn_o_item_firstaidkit",1],["vn_ppsh41_35_t_mag",3,35],["vn_m1895_mag",2,7]]],["vn_o_vest_vc_05",[["vn_rdg2_mag",1,1],["vn_t67_grenade_mag",2,1]]],["vn_o_pack_01_ppsh_pl",[["vn_o_item_firstaidkit",2],["vn_ppsh41_35_t_mag",6,35],["vn_rdg2_mag",2,1],["vn_t67_grenade_mag",2,1]]],"vn_o_helmet_vc_01","vn_o_scarf_01_04",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(vc_ftl,_baseLoadout);
COPY_ADDONS(vc_ftl,vc_rif);


// Squad lead Loadout

COPY_LOADOUT(vc_sl,vc_ftl);


// Medic Loadout

_baseLoadout = [["vn_izh54","","","",["vn_izh54_mag",2],[],""],[],[],["vn_o_uniform_vc_mf_12_07",[["vn_o_item_firstaidkit",1],["vn_izh54_mag",3,2],["vn_rdg2_mag",2,1]]],["vn_o_vest_vc_04",[["vn_rdg2_mag",1,1]]],["vn_o_pack_01_medic_ish54_pl",[["vn_b_item_medikit_01",1],["vn_o_item_firstaidkit",2],["vn_izh54_mag",16,2],["vn_rdg2_mag",2,1]]],"vn_o_helmet_vc_02","vn_o_scarf_01_04",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(vc__med,_baseLoadout);
COPY_ADDONS(vc_med,vc_rif);

// Autorifleman Loadout

_baseLoadout = [["vn_rpd","","","",["vn_rpd_100_mag",100],[],""],[],[],["vn_o_uniform_vc_mf_03_07",[["vn_o_item_firstaidkit",1],["vn_rdg2_mag",1,1]]],["vn_o_vest_03",[["vn_rpd_100_mag",2,100],["vn_rg42_grenade_mag",1,1],["vn_t67_grenade_mag",1,1]]],["vn_o_pack_04_rpd_pl",[["vn_o_item_firstaidkit",2],["vn_rpd_100_mag",3,100],["vn_rdg2_mag",2,1],["vn_rg42_grenade_mag",2,1]]],"vn_o_helmet_vc_03","vn_o_scarf_01_04",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(vc_ar,_baseLoadout);
COPY_ADDONS(vc_ar,vc_rif);

// Marksman Loadout

_baseLoadout = [["vn_sks_gl","","","",["vn_sks_t_mag",10],["vn_22mm_m60_frag_mag",1],""],[],[],["vn_o_uniform_vc_mf_11_07",[["vn_o_item_firstaidkit",1],["vn_sks_t_mag",3,10],["vn_22mm_m60_frag_mag",3,1]]],["vn_o_vest_vc_02",[["vn_rdg2_mag",1,1],["vn_rgd33_grenade_mag",2,1]]],["vn_o_pack_04_sks_pl",[["vn_o_item_firstaidkit",2],["vn_sks_t_mag",10,10],["vn_22mm_m60_frag_mag",6,1],["vn_22mm_m60_heat_mag",2,1],["vn_22mm_lume_mag",2,1],["vn_22mm_m22_smoke_mag",2,1],["vn_22mm_m19_wp_mag",2,1],["vn_chicom_grenade_mag",2,1]]],"vn_o_helmet_vc_03","vn_o_scarf_01_04",[],["vn_o_item_map","","vn_o_item_radio_m252","vn_b_item_compass","vn_b_item_watch",""]];

CREATE_LOADOUT(vc_mk,_baseLoadout);
COPY_ADDONS(vc__mk,vc_rif);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,vc_rif,2);
ADD_PISTOL_TO_CRATE(small,vc_rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,vc_rif,8);
ADD_RIFLE_AMMO_TO_CRATE(small,vc_rif,40);
ADD_RIFLE_AMMO_TO_CRATE(small,vc_ar,8);
ADD_RIFLE_AMMO_TO_CRATE(small,vc_mk,12);
ADD_RIFLE_GRENADES_TO_CRATE(small,vc_ftl,15);

ADD_ITEMS_TO_CRATE(small,"30Rnd_65x39_caseless_green_mag_Tracer",15);
ADD_ITEMS_TO_CRATE(small,"ACE_10Rnd_762x54_Tracer_mag",12);
ADD_ITEMS_TO_CRATE(small,"150Rnd_762x54_Box_Tracer",4);

ADD_ITEMS_TO_CRATE(small,"1Rnd_HE_Grenade_shell",15);
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

ADD_BACKPACKS_TO_CRATE(small,vc_rif,2);

ADD_ITEMS_TO_CRATE(small,"Binocular",2);
ADD_ITEMS_TO_CRATE(small,"Toolkit",1);

FINALIZE_CRATE(small);


// Medium crate loadout
CREATE_CRATE(med);

ADD_RIFLE_TO_CRATE(med,vc_rif,4);
ADD_PISTOL_TO_CRATE(med,vc_rif,4);

ADD_PISTOL_AMMO_TO_CRATE(med,vc_rif,12);
ADD_RIFLE_AMMO_TO_CRATE(med,vc_rif,60);
ADD_RIFLE_AMMO_TO_CRATE(med,vc_ar,12);
ADD_RIFLE_AMMO_TO_CRATE(med,vc_mk,24);
ADD_RIFLE_GRENADES_TO_CRATE(med,vc_ftl,30);

ADD_ITEMS_TO_CRATE(med,"30Rnd_65x39_caseless_green_mag_Tracer",20);
ADD_ITEMS_TO_CRATE(med,"ACE_10Rnd_762x54_Tracer_mag",24);
ADD_ITEMS_TO_CRATE(med,"150Rnd_762x54_Box_Tracer",6);

ADD_ITEMS_TO_CRATE(med,"1Rnd_Smoke_Grenade_shell",20);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeRed_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeBlue_Grenade_shell",10);

ADD_ITEMS_TO_CRATE(med,"SmokeShellRed",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShellBlue",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShell",15);

ADD_ITEMS_TO_CRATE(med,"HandGrenade",15);
ADD_ITEMS_TO_CRATE(med,"ACE_SpareBarrel",25);

ADD_BANDAGES_TO_CRATE(med,80);
ADD_SPLINTS_TO_CRATE(med,40);
ADD_MEDS_TO_CRATE(med,50);
ADD_BLOOD_TO_CRATE(med,30);

ADD_BACKPACKS_TO_CRATE(med,vc_rif,4);

ADD_ITEMS_TO_CRATE(med,"Binocular",4);
ADD_ITEMS_TO_CRATE(med,"Toolkit",1);

FINALIZE_CRATE(med);

// Default loadout.
// If Gearscript tries to use an invalid loadout, it will fall-back to this default loadout instead.

COPY_LOADOUT(default,vc_rif);
