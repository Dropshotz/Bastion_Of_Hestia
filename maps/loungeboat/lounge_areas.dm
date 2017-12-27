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


/area/lounge/surfacebase/transport
	icon_state = "security"
/area/lounge/surfacebase/transport/shuttlepad
	name = "\improper Airtight Hanger"










// Areas | SPECIAL ONLY

/area/turbolift/l_surface/level1
	name = "surface (level 1)"
	lift_floor_label = "Sector A"
	lift_floor_name = "Tram, Security"
	lift_announce_str = "Now arriving at Sector A: Tram and Security Facilities."

/area/turbolift/l_surface/level2
	name = "surface (level 2)"
	lift_floor_label = "Sector B"
	lift_floor_name = "Engineering, Civil"
	lift_announce_str = "Now arriving at Sector B: Engineering, Atmospherics, Civil Facilities and Housing."

/area/turbolift/l_surface/level3
	name = "surface (level 3)"
	lift_floor_label = "Sector C"
	lift_floor_name = "Laboratories, Command"
	lift_announce_str = "Now arriving at Sector C: Test Labs and Control Facilities."