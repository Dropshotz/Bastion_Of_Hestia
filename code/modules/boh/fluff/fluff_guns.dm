//Needeed Defs.
#define SINGLE_CASING 	1	//The gun only accepts ammo_casings. ammo_magazines should never have this as their mag_type.
#define SPEEDLOADER 	2	//Transfers casings from the mag to the gun when used.
#define MAGAZINE 		4	//The magazine item itself goes inside the gun

#define HOLD_CASINGS	0 //do not do anything after firing. Manual action, like pump shotguns, or guns that want to define custom behaviour
#define EJECT_CASINGS	1 //drop spent casings on the ground after firing
#define CYCLE_CASINGS 	2 //experimental: cycle casings, like a revolver. Also works for multibarrelled guns

// - - - - - |
/obj/item/weapon/gun/projectile/animusrevolver
	name = "PT SERB .44 \"Animus\""
	desc = "This revolver appears to be of custom make. Has the word \"Animus\" carved into the left side of the barrel. Uses .44 rounds."
	icon_state = "animus"
	item_state = "animus"
	icon = 'icons/boh/weapon.dmi'
	caliber = ".44"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	ammo_type = /obj/item/ammo_casing/an44/rubber
	fire_sound='sound/weapons/revolver.ogg'
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round

/obj/item/weapon/gun/projectile/animusrevolver/verb/spin_cylinder()
	set name = "Spin cylinder"
	set desc = "Fun when you're bored out of your skull."
	set category = "Object"

	chamber_offset = 0
	visible_message("<span class='warning'>\The [usr] spins the cylinder of \the [src]!</span>", \
	"<span class='notice'>You hear something metallic spin and click.</span>")
	playsound(src.loc, 'sound/weapons/revolver_spin.ogg', 100, 1)
	loaded = shuffle(loaded)
	if(rand(1,max_shells) > loaded.len)
		chamber_offset = rand(0,max_shells - loaded.len)

/obj/item/weapon/gun/projectile/animusrevolver/consume_next_projectile()
	if(chamber_offset)
		chamber_offset--
		return
	return ..()

/obj/item/weapon/gun/projectile/animusrevolver/load_ammo(var/obj/item/A, mob/user)
	chamber_offset = 0
	return ..()

// Animus speedloader
/obj/item/ammo_magazine/an44
	name = "speedloader (.44 Wildcat)"
	desc = "A speedloader for .44 revolvers."
	icon = 'icons/obj/ammo_vr.dmi'
	icon_state = "s357"
	caliber = ".44"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/an44
	max_ammo = 6
	multiple_sprites = 1
	mag_type = SPEEDLOADER

/obj/item/ammo_magazine/an44/rubber
	name = "speedloader (.44 wildcat less-than-lethal)"
	icon_state = "ram44"
	ammo_type = /obj/item/ammo_casing/an44/rubber


// Animus rounds
/obj/item/ammo_casing/an44
	icon_state = "am-casing"
	desc = "A wildcat .44 bullet casing."
	caliber = ".44"
	projectile_type = /obj/item/projectile/bullet/pistol/strong/am

/obj/item/ammo_casing/an44/rubber
	icon_state = "ram-casing"
	desc = "A wildcat .44 'rubber' bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber/am



//-----flaregun-----
/obj/item/weapon/gun/projectile/trueflaregun
	name = "flare gun"
	desc = "Mostly legal. Great for bird suppression."
	icon_state = "flaregunp"
	item_state = "flaregunp"
	icon = 'icons/boh/weapon.dmi'
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 1
	force = 10
	flags =  CONDUCT
	caliber = "12g"
	fire_sound = 'sound/weapons/bb.ogg'
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)
	ammo_type = /obj/item/ammo_casing/flaredp
	w_class = ITEMSIZE_SMALL

//One shell for now.
/obj/item/ammo_casing/flaredp
	name = "Flare Shell"
	icon_state = "flaredp"
	desc = "Dual purpose flare round."
	caliber = "12g"
	matter = list(DEFAULT_WALL_MATERIAL = 530)
	projectile_type = /obj/item/projectile/energy/flash/flaredp


/obj/item/weapon/storage/box/flaredp_half
	name = "box of flare shells"
	desc = "A box full of flare shells. It has instructions on safe use... as if."
	icon_state = "flaredp_box"

/obj/item/weapon/storage/box/flaredp_half/New()
	..()
	for(var/i = 1 to 4)
		new /obj/item/ammo_casing/flaredp(src)


/obj/item/weapon/storage/box/flaredp
	name = "box of flare shells"
	desc = "A box full of flare shells. It has instructions on safe use... as if."
	icon_state = "flaredp_box"

/obj/item/weapon/storage/box/flaredp/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/ammo_casing/flaredp(src)
//---------
//PFC Honor weapon - Mosin copy
/*
/obj/item/weapon/gun/projectile/shotgun/pump/rifle/pfchonor
	name = "\improper PCRC Honor Rifle"
	desc = "Despite this rifle looking like an old Terran Mosin, albeit without the same color scheme, it is, in fact, not a copy. Few would recognize it as a 'weapon' used by the not so well known PCRC elite. Mainly a display of power rather than an actual firearm for combat, although it can be used if required. Looks modified to fire specialized 7.62mm rounds."
	icon_state = "pfchonor"
	item_state = "pfchonor"
	fire_sound = 'sound/weapons/svd_shot.ogg'
	caliber = "sp-7.62mm"
	ammo_type = /obj/item/ammo_casing/a762pfcrubber
	origin_tech = list(TECH_COMBAT = 1)
	max_shells = 5
*/
/obj/item/weapon/gun/projectile/pfchonorSVD
	name = "\improper PCRC AVO43"
	desc = "Despite this rifle looking like an old Terran SVD, albeit without the same color scheme, it is, in fact, not a copy. Few would recognize it as the AVO43, produced within Martian colonies and used by the not so well known PCRC elite. Mainly a display of power rather than an actual firearm for combat, although it can be used if required. Looks modified to fire specialized 7.62mm rounds."
	icon_state = "pfchonor_proper"
	item_state = "pfchonor_proper"
	icon = 'icons/boh/weapon.dmi'
	w_class = ITEMSIZE_LARGE
	force = 10
