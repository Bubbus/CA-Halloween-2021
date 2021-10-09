_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
firework11= _soundPath + "sounds\firework1.ogg";
firework22= _soundPath + "sounds\firework2.ogg";
firework33= _soundPath + "sounds\firework3.ogg";

fnc_zen_createBurper =
{
	params ["_pos"];

	_anomaly = [_pos, false] call f_fnc_createBurperAnomaly;
	[_anomaly] call f_fnc_addObjectsToAllZeuses;
};


fnc_zen_createFarty =
{
	params ["_pos", "_radius", "_puddles"];

	_anomalyParts = [_pos, "G_AirPurifyingRespirator_02_sand_F", true, _radius, true, true, _puddles] call f_fnc_createFartyAnomaly;
	_anomalyParts call f_fnc_addObjectsToAllZeuses;
};


fnc_zen_createFlamer =
{
	params ["_pos", "_radius"];

	_anomaly = [_pos, _radius, 0.1, 50] call f_fnc_createFlamerAnomaly;
	[_anomaly] call f_fnc_addObjectsToAllZeuses;
};


fnc_zen_createSparky =
{
	params ["_pos", "_radius"];

	_anomaly = [_pos, _radius, true] call f_fnc_createSparkyAnomaly;
	[_anomaly] call f_fnc_addObjectsToAllZeuses;
};


fnc_zen_createMegaSparky =
{
	params ["_pos", "_radius"];

	_anomaly = [_pos, _radius, true] call f_fnc_createMegaSparkyAnomaly;
	[_anomaly] call f_fnc_addObjectsToAllZeuses;
};

if !(hasInterface) then
{
	{
		_x addEventHandler ["HandleDamage", 
		{
			params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

			hint ((str _instigator) + (currentWeapon _instigator));

			if !(isPlayer _instigator) exitWith {0};

			if !(currentWeapon _instigator isEqualTo "vn_m_hammer") exitWith {0};

			[_unit] remoteExec ["f_fnc_destroyHeartAnchor", 2];

			0
		}];
		
	} forEach 
	[
		anchor_1,
		anchor_2,
		anchor_3
	];
};