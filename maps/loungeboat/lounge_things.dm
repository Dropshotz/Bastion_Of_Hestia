// Shuttle exit

/obj/machinery/cryopod/robot/door/pad
	name = "\improper Shuttle Hanger"
	icon = 'icons/obj/doors/Doorext.dmi'
	icon_state = "door_closed"
	base_icon_state = "door_closed"
	occupied_icon_state = "door_locked"
	desc = "The shuttle pad you might've came in from.  You could leave the facility and planet from here."
	on_store_message = "has departed on an executive shuttle."
	on_store_name = "Travel Oversight"
	on_enter_occupant_message = "The shuttle docks within the airtight hanger; you board and quickly take a seat."
	on_store_visible_message_1 = "'s speakers chime, anouncing a shuttle has arrived to take"
	on_store_visible_message_2 = "to an offworld location"
	time_till_despawn = 10 SECONDS
	spawnpoint_type = /datum/spawnpoint/pad

/obj/machinery/cryopod/robot/door/pad/process()
	if(emergency_shuttle.online() || emergency_shuttle.returned())
		// Transform into a door!  But first despawn anyone inside
		time_till_despawn = 0
		..()
		var/turf/T = get_turf(src)
		var/obj/machinery/door/airlock/external/door = new(T)
		door.req_access = null
		door.req_one_access = null
		qdel(src)
	// Otherwise just operate normally
	return ..()

/obj/machinery/cryopod/robot/door/pad/Bumped(var/atom/movable/AM)
	if(!ishuman(AM))
		return

	var/mob/living/carbon/human/user = AM

	var/choice = alert("Do you want to depart via the shuttle? Your character will leave the round.","Departure","Yes","No")
	if(user && choice == "Yes")
		user.ghostize()
		despawn_occupant(user)

// - - - -

//Spawn Shuttle

var/global/list/latejoin_pad   = list()

/obj/effect/landmark/pad
	name = "JoinLateShuttle"
	delete_me = 1

/obj/effect/landmark/pad/New()
	latejoin_pad += loc // Register this turf as tram latejoin.
	latejoin += loc // Also register this turf as fallback latejoin, since we won't have any arrivals shuttle landmarks.
	..()

/datum/spawnpoint/pad
	display_name = "Airtight Shuttle Pad"
	msg = "has arrived on an executive shuttle"

/datum/spawnpoint/pad/New()
	..()
	turfs = latejoin_pad

// - - - -
//Shuttle Clamps

/turf/simulated/floor/maglev/clamp
	name = "shuttle clamp"
	desc = "Magnetic grip shuttle clamps. Caution! Electrified!"
	icon = 'icons/turf/flooring/maglevs.dmi'
	icon_state = "maglevup"

	var/area/shock_area_l = /area/lounge/surfacebase/shuttlepad

// - -
/area/lounge/surfacebase/shuttlepad
	name = "\improper Airtight Hanger"
	icon_state = "dk_yellow"
// - -

/turf/simulated/floor/maglev/clamp/initialize()
	..()
	shock_area_l = locate(shock_area_l)

// Walking on maglev tracks will shock you! Horray!
/turf/simulated/floor/maglev/clamp/Entered(var/atom/movable/AM, var/atom/old_loc)
	if(isliving(AM) && prob(50))
		track_zap(AM)
/turf/simulated/floor/maglev/clamp/attack_hand(var/mob/user)
	if(prob(75))
		track_zap(user)
/turf/simulated/floor/maglev/clamp/proc/track_zap_l(var/mob/living/user)
	if (!istype(user)) return
	if (electrocute_mob(user, shock_area, src))
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(5, 1, src)
		s.start()



// Landmark and Lift

/obj/effect/landmark/map_data/lounge
	name = "Base"
	desc = "Probably important."
	invisibility = 101
	height = 3

/obj/turbolift_map_holder/lounge
	name = "Lounge Climber"
	depth = 3
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_3x3.dmi'
	wall_type = null // Don't make walls

	areas_to_use = list(
		/area/turbolift/l_surface/level1,
		/area/turbolift/l_surface/level2,
		/area/turbolift/l_surface/level3
		)


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

// Areas | GENERIC ONLY