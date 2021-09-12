/*

    Assign custom identities to factions with the following syntax:

    SET_FACTION_IDENTITY(FACTION_NAME,IDENTITY_NAME);

    For example:
    SET_FACTION_IDENTITY(opfor,british);
    
*/


BEGIN_IDENTITY_ASSIGNMENT;

SET_FACTION_IDENTITY(opfor,tanoan);
SET_FACTION_IDENTITY(blufor,american);
SET_FACTION_IDENTITY(indfor,french_colonial);
SET_FACTION_IDENTITY(guerrilla,cultist);
SET_FACTION_IDENTITY(civilian,greek);
