#if !defined(USING_MAP_DATUM)

	#include "lounge_things.dm"
	#include "lounge_defines.dm"
	#include "lounge_spyra.dm"
	#include "lounge_turfs.dm"
	#include "lounge_areas.dm"
// - - - - -

// The following is included to bypass Tether excess, while also allowing for a few other things that'll more than likely be used.
	#include "excess/tether_things_l.dm"
	#include "excess/tether_shuttle_defs_l.dm"
	#include "excess/tether_shuttles_l.dm"
	#include "excess/tether_areas_l.dm"

// - - - - -

// Additional modules not relating to Tether excess below.
	#include "turfs/outdoors.dm"
//	#include "reactor/setup_nuclear_power.dm" -Neither are finished, and remnants have been removed for the time being. -Carl
//	#include "reactor/nuclear_power.dm"
	#include "announcements/lounge_announcements.dm"
	#include "announcements/lounge_loremaster.dm"
	#include "announcements/lounge_organizations.dm"

// - - - - -

	#include "lounge-01-surface.dmm"
	#include "lounge-02-misc.dmm"
	#include "lounge-03-hub.dmm"
	#include "lounge-04-desert.dmm"

	#define USING_MAP_DATUM /datum/map/lounge

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Lounge

#endif