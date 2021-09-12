
#define FACTION indfor

BEGIN_LOADOUTS;


/*

    Gearscript configuration - BAGUETTE faction.

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

_baseLoadout = [["vn_m2carbine","","vn_b_carbine","",["vn_carbine_15_t_mag",15],[],""],[],[],["U_Simc_OG107_mk1_MC",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["SmokeShell",2,1]]],["V_Simc_mk56_sks",[["vn_m18_white_mag",1,1],["vn_carbine_15_t_mag",13,15]]],[],"H_Simc_Boon_green_3","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(rif,_baseLoadout);

ADD_UNIFORM(rif,"U_Simc_OG107_mk1_MC");
ADD_UNIFORM(rif,"U_Simc_OG107_mk1_gas_MC");
ADD_UNIFORM(rif,"U_Simc_OG107_mk1_gas_blench");

ADD_UNIFORM(rif,"U_Simc_regenkot_erdl_High");
ADD_UNIFORM(rif,"U_Simc_regenkot_og107");
ADD_UNIFORM(rif,"U_Simc_regenkot");


ADD_HAT(rif,"SP_Beret_Blue");
ADD_HAT(rif,"H_Simc_Boon_green_3");
ADD_HAT(rif,"H_Simc_Boon_green_1");
ADD_HAT(rif,"H_Simc_Boon_erdl_low_1");


// Fireteam lead Loadout

_baseLoadout = [["vn_m2carbine_gl","","","",["vn_carbine_15_t_mag",15],["vn_22mm_m17_frag_mag",1],""],[],[],["U_Simc_OG107_mk1_MC",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["SmokeShell",2,1],["vn_carbine_15_t_mag",2,15]]],["V_Simc_mk56_sks",[["vn_m18_white_mag",1,1],["vn_carbine_15_t_mag",5,15],["vn_22mm_m60_frag_mag",3,1],["vn_22mm_m1a2_frag_mag",2,1],["vn_22mm_m22_smoke_mag",1,1]]],[],"H_Simc_Boon_green_3","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);


// Medic Loadout

_baseLoadout = [["vn_m1carbine","","","",["vn_carbine_15_mag",15],[],""],[],[],["U_Simc_OG107_mk1_MC",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["SmokeShell",2,1],["vn_carbine_15_t_mag",2,15]]],["V_Simc_mk56_sks",[["vn_m18_white_mag",1,1],["vn_carbine_15_t_mag",13,15]]],["vn_b_pack_m5_01",[["ACE_elasticBandage",15],["ACE_packingBandage",15],["ACE_adenosine",5],["ACE_epinephrine",10],["FSGm_ItemMedicBag",1],["ACE_morphine",10],["ACE_salineIV",10],["ACE_splint",8],["ACE_tourniquet",6]]],"H_Simc_Boon_green_3","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Autorifleman Loadout

_baseLoadout = [["vn_mp40","","","",["vn_mp40_t_mag",32],[],""],[],[],["U_Simc_OG107_mk1_MC",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["SmokeShell",2,1],["vn_mp40_t_mag",1,32]]],["V_Simc_mk56_sks",[["vn_m18_white_mag",1,1],["vn_mp40_t_mag",10,32]]],[],"H_Simc_Boon_green_3","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);

// Light anti-tank Loadout

_baseLoadout = [["vn_m2carbine","","vn_b_carbine","",["vn_carbine_15_t_mag",10],[],""],[],[],["U_Simc_OG107_mk1_MC",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["vn_carbine_15_t_mag",3,10],["SmokeShell",2,1]]],["V_Simc_mk56_sks",[["vn_carbine_15_t_mag",20,10],["vn_m18_white_mag",1,1]]],[],"H_Simc_Boon_green_3","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [["vn_m2carbine","","","vn_o_3x_m9130",["vn_carbine_15_t_mag",10],[],""],[],[],["U_Simc_OG107_mk1_MC",[["ACE_fieldDressing",5],["ACE_elasticBandage",2],["ACE_packingBandage",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_splint",2],["ACE_tourniquet",2],["vn_m61_grenade_mag",2,1],["vn_carbine_15_t_mag",3,10],["SmokeShell",2,1]]],["V_Simc_mk56_sks",[["vn_carbine_15_t_mag",20,10],["vn_m18_white_mag",1,1]]],[],"H_Simc_Boon_green_3","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,rif,2);
ADD_LAUNCHER_TO_CRATE(small,lat,2);
ADD_PISTOL_TO_CRATE(small,rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,rif,6);
ADD_RIFLE_AMMO_TO_CRATE(small,rif,30);
ADD_RIFLE_AMMO_TO_CRATE(small,ar,4);
ADD_RIFLE_AMMO_TO_CRATE(small,mk,5);
ADD_RIFLE_AMMO_TO_CRATE(small,crew,2);
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

ADD_ITEMS_TO_CRATE(small,"ACRE_PRC343",6);
ADD_ITEMS_TO_CRATE(small,"ACRE_PRC152",2);
ADD_ITEMS_TO_CRATE(small,"ACRE_PRC148",2);
ADD_ITEMS_TO_CRATE(small,"Binocular",2);
ADD_ITEMS_TO_CRATE(small,"Toolkit",1);

FINALIZE_CRATE(small);


// Medium crate loadout
CREATE_CRATE(med);

ADD_RIFLE_TO_CRATE(med,rif,4);
ADD_LAUNCHER_TO_CRATE(med,lat,4);
ADD_PISTOL_TO_CRATE(med,rif,4);

ADD_PISTOL_AMMO_TO_CRATE(med,rif,12);
ADD_RIFLE_AMMO_TO_CRATE(med,rif,60);
ADD_RIFLE_AMMO_TO_CRATE(med,ar,8);
ADD_RIFLE_AMMO_TO_CRATE(med,mk,10);
ADD_RIFLE_AMMO_TO_CRATE(med,crew,4);
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

ADD_ITEMS_TO_CRATE(med,"ACRE_PRC343",12);
ADD_ITEMS_TO_CRATE(med,"ACRE_PRC152",4);
ADD_ITEMS_TO_CRATE(med,"ACRE_PRC148",4);
ADD_ITEMS_TO_CRATE(med,"Binocular",4);
ADD_ITEMS_TO_CRATE(med,"Toolkit",1);

FINALIZE_CRATE(med);


// Default loadout.
// If Gearscript tries to use an invalid loadout, it will fall-back to this default loadout instead.

COPY_LOADOUT(default,rif);
