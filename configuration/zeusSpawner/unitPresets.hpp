




// Start editing below here
// ---------------------------------------------------------------------------------------------------------------------------------------

class CA_ZeusUI_Units
{

	// Category definition
	class BLUFOR_Infantry
	{
		categoryName = "BLUFOR Infantry";			// This is the name of the category which you will see in-game.
		gear = "blu_f";					// This is the faction code as used in the F3 framework. Here, "blu_f", means the gear will be taken from the BLUFOR gearscript (aka BLUFOR).
		side = "west";					// "west" means the units will bear allegiance to the western side (aka BLUFOR). Available options are: "west", "east", "resistance" and "civilian".

		// Units definition
		class Rifleman
		{
			unitName = "BLUFOR Rifleman";		// This is the name of the squad which will be shown in-game.
			units[] = {"rif"};			// This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "BLUFOR Fireteam 4x";
			units[] = {"ftl", "ar", "lat", "rif"};
		};

		class Squad_6x
		{
			unitName = "BLUFOR Squad 6x";
			units[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};	// This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "BLUFOR Section 9x";
			units[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};

		class LAT_Team
		{
			unitName = "BLUFOR LAT Team";
			units[] = {"rif", "lat"};
		};

		class AR_Team
		{
			unitName = "BLUFOR AR Team";
			units[] = {"aar", "ar"};
		};

		class MK_Team
		{
			unitName = "BLUFOR MK Team";
			units[] = {"rif", "mk"};
		};
	};

	class BLUFOR_Vehicles
	{
		categoryName = "BLUFOR Vehicles";
		gear = "blu_f";
		side = "west";

		class M2A4_Slammer_UP
		{
			unitName = "M54 Truck";		// This is the name of the vehicle which will be shown in-game.
			vehicle = "vn_b_wheeled_m54_01";		// This is the classname of the vehicle. You can get it by right-clicking a vehicle in 3DEN and selecting "Log > Log classes to clipboard"
			units[] = {"rif"};		// This is the crew of the vehicle.  The first unit in the list is always the commander.
		};

		class AMV7_Marshall		// Classnames can't contain '-'
		{
			unitName = "Willys Jeep";
			vehicle = "vn_i_wheeled_m151_01";
			units[] = {"rif"};
		};

		class IFV6C_Panther
		{
			unitName = "Repair Truck";
			vehicle = "vn_i_wheeled_m54_repair";
			units[] = {"rif"};
		};
	};

	class OPFOR_Infantry
	{
		categoryName = "OPFOR Infantry";
		gear = "opf_f";
		side = "east";

		// Units definition
		class Rifleman
		{
			unitName = "OPFOR Rifleman";		// This is the name of the squad which will be shown in-game.
			units[] = {"rif"};			// This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "OPFOR Fireteam 4x";
			units[] = {"ftl", "ar", "lat", "rif"};
		};

		class Squad_6x
		{
			unitName = "OPFOR Squad 6x";
			units[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};	// This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "OPFOR Section 9x";
			units[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};

		class LAT_Team
		{
			unitName = "OPFOR LAT Team";
			units[] = {"rif", "lat"};
		};

		class AR_Team
		{
			unitName = "OPFOR AR Team";
			units[] = {"aar", "ar"};
		};

		class MK_Team
		{
			unitName = "OPFOR MK Team";
			units[] = {"rif", "mk"};
		};
	};

	class OPFOR_Vehicles
	{
		categoryName = "OPFOR Vehicles";
		gear = "opf_f";
		side = "east";

		class T100_Varsuk		// Classnames can't contain '-'
		{
			unitName = "Jeep Transport";
			vehicle = "vn_c_wheeled_m151_01";
			units[] = {"rif", "ar", "aar"};
		};

		class MSE3_Marid
		{
			unitName = "Truck (DShK)";
			vehicle = "vn_o_wheeled_z157_mg_01_vcmf";
			units[] = {"rif", "rif", "rif"};
		};

		class MSE3_Marid_Reinforcements
		{
			unitName = "Truck + Section 9x";
			vehicle = "vn_o_wheeled_z157_01_vcmf";
			units[] = {"rif"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "rif", "rif", "rif", "mk"};
		};

	};

	class INDFOR_Infantry
	{
		categoryName = "INDFOR Infantry";
		gear = "ind_f";
		side = "resistance";

		// Units definition
		class Rifleman
		{
			unitName = "INDFOR Rifleman";		// This is the name of the squad which will be shown in-game.
			units[] = {"rif"};			// This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "INDFOR Fireteam 4x";
			units[] = {"ftl", "ar", "lat", "rif"};
		};

		class Squad_6x
		{
			unitName = "INDFOR Squad 6x";
			units[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};	// This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "INDFOR Section 9x";
			units[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};

		class LAT_Team
		{
			unitName = "INDFOR LAT Team";
			units[] = {"rif", "lat"};
		};

		class AR_Team
		{
			unitName = "INDFOR AR Team";
			units[] = {"aar", "ar"};
		};

		class MK_Team
		{
			unitName = "INDFOR MK Team";
			units[] = {"rif", "mk"};
		};
	};

	class INDFOR_Vehicles
	{
		categoryName = "INDFOR Vehicles";
		gear = "ind_f";
		side = "resistance";

		class MBT52_Kuma		// Classnames can't contain '-'
		{
			unitName = "Jeep Transport";
			vehicle = "vn_i_wheeled_m151_01";
			units[] = {"rif", "rif", "rif"};
		};

		class MBT52_Coomer		// Classnames can't contain '-'
		{
			unitName = "Jeep MMG";
			vehicle = "vn_i_wheeled_m151_mg_01";
			units[] = {"rif", "rif", "rif"};
		};

		class AFV4_Gorgon_Reinforcements
		{
			unitName = "Truck + Section 9x";
			vehicle = "vn_i_wheeled_m54_01";
			units[] = {"rif"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "rif", "rif", "rif", "mk"};
		};

		class Huey_Reinforcements
		{
			unitName = "Huey + Squad 6x";
			vehicle = "vn_b_air_uh1c_07_06";
			units[] = {"rif", "rif", "rif"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};
		};

		class BTRK_Kamysh_Reinforcements
		{
			unitName = "Huey";
			vehicle = "vn_b_air_uh1c_07_06";
			units[] = {"rif", "rif", "rif"};
		};
	};
};
