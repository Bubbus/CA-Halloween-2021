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
US forces have pushed west from the camp to assault a VC-occupied village.  Establish radio contact and find out how you can help.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
The Heart erupted as the final blow was struck.  It sent one final pulse, stronger than anything you've felt before.  Everything feels shifted now - time and space.  
<br/>

<br/>
Through the morning the platoon has emerged from the mysterious portal, one by one, until you all stand arrayed before it - or at least, those who are left.
<br/>

<br/>
The US Army seems to have made camp here, but things seem strange.  Different equipment, new weapons.  
<br/>

<br/>
How long were you away?
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
From what you've found at the camp, it seems the war still rages between north and south.  Expect contact from the NVA and VC.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
The USA should still be on our side - if they remember us at all.  The ARVN still seems to be in the fight.
"]];

// ====================================================================================