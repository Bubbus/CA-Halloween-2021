
#define FACTION NONE

#define LOADOUT_VAR(NAME) CONCAT3(f_loadouts_,CONCAT(FACTION,_),NAME)
#define LOADOUT_VAR_DYNAMIC(SIDE,NAME) (missionNamespace getVariable [format ["f_loadouts_%1_%2", SIDE, NAME], []])

#define LOADOUT_REGISTRY LOADOUT_VAR(registry)
#define CRATE_REGISTRY LOADOUT_VAR(crateRegistry)

#define LOADOUT_REGISTRY_DYNAMIC(SIDE) (missionNamespace getVariable [format ["f_loadouts_%1_registry", SIDE], []])
#define CRATE_REGISTRY_DYNAMIC(SIDE) (missionNamespace getVariable [format ["f_loadouts_%1_crateRegistry", SIDE], []])

#define BEGIN_LOADOUTS \
    LOADOUT_REGISTRY = []; \
    CRATE_REGISTRY = []

#define CRATE(NAME) CONCAT(crate_,NAME)
#define ADD_LOADOUT_TO_REGISTRY(NAME) LOADOUT_REGISTRY pushBack #NAME
#define ADD_CRATE_TO_REGISTRY(NAME) CRATE_REGISTRY pushBack STRING(CRATE(NAME))

#define LOADOUT_ITEM_VAR(NAME,ITEM) CONCAT3(LOADOUT_VAR(NAME),_,ITEM)
#define LOADOUT_ITEM_VAR_DYNAMIC(SIDE,NAME,ITEM) (missionNamespace getVariable [format ["f_loadouts_%1_%2_%3", SIDE, NAME, ITEM], []])

#define HATS_DYNAMIC(SIDE,NAME) LOADOUT_ITEM_VAR_DYNAMIC(SIDE,NAME,"hats")
#define VESTS_DYNAMIC(SIDE,NAME) LOADOUT_ITEM_VAR_DYNAMIC(SIDE,NAME,"vest")
#define UNIFORMS_DYNAMIC(SIDE,NAME) LOADOUT_ITEM_VAR_DYNAMIC(SIDE,NAME,"uniforms")
#define BACKPACKS_DYNAMIC(SIDE,NAME) LOADOUT_ITEM_VAR_DYNAMIC(SIDE,NAME,"backpack")

#define ADD_VARIANT(NAME,LOADOUT) LOADOUT_VAR(NAME) pushBack ([LOADOUT] call f_fnc_applyLoadoutModifications)

#define HATS(NAME) LOADOUT_ITEM_VAR(NAME,hats)
#define VESTS(NAME) LOADOUT_ITEM_VAR(NAME,vest)
#define UNIFORMS(NAME) LOADOUT_ITEM_VAR(NAME,uniforms)
#define BACKPACKS(NAME) LOADOUT_ITEM_VAR(NAME,backpack)

#define ADD_HAT(NAME,ITEM) HATS(NAME) pushBack ITEM
#define ADD_VEST(NAME,ITEM) VESTS(NAME) pushBack ITEM
#define ADD_UNIFORM(NAME,ITEM) UNIFORMS(NAME) pushBack ITEM
#define ADD_BACKPACK(NAME,ITEM) BACKPACKS(NAME) pushBack ITEM

#define CLEAR_HATS(NAME) HATS(NAME) = []
#define CLEAR_VESTS(NAME) VESTS(NAME) = []
#define CLEAR_UNIFORMS(NAME) UNIFORMS(NAME) = []
#define CLEAR_BACKPACKS(NAME) BACKPACKS(NAME) = []

#define CREATE_LOADOUT(NAME,LOADOUT)\
    LOADOUT_VAR(NAME) = [];\
    HATS(NAME) = [];\
    VESTS(NAME) = [];\
    UNIFORMS(NAME) = [];\
    BACKPACKS(NAME) = [];\
    ADD_VARIANT(NAME,LOADOUT);\
    ADD_LOADOUT_TO_REGISTRY(NAME)

#define COPY_UNIFORMS(NAME,OTHERNAME)\
	UNIFORMS(NAME) = +UNIFORMS(OTHERNAME)

