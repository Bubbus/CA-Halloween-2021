#include "macros.hpp"

CLIENT_ONLY;

// fade sound, apply "unconscious" effect.
// iter 2: try to fade acre sound
// iter 2: try to mute player
// apply cut fade

// give immersive heal, remove wounds

// find random teleport location

// disarm player, set as prisoner

// remove cut fade
// iter 2: try to unmute player
// iter 2: try to fade-in acre sound
// fade in sound

1 fadeSound 0;
1 fadeSpeech 0;

[
    {
        "HeartbeatFade" cutText ["", "BLACK OUT", 0.3, false];
    },
    [],
    2

] call CBA_fnc_waitAndExecute;

[
    {
        [player] call f_fnc_immersiveRevive;
        [player] call f_fnc_healWounds;
    },
    [],
    2

] call CBA_fnc_waitAndExecute;

[
    {
        player setCaptive true;
        [player, true] call ACE_captives_fnc_setHandcuffed;

        [player, true] call f_fnc_removeAllWeapons;

        private _telePoint = selectRandom ["tele_1","tele_2","tele_3","tele_4","tele_5","tele_6","tele_7","tele_8","tele_9"];

        player setPos (getMarkerPos _telePoint);
        player setVariable ["heartbeat_telePoint", _telePoint, true];
    },
    [],
    2

] call CBA_fnc_waitAndExecute;

[
    {
		"HeartbeatFade" cutFadeOut 1;
        
        1 fadeSound 1;
        1 fadeSpeech 1;
    },
    [],
    8

] call CBA_fnc_waitAndExecute;

[{_this setUnconscious false}, player, 13 + (random 2)] call CBA_fnc_waitAndExecute;
