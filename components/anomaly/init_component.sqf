#include "macros.hpp"

DEBUG_PRINT_LOG("initting anomalies")

[] call f_fnc_functions_flame;
[] call f_fnc_functions_orbFx;

if (!hasInterface) exitWith {DEBUG_PRINT_LOG("jumped out of anomalies")};

[] spawn f_fnc_clientInitFartyAnomaly;
