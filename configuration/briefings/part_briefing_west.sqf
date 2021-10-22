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
Visit each of the known antiquity sites and uncover their secrets.  Archaeologists will be able to dig up the ruins and find artefacts.
<br/>

<br/>
Read the information provided in the Tasks tab.  Whatever you learn will be revealed there.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
An expedition has been commissioned by the US government to investigate credible rumours of a useful ancient technology.  An archaeological team led by Montana Miller is being escorted by a veteran mercenary band known as Century Arms between antiquity sites in French Tanoa.
<br/>

<br/>
The Tanoan colonists have recently rebelled since independence was declared from France.  Montana Miller's search will be taking place in an active conflict zone, although the local government has declared its support for the expedition largely to improve its ties with the US.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Rebels, potentially backed by the Soviets.  Expect light motorised assets and irregular uniforms.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
Independent Tanoan government forces, backed by various Western powers.  Regular uniforms, Western gear and vehicles.
"]];

// ====================================================================================