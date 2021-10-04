




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

	class OPFOR_Infantry
	{
		categoryName = "OPFOR Infantry";
		gear = "opf_f";
		side = "east";

		// Units definition
		class Rifleman
		{
			unitName = "Cultist 1x";		// This is the name of the squad which will be shown in-game.
			units[] = {"cultist"};			// This is the squad which will spawn - this just spawns one rifleman.
		};

		// Units definition
		class Riflemann
		{
			unitName = "Cult Leader 1x";		// This is the name of the squad which will be shown in-game.
			units[] = {"cultleader"};			// This is the squad which will spawn - this just spawns one rifleman.
		};

		// Units definition
		class Riflemannn
		{
			unitName = "Cult Gunner 1x";		// This is the name of the squad which will be shown in-game.
			units[] = {"cultgunner"};			// This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "Cult Melee Team 4x";
			units[] = {"cultleader", "cultist", "cultist", "cultist"};
		};

		class Squad_6x
		{
			unitName = "Cult Mixed Team 4x";
			units[] = {"cultleader", "cultist", "cultist", "cultgunner"};
		};

		class Section_9x
		{
			unitName = "Cult Melee Section 9x";
			units[] = {"cultleader", "cultist", "cultist", "cultist", "cultist", "cultist", "cultist", "cultist", "cultist"};
		};

		class Section_9xx
		{
			unitName = "Cult Mixed Section 9x";
			units[] = {"cultleader", "cultist", "cultist", "cultist", "cultist", "cultist", "cultgunner", "cultgunner", "cultgunner"};
		};
	};

	class INDFOR_Infantry
	{
		categoryName = "Mike Force Infantry";
		gear = "ind_f";
		side = "resistance";

		// Units definition
		class Rifleman
		{
			unitName = "MF Rifleman";		// This is the name of the squad which will be shown in-game.
			units[] = {"rif"};			// This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "MF Fireteam 4x";
			units[] = {"ftl", "ar", "lat", "rif"};
		};

		class Squad_6x
		{
			unitName = "MF Squad 6x";
			units[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};	// This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "MF Section 9x";
			units[] = {"ftl", "ar", "aar", "ar", "med", "mk", "aar", "rif", "rif"};
		};

		class LAT_Team
		{
			unitName = "MF LAT Team";
			units[] = {"rif", "lat"};
		};

		class AR_Team
		{
			unitName = "MF AR Team";
			units[] = {"aar", "ar"};
		};

		class MK_Team
		{
			unitName = "MF MK Team";
			units[] = {"rif", "mk"};
		};
	};

	class INDFOR_Vehicles
	{
		categoryName = "Mike Force Vehicles";
		gear = "ind_f";
		side = "resistance";

		class MBT52_Kuma		// Classnames can't contain '-'
		{
			unitName = "Jeep (50 Cal)";
			vehicle = "vn_b_wheeled_m151_mg_03";
			units[] = {"rif", "rif"};
		};

		class AFV4_Gorgon
		{
			unitName = "Jeep (Unarmed)";
			vehicle = "vn_b_wheeled_m151_02";
			units[] = {"rif", "rif", "rif"};
		};

		class FV720_Mora_Reinforcements
		{
			unitName = "Huey + Squad 6x";
			vehicle = "vn_b_air_uh1c_07_07";
			units[] = {"rif", "rif", "rif"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};
		};

		class Zamak_Reinforcements
		{
			unitName = "Truck + Section 9x";
			vehicle = "vn_b_wheeled_m54_01";
			units[] = {"rif", "rif"};
			reinforcements[] = {"ftl", "ar", "aar", "ar", "med", "mk", "rif", "rif", "rif"};
		};
	};
};
