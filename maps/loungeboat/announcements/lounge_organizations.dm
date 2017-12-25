//Datums for different companies that can be used by busy_space
/datum/lore/anno
	var/name = ""				// Organization's name
	var/short_name = ""			// Organization's shortname (NanoTrasen for "NanoTrasen Incorporated")
	var/acronym = ""			// Organization's acronym, e.g. 'NT' for NanoTrasen'.
	var/desc = ""				// One or two paragraph description of the organization, but only current stuff.  Currently unused.
	var/history = ""			// Historical discription of the organization's origins  Currently unused.
	var/work = ""				// Short description of their work, eg "an arms manufacturer"
	var/headquarters = ""		// Location of the organization's HQ.  Currently unused.
	var/motto = ""				// A motto/jingle/whatever, if they have one.  Currently unused.

	var/list/ship_prefixes = list()	//Some might have more than one! Like NanoTrasen. Value is the mission they perform, e.g. ("ABC" = "mission desc")
	var/list/ship_names = list(		//Names of spaceships.  This is a mostly generic list that all the other organizations inherit from if they don't have anything better.
		"Kestrel",
		"Beacon",
		"Signal",
		"Freedom",
		"Glory",
		"Axiom",
		"Eternal",
		"Icarus",
		"Harmony",
		"Light",
		"Discovery",
		"Endeavour",
		"Explorer",
		"Swift",
		"Dragonfly",
		"Ascendant",
		"Tenacious",
		"Pioneer",
		"Hawk",
		"Haste",
		"Radiant",
		"Luminous"
		)
	var/list/destination_names = list()	//Names of static holdings that the organization's ships visit regularly.
	var/autogenerate_destination_names = TRUE

/datum/lore/anno/New()
	..()
	if(autogenerate_destination_names) // Lets pad out the destination names.
		var/i = rand(6, 10)
		var/list/star_names = list(
			"Sol", "Alpha Centauri", "Sirius", "Vega", "Regulus", "Vir", "Algol", "Aldebaran",
			"Delta Doradus", "Menkar", "Geminga", "Elnath", "Gienah", "Mu Leporis", "Nyx", "Tau Ceti",
			"Wazn", "Alphard", "Phact", "Altair")
		var/list/destination_types = list("dockyard", "station", "vessel", "waystation", "telecommunications satellite", "spaceport", "distress beacon", "anomaly", "colony", "outpost")
		while(i)
			destination_names.Add("a [pick(destination_types)] in [pick(star_names)]")
			i--

//////////////////////////////////////////////////////////////////////////////////


// Spyra Command.
/datum/lore/anno/mil/sdc
	name = "Spyra Defence and Command"
	short_name = "" //-Nadda
	acronym = "SDC"
	desc = "A group based around the planet Spyra, in the system of Krevallo-Virchow.\
	Generally seen as little more than a terrorist organization by larger powers,\
	the militant forces both occupy and restrict access to the entirety of Krevallo-Virchow.\
	Their base of operations is unknown to all but the highest of individuals in their ranks,\
	the only exact locations outside of the books and secrecy being the colonies under their watch.\
	Dagon is one such colony, the research done there contributing vast amounts to the expansion of\
	the SDC.\
	Rumor has it that NanoTrasen supplies, supports and grants certain materials and rights to\
	the group; the claims are unfounded.\
	- - - \
	Being a frontier organization, a majority, if not all of the forces and population of the SDC\
	are militarized; the threat of invasion and takeover negated by both planetary-guns and harsh conditions."
	history = "" // TBD
	work = "frontier 'defence' and expansion"
	headquarters = "Spyra"
	motto = ""

	ship_prefixes = list("SDC-SF" = "frigate", "SDC-SB" = "battleship", "SDC-SD" = "destroyer", "SDC-ERT" = "emergency response")
	destination_names = list(
		"Spyra Main Port",
		"Dagon Forward Mining Post",
		"an asteroid orbiting Spyra",
		"Spyra Tram Command",
		"Spyra Militarized Spaceport",
		"Krevallo-Virchow Minefields",
		"Spyra Battery Monitoring"
		)

// Dagon - Sovereign Colony
/datum/lore/anno/gov/dagon
	name = "Sovereign Colony Dagon of Krevallo-Virchow"
	short_name = "Dagon"
	acronym = "SCD"
	desc = "Dagon, a colony on the hostile planet known as Spyra.\
	Not only is it responsible for a majority of the successes that the SDC has had,\
	the research done on the colony is mostly bought up by NanoTrasen.\
	Having the backing of a tech-giant tends to help in the way of funds and Security.\
	Besides the aforementioned science related material, SCD is also a major stopping point\
	on the tram line for Spyra, providing both safety and passage for those either passing through,\
	or a meeting ground for officials of the SDC and NanoTrasen."
	history = "" // Todo
	work = "research and security colony of the SDC"
	headquarters = "Spyra"
	motto = "A Puer Qui Habet Potestate." // Says ;'A child who has the power to revoke.'.
	autogenerate_destination_names = FALSE

	ship_prefixes = list("SCD-P" = "patrol", "SCD-D" = "defence", "SCD-S" = "surveillance")
	destination_names = list(
						"Spyra Main Port",
						"Dagon Forward Mining Post",
						"an asteroid orbiting Spyra",
						"Spyra Tram Command",
						"Spyra Militarized Spaceport"
						)
