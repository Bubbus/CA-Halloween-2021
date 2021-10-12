// by ALIAS

if ((!alive swarmer_public) or {player distance swarmer_public > 1000}) exitWith {};

if (isNil {swarmer_public getVariable "tgt"}) then
{
	private _posASL = getposasl swarmer_public;
	flow_back = _this vectorFromTo [(_posASL # 0) + random (selectrandom [1, -1]), (_posASL # 1) + random (selectrandom [1, -1]), random 2]
}
else
{
	if (atak_swarmer) then
	{
		private _tgt_sw = swarmer_public getVariable ["tgt", objNull];
		private _posASL = getposasl _tgt_sw;

		flow_back = (_this vectorFromTo [_posASL # 0, _posASL # 1, 0.5 + random 1]) vectorMultiply (3 + random 5);

		if ((!atinge) and {_this vectorDistance _posASL < 1}) then 
		{
			atinge = true; 
			publicVariable "atinge";
		};
	}
	else
	{
		private _posASL = getposasl swarmer_public;
		flow_back = (_this vectorFromTo [(_posASL # 0) + random 2, (_posASL # 1) + random 2, 0.5+random 1]) vectorMultiply (3 + random 5)
	};
};

drop [["\A3\animals_f\fly.p3d",1,0,1,1],"","SpaceObject",1,0.5,_this,flow_back,0,10,7.9,0,[6],[[1,1,1,1]],[1],1,1,"","components\anomaly\AL_swarmer\al_flies.sqf",_this];
drop [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,0],"","Billboard",1,0.5,_this,[0,0,0],0,10,8,0,[5,5,5],[[0,0,0,0],[0,0,0,0.01],[0,0,0,0]],[1],0,0,"","",_this];
