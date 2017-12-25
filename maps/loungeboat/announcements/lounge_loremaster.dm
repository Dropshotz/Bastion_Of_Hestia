
var/datum/lore/annolore/loremaster_ann = new/datum/lore/annolore

/datum/lore/annolore
	var/list/organizations = list()

/datum/lore/annolore/New()

	var/list/paths = typesof(/datum/lore/anno) - /datum/lore/anno
	for(var/path in paths)
		// Some intermediate paths are not real organizations (ex. /datum/lore/anno/mil). Only do ones with names
		var/datum/lore/anno/instance = path
		if(initial(instance.name))
			instance = new path()
			organizations[path] = instance
