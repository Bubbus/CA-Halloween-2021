
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


// cult member Loadout

_baseLoadout = [[],[],["Knife_kukri","","","",[],[],""],["vn_o_uniform_vc_mf_10_07",[["ACE_fieldDressing",4]]],["CUP_V_OI_TKI_Jacket5_04",[]],["B_simc_US_Bandoleer_60_L",[]],"vn_o_boonie_vc_01_02","G_Bandanna_beast",[],["","","","","",""]];

CREATE_LOADOUT(cultist,_baseLoadout);

ADD_UNIFORM(cultist,"vn_o_uniform_vc_mf_10_07");
ADD_UNIFORM(cultist,"vn_o_uniform_vc_mf_11_07");
ADD_UNIFORM(cultist,"vn_o_uniform_vc_reg_11_10");
ADD_UNIFORM(cultist,"vn_o_uniform_vc_mf_12_07");
ADD_UNIFORM(cultist,"vn_o_uniform_vc_reg_12_10");
ADD_UNIFORM(cultist,"vn_o_uniform_vc_mf_02_07");
ADD_UNIFORM(cultist,"vn_o_uniform_vc_02_01");
ADD_UNIFORM(cultist,"vn_o_uniform_vc_02_02");
ADD_UNIFORM(cultist,"vn_o_uniform_vc_mf_03_07");
ADD_UNIFORM(cultist,"vn_o_uniform_vc_mf_09_07");
ADD_UNIFORM(cultist,"vn_o_uniform_nva_dc_13_07");

ADD_BACKPACK(cultist,"B_simc_US_Bandoleer_60_L");
ADD_BACKPACK(cultist,"B_simc_US_Bandoleer_60_R");

_baseLoadout = [[],[],["Pipe_aluminium","","","",[],[],""],["vn_o_uniform_vc_mf_10_07",[["ACE_fieldDressing",4]]],["CUP_V_OI_TKI_Jacket5_04",[]],["B_simc_US_Bandoleer_60_L",[]],"vn_o_boonie_vc_01_02","CUP_PMC_Facewrap_Skull",[],["","","","","",""]];
ADD_VARIANT(cultist,_baseLoadout);

_baseLoadout = [[],[],["WBK_craftedAxe","","","",[],[],""],["vn_o_uniform_vc_mf_10_07",[["ACE_fieldDressing",4]]],["CUP_V_OI_TKI_Jacket5_04",[]],["B_simc_US_Bandoleer_60_L",[]],"vn_o_boonie_vc_01_02","CFP_Face_Wear_Spook",[],["","","","","",""]];
ADD_VARIANT(cultist,_baseLoadout);

_baseLoadout = [[],[],["Crowbar","","","",[],[],""],["vn_o_uniform_vc_mf_10_07",[["ACE_fieldDressing",4]]],["CUP_V_OI_TKI_Jacket5_04",[]],["B_simc_US_Bandoleer_60_L",[]],"vn_o_boonie_vc_01_02","SP_Balaclava_Skull2",[],["","","","","",""]];
ADD_VARIANT(cultist,_baseLoadout);

_baseLoadout = [[],[],["Knife_m3","","","",[],[],""],["vn_o_uniform_vc_mf_10_07",[["ACE_fieldDressing",4]]],["CUP_V_OI_TKI_Jacket5_04",[]],["B_simc_US_Bandoleer_60_L",[]],"vn_o_boonie_vc_01_02","SP_Balaclava_Skull",[],["","","","","",""]];
ADD_VARIANT(cultist,_baseLoadout);

_baseLoadout = [[],[],["WBK_pipeStyledSword","","","",[],[],""],["vn_o_uniform_vc_mf_10_07",[["ACE_fieldDressing",4]]],["CUP_V_OI_TKI_Jacket5_04",[]],["B_simc_US_Bandoleer_60_L",[]],"vn_o_boonie_vc_01_02","G_Bandanna_beast",[],["","","","","",""]];
ADD_VARIANT(cultist,_baseLoadout);

_baseLoadout = [[],[],["Rod","","","",[],[],""],["vn_o_uniform_vc_mf_10_07",[["ACE_fieldDressing",4]]],["CUP_V_OI_TKI_Jacket5_04",[]],["B_simc_US_Bandoleer_60_L",[]],"vn_o_boonie_vc_01_02","CUP_PMC_Facewrap_Skull",[],["","","","","",""]];
ADD_VARIANT(cultist,_baseLoadout);

_baseLoadout = [[],[],["Shovel_Russian_Rotated","","","",[],[],""],["vn_o_uniform_vc_mf_10_07",[["ACE_fieldDressing",4]]],["CUP_V_OI_TKI_Jacket5_04",[]],["B_simc_US_Bandoleer_60_L",[]],"vn_o_boonie_vc_01_02","CFP_Face_Wear_Spook",[],["","","","","",""]];
ADD_VARIANT(cultist,_baseLoadout);

_baseLoadout = [[],[],["WBK_survival_weapon_4","","","",[],[],""],["vn_o_uniform_vc_mf_10_07",[["ACE_fieldDressing",4]]],["CUP_V_OI_TKI_Jacket5_04",[]],["B_simc_US_Bandoleer_60_L",[]],"vn_o_boonie_vc_01_02","SP_Balaclava_Skull2",[],["","","","","",""]];
ADD_VARIANT(cultist,_baseLoadout);

