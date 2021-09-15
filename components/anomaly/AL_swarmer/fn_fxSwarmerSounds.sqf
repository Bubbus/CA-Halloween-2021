// by ALIAS

if (!hasInterface) exitWith {};

params ["_swarmer"];
private ["_swarmer"];
enableCamShake true;

sleep 5;

while {alive _swarmer} do
{
	if (player distance _swarmer > 500) then
	{
		_queen_call = selectrandom ["AL_swarmer_hive_queen_01","AL_swarmer_hive_queen_02"];
		_swarmer say3D [_queen_call, 2000];
	};

	if (player distance _swarmer < 500) then
	{
		_swarmer say3D ["AL_swarmer_roi_02", 300];
	};

	if (player distance _swarmer < 15) then
	{
		_baz_c = selectRandom ["AL_swarmer_insect_01","AL_swarmer_insect_03","AL_swarmer_insect_04","AL_swarmer_insect_05","AL_swarmer_insect_07","AL_swarmer_insect_08"];
		playSound _baz_c;
	};

	if ((player == _swarmer getVariable "tgt") and (player distance _swarmer < 5)) then
	{
		addCamShake [5,2,5];
		[60] call BIS_fnc_bloodEffect;
	};

	sleep 11;
};
