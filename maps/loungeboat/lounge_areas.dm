// Non-special areas go here.

//Surface exterior
/area/lounge/surfacebase
	icon = 'icons/turf/areas_vr.dmi'
	requires_power = 0 //Temp for testing

/area/lounge/surfacebase/outside
	name = "Outside - Surface"
	sound_env = MOUNTAINS
/area/lounge/surfacebase/outside/outside1
	icon_state = "outside1"
/area/lounge/surfacebase/outside/outside2
	icon_state = "outside2"
/area/lounge/surfacebase/outside/outside3
	icon_state = "outside3"

/area/lounge/surfacebase/outside/empty
	name = "Outside - Empty Area"

/area/lounge/surfacebase/crash
	name = "Outside - Desert"
	icon_state = "yellow"



//Surface interior

/area/lounge/surfacebase/sector_a
	name = "\improper Sector - A"
	icon_state = "dk_yellow"
/area/lounge/surfacebase/sector_b
	name = "\improper Sector - B"
	icon_state = "dk_yellow"
/area/lounge/surfacebase/sector_c
	name = "\improper Sector - C"
	icon_state = "dk_yellow"


/area/lounge/surfacebase/medical
	icon_state = "medical"
/area/lounge/surfacebase/medical/morgue
	name = "\improper Surface Morgue"
/area/lounge/surfacebase/medical/triage
	name = "\improper Surface Triage"


/area/lounge/surfacebase/security
	icon_state = "security"
/area/lounge/surfacebase/security/breakroom
	name = "\improper Surface Security Break Room"
/area/lounge/surfacebase/security/lobby
	name = "\improper Surface Security Lobby"
/area/lounge/surfacebase/security/common
	name = "\improper Surface Security Room"
/area/lounge/surfacebase/security/armory
	name = "\improper Surface Armory"
/area/lounge/surfacebase/security/checkpoint
	name = "\improper Surface Checkpoint Office"
/area/lounge/surfacebase/security/hallway
	name = "\improper Surface Checkpoint Hallway"
/area/lounge/surfacebase/security/screen
	name = "\improper Surface Checkpoint Screening"
/area/lounge/surfacebase/security/interrogation
	name = "\improper Surface Checkpoint Interrogation"
