// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: NATO

// ====================================================================================

// TASKS
// The code below creates tasks. Two (commented-out) sample tasks are included.
// Note: tasks should be entered into this file in reverse order.

// _task2 = player createSimpleTask ["OBJ_2"];
// _task2 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task2 setSimpleTaskDestination WAYPOINTLOCATION;
// _task2 setTaskState "Created";

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";




// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Go north and find evidence of the rumoured sect.  Find their temples and the power they may contain.
<br/>

<br/>
Read the information provided in the Tasks tab.  Whatever you learn will be revealed there.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
You have found a small, yet tangible power in Tanoa, but to find something more in the jungle ruins of south Vietnam would be a great result for the expedition.  Secrets revealed in Tanoa point towards an ancient secret sect, thought to have existed here long ago.
<br/>

<br/>
Such a journey is fraught with danger however, as the early days of the Vietnam war have brought initial skirmishes to the region.  Your American sponsors have received news of your success though, and have pledged their full support to your cause.
<br/>

<br/>
Go forth from the airstrip and seek these treasures out.  Bring fame and riches to your names.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
NVA + iregulars, backed by the Soviets.  Infiltrators have made their way this far south and may pose an issue for you in your search.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
ARVN and small US recon teams/advisors.  Locations of supply caches have been made available to you in case they are needed.  Limited air support can be requested over the radio.
"]];

// ====================================================================================