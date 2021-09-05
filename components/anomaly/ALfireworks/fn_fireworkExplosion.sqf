// By Bubbus, with parts taken from BIS COF Grey.

params ["_rocket"];

_colour = selectRandom ["blue", "yellow", "gold", "green", "white", "red"];
_colorArray = [250/255, 10/255, 10/255];

switch (_colour) do
{
    case "blue": {_colorArray = [5/255, 30/255, 240/255];};
    case "yellow": {_colorArray = [255/255, 220/255, 30/255];};
    case "gold": {_colorArray = [100/255, 50/255, 0/255];};
    case "green": {_colorArray = [15/255, 200/255, 5/255];};
    case "white": {_colorArray = [255/255, 250/255, 240/255];};
    case "red": {_colorArray = [250/255, 10/255, 10/255];};
};

_pos = getPosASL _rocket;

_doi_lum = "#lightpoint" createVehicle _pos;
_doi_lum setPosASL _pos;
_doi_lum setLightUseFlare false;
_doi_lum setLightAttenuation [12, 0, 40, 0, 15, 200];
_doi_lum setLightColor _colorArray;
_doi_lum setLightAmbient _colorArray;
_doi_lum setLightDayLight true;
_doi_lum setLightBrightness 10;

_doi_lum spawn
{
    _bright = 100;

    while {_bright > 0} do
    {
        sleep 0.016;
        _bright = _bright - 3;
        _this setLightBrightness ((_bright + random (_bright * 0.5)) * 0.15);

    };

    deletevehicle _this;

};


_sparkers = [];

for "_i" from 1 to 2 do
{
	private _source = "#particlesource" createVehicleLocal _pos;
	_source setPosASL _pos;
	_source setParticleCircle [0, [0, 0, 0]];

	_source setParticleRandom
	[
		0.2,
		[0, 0, 0],
		[50, 50, 50],
		5,
		0.1,
		[0, 0, 0, 0],
		0,
		0,
		0
	];

	_source setParticleParams
	[
		["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 8],
		"",
		"Billboard",
		1,
		2,
		[0, 0, 0],
		[0, 0, 0.75],
		0,
		20,
		7.9,
		0.03,
		[1.2, 0.5, 0.25],
		[[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]],
		[0.08],
		1,
		0,
		"",
		"",
		"",
		0,
		false,
		0,
		[(_colorArray vectorMultiply 1000) + [1], (_colorArray vectorMultiply 900) + [0.6], (_colorArray vectorMultiply 50) + [0.2]]
	];

	_source setDropInterval 0.001;

	_sparkers pushBack _source;

};

private _smoke = "#particlesource" createVehicleLocal _pos;
_smoke setPosASL _pos;
_smoke setParticleCircle [0, [0, 0, 0]];
_smoke setParticleRandom [0, [0.25, 0.25, 0], [5, 5, 5], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_smoke setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [0, 20, 40], [[0.6, 0.6, 0.6, 0.4], [0.5, 0.5, 0.5, 0.2], [0.4, 0.4, 0.4, 0]], [0.08], 1, 0, "", "", ""];
_smoke setDropInterval 0.004;


private _vol = 5;
private _pitch = 0.8 + (random 0.4);
private _dist = 4000;
_sfx = selectRandom ["GrenadeMediumA_distExp_01", "GrenadeMediumB_distExp_01", "GrenadeLight_distExp_01"];

playSound3D ["A3\Sounds_F\arsenal\explosives\grenades\" + _sfx + ".wss", nil, false, _pos, _vol, _pitch, _dist, 0];
playSound3D ["A3\Sounds_F\arsenal\explosives\grenades\" + _sfx + ".wss", nil, false, _pos, _vol, _pitch, _dist, 0];


sleep 0.1;

deleteVehicle _smoke;

sleep 0.1;

{ deleteVehicle _x } forEach _sparkers;
