// by ALIAS

if (!hasInterface) exitWith {};

sleep 3;

waitUntil {!isNil "obj_prot_toxic"};

[] spawn
{
	while {true} do
	{
		waitUntil {alive player};

		_hasProtection = ((headgear player == obj_prot_toxic) or (goggles player==obj_prot_toxic) or (uniform player==obj_prot_toxic) or (vest player==obj_prot_toxic) or (Backpack player==obj_prot_toxic));

		player setVariable ["protejat_tox", _hasProtection, true];

		sleep 1;

	};

};



waitUntil {!isNil {player getVariable "protejat_tox"}};

while {!isNull player} do
{
	waitUntil {alive player};
	waitUntil {sleep 0.5; ((player getVariable ["protejat_tox", false]) and {player getVariable ["inFartyAnomaly", false]}) };

	playsound "echipare_toxic";
	sleep 2.5;

	[] spawn
	{
		while {player getVariable "protejat_tox"} do
		{
		_int_b = linearConversion [0, 1, (getFatigue player), 8, 1.8, true];
		playsound "breath_toxic";
		sleep _int_b;
		};

	};

	waitUntil {sleep 0.5; !((player getVariable ["protejat_tox", false]) and {player getVariable ["inFartyAnomaly", false]})};

	playsound "dezechipare_toxic";

	sleep 0.1;

};
