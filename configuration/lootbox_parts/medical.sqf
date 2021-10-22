

// START: Meds

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_fieldDressing",RANGE(3,5)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_morphine",RANGE(1,2)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_epinephrine",RANGE(1,2)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_salineIV_500",RANGE(1,2)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_splint",RANGE(1,2)));
_med_lowtier_tiny = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_fieldDressing",RANGE(7,10)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_morphine",RANGE(2,4)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_epinephrine",RANGE(2,4)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_salineIV_500",RANGE(2,3)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_splint",RANGE(2,3)));
_med_lowtier_small = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_fieldDressing",RANGE(25,30)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_morphine",RANGE(8,12)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_epinephrine",RANGE(6,10)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_salineIV_500",RANGE(8,12)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_splint",RANGE(10,12)));
_med_lowtier_large = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_elasticBandage",RANGE(2,3)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_packingBandage",RANGE(2,3)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_morphine",RANGE(1,2)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_epinephrine",RANGE(1,2)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_adenosine",RANGE(1,2)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_bloodIV_500",RANGE(1,2)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_splint",RANGE(1,2)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_tourniquet",RANGE(1,2)));
_med_hightier_tiny = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_elasticBandage",RANGE(4,6)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_packingBandage",RANGE(3,4)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_morphine",RANGE(2,4)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_epinephrine",RANGE(2,4)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_adenosine",RANGE(2,4)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_bloodIV_500",RANGE(2,3)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_splint",RANGE(2,3)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_tourniquet",RANGE(2,4)));
_med_hightier_small = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_elasticBandage",RANGE(15,18)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_packingBandage",RANGE(10,12)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_morphine",RANGE(8,12)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_epinephrine",RANGE(6,10)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_salineIV_500",RANGE(8,12)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_adenosine",RANGE(6,10)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_splint",RANGE(10,12)));
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_tourniquet",RANGE(6,10)));
_med_hightier_large = _group;

_group = LOOTGROUP();
ADD_TO_LOOTGROUP(_group, ITEMS("ACE_bodyBag",RANGE(4,6)));
ADD_TO_LOOTGROUP(_group, ITEM("ACE_personalAidKit"));
ADD_TO_LOOTGROUP(_group, ITEM("ACE_surgicalKit"));
_med_tools = _group;

// END: Meds



// START: Mashups

_list = LOOTLIST(1);
ADD_TO_LOOTLIST(_list, _med_lowtier_tiny, WHITE);
ADD_TO_LOOTLIST(_list, _med_hightier_tiny, GREEN);
_med_tiny = _list;

_list = LOOTLIST(1);
ADD_TO_LOOTLIST(_list, _med_lowtier_small, WHITE);
ADD_TO_LOOTLIST(_list, _med_hightier_small, GREEN);
_med_small = _list;

_list = LOOTLIST(1);
ADD_TO_LOOTLIST(_list, _med_lowtier_large, WHITE);
ADD_TO_LOOTLIST(_list, _med_hightier_large, GREEN);
_med_large = _list;

// END: Mashups



// START: Lootboxes

CREATE_LOOTBOX(med_lowtier_tiny);
ADD_TO_LOOTBOX(med_lowtier_tiny,_med_lowtier_tiny);

CREATE_LOOTBOX(med_lowtier_small);
ADD_TO_LOOTBOX(med_lowtier_small,_med_lowtier_small);

CREATE_LOOTBOX(med_lowtier_large);
ADD_TO_LOOTBOX(med_lowtier_large,_med_lowtier_large);
ADD_TO_LOOTBOX(med_lowtier_large,_med_tools);

CREATE_LOOTBOX(med_hightier_tiny);
ADD_TO_LOOTBOX(med_hightier_tiny,_med_hightier_tiny);

CREATE_LOOTBOX(med_hightier_small);
ADD_TO_LOOTBOX(med_hightier_small,_med_hightier_small);

CREATE_LOOTBOX(med_hightier_large);
ADD_TO_LOOTBOX(med_hightier_large,_med_hightier_large);
ADD_TO_LOOTBOX(med_hightier_large,_med_tools);

CREATE_LOOTBOX(med_tools);
ADD_TO_LOOTBOX(med_tools,_med_tools);

// END: Lootboxes
