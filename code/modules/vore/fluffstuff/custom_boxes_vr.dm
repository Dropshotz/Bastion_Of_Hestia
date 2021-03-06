// BEGIN - DO NOT EDIT PROTOTYPE
/obj/item/weapon/storage/box/fluff
	name = "Undefined Fluff Box"
	desc = "This should have a description. Tell an admin."
	storage_slots = 7
	var/list/has_items = list()

/obj/item/weapon/storage/box/fluff/New()
	storage_slots = has_items.len
	allowed = list()
	for(var/P in has_items)
		allowed += P
		new P(src)
	..()
	return
// END - DO NOT EDIT PROTOTYPE


/* TEMPLATE
// ckey:Character Name
/obj/item/weapon/storage/box/fluff/charactername
	name = ""
	desc = ""
	has_items = list(
		/obj/item/clothing/head/thing1,
		/obj/item/clothing/shoes/thing2,
		/obj/item/clothing/suit/thing3,
		/obj/item/clothing/under/thing4)
*/


//----------BoH----------
// nothingbutcarl:Cedrick Marois
/obj/item/weapon/storage/box/fluff/cedrick_marois
	name = "Cedrick Marois' Personal Kit"
	desc = "A kit containing Marois' equipment."
	has_items = list(
//		/obj/item/fluff/permit/nothingbutcarl,
//		/obj/item/weapon/gun/projectile/colt/fluff/ccg2492,
//		/obj/item/ammo_magazine/m45/rubber,
//		/obj/item/ammo_magazine/m45/rubber,
//		/obj/item/clothing/accessory/holster/armpit,
		/obj/item/clothing/suit/storage/fluff/cedrick_coat,
		/obj/item/clothing/head/fedora/fluff/cedrickhat)

// nothingbutcarl:Gahgrr Raharf
/obj/item/weapon/storage/box/fluff/gahgrr_raharf
	name = "Gahgrr Raharf's Personal Kit"
	desc = "A kit containing Raharf's equipment."
	has_items = list(
		/obj/item/fluff/permit/nothingbutcarl_2,
		/obj/item/weapon/gun/projectile/colt/fluff/ccg2492,
		/obj/item/ammo_magazine/mr2492,
		/obj/item/ammo_magazine/mr2492,
		/obj/item/clothing/accessory/holster/armpit)

// Vuk Farkas - Vuk Farkas...
/obj/item/weapon/storage/box/fluff/vuk_farkas
	name = "A heavy box"
	desc = "This rattles sharply when you touch it. Best not to mess with it."
	has_items = list(
//		/obj/item/fluff/permit/vukfarkas,
		/obj/item/weapon/gun/projectile/trueflaregun,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/weapon/storage/box/flaredp_half,
		/obj/item/weapon/extinguisher/mini)


// Dropshotz - David Thunderwing.
/obj/item/weapon/storage/box/fluff/david_thunderwing
	name = "David Thunderwing's Personal Kit"
	desc = "A kit containing David Thunderwing's equipment."
	has_items = list(
		/obj/item/fluff/permit/david_thunderwing,
		/obj/item/weapon/gun/energy/netgun,
//		/obj/item/device/multitool/hacktool,
		/obj/item/clothing/under/bluespace)


// Lezus_Konrad - Alden Bluetenberger.
/obj/item/weapon/storage/box/fluff/alden_bluetenberger
	name = "Alden Bluetenberger's Personal Kit"
	desc = "A kit containing Alden Bluetenberger's equipment."
	has_items = list(
		/obj/item/clothing/suit/storage/fluff/cedrick_coat,
		/obj/item/clothing/head/fedora/fluff/cedrickhat,
		/obj/item/clothing/head/richard,
//		/obj/item/weapon/reagent_containers/food/drinks/cans/alden_drink,
//		/obj/item/weapon/gun/energy/holdout_taser,
		/obj/item/fluff/permit/alden_bluetenberger,
//		/obj/item/weapon/hand_tele/lezus,
		/obj/item/weapon/material/butterfly/boxcutter)


// NetraKyram: Ne'tra Ky'ram
/obj/item/weapon/storage/box/fluff/netra
	name = "Ne'tra Ky'ram's Personal Kit"
	desc = "A kit containing Ky'ram's equipment."
	has_items = list(
		/obj/item/fluff/permit/netra,
		/obj/item/weapon/gun/projectile/colt/fluff/ccg2492,
		/obj/item/ammo_magazine/mr2492,
		/obj/item/ammo_magazine/mr2492,
		/obj/item/device/radio/headset/fluff/netra,
		/obj/item/clothing/suit/storage/hooded/wintercoat/netra,
		/obj/item/clothing/under/dress/fluff/netra_dress,
		/obj/item/clothing/shoes/boots/winter/command/netra_boots,
		/obj/item/clothing/accessory/storage/black_vest/fluff/netra_vest,
		/obj/item/weapon/storage/belt/fluff/netra_belt,
		/obj/item/weapon/stamp/centcomm,
		/obj/item/clothing/gloves/fluff/netra_gloves,
		/obj/item/weapon/storage/pill_bottle/phenethylamine)


