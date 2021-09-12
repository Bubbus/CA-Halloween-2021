
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

_baseLoadout = [["vn_sks","","vn_b_sks","",["vn_sks_mag",10],[],""],[],[],["CUP_U_C_Mechanic_03",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["vn_sks_t_mag",3,10],["SmokeShell",2,1]]],["vn_o_vest_vc_02",[["vn_sks_t_mag",20,10],["vn_m18_white_mag",1,1]]],[],"CUP_U_C_Mechanic_03","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(rif,_baseLoadout);

ADD_UNIFORM(rif,"CUP_U_C_Mechanic_03");
ADD_UNIFORM(rif,"U_I_C_Soldier_Para_5_F");
ADD_UNIFORM(rif,"CUP_U_C_racketeer_02");

ADD_UNIFORM(rif,"CUP_U_C_Rocker_03");
ADD_UNIFORM(rif,"CUP_U_C_Rocker_01");
ADD_UNIFORM(rif,"CUP_U_C_Rocker_04");


ADD_HAT(rif,"vn_b_bandana_03");
ADD_HAT(rif,"H_Cap_grn_BI");
ADD_HAT(rif,"H_Bandanna_surfer");
ADD_HAT(rif,"H_Watchcap_blk");


// Fireteam lead Loadout

_baseLoadout = [["vn_sks_gl","","","",["vn_sks_mag",10],[],""],[],[],["CUP_U_C_Mechanic_03",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["SmokeShell",2,1],["vn_sks_t_mag",3,10]]],["vn_o_vest_vc_05",[["vn_m18_white_mag",1,1],["vn_sks_t_mag",10,10],["vn_22mm_m60_frag_mag",3,1],["vn_22mm_m22_smoke_mag",2,1]]],[],"CUP_U_C_Mechanic_03","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);


// Medic Loadout

_baseLoadout =[["vn_m1897","","","",["vn_m1897_fl_mag",6],[],""],[],[],["CUP_U_C_Mechanic_03",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["SmokeShell",2,1]]],["vn_o_vest_vc_02",[["vn_m18_white_mag",1,1],["vn_m1897_buck_mag",6,6],["vn_m1897_fl_mag",5,6]]],["vn_b_pack_m5_01",[["ACE_elasticBandage",15],["ACE_packingBandage",15],["ACE_adenosine",5],["ACE_epinephrine",10],["FSGm_ItemMedicBag",1],["ACE_morphine",10],["ACE_salineIV",10],["ACE_splint",8],["ACE_tourniquet",6]]],"CUP_U_C_Mechanic_03","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Autorifleman Loadout

_baseLoadout = [["vn_dp28","","","",["vn_dp28_mag",47],[],""],[],[],["CUP_U_C_Mechanic_03",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["SmokeShell",2,1]]],["vn_o_vest_vc_03",[["vn_m18_white_mag",1,1],["vn_dp28_mag",5,47]]],["vn_o_pack_01",[["vn_dp28_mag",10,47]]],"SP_Hood_Black","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);

// Light anti-tank Loadout

_baseLoadout = [["vn_sks","","vn_b_sks","",["vn_sks_mag",10],[],""],[],[],["CUP_U_C_Mechanic_03",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["vn_sks_t_mag",3,10],["SmokeShell",2,1]]],["vn_o_vest_vc_02",[["vn_sks_t_mag",20,10],["vn_m18_white_mag",1,1]]],[],"CUP_U_C_Mechanic_03","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [["vn_sks","","","vn_o_3x_m9130",["vn_sks_mag",10],[],""],[],[],["CUP_U_C_Mechanic_03",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["vn_sks_t_mag",3,10],["SmokeShell",2,1]]],["vn_o_vest_vc_02",[["vn_sks_t_mag",20,10],["vn_m18_white_mag",1,1]]],[],"CUP_U_C_Mechanic_03","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,rif,2);
ADD_LAUNCHER_AMMO_TO_CRATE(small,lat,2);
ADD_PISTOL_TO_CRATE(small,rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,rif,8);
ADD_RIFLE_AMMO_TO_CRATE(small,rif,40);
ADD_RIFLE_AMMO_TO_CRATE(small,ar,8);
ADD_RIFLE_AMMO_TO_CRATE(small,mk,12);
ADD_RIFLE_AMMO_TO_CRATE(small,crew,2);
ADD_RIFLE_GRENADES_TO_CRATE(small,ftl,15);

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

ADD_BACKPACKS_TO_CRATE(small,rif,2);

ADD_ITEMS_TO_CRATE(small,"ACRE_PRC343",6);
ADD_ITEMS_TO_CRATE(small,"ACRE_PRC152",2);
ADD_ITEMS_TO_CRATE(small,"ACRE_PRC148",2);
ADD_ITEMS_TO_CRATE(small,"Binocular",2);
ADD_ITEMS_TO_CRATE(small,"Toolkit",1);

FINALIZE_CRATE(small);


// Medium crate loadout
CREATE_CRATE(med);

ADD_RIFLE_TO_CRATE(med,rif,4);
ADD_LAUNCHER_TO_CRATE(med,lat,1);
ADD_LAUNCHER_AMMO_TO_CRATE(med,lat,4);
ADD_PISTOL_TO_CRATE(med,rif,4);

ADD_PISTOL_AMMO_TO_CRATE(med,rif,12);
ADD_RIFLE_AMMO_TO_CRATE(med,rif,60);
ADD_RIFLE_AMMO_TO_CRATE(med,ar,12);
ADD_RIFLE_AMMO_TO_CRATE(med,mk,24);
ADD_RIFLE_AMMO_TO_CRATE(med,crew,4);
ADD_RIFLE_GRENADES_TO_CRATE(med,ftl,30);

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

ADD_BACKPACKS_TO_CRATE(med,rif,4);

ADD_ITEMS_TO_CRATE(med,"ACRE_PRC343",12);
ADD_ITEMS_TO_CRATE(med,"ACRE_PRC152",4);
ADD_ITEMS_TO_CRATE(med,"ACRE_PRC148",4);
ADD_ITEMS_TO_CRATE(med,"Binocular",4);
ADD_ITEMS_TO_CRATE(med,"Toolkit",1);

FINALIZE_CRATE(med);


// Default loadout.
// If Gearscript tries to use an invalid loadout, it will fall-back to this default loadout instead.

COPY_LOADOUT(default,rif);
