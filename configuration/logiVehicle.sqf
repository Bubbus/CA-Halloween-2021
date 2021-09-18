/*

    Logistics vehicle configuration
    Inspired by F3_CA's logi vic system.  Initial work by Joecuronium, expanded by Bubbus.

    This file allows you to configure logistics vehicles for your mission.
    Logistics vehicles can be used to spawn-in new assets for your players.  It may be operated by anyone in a certain group, or anyone of a certain role.

    Multiple kinds of logistics vehicle may be configured here.  In the editor, assign the logistics role to a vehicle by using the following line in the 'Init' box:

        [this, "example"] call f_fnc_setLogiVehicle;

*/

BEGIN_LOGI_CONFIG;


// Create a type of logi vehicle named "example".
CREATE_LOGI_TYPE(example);

// The same commands can be used to spawn spare wheels and tracks.
ADD_VEHICLE(example,"ACE_Wheel",6);

// This special command lets you give gearscript to a vehicle (for example, ammo crates).
ADD_VEHICLE_WITH_GEAR(example,"vn_b_wheeled_m54_01",5,"crate_small");

ADD_VEHICLE_WITH_GEAR(example,"vn_i_wheeled_m151_01",5,"crate_small");

// Set the faction of the logi vehicle.  Used to choose the correct gear for gearscripted crates etc.
SET_FACTION(example,"blu_f");
