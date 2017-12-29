//Simulated
SPYRA_TURF_CREATE(/turf/simulated/open)
/turf/simulated/open/spyra
	edge_blending_priority = 0.5 //Turfs which also have e_b_p and higher than this will plop decorative edges onto this turf
/turf/simulated/open/spyra/New()
	..()
	outdoor_turfs.Add(src)

SPYRA_TURF_CREATE(/turf/simulated/floor)
/turf/simulated/floor/spyra/New()
	..()
	outdoor_turfs.Add(src)

/turf/simulated/floor/spyra_indoors
	SPYRA_SET_ATMOS
/turf/simulated/floor/spyra_indoors/update_graphic(list/graphic_add = null, list/graphic_remove = null)
	return 0

SPYRA_TURF_CREATE(/turf/simulated/floor/outdoors/dirt)

SPYRA_TURF_CREATE(/turf/simulated/floor/outdoors/rocks)

SPYRA_TURF_CREATE(/turf/simulated/floor/outdoors/grass/spyra)
/turf/simulated/floor/outdoors/grass/spyra
	turf_layers = list(
		/turf/simulated/floor/outdoors/rocks/spyra,
		/turf/simulated/floor/outdoors/dirt/spyra
		)


SPYRA_TURF_CREATE(/turf/simulated/floor/reinforced)
/turf/simulated/floor/reinforced/spyra/New()
	..()
	outdoor_turfs.Add(src)

SPYRA_TURF_CREATE(/turf/simulated/floor/tiled/steel_dirty)
/turf/simulated/floor/tiled/steel_dirty/spyra/New()
	..()
	outdoor_turfs.Add(src)

SPYRA_TURF_CREATE(/turf/simulated/mineral)

//Unsimulated
/turf/unsimulated/wall/planetary/spyra
	name = "facility wall"
	desc = "An eight-meter tall carbyne wall. For when the only thing trying to kill you is the planet itself."
	alpha = 0xFF
	SPYRA_SET_ATMOS

/turf/unsimulated/mineral/spyra
	blocks_air = TRUE

/turf/unsimulated/floor/steel
	icon = 'icons/turf/flooring/tiles_vr.dmi'
	icon_state = "steel"


/turf/unsimulated/wall
	blocks_air = 1

/turf/unsimulated/wall/planetary
	blocks_air = 0

// Some turfs to make floors look better in centcom tram station.



/turf/unsimulated/floor/techfloor_grid
	name = "floor"
	icon = 'icons/turf/flooring/techfloor_vr.dmi'
	icon_state = "techfloor_grid"

/turf/unsimulated/floor/maglev
	name = "maglev track"
	desc = "Magnetic levitation tram tracks. Caution! Electrified!"
	icon = 'icons/turf/flooring/maglevs.dmi'
	icon_state = "maglevup"

/turf/unsimulated/wall/transit
	icon = 'icons/turf/transit_vr.dmi'

/turf/unsimulated/floor/transit
	icon = 'icons/turf/transit_vr.dmi'

/obj/effect/floor_decal/transit/orange
	icon = 'icons/turf/transit_vr.dmi'
	icon_state = "transit_techfloororange_edges"

/obj/effect/transit/light
	icon = 'icons/turf/transit_128.dmi'
	icon_state = "tube1-2"

// - - - - -
// Spyra Desert Turf

/turf/simulated/floor/outdoors/sand/
	name = "desert sand"
	base_name = "desert sand"
	desc = "It’s coarse, rough, irritating and it gets everywhere."
	base_desc = "It’s coarse, rough, irritating and it gets everywhere."
	icon_state = "desert"
	base_icon_state = "desert"
	icon = 'icons/turf/desert.dmi'
	base_icon = 'icons/turf/desert.dmi'
	initial_flooring = null