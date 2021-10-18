




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
			unitName = "M2A4 Slammer UP";		// This is the name of the vehicle which will be shown in-game.
			vehicle = "B_MBT_01_TUSK_F";		// This is the classname of the vehicle. You can get it by right-clicking a vehicle in 3DEN and selecting "Log > Log classes to clipboard"
			units[] = {"crew", "crew", "crew"};		// This is the crew of the vehicle.  The first unit in the list is always the commander.
		};

		class AMV7_Marshall		// Classnames can't contain '-'
		{
			unitName = "AMV-7 Marshall";
			vehicle = "B_APC_Wheeled_01_cannon_F";
			units[] = {"crew", "crew", "crew"};
		};

		class AMV_7_Reinforcements
		{
			unitName = "AMV-7 Marshall + Squad 6x"
			vehicle = "B_APC_Wheeled_01_cannon_F";
			units[] = {"crew", "crew", "crew"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"}; // When defined, this group spawns in the cargo space of the vehicle. The vehicle gets a TR unload waypoint and a RTB waypoint (only if it's unarmed), the group a Move waypoint. The vehicle will also despawn on RTB. If the vehicle is a Heli, it will spawn flying and always RTB
		};

		class IFV6C_Panther
		{
			unitName = "IFV-6C Panther";
			vehicle = "B_APC_Tracked_01_rcws_F";
			units[] = {"crew", "crew", "crew"};
		};

		class IFV6C_Panther_Reinforcements
		{
			unitName = "IFV-6C Panther + Squad 6x";
			vehicle = "B_APC_Tracked_01_rcws_F";
			units[] = {"crew", "crew", "crew"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};
		};

		class Hunter_HMG
		{
			unitName = "Hunter HMG";
			vehicle = "B_MRAP_01_HMG_F";
			units[] = {"ftl", "rif", "rif"};
		};

		class HEMTT_Reinforcements
		{
			unitName = "HEMTT Transport + Section 9x";
			vehicle = "B_Truck_01_covered_F";
			units[] = {"rif", "rif"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};
	};

	class OPFOR_Infantry
	{
		categoryName = "US Infantry";
		gear = "ind_f";
		side = "resistance";

		// Units definition
		class Rifleman
		{
			unitName = "OPFOR Rifleman";		// This is the name of the squad which will be shown in-game.
			units[] = {"us_rif"};			// This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "OPFOR Fireteam 4x";
			units[] = {"us_ftl", "us_ar", "us_lat", "us_rif"};
		};

		class Squad_6x
		{
			unitName = "OPFOR Squad 6x";
			units[] = {"us_ftl", "us_ar", "us_eng", "us_lat", "us_rif", "us_mk"};	// This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "OPFOR Section 9x";
			units[] = {"us_ftl", "us_ar", "us_eng", "us_lat", "us_med", "us_mk", "us_rif", "us_rif", "us_eng"};
		};

		class LAT_Team
		{
			unitName = "OPFOR LAT Team";
			units[] = {"us_rif", "us_lat"};
		};

		class AR_Team
		{
			unitName = "OPFOR AR Team";
			units[] = {"us_rif", "us_ar"};
		};

		class MK_Team
		{
			unitName = "OPFOR MK Team";
			units[] = {"us_rif", "us_mk"};
		};
	};

	class OPFOR_Vehicles
	{
		categoryName = "US Vehicles";
		gear = "ind_f";
		side = "resistance";

		class T100_Varsuk		// Classnames can't contain '-'
		{
			unitName = "Jeep (50 Cal)";
			vehicle = "vn_b_wheeled_m151_mg_02";
			units[] = {"us_eng", "us_eng", "us_rif"};
		};

		class MSE3_Marid
		{
			unitName = "Armoured Truck (Guns)";
			vehicle = "vn_b_wheeled_m151_mg_04";
			units[] = {"us_eng", "us_eng", "us_rif"};
		};

		class BTRK_Kamysh_Reinforcements
		{
			unitName = "Huey + Squad 6x";
			vehicle = "vn_b_air_uh1c_07_01";
			units[] = {"us_eng", "us_eng", "us_rif","us_rif"};
			reinforcements[] = {"us_ftl", "us_ar", "us_rif", "us_lat", "us_rif", "us_mk"};
		};

		class Ifrit_HMG
		{
			unitName = "M41 Tank";
			vehicle = "vn_b_armor_m41_01_01";
			units[] = {"us_eng", "us_eng", "us_rif"};
		};

		class Tempest_Reinforcements
		{
			unitName = "Truck + Section 9x";
			vehicle = "vn_b_wheeled_m54_01";
			units[] = {"us_rif"};
			reinforcements[] = {"us_ftl", "us_ar", "us_rif", "us_lat", "us_med", "us_mk", "us_rif", "us_rif", "us_eng"};
		};
	};


	class ARVN_Infantry
	{
		categoryName = "ARVN Infantry";
		gear = "ind_f";
		side = "resistance";

		// Units definition
		class Rifleman
		{
			unitName = "ARVN Rifleman";		// This is the name of the squad which will be shown in-game.
			units[] = {"arvn_rif"};			// This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "ARVN Fireteam 4x";
			units[] = {"arvn_ftl", "arvn_ar", "arvn_lat", "arvn_rif"};
		};

		class Squad_6x
		{
			unitName = "ARVN Squad 6x";
			units[] = {"arvn_ftl", "arvn_ar", "arvn_eng", "arvn_lat", "arvn_rif", "arvn_mk"};	// This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "ARVN Section 9x";
			units[] = {"arvn_ftl", "arvn_ar", "arvn_eng", "arvn_lat", "arvn_med", "arvn_mk", "arvn_rif", "arvn_rif", "arvn_eng"};
		};

		class LAT_Team
		{
			unitName = "ARVN LAT Team";
			units[] = {"arvn_rif", "arvn_lat"};
		};

		class AR_Team
		{
			unitName = "ARVN AR Team";
			units[] = {"arvn_rif", "arvn_ar"};
		};

		class MK_Team
		{
			unitName = "ARVN MK Team";
			units[] = {"arvn_rif", "arvn_mk"};
		};
	};

	class ARVN_Vehicles
	{
		categoryName = "ARVN Vehicles";
		gear = "ind_f";
		side = "resistance";

		class T100_Varsuk		// Classnames can't contain '-'
		{
			unitName = "Type 63 Tank";
			vehicle = "vn_i_armor_type63_01";
			units[] = {"arvn_eng", "arvn_eng", "arvn_rif"};
		};

		class MSE3_Marid
		{
			unitName = "Jeep (50 cal)";
			vehicle = "vn_i_wheeled_m151_mg_01_mp";
			units[] = {"arvn_eng", "arvn_eng", "arvn_rif"};
		};

		class BTRK_Kamysh_Reinforcements
		{
			unitName = "Huey + Squad 6x";
			vehicle = "vn_i_air_uh1c_07_01";
			units[] = {"arvn_eng", "arvn_eng", "arvn_rif", "arvn_rif"};
			reinforcements[] = {"arvn_ftl", "arvn_ar", "arvn_rif", "arvn_lat", "arvn_rif", "arvn_mk"};
		};

		class Tempest_Reinforcements
		{
			unitName = "Truck + Section 9x";
			vehicle = "vn_i_wheeled_m54_01";
			units[] = {"arvn_rif", "arvn_rif"};
			reinforcements[] = {"arvn_ftl", "arvn_ar", "arvn_rif", "arvn_lat", "arvn_med", "arvn_mk", "arvn_rif", "arvn_rif", "arvn_eng"};
		};
	};


	class INDFOR_Infantry
	{
		categoryName = "NVA Infantry";
		gear = "opf_f";
		side = "east";

		// Units definition
		class Rifleman
		{
			unitName = "NVA Rifleman";		// This is the name of the squad which will be shown in-game.
			units[] = {"nva_rif"};			// This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "NVA Fireteam 4x";
			units[] = {"nva_ftl", "nva_ar", "nva_rif", "nva_rif"};
		};

		class Squad_6x
		{
			unitName = "NVA Squad 6x";
			units[] = {"nva_ftl", "nva_ar", "nva_rif", "nva_rif", "nva_rif", "nva_mk"};	// This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "NVA Section 9x";
			units[] = {"nva_ftl", "nva_ar", "nva_rif", "nva_rif", "nva_med", "nva_mk", "nva_rif", "nva_rif", "nva_rif"};
		};

		class AR_Team
		{
			unitName = "NVA AR Team";
			units[] = {"nva_rif", "nva_ar"};
		};

		class MK_Team
		{
			unitName = "NVA MK Team";
			units[] = {"nva_rif", "nva_mk"};
		};
	};

	class INDFOR_Vehicles
	{
		categoryName = "NVA Vehicles";
		gear = "opf_f";
		side = "east";

		class MBT52_Kuma		// Classnames can't contain '-'
		{
			unitName = "BTR-40 DSHKM";
			vehicle = "vn_o_wheeled_btr40_mg_02_nva65";
			units[] = {"nva_rif", "nva_rif", "nva_rif"};
		};

		class AFV4_Gorgon
		{
			unitName = "ZPU Truck";
			vehicle = "vn_o_wheeled_z157_mg_02_nva65";
			units[] = {"nva_rif", "nva_rif"};
		};

		class AFV4_Gorgon_Reinforcements
		{
			unitName = "BTR-40 Transport + Squad 6x";
			vehicle = "vn_o_wheeled_btr40_01_nva65";
			units[] = {"nva_rif", "nva_rif", "nva_rif"};
			reinforcements[] = {"nva_ftl", "nva_ar", "nva_rif", "nva_rif", "nva_rif", "nva_mk"};
		};

		class FV720_Mora_Reinforcements
		{
			unitName = "Truck + Squad 6x";
			vehicle = "vn_o_wheeled_z157_01_nva65";
			units[] = {"nva_rif", "nva_rif", "nva_rif"};
			reinforcements[] = {"nva_ftl", "nva_ar", "nva_rif", "nva_rif", "nva_rif", "nva_mk"};
		};

		class FV720_Mora_Reinforcementssdffsd
		{
			unitName = "Mi-2 + Squad 6x";
			vehicle = "vn_o_air_mi2_01_01";
			units[] = {"nva_rif", "nva_rif", "nva_rif"};
			reinforcements[] = {"nva_ftl", "nva_ar", "nva_rif", "nva_rif", "nva_rif", "nva_mk"};
		};
	};

	class VC_Infantry
	{
		categoryName = "VC Infantry";
		gear = "opf_f";
		side = "east";

		// Units definition
		class Rifleman
		{
			unitName = "VC Rifleman";		// This is the name of the squad which will be shown in-game.
			units[] = {"vc_rif"};			// This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "VC Fireteam 4x";
			units[] = {"vc_ftl", "vc_ar", "vc_rif", "vc_rif"};
		};

		class Squad_6x
		{
			unitName = "VC Squad 6x";
			units[] = {"vc_ftl", "vc_ar", "vc_rif", "vc_rif", "vc_rif", "vc_mk"};	// This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "VC Section 9x";
			units[] = {"vc_ftl", "vc_ar", "vc_rif", "vc_rif", "vc_med", "vc_mk", "vc_rif", "vc_rif", "vc_rif"};
		};

		class AR_Team
		{
			unitName = "VC AR Team";
			units[] = {"vc_rif", "vc_ar"};
		};

		class MK_Team
		{
			unitName = "VC MK Team";
			units[] = {"vc_rif", "vc_mk"};
		};
	};

	// No VC vics
	// class VC_Vehicles
	// {
	// 	categoryName = "VC Vehicles";
	// 	gear = "opf_f";
	// 	side = "east";

	// 	class MBT52_Kuma		// Classnames can't contain '-'
	// 	{
	// 		unitName = "MBT-52 Kuma";
	// 		vehicle = "I_MBT_03_cannon_F";
	// 		units[] = {"vc_rif", "vc_rif", "vc_rif"};
	// 	};

	// 	class AFV4_Gorgon
	// 	{
	// 		unitName = "AFV-4 Gorgon";
	// 		vehicle = "I_APC_Wheeled_03_cannon_F";
	// 		units[] = {"vc_rif", "vc_rif", "vc_rif"};
	// 	};

	// 	class AFV4_Gorgon_Reinforcements
	// 	{
	// 		unitName = "AFV-4 Gorgon + Squad 6x";
	// 		vehicle = "I_APC_Wheeled_03_cannon_F";
	// 		units[] = {"vc_rif", "vc_rif", "vc_rif"};
	// 		reinforcements[] = {"vc_ftl", "vc_ar", "vc_rif", "vc_rif", "vc_rif", "vc_mk"};
	// 	};

	// 	class FV720_Mora
	// 	{
	// 		unitName = "FV-720 Mora";
	// 		vehicle = "I_APC_tracked_03_cannon_F";
	// 		units[] = {"vc_rif", "vc_rif", "vc_rif"};
	// 	};

	// 	class FV720_Mora_Reinforcements
	// 	{
	// 		unitName = "FV-720 Mora + Squad 6x";
	// 		vehicle = "I_APC_tracked_03_cannon_F";
	// 		units[] = {"vc_rif", "vc_rif", "vc_rif"};
	// 		reinforcements[] = {"vc_ftl", "vc_ar", "vc_rif", "vc_rif", "vc_rif", "vc_mk"};
	// 	};

	//};	
};