_baseLoadout = [[],[],["WBK_survival_weapon_3","","","",[],[],""],["vn_o_uniform_vc_mf_10_07",[["ACE_fieldDressing",4]]],["CUP_V_OI_TKI_Jacket5_04",[]],["B_simc_US_Bandoleer_60_L",[]],"vn_o_boonie_vc_01_02","SP_Balaclava_Skull",[],["","","","","",""]];
ADD_VARIANT(cultist,_baseLoadout);


// cult leader Loadout

_baseLoadout = [[],[],["WBK_axe","","","",[],[],""],["vn_o_uniform_vc_mf_04_07",[["ACE_splint",1],["ACE_fieldDressing",5],["ACE_bloodIV_250",1],["vn_b_item_trapkit",1]]],["CUP_V_OI_TKI_Jacket5_05",[]],[],"NWTS_Deer_Mossy","G_Blindfold_01_black_F",[],["","","","","",""]];

CREATE_LOADOUT(cultleader,_baseLoadout);
COPY_ADDONS(cultleader,cultist);

_baseLoadout = [[],[],["Bat_Spike","","","",[],[],""],["vn_o_uniform_vc_mf_04_07",[["ACE_splint",1],["ACE_fieldDressing",5],["ACE_bloodIV_250",1],["vn_b_item_trapkit",1]]],["CUP_V_OI_TKI_Jacket5_05",[]],[],"NWTS_Deer_Mossy","G_Blindfold_01_black_F",[],["","","","","",""]];
ADD_VARIANT(cultleader,_baseLoadout);

_baseLoadout = [[],[],["WBK_brush_axe","","","",[],[],""],["vn_o_uniform_vc_mf_04_07",[["ACE_splint",1],["ACE_fieldDressing",5],["ACE_bloodIV_250",1],["vn_b_item_trapkit",1]]],["CUP_V_OI_TKI_Jacket5_05",[]],[],"NWTS_Deer_Mossy","G_Blindfold_01_black_F",[],["","","","","",""]];
ADD_VARIANT(cultleader,_baseLoadout);

_baseLoadout = [[],[],["WBK_craftedAxe","","","",[],[],""],["vn_o_uniform_vc_mf_04_07",[["ACE_splint",1],["ACE_fieldDressing",5],["ACE_bloodIV_250",1],["vn_b_item_trapkit",1]]],["CUP_V_OI_TKI_Jacket5_05",[]],[],"NWTS_Deer_Mossy","G_Blindfold_01_black_F",[],["","","","","",""]];
ADD_VARIANT(cultleader,_baseLoadout);

_baseLoadout = [[],[],["WBK_survival_weapon_2","","","",[],[],""],["vn_o_uniform_vc_mf_04_07",[["ACE_splint",1],["ACE_fieldDressing",5],["ACE_bloodIV_250",1],["vn_b_item_trapkit",1]]],["CUP_V_OI_TKI_Jacket5_05",[]],[],"NWTS_Deer_Mossy","G_Blindfold_01_black_F",[],["","","","","",""]];
ADD_VARIANT(cultleader,_baseLoadout);

_baseLoadout = [[],[],["WBK_pipeStyledSword","","","",[],[],""],["vn_o_uniform_vc_mf_04_07",[["ACE_splint",1],["ACE_fieldDressing",5],["ACE_bloodIV_250",1],["vn_b_item_trapkit",1]]],["CUP_V_OI_TKI_Jacket5_05",[]],[],"NWTS_Deer_Mossy","G_Blindfold_01_black_F",[],["","","","","",""]];
ADD_VARIANT(cultleader,_baseLoadout);

_baseLoadout = [[],[],["Rod","","","",[],[],""],["vn_o_uniform_vc_mf_04_07",[["ACE_splint",1],["ACE_fieldDressing",5],["ACE_bloodIV_250",1],["vn_b_item_trapkit",1]]],["CUP_V_OI_TKI_Jacket5_05",[]],[],"NWTS_Deer_Mossy","G_Blindfold_01_black_F",[],["","","","","",""]];
ADD_VARIANT(cultleader,_baseLoadout);

_baseLoadout = [[],[],["Sashka_Russian","","","",[],[],""],["vn_o_uniform_vc_mf_04_07",[["ACE_splint",1],["ACE_fieldDressing",5],["ACE_bloodIV_250",1],["vn_b_item_trapkit",1]]],["CUP_V_OI_TKI_Jacket5_05",[]],[],"NWTS_Deer_Mossy","G_Blindfold_01_black_F",[],["","","","","",""]];
ADD_VARIANT(cultleader,_baseLoadout);


// cult gunner Loadout

_baseLoadout = [["vn_izh54_shorty","","","",["vn_izh54_so_mag",2],[],""],[],[],["vn_o_uniform_vc_mf_10_07",[["ACE_fieldDressing",4]]],["CUP_V_OI_TKI_Jacket5_04",[["vn_izh54_so_mag",4,2]]],["B_simc_US_Bandoleer_60_L",[]],"vn_o_boonie_vc_01_02","G_Bandanna_beast",[],["","","","","",""]];

CREATE_LOADOUT(cultgunner,_baseLoadout);
COPY_ADDONS(cultgunner,cultist);


// Default loadout.
// If Gearscript tries to use an invalid loadout, it will fall-back to this default loadout instead.

COPY_LOADOUT(default,cultist);
