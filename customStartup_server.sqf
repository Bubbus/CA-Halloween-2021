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