//	slot_flags = SLOT_BACK // Needs a sprite.
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 4, TECH_ILLEGAL = 2)
	recoil = 2
	caliber = "sp-7.62mm"
	load_method = MAGAZINE
	accuracy = -3
	scoped_accuracy = 0
	requires_two_hands = 1
//	one_handed_penalty = 4
	fire_sound = 'sound/weapons/SVD_shot.ogg'
	magazine_type = /obj/item/ammo_magazine/m762pfcrubber
	//allowed_magazines = list(/obj/item/ammo_magazine/SVD, /obj/item/ammo_magazine/m762)

/obj/item/weapon/gun/projectile/SVD/update_icon()
	..()
//	if(istype(ammo_magazine,/obj/item/ammo_magazine/m762)
//		icon_state = "SVD-bigmag" //No icon for this exists yet.
	if(ammo_magazine)
		icon_state = "pfchonor_proper"
	else
		icon_state = "pfchonor_proper-empty"

/*/obj/item/weapon/gun/projectile/SVD/verb/scope()
	set category = "Object"--
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)*/


//pfc magazines
/obj/item/ammo_magazine/m762pfcrubber
	name = "magazine (7.62mm Specialized)"
	icon_state = "m762-small"
	mag_type = MAGAZINE
	caliber = "sp-7.62mm"
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	ammo_type = /obj/item/ammo_casing/a762pfcrubber
	max_ammo = 10
	multiple_sprites = 1

// pfc ammo

/obj/item/ammo_casing/a762pfcrubber
	desc = "A specialized 7.62mm 'rubber' bullet casing."
	caliber = "sp-7.62mm"
	icon_state = "pfc_rubber_rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/a762pfcrubber


//-----CC Colt-----\\

/obj/item/weapon/gun/projectile/colt/fluff/ccg2492
	name = "Jhen G2492"
	desc = "A NanoTrasen Jhen G2492 self defence weapon. Modified to accept only specialized .45 ammunition."
	magazine_type = /obj/item/ammo_magazine/mr2492
	allowed_magazines = list(/obj/item/ammo_magazine/mr2492)
	icon_state = "jhencolt"
	caliber = ".45sp"
	icon = 'icons/boh/weapon.dmi'
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/xm8.ogg'
	load_method = MAGAZINE

/obj/item/weapon/gun/projectile/colt/fluff/ccg2492/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "jhencolt"
	else
		icon_state = "jhencolt-empty"

/obj/item/ammo_magazine/mr2492
	name = "magazine (.45 Specialized)"
	desc = "This magazine probably wouldn't fit a normal .45 caliber weapon, as it appears to be modified against that. NT branding is visible on the underside."
	icon_state = "sp45-10"
	mag_type = MAGAZINE
	caliber = ".45sp"
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	ammo_type = /obj/item/ammo_casing/r2492
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_casing/r2492
	desc = "A specialized .45 'rubber' bullet casing."
	caliber = ".45sp"
	icon_state = "am-casing"
	projectile_type = /obj/item/projectile/bullet/pistol/rubber/jhen45sp

//-----CC Carbine-----\\

/obj/item/weapon/gun/projectile/carbine/jhenc2487
	name = "Jhen C2487"
	desc = "The Jhen C2487 is a lightweight carbine manufactured by NanoTrasen subsidiaries, and issued to security forces aboard NanoTrasen vessels and stations. \
	Whispered to be a knockoff. \
	Modified to fire specialized less-than-lethal 7.62 ammunition.\
	Only able to accept a magazine with the ability to hold the same round type."
	magazine_type = /obj/item/ammo_magazine/mr2487
	allowed_magazines = list(/obj/item/ammo_magazine/mr2487)
	icon_state = "jhencarbine" //Gotta change this at some point. -Carl
	icon = 'icons/boh/weapon.dmi'
	caliber = "7.62sp"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/svd_shot.ogg'
	load_method = MAGAZINE
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/magdrop_1.ogg'

/obj/item/weapon/gun/projectile/carbine/jhenc2487/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "jhencarbine"
	else
		icon_state = "jhencarbine-empty"

/obj/item/ammo_magazine/mr2487
	name = "rifle magazine (7.62mm Specialized)"
	desc = "This magazine probably wouldn't fit a normal rifle of the same caliber, as it appears to be modified against that.\
	 NT branding is visible on the underside."
	icon = 'icons/obj/ammo_vr.dmi'
	icon_state = "jhencarb"
	mag_type = MAGAZINE
	caliber = "7.62sp"
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	ammo_type = /obj/item/ammo_casing/r2487
	max_ammo = 16
	multiple_sprites = 1

/obj/item/ammo_casing/r2487
	desc = "A specialized 7.62 'rubber' bullet casing."
	caliber = "7.62sp"
	icon_state = "pfc_rubber_rifle-casing"
	projectile_type = /obj/item/projectile/bullet/rifle/rubber/jhen762sp