#define COPY_HATS(NAME,OTHERNAME)\
	HATS(NAME) = +HATS(OTHERNAME)

#define COPY_VESTS(NAME,OTHERNAME)\
	VESTS(NAME) = +VESTS(OTHERNAME)

#define COPY_BACKPACKS(NAME,OTHERNAME)\
	BACKPACKS(NAME) = +BACKPACKS(OTHERNAME)

#define COPY_ADDONS(NAME,OTHERNAME)\
    COPY_HATS(NAME,OTHERNAME);\
    COPY_VESTS(NAME,OTHERNAME);\
    COPY_UNIFORMS(NAME,OTHERNAME);\
    COPY_BACKPACKS(NAME,OTHERNAME)

#define COPY_LOADOUT(NAME,OTHERNAME)\
    LOADOUT_VAR(NAME) = +LOADOUT_VAR(OTHERNAME);\
    COPY_ADDONS(NAME,OTHERNAME);\
    ADD_LOADOUT_TO_REGISTRY(NAME)



#define CRATE_VAR(NAME) LOADOUT_VAR(CRATE(NAME))
#define CRATE_VAR_DYNAMIC(SIDE,NAME) (missionNamespace getVariable [format ["f_loadouts_%1_crate_%2", SIDE, NAME], []])
#define CRATE_VAR_EXISTS(SIDE,NAME) !(isNil format ["f_loadouts_%1_crate_%2", SIDE, NAME])

#define CREATE_CRATE(NAME) \
    CRATE_VAR(NAME) = [];  \
    ADD_CRATE_TO_REGISTRY(NAME)

#define ADD_ITEMS_TO_CRATE(CRATE,ITEM,AMOUNT) [#FACTION,#CRATE,ITEM,AMOUNT] call f_fnc_addItemsToCrate

#define ADD_RIFLE_TO_CRATE(CRATE,NAME,AMOUNT) [#FACTION,#CRATE,#NAME,AMOUNT] call f_fnc_addRifleToCrate
#define ADD_RIFLE_AMMO_TO_CRATE(CRATE,NAME,AMOUNT) [#FACTION,#CRATE,#NAME,AMOUNT] call f_fnc_addRifleAmmoToCrate
#define ADD_RIFLE_GRENADES_TO_CRATE(CRATE,NAME,AMOUNT) [#FACTION,#CRATE,#NAME,AMOUNT] call f_fnc_addRifleGrenadesToCrate

#define ADD_PISTOL_TO_CRATE(CRATE,NAME,AMOUNT) [#FACTION,#CRATE,#NAME,AMOUNT] call f_fnc_addPistolToCrate
#define ADD_PISTOL_AMMO_TO_CRATE(CRATE,NAME,AMOUNT) [#FACTION,#CRATE,#NAME,AMOUNT] call f_fnc_addPistolAmmoToCrate

#define ADD_LAUNCHER_TO_CRATE(CRATE,NAME,AMOUNT) [#FACTION,#CRATE,#NAME,AMOUNT] call f_fnc_addLauncherToCrate
#define ADD_LAUNCHER_AMMO_TO_CRATE(CRATE,NAME,AMOUNT) [#FACTION,#CRATE,#NAME,AMOUNT] call f_fnc_addLauncherAmmoToCrate

#define ADD_BANDAGES_TO_CRATE(CRATE,AMOUNT) [#FACTION,#CRATE,AMOUNT] call f_fnc_addBandagesToCrate
#define ADD_SPLINTS_TO_CRATE(CRATE,AMOUNT) [#FACTION,#CRATE,AMOUNT] call f_fnc_addSplintsToCrate
#define ADD_MEDS_TO_CRATE(CRATE,AMOUNT) [#FACTION,#CRATE,AMOUNT] call f_fnc_addMedsToCrate
#define ADD_BLOOD_TO_CRATE(CRATE,AMOUNT) [#FACTION,#CRATE,AMOUNT] call f_fnc_addBloodToCrate
#define ADD_BACKPACKS_TO_CRATE(CRATE,NAME,AMOUNT) [#FACTION,#CRATE,#NAME,AMOUNT] call f_fnc_addBackpacksToCrate

#define FINALIZE_CRATE(NAME) [CRATE_VAR(NAME)] call f_fnc_applyCrateModifications
