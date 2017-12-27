//Atmosphere properties
#define SPYRA_ONE_ATMOSPHERE	92.4 //kPa
#define SPYRA_AVG_TEMP	313.15 //kelvin

#define SPYRA_PER_N2		50.50 //percent
#define SPYRA_PER_O2		0.00
#define SPYRA_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define SPYRA_PER_CO2		49.50
#define SPYRA_PER_PHORON	0.00

//Math only beyond this point
#define SPYRA_MOL_PER_TURF	(SPYRA_ONE_ATMOSPHERE*CELL_VOLUME/(SPYRA_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define SPYRA_MOL_N2			(SPYRA_MOL_PER_TURF * SPYRA_PER_N2)
#define SPYRA_MOL_O2			(SPYRA_MOL_PER_TURF * SPYRA_PER_O2)
#define SPYRA_MOL_N2O			(SPYRA_MOL_PER_TURF * SPYRA_PER_N2O)
#define SPYRA_MOL_CO2			(SPYRA_MOL_PER_TURF * SPYRA_PER_CO2)
#define SPYRA_MOL_PHORON		(SPYRA_MOL_PER_TURF * SPYRA_PER_PHORON)

//Turfmakers
#define SPYRA_SET_ATMOS	nitrogen=SPYRA_MOL_N2;oxygen=SPYRA_MOL_O2;carbon_dioxide=SPYRA_MOL_CO2;phoron=SPYRA_MOL_PHORON;temperature=SPYRA_AVG_TEMP
#define SPYRA_TURF_CREATE(x)	x/spyra/nitrogen=SPYRA_MOL_N2;x/spyra/oxygen=SPYRA_MOL_O2;x/spyra/carbon_dioxide=SPYRA_MOL_CO2;x/spyra/phoron=SPYRA_MOL_PHORON;x/spyra/temperature=SPYRA_AVG_TEMP;x/spyra/update_graphic(list/graphic_add = null, list/graphic_remove = null) return 0
#define SPYRA_TURF_CREATE_UN(x)	x/spyra/nitrogen=SPYRA_MOL_N2;x/spyra/oxygen=SPYRA_MOL_O2;x/spyra/carbon_dioxide=SPYRA_MOL_CO2;x/spyra/phoron=SPYRA_MOL_PHORON;x/spyra/temperature=SPYRA_AVG_TEMP


//Normal map defs
#define Z_LEVEL_SURFACE_LOW					1
#define Z_LEVEL_SURFACE_MID					2
#define Z_LEVEL_SURFACE_HIGH				3
#define Z_LEVEL_MISC						4
#define Z_LEVEL_HUB							5
#define Z_LEVEL_DESERT						6


/datum/map/lounge
	name = "Virchow"
	full_name = "SC: Dagon"
	path = "lounge"

	lobby_icon = 'icons/misc/title_bh.dmi'
	lobby_screens = list("lounge")

	station_name  = "SC: Dagon"
	station_short = "Dagon"
	dock_name     = "Virchow: S14-North"
	boss_name     = "Spyra Defence and Command"
	boss_short    = "SDC"
	company_name  = "Sovereign Colony Dagon of Krevallo-Virchow"
	company_short = "Dagon"
	starsys_name  = "Krevallo-Virchow"

	shuttle_docked_message = "The scheduled Orange Line tram to the %dock_name% has arrived. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Orange Line tram has left the station. Estimate %ETA% until the tram arrives at %dock_name%."
	shuttle_called_message = "A scheduled crew transfer to the %dock_name% is occuring. The tram will be arriving shortly. Those departing should proceed to the Orange Line tram station within %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The evacuation tram has arrived at the tram station. You have approximately %ETD% to board the tram."
	emergency_shuttle_leaving_dock = "The emergency tram has left the station. Estimate %ETA% until the shuttle arrives at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation has begun, and an off-schedule tram has been called. It will arrive at the tram station in approximately %ETA%."
	emergency_shuttle_recall_message = "The evacuation tram has been recalled."

	station_networks = list(
							NETWORK_CARGO,
							NETWORK_CIVILIAN,
							NETWORK_COMMAND,
							NETWORK_ENGINE,
							NETWORK_ENGINEERING,
							NETWORK_ENGINEERING_OUTPOST,
							NETWORK_DEFAULT,
							NETWORK_MEDICAL,
							NETWORK_MINE,
							NETWORK_RESEARCH,
							NETWORK_ROBOTS,
							NETWORK_SECURITY,
							NETWORK_INTERROGATION
							)

	allowed_spawns = list("Tram Station","Airtight Shuttle Pad")

// No reason to have the below as of yet.
/*
/datum/map/lounge/perform_map_generation()

	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_SURFACE_MINE, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_SURFACE_MINE, 64, 64)         // Create the mining ore distribution map.

	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_SOLARS, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_SOLARS, 64, 64)         // Create the mining ore distribution map.

	return 1
*/

/datum/map_z_level/lounge/station
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES

/datum/map_z_level/lounge/station/surface_low
	z = Z_LEVEL_SURFACE_LOW
	name = "Surface 1"
	base_turf = /turf/simulated/floor/outdoors/rocks/spyra

/datum/map_z_level/lounge/station/surface_mid
	z = Z_LEVEL_SURFACE_MID
	name = "Surface 2"
	base_turf = /turf/simulated/open

/datum/map_z_level/lounge/station/surface_high
	z = Z_LEVEL_SURFACE_HIGH
	name = "Surface 3"
	base_turf = /turf/simulated/open

/datum/map_z_level/lounge/hub
	z = Z_LEVEL_HUB
	name = "CentCom"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT

/datum/map_z_level/lounge/misc
	z = Z_LEVEL_MISC
	name = "Misc"
	flags = MAP_LEVEL_ADMIN

/datum/map_z_level/lounge/desert
	z = Z_LEVEL_DESERT
	name = "Desert"
	flags = MAP_LEVEL_ADMIN
	base_turf = /turf/simulated/floor/outdoors/rocks/spyra

/proc/get_z_level_datum(atom/A)
	var/turf/T = get_turf(A)
	var/datum/map_z_level/z_level = using_map.zlevels["[T.z]"]
	if(z_level)
		return z_level

/datum/map/lounge/get_map_levels(var/srcz, var/long_range = TRUE)
	if (long_range && (srcz in map_levels))
		return map_levels
	else if (srcz == Z_LEVEL_HUB)
		return list() // Nothing on transit!
	else if (srcz >= Z_LEVEL_SURFACE_LOW && srcz <= Z_LEVEL_SURFACE_HIGH)
		return list(
			Z_LEVEL_SURFACE_LOW,
			Z_LEVEL_SURFACE_MID,
			Z_LEVEL_SURFACE_HIGH/*,
			Z_LEVEL_SPACE_LOW,
			Z_LEVEL_SPACE_MID,
			Z_LEVEL_SPACE_HIGH*/
			)
	else
		return ..()