// DragonKo: Solar Attia
/obj/item/weapon/storage/box/fluff/solar
	name = "Solar Attia's Personal Kit"
	desc = "A kit containing Attia's equipment."
	has_items = list(
		/obj/item/clothing/under/fluff/solar_uniform,
		/obj/item/clothing/glasses/omnihud/med/fluff/solar,
		/obj/item/device/communicator/fluff/solar)
//----------------------------------------------------|
// bwoincognito:Tasald Corlethian
/obj/item/weapon/storage/box/fluff/tasald
	name = "Tasald's Kit"
	desc = "A kit containing Talsald's equipment."
	has_items = list(
		/obj/item/clothing/suit/storage/det_suit/fluff/tasald,
		/obj/item/clothing/suit/storage/det_suit/fluff/tas_coat,
		/obj/item/clothing/under/det/fluff/tasald,
		//Commented out since expired. Uncomment if renewed.
		///obj/item/fluff/permit/tasald_corlethian,
		///obj/item/weapon/gun/projectile/revolver/mateba/fluff/tasald_corlethian,
		/obj/item/weapon/implanter/loyalty)

//bwoincognito:Octavious Ward
/obj/item/weapon/storage/box/fluff/octavious
	name = "Octavious's Kit"
	desc = "A kit containing Octavious's work clothes."
	has_items = list(
		/obj/item/clothing/suit/storage/trench/fluff/octaviouscoat,
		/obj/item/clothing/under/det/fluff/octavious,
		/obj/item/clothing/mask/gas/plaguedoctor/fluff/octaviousmask,
		/obj/item/clothing/head/fedora/fluff/bowler,
		/obj/item/clothing/shoes/black/cuffs/octavious,
		/obj/item/weapon/cane/fluff/tasald,
		/obj/item/clothing/glasses/hud/health/octaviousmonicle
		)

// jemli:Cirra Mayhem
/obj/item/weapon/storage/box/fluff/cirra
	name = "Instant Pirate Kit"
	desc = "Just add Akula!"
	has_items = list(
		/obj/item/clothing/head/pirate,
		/obj/item/clothing/glasses/eyepatch,
		/obj/item/clothing/suit/pirate,
		/obj/item/clothing/under/pirate)

// joey4298:Emoticon
/obj/item/weapon/storage/box/fluff/emoticon
	name = "Emoticon's Mime Kit"
	desc = "Specially packaged for the hungry catgirl mime with a taste for clown."
	has_items = list(
		/obj/item/device/fluff/id_kit_mime,
		/obj/item/clothing/gloves/white,
		/obj/item/clothing/head/beret,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing,
		/obj/item/clothing/shoes/black,
		/*/obj/item/toy/crayon/mime*/) //Need to track down the code for crayons before adding this back in

//joanrisu:Joan Risu
/obj/item/weapon/storage/backpack/dufflebag/sec/fluff/joanrisu
	name = "Joan's Workbag"
	desc = "A bag Joan uses to carry her work equipment. It has the 82nd Battle Group Insignia on it."
	icon_state = "joanbag"
	icon = 'icons/vore/custom_items_vr.dmi'
	item_state = "duffle_med"
	slowdown = 0

	New()
		..()
		new /obj/item/clothing/accessory/holster/hip(src)
		new /obj/item/clothing/suit/storage/fluff/modernfedcoat(src)
		new /obj/item/clothing/head/caphat/formal/fedcover(src)
		new /obj/item/weapon/card/id/centcom/fluff/joanbadge(src)
		new /obj/item/weapon/gun/energy/gun/fluff/dominator(src)
		new /obj/item/clothing/suit/armor/det_suit(src)
		new /obj/item/fluff/permit/joanrisu(src)
		new /obj/item/weapon/sword/fluff/joanaria(src)
		new /obj/item/weapon/flame/lighter/zippo/fluff/joan(src)
		new /obj/item/clothing/under/rank/internalaffairs/fluff/joan(src)
		new /obj/item/clothing/head/helmet/space/fluff/joan(src)
		new /obj/item/clothing/suit/space/fluff/joan(src)



//joanrisu:Katarina Eine
/obj/item/weapon/storage/backpack/dufflebag/sec/fluff/katarina
	name = "Katarina's Workbag"
	desc = "A duffle bag Katarina uses to carry her tools."
	slowdown = 0

	New()
		..()
		new /obj/item/clothing/accessory/holster/hip(src)
		new /obj/item/clothing/suit/storage/fluff/fedcoat(src)
		new /obj/item/weapon/gun/energy/gun/fluff/dominator(src)
		new /obj/item/clothing/suit/armor/det_suit(src)
		new /obj/item/clothing/accessory/storage/black_vest(src)
		new /obj/item/weapon/material/hatchet/tacknife/combatknife/fluff/katarina(src)
		new /obj/item/weapon/material/hatchet/tacknife/combatknife/fluff/katarina(src)
		new /obj/item/weapon/material/hatchet/tacknife/combatknife/fluff/katarina(src)
		new /obj/item/weapon/material/hatchet/tacknife/combatknife/fluff/katarina(src)
		new /obj/item/clothing/under/rank/internalaffairs/fluff/joan(src)

