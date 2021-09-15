
#define FACTION blufor

BEGIN_LOADOUTS;


/*

    Gearscript configuration - BLUFOR faction.

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
    For examples on how to use the gearscript system, see below for a default "NATO 2035" loadout.  There are extra details in comments below to explain things.

*/


// Rifleman Loadout

_baseLoadout = [["vn_m14","","vn_b_m14","",["vn_m14_mag",20],[],""],[],["vn_m_machete_02","","","",[],[],""],["CFP_GUER_M81Tee",[["ACE_fieldDressing",4],["ACE_morphine",4],["ACE_tourniquet",4],["ACE_packingBandage",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_elasticBandage",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV",1],["vn_m7_grenade_mag",2,1]]],["CUP_V_OI_TKI_Jacket6_01",[["vn_m14_mag",6,20],["vn_m67_grenade_mag",1,1]]],["grcb_rus_patrol_bag_khaki",[["ACE_EntrenchingTool",1],["vn_m18_white_mag",2,1],["vn_m34_grenade_mag",2,1],["vn_m67_grenade_mag",3,1],["vn_m18_green_mag",1,1],["vn_m18_red_mag",1,1],["vn_m14_mag",10,20]]],"vn_b_boonie_05_01","",["Binocular","","","",[],[],""],["vn_b_item_map","","ItemRadioAcreFlagged","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(rif,_baseLoadout);   // Riflemen will now have the loadout from the line above.

ADD_UNIFORM(rif,"CFP_GUER_M81Tee");  // Add a random uniform or t-shirt.
ADD_UNIFORM(rif,"CFP_GUER_GreenTan");  // Units are twice as likely to have a uniform than a t-shirt because this line has been copied.
ADD_UNIFORM(rif,"CFP_GUER_ERDLpants");
ADD_UNIFORM(rif,"CFP_GUER_ChocChippants");
ADD_UNIFORM(rif,"CFP_GUER_Khk_Wdl");
ADD_UNIFORM(rif,"CFP_GUER_PolyDesTee");
ADD_UNIFORM(rif,"CFP_GUER_Tigerpants");
ADD_UNIFORM(rif,"CFP_GUER_PolyDespants");
 

ADD_VEST(rif, "CUP_V_OI_TKI_Jacket6_06");
ADD_VEST(rif, "CUP_V_OI_TKI_Jacket6_05");
ADD_VEST(rif, "CUP_V_OI_TKI_Jacket6_04");
ADD_VEST(rif, "CUP_V_OI_TKI_Jacket2_04");
ADD_VEST(rif, "CUP_V_OI_TKI_Jacket2_01");
ADD_VEST(rif, "CUP_V_OI_TKI_Jacket3_04");
ADD_VEST(rif, "CUP_V_OI_TKI_Jacket5_04");
ADD_VEST(rif, "CUP_V_OI_TKI_Jacket5_01");

ADD_HAT(rif,"vn_b_boonie_04_05"); // Add a random helmet to all riflemen.
ADD_HAT(rif,"vn_b_boonie_03_07");
ADD_HAT(rif,"vn_b_boonie_04_06");
ADD_HAT(rif,"vn_b_boonie_04_07");
ADD_HAT(rif,"vn_b_boonie_01_01");
ADD_HAT(rif,"vn_b_boonie_05_05");
ADD_HAT(rif,"vn_b_boonie_04_06");
ADD_HAT(rif,"vn_b_boonie_04_01");
ADD_HAT(rif,"vn_b_boonie_04_03");
ADD_HAT(rif,"vn_b_boonie_02_02");
ADD_HAT(rif,"vn_b_boonie_02_05");

ADD_BACKPACK(rif,"grcb_rus_patrol_bag_olive");
ADD_BACKPACK(rif,"grcb_rus_patrol_bag_Black");
ADD_BACKPACK(rif,"grcb_rus_patrol_bag_khaki_shovel");
ADD_BACKPACK(rif,"grcb_rus_patrol_bag_hxt");
ADD_BACKPACK(rif,"grcb_rus_patrol_bag_flora");
ADD_BACKPACK(rif,"vn_b_pack_trp_02");
ADD_BACKPACK(rif,"vn_b_pack_01");
ADD_BACKPACK(rif,"vn_b_pack_04");
ADD_BACKPACK(rif,"vn_b_pack_01_02");


_variantLoadout = [["vn_m2carbine","","","",["vn_carbine_30_mag",30],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["CFP_GUER_GreenTan",[["ACE_fieldDressing",4],["ACE_morphine",4],["ACE_tourniquet",4],["ACE_packingBandage",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_elasticBandage",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV",1],["vn_m7_grenade_mag",2,1]]],["CUP_V_OI_TKI_Jacket6_06",[["vn_m67_grenade_mag",1,1],["vn_carbine_30_mag",5,30],["vn_m1911_mag",2,7]]],["vn_b_pack_trp_02",[["ACE_EntrenchingTool",1],["vn_m18_white_mag",2,1],["vn_m34_grenade_mag",2,1],["vn_m67_grenade_mag",1,1],["vn_m18_green_mag",1,1],["vn_m18_red_mag",1,1]]],"vn_b_boonie_04_07","UK3CB_BAF_G_Tactical_Grey",["Binocular","","","",[],[],""],["vn_b_item_map","","","ItemCompass","ItemWatch",""]];

ADD_VARIANT(rif,_variantLoadout);

// Commander Loadout

_baseLoadout = [["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC343_ID_3",1],["ACRE_PRC148_ID_1",1],["ACE_splint",2],["ACE_epinephrine",1],["ACRE_PRC152",1]]],["V_PlateCarrier1_rgr",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_mag_Tracer",4,30],["30Rnd_65x39_caseless_mag",4,30],["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["16Rnd_9x21_Mag",1,17]]],["B_AssaultPack_khk",[["NVGoggles",1]]],"H_MilCap_mcamo","G_Tactical_Clear",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["vn_m14","","vn_b_m14","",["vn_m14_mag",20],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["CFP_GUER_M81Tee",[["ACE_fieldDressing",4],["ACE_morphine",4],["ACE_tourniquet",4],["ACE_packingBandage",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_elasticBandage",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV",1],["vn_m7_grenade_mag",2,1]]],["CUP_V_OI_TKI_Jacket6_01",[["vn_m14_mag",6,20],["vn_m67_grenade_mag",1,1]]],["grcb_rus_patrol_bag_khaki",[["ACE_EntrenchingTool",1],["vn_m18_white_mag",4,1],["vn_m34_grenade_mag",2,1],["vn_m18_green_mag",3,1],["vn_m18_red_mag",3,1],["vn_m14_mag",6,20],["vn_m1911_mag",4,7],["vn_m67_grenade_mag",2,1]]],"vn_b_boonie_05_01","",["Binocular","","","",[],[],""],["vn_b_item_map","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);   // FTLs will now get the random uniforms and hats from the Rifleman class.

// Squad lead Loadout

COPY_LOADOUT(sl,ftl);   // SLs will be identical to FTLs.  Because FTLs get the random Rifleman stuff, SLs will get it too.

// RTO

_baseLoadout = [["vn_m14","","vn_b_m14","",["vn_m14_mag",20],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["CFP_GUER_M81Tee",[["ACE_fieldDressing",4],["ACE_morphine",4],["ACE_tourniquet",4],["ACE_packingBandage",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_elasticBandage",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV",1],["vn_m7_grenade_mag",2,1]]],["CUP_V_OI_TKI_Jacket6_01",[["vn_m14_mag",6,20],["vn_m67_grenade_mag",1,1]]],["vn_b_pack_lw_06",[["ACE_EntrenchingTool",1],["ACRE_PRC152",1],["vn_m18_white_mag",3,1],["vn_m34_grenade_mag",2,1],["vn_m18_green_mag",1,1],["vn_m18_red_mag",1,1],["vn_m14_mag",8,20],["vn_m1911_mag",4,7],["vn_m67_grenade_mag",1,1]]],"vn_b_boonie_05_01","",["Binocular","","","",[],[],""],["vn_b_item_map","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(rto,_baseLoadout);


ADD_UNIFORM(rto,"CFP_GUER_M81Tee");  // Add a random uniform or t-shirt.
ADD_UNIFORM(rto,"CFP_GUER_GreenTan");  // Units are twice as likely to have a uniform than a t-shirt because this line has been copied.
ADD_UNIFORM(rto,"CFP_GUER_ERDLpants");
ADD_UNIFORM(rto,"CFP_GUER_ChocChippants");
ADD_UNIFORM(rto,"CFP_GUER_Khk_Wdl");
ADD_UNIFORM(rto,"CFP_GUER_PolyDesTee");
ADD_UNIFORM(rto,"CFP_GUER_Tigerpants");
ADD_UNIFORM(rto,"CFP_GUER_PolyDespants");
 

ADD_VEST(rto, "CUP_V_OI_TKI_Jacket6_06");
ADD_VEST(rto, "CUP_V_OI_TKI_Jacket6_05");
ADD_VEST(rto, "CUP_V_OI_TKI_Jacket6_04");
ADD_VEST(rto, "CUP_V_OI_TKI_Jacket2_04");
ADD_VEST(rto, "CUP_V_OI_TKI_Jacket2_01");
ADD_VEST(rto, "CUP_V_OI_TKI_Jacket3_04");
ADD_VEST(rto, "CUP_V_OI_TKI_Jacket5_04");
ADD_VEST(rto, "CUP_V_OI_TKI_Jacket5_01");

ADD_HAT(rto,"vn_b_boonie_04_05"); // Add a random helmet to all riflemen.
ADD_HAT(rto,"vn_b_boonie_03_07");
ADD_HAT(rto,"vn_b_boonie_04_06");
ADD_HAT(rto,"vn_b_boonie_04_07");
ADD_HAT(rto,"vn_b_boonie_01_01");
ADD_HAT(rto,"vn_b_boonie_05_05");
ADD_HAT(rto,"vn_b_boonie_04_06");
ADD_HAT(rto,"vn_b_boonie_04_01");
ADD_HAT(rto,"vn_b_boonie_04_03");
ADD_HAT(rto,"vn_b_boonie_02_02");
ADD_HAT(rto,"vn_b_boonie_02_05");

// Medic Loadout

_baseLoadout = [["vn_m2carbine","","","",["vn_carbine_30_mag",30],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["CFP_GUER_GreenTan",[["ACE_fieldDressing",4],["ACE_morphine",4],["ACE_tourniquet",4],["ACE_packingBandage",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_elasticBandage",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV",1],["vn_m7_grenade_mag",2,1]]],["CUP_V_OI_TKI_Jacket6_06",[["vn_carbine_30_mag",5,30],["vn_m1911_mag",2,7],["vn_m67_grenade_mag",1,1]]],["vn_b_pack_trp_02",[["ACE_elasticBandage",35],["ACE_EntrenchingTool",1],["FSGm_ItemMedicBag",1],["ACE_morphine",6],["ACE_salineIV",8],["ACE_salineIV_500",8],["ACE_splint",10],["ACE_tourniquet",6],["ACE_epinephrine",6],["ACE_adenosine",6],["vn_m18_white_mag",3,1],["vn_carbine_30_mag",2,30]]],"vn_b_boonie_04_07","UK3CB_BAF_G_Tactical_Grey",["Binocular","","","",[],[],""],["vn_b_item_map","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Montana Miller Loadout

_baseLoadout = [["vn_m1897","","","",["vn_m1897_fl_mag",6],[],""],[],["vn_m1895","","","",["vn_m1895_mag",7],[],""],["CFP_GUER_TanTee",[["ACE_fieldDressing",4],["ACE_morphine",4],["ACE_tourniquet",4],["ACE_packingBandage",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_elasticBandage",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV",1],["vn_m7_grenade_mag",2,1]]],["CUP_V_OI_TKI_Jacket1_06",[["vn_m1895_mag",3,7],["vn_m1897_buck_mag",1,6],["vn_m1897_fl_mag",1,6]]],["vn_b_pack_trp_02",[["ACE_EntrenchingTool",1],["vn_m1897_buck_mag",6,6],["vn_m1897_fl_mag",6,6],["vn_m1895_mag",15,7],["vn_m18_white_mag",4,1],["vn_m34_grenade_mag",2,1]]],"CUP_H_NAPA_Fedora","vn_b_scarf_01_03",["Binocular","","","",[],[],""],["vn_b_item_map","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(miller,_baseLoadout);

// Autorifleman Loadout

_baseLoadout = [["hlc_lmg_MG42","","","",["hlc_200Rnd_792x57_M_MG42",200],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["CFP_GUER_GreenTan",[["ACE_fieldDressing",4],["ACE_morphine",4],["ACE_tourniquet",4],["ACE_packingBandage",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_elasticBandage",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV",1],["vn_m7_grenade_mag",2,1]]],["CUP_V_OI_TKI_Jacket6_06",[["vn_m67_grenade_mag",1,1],["vn_m1911_mag",5,7],["vn_m18_white_mag",2,1]]],["vn_b_pack_trp_02",[["ACE_EntrenchingTool",1],["hlc_200Rnd_792x57_M_MG42",2,200]]],"vn_b_boonie_04_07","UK3CB_BAF_G_Tactical_Grey",["Binocular","","","",[],[],""],["vn_b_item_map","","","ItemCompass","ItemWatch",""]];


CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [["vn_m2carbine","","","",["vn_carbine_30_mag",30],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["CFP_GUER_GreenTan",[["ACE_fieldDressing",4],["ACE_morphine",4],["ACE_tourniquet",4],["ACE_packingBandage",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_elasticBandage",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV",1],["vn_m7_grenade_mag",2,1]]],["CUP_V_OI_TKI_Jacket6_06",[["vn_m67_grenade_mag",1,1],["vn_carbine_30_mag",5,30],["vn_m1911_mag",2,7]]],["vn_b_pack_trp_02",[["ACE_EntrenchingTool",1],["vn_m18_white_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_m67_grenade_mag",1,1],["hlc_200Rnd_792x57_M_MG42",2,200],["vn_carbine_30_mag",3,30]]],"vn_b_boonie_04_07","UK3CB_BAF_G_Tactical_Grey",["Binocular","","","",[],[],""],["vn_b_item_map","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,rif);

_variantLoadout = [["vn_m14","","vn_b_m14","",["vn_m14_mag",20],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["CFP_GUER_GreenTan",[["ACE_fieldDressing",4],["ACE_morphine",4],["ACE_tourniquet",4],["ACE_packingBandage",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_elasticBandage",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV",1],["vn_m7_grenade_mag",2,1]]],["CUP_V_OI_TKI_Jacket6_06",[["vn_m67_grenade_mag",1,1],["vn_m1911_mag",2,7],["vn_m14_mag",5,20]]],["vn_b_pack_trp_02",[["ACE_EntrenchingTool",1],["vn_m18_white_mag",2,1],["vn_m34_grenade_mag",1,1],["vn_m67_grenade_mag",1,1],["hlc_200Rnd_792x57_M_MG42",2,200],["vn_m14_mag",3,20]]],"vn_b_boonie_04_07","UK3CB_BAF_G_Tactical_Grey",["Binocular","","","",[],[],""],["vn_b_item_map","","","ItemCompass","ItemWatch",""]];

ADD_VARIANT(aar,_variantLoadout);

// Grenadier Loadout

_baseLoadout = [["vn_m2carbine_gl","","","",["vn_carbine_30_mag",30],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["CFP_GUER_GreenTan",[["ACE_fieldDressing",4],["ACE_morphine",4],["ACE_tourniquet",4],["ACE_packingBandage",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_elasticBandage",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV",1],["vn_m7_grenade_mag",2,1]]],["CUP_V_OI_TKI_Jacket6_06",[["vn_m67_grenade_mag",1,1],["vn_m1911_mag",2,7],["vn_carbine_30_mag",5,30]]],["vn_b_pack_trp_02",[["ACE_EntrenchingTool",1],["vn_m18_white_mag",2,1],["vn_m34_grenade_mag",2,1],["vn_m67_grenade_mag",1,1],["vn_m18_green_mag",1,1],["vn_m18_red_mag",1,1],["vn_carbine_15_mag",9,15],["vn_m1911_mag",2,7],["vn_22mm_m19_wp_mag",4,1],["vn_22mm_m17_frag_mag",7,1],["vn_22mm_m22_smoke_mag",4,1]]],"vn_b_boonie_04_07","UK3CB_BAF_G_Tactical_Grey",["Binocular","","","",[],[],""],["vn_b_item_map","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(gren,_baseLoadout);
COPY_ADDONS(gren,rif);


// SMG Loadout

_baseLoadout = [["vn_m45","","","",["vn_m45_mag",36],[],""],[],["vn_m1911","","","",["vn_m1911_mag",7],[],""],["CFP_GUER_GreenTan",[["ACE_fieldDressing",4],["ACE_morphine",4],["ACE_tourniquet",4],["ACE_packingBandage",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_elasticBandage",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV",1],["vn_m7_grenade_mag",2,1]]],["CUP_V_OI_TKI_Jacket6_06",[["vn_m67_grenade_mag",1,1],["vn_m1911_mag",2,7],["vn_m45_mag",5,36]]],["vn_b_pack_trp_02",[["ACE_EntrenchingTool",1],["vn_m18_white_mag",2,1],["vn_m34_grenade_mag",2,1],["vn_m67_grenade_mag",2,1],["vn_m18_green_mag",1,1],["vn_m18_red_mag",1,1],["vn_m45_mag",14,36],["vn_m1911_mag",3,7]]],"vn_b_boonie_04_07","UK3CB_BAF_G_Tactical_Grey",["Binocular","","","",[],[],""],["vn_b_item_map","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(smg,_baseLoadout);
COPY_ADDONS(smg,rif);


// Crewman Loadout

_baseLoadout = [["SMG_01_F","","acc_flashlight_smg_01","optic_ACO_grn_smg",["30Rnd_45ACP_Mag_SMG_01",25],[],""],[],[],["U_B_HeliPilotCoveralls",[["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACE_splint",2],["ACRE_PRC343_ID_1",1],["ACRE_PRC148_ID_2",1],["ACRE_PRC152_ID_2",1]]],["V_Chestrig_oli",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["30Rnd_45ACP_Mag_SMG_01",5,25],["SmokeShellBlue",1,1],["SmokeShellRed",1,1]]],["B_FieldPack_oli",[["ToolKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetCrew_B","G_Combat",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles_INDEP"]];

CREATE_LOADOUT(crew,_baseLoadout);


// Engineer/logi Loadout

_baseLoadout = [["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC343_ID_3",1],["ACRE_PRC148_ID_1",1],["ACE_splint",2],["ACE_epinephrine",1],["ACRE_PRC152",1]]],["V_PlateCarrier1_rgr",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_mag_Tracer",4,30],["30Rnd_65x39_caseless_mag",4,30],["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["16Rnd_9x21_Mag",1,17]]],["B_AssaultPack_khk",[["ToolKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetB","G_Tactical_Clear",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(eng,_baseLoadout);


// Zeus

_baseLoadout = [["arifle_SDAR_F","","","",["30Rnd_556x45_Stanag_Tracer_Red",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343_ID_3",1],["ACRE_PRC148",1],["ACRE_PRC152",1],["ACE_Banana",1]]],["V_PlateCarrier1_rgr",[["ACE_Banana",1],["ACE_CableTie",10],["16Rnd_9x21_Mag",2,17],["30Rnd_556x45_Stanag_Tracer_Red",3,30]]],["B_AssaultPack_rgr",[["ACE_Banana",1],["ACE_UAVBattery",1],["ACE_EntrenchingTool",1],["ACE_DefusalKit",1],["ToolKit",1],["ACE_wirecutter",1]]],"H_HelmetCrew_I","G_Lowprofile",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles_INDEP"]];

CREATE_LOADOUT(zeus,_baseLoadout);
COPY_ADDONS(zeus,rif);



// Small crate loadout
CREATE_CRATE(small);  // The name of this crate is "small".  You will need to use this name in all the commands below.
                      // INFO: the name of this crate in-game will be "crate_small".

ADD_RIFLE_TO_CRATE(small,rif,2);    // This crate now contains two of the Rifleman's rifles in it.
ADD_LAUNCHER_TO_CRATE(small,lat,2); // This crate now contains two of the LAT soldier's launchers in it.
ADD_PISTOL_TO_CRATE(small,rif,2);   // Two of the Rifleman's pistols.  If the Rifleman doesn't have a pistol, you can choose it from other units (for example, ftl or co).

ADD_RIFLE_AMMO_TO_CRATE(small,rif,30); // This crate now contains two rifle magazines in it, which the Rifleman can use.
ADD_PISTOL_AMMO_TO_CRATE(small,rif,6); // This crate now contains two of the Rifleman's pistol magazines in it.
ADD_RIFLE_AMMO_TO_CRATE(small,ar,6);   // These commands copy whatever magazine is loaded into the weapon in ACE Arsenal.
ADD_RIFLE_AMMO_TO_CRATE(small,crew,2); // So if nothing appears, make sure your loadout has a magazine loaded into its gun.
ADD_RIFLE_GRENADES_TO_CRATE(small,ftl,4);  // Grenade launcher rounds work too!

ADD_ITEMS_TO_CRATE(small,"30Rnd_65x39_caseless_mag_Tracer",10); // The Rifleman has normal bullets loaded into his gun.  To add Tracer rounds into this box, we can use this command.
ADD_ITEMS_TO_CRATE(small,"100Rnd_65x39_caseless_mag_Tracer",3);

ADD_ITEMS_TO_CRATE(small,"3Rnd_Smoke_Grenade_shell",4); // The FTL has explosive grenades loaded by default, to add smoke rounds we can use this command.
ADD_ITEMS_TO_CRATE(small,"3Rnd_SmokeRed_Grenade_shell",2); // If your gearscript uses different ammo, you can select it in ACE Arsenal and use CTRL+C to get the right Classname.
ADD_ITEMS_TO_CRATE(small,"3Rnd_SmokeBlue_Grenade_shell",2); // Then you can use CTRL+V to paste into the quote-marks here.

ADD_ITEMS_TO_CRATE(small,"SmokeShellRed",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShellBlue",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShell",6);

ADD_ITEMS_TO_CRATE(small,"HandGrenade",6);
ADD_ITEMS_TO_CRATE(small,"ACE_SpareBarrel",1);  // to go into battle with a machinegun and not get it red-hot is blasphemous.

ADD_BANDAGES_TO_CRATE(small,40); // This will automatically add a mixture of different bandages into the crate.
ADD_SPLINTS_TO_CRATE(small,20);
ADD_MEDS_TO_CRATE(small,30); // This will automatically add a mixture of different auto-injectors into the crate.
ADD_BLOOD_TO_CRATE(small,15); // This will add eight 1000ml bags of blood.

ADD_BACKPACKS_TO_CRATE(small,rif,2);  // We can also add two of the Rifleman's backpacks in here, in case someone loses theirs or needs to carry extra things.

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
ADD_RIFLE_AMMO_TO_CRATE(med,ar,15);
ADD_RIFLE_AMMO_TO_CRATE(med,crew,4);
ADD_RIFLE_GRENADES_TO_CRATE(med,ftl,10);

ADD_ITEMS_TO_CRATE(med,"30Rnd_65x39_caseless_mag_Tracer",20);
ADD_ITEMS_TO_CRATE(med,"100Rnd_65x39_caseless_mag_Tracer",10);

ADD_ITEMS_TO_CRATE(med,"3Rnd_Smoke_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(med,"3Rnd_SmokeRed_Grenade_shell",5);
ADD_ITEMS_TO_CRATE(med,"3Rnd_SmokeBlue_Grenade_shell",5);

ADD_ITEMS_TO_CRATE(med,"SmokeShellRed",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShellBlue",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShell",15);

ADD_ITEMS_TO_CRATE(med,"HandGrenade",15);
ADD_ITEMS_TO_CRATE(med,"ACE_SpareBarrel",2);

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
