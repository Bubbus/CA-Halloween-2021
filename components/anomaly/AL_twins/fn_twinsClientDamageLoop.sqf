// by ALIAS
// Heavily modified by Bubbus

if (!hasInterface) exitWith {};

waitUntil {time > 0};

private _obj_emit = _this select 0;
private _dist_damage = _this select 1;

private _lastPlayedSound = "none";
private _soundTimer = 13;

while {alive _obj_emit} do
{
	waitUntil 
	{
		sleep 0.2;
		(player distance _obj_emit < 1000) 
		and 
		{
			(isDamageAllowed player) 
			and {!(player getVariable ["anomalyIgnore", false])}
		}
	};

	private _vecToTotem = (getPosASL player) vectorFromTo (getPosASL _obj_emit);
	private _viewVec = getCameraViewDirection player;
	private _relativeAngle = acos (_vecToTotem vectorDotProduct _viewVec);

	if (_relativeAngle <= 46) then
	{		
		isNil
		{
			private _wasLastVisible = _obj_emit getVariable ["visibleToLocalPlayer", false];
			_obj_emit setVariable ["visibleToLocalPlayer", true];

			if !(_wasLastVisible) then
			{
				private _visibleToPlayers = _obj_emit getVariable ["visibleToPlayersCount", 0];
				_obj_emit setVariable ["visibleToPlayersCount", (_visibleToPlayers + 1), true];
			};
		};

		if (player distance _obj_emit < _dist_damage) then
		{
			private _aberat = ppEffectCreate ["ChromAberration", 250];
			_aberat ppEffectEnable true;
			enableCamShake true;

			addCamShake [1,4,33];
			_aberat ppEffectAdjust[1, 0.8, true];
			_aberat ppEffectCommit 3;

			playSound "AL_twins_sound_twin";
			[player, 3, nil, nil, [0.5, 0.6, 0.9]] call f_fnc_woundUnitRandomly;

			sleep 3;

			addCamShake [1,4,33];
			_aberat ppEffectAdjust[0, 0, true];
			_aberat ppEffectCommit 3;

			sleep 3;

			_aberat ppEffectEnable false;
			ppEffectDestroy _aberat;
			enableCamShake false;
		};
	}
	else
	{
		isNil
		{
			private _wasLastVisible = _obj_emit getVariable ["visibleToLocalPlayer", false];
			_obj_emit setVariable ["visibleToLocalPlayer", false];

			if (_wasLastVisible) then
			{
				private _visibleToPlayers = _obj_emit getVariable ["visibleToPlayersCount", 0];
				_obj_emit setVariable ["visibleToPlayersCount", 0 max (_visibleToPlayers - 1), true];
			};
		};

		_chosenSound = selectRandom ["AL_twins_metalic1", "AL_twins_metalic2", "AL_twins_metalic3", "AL_twins_metalic4", "AL_twins_metalic5"];

		if ((_lastPlayedSound isNotEqualTo _chosenSound) and (_soundTimer > 12)) then
		{
			_obj_emit say3D [_chosenSound, 1500];
			_soundTimer = 0;
		};

		_soundTimer = _soundTimer + 0.2;
		_lastPlayedSound = _chosenSound;
	};

};