//Razerwing:Archer Maximus
/obj/item/weapon/storage/box/fluff/archermaximus
	desc = "Personal Effects"
	has_items = list(
		/obj/item/fluff/permit/archermaximus,
		/obj/item/weapon/gun/projectile/colt/fluff/archercolt)

//ivymoomoo:Ivy Baladeva
/obj/item/weapon/storage/backpack/messenger/sec/fluff/ivymoomoo
	name = "Ivy's Courier"
	desc = "A bag resembling something used by college students. Contains items for ''MooMoo''."

	New()
		..()
		new /obj/item/clothing/head/beretg(src)
		new /obj/item/weapon/card/id/fluff/ivyholoid(src)
		new /obj/item/weapon/storage/fancy/cigarettes/dromedaryco(src)
		new /obj/item/weapon/storage/box/matches(src)
		new /obj/item/weapon/reagent_containers/food/snacks/sliceable/plaincake(src)

//Xsdew:Penelope Allen
/obj/item/weapon/storage/box/fluff/penelope
	name = "Penelope's capsule"
	desc = "A little capsule where a designer's swimsuit is stored."
	icon = 'icons/vore/custom_items_vr.dmi'
	icon_state = "capsule"
	storage_slots = 1
	foldable = null
	w_class = ITEMSIZE_SMALL
	max_w_class = ITEMSIZE_NORMAL
	can_hold = list(/obj/item/clothing/under/swimsuit/)
	has_items = list(/obj/item/clothing/under/swimsuit/fluff/penelope)

//Arokha:Aronai Kadigan
/obj/item/weapon/storage/backpack/satchel/gen/fluff/aronai
	name = "blue medical satchel"
	desc = "A medical satchel done up in blue and white."

	New()
		..() //Might look like a lot... but all small items.
		//Centcom stuff and permit
		new /obj/item/weapon/card/id/centcom/fluff/aronai(src)
		new /obj/item/fluff/permit/aronai_kadigan(src)
		//Gun and holster
		new /obj/item/weapon/gun/projectile/nsfw(src)
		new /obj/item/ammo_magazine/nsfw_mag(src)
		new /obj/item/ammo_casing/nsfw_batt/stun(src)
		new /obj/item/ammo_casing/nsfw_batt/stun(src)
		new /obj/item/ammo_casing/nsfw_batt/net(src)
		new /obj/item/clothing/accessory/holster(src)

//Aerowing:Sebastian Aji
/obj/item/weapon/storage/box/fluff/sebastian_aji
	name = "Sebastian's Lumoco Arms P3 Box"
	has_items = list(
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/ammo_magazine/m9mm/flash,
		/obj/item/ammo_magazine/m9mm/flash,
		/obj/item/fluff/permit/sebastian_aji)

/obj/item/weapon/storage/box/fluff/briana_moore
	name = "Briana's Derringer Box"
	has_items = list(
		/obj/item/weapon/gun/projectile/derringer/fluff/briana,
		/obj/item/fluff/permit/briana_moore)


/*
Swimsuits, for general use, to avoid arriving to work with your swimsuit.
*/
/obj/item/weapon/storage/box/fluff/swimsuit
	name = "Black Swimsuit capsule"
	desc = "A little capsule where a swimsuit is usually stored."
	storage_slots = 1
	icon = 'icons/vore/custom_items_vr.dmi'
	icon_state = "capsule"
	foldable = null
	w_class = ITEMSIZE_SMALL
	max_w_class = ITEMSIZE_NORMAL
	can_hold = list(/obj/item/clothing/under/swimsuit/)
	has_items = list(/obj/item/clothing/under/swimsuit/black)

/obj/item/weapon/storage/box/fluff/swimsuit/blue
	name = "Blue Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/blue)

/obj/item/weapon/storage/box/fluff/swimsuit/purple
	name = "Purple Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/purple)

/obj/item/weapon/storage/box/fluff/swimsuit/green
	name = "Green Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/green)

/obj/item/weapon/storage/box/fluff/swimsuit/red
	name = "Red Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/red)

/obj/item/weapon/storage/box/fluff/swimsuit/engineering
	name = "Engineering Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/fluff/engineering)

/obj/item/weapon/storage/box/fluff/swimsuit/science
	name = "Science Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/fluff/science)

/obj/item/weapon/storage/box/fluff/swimsuit/security
	name = "Security Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/fluff/security)

/obj/item/weapon/storage/box/fluff/swimsuit/medical
	name = "Medical Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/fluff/medical)
