
//NetraKyram
/obj/item/clothing/suit/storage/hooded/wintercoat/netra
	name = "NT Magistrate Officer coat"
	desc = "A Black and Gold Winter Coat, The Colors of the NT Magistrate Division."
	icon = 'icons/boh/fluff.dmi'
	icon_state = "coatcaptain"
	item_state_slots = list(slot_r_hand_str = "coatcaptain", slot_l_hand_str = "coatcaptain")

	icon_override = 'icons/boh/fluff.dmi'
	item_state = "coatcaptain_mob"
	armor = list(melee = 5, bullet = 5, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/hooded/wintercoat/netra/ui_action_click()
	ToggleHood_netra()

/obj/item/clothing/suit/storage/hooded/wintercoat/netra/equipped(mob/user, slot)
	if(slot != slot_wear_suit)
		RemoveHood_netra()
	..()

/obj/item/clothing/suit/storage/hooded/wintercoat/netra/proc/RemoveHood_netra()
	icon_state = "coatcaptain"
	item_state = "coatcaptain_mob"
	suittoggled = 0
	if(ishuman(hood.loc))
		var/mob/living/carbon/H = hood.loc
		H.unEquip(hood, 1)
		H.update_inv_wear_suit()
	hood.loc = src

/obj/item/clothing/suit/storage/hooded/wintercoat/netra/proc/ToggleHood_netra()
	if(!suittoggled)
		if(ishuman(loc))
			var/mob/living/carbon/human/H = src.loc
			if(H.wear_suit != src)
				H << "<span class='warning'>You must be wearing [src] to put up the hood!</span>"
				return
			if(H.head)
				H << "<span class='warning'>You're already wearing something on your head!</span>"
				return
			else
				H.equip_to_slot_if_possible(hood,slot_head,0,0,1)
				suittoggled = 1
				icon_state = "coatcaptain_t"
				item_state = "coatcaptain_mob_t"
				H.update_inv_wear_suit()
	else
		RemoveHood_netra()

/obj/item/clothing/under/dress/fluff/netra_dress
	name = "NT Magistrate Officer dress"
	desc = "A black and gold Patterned Dress, the colors of the NT Magistrate Division. The dress appears to be infused with a ballistic weave of sorts."

	icon = 'icons/boh/fluff.dmi'
	icon_state = "kilanosuit"

	icon_override = 'icons/boh/onmobfluff.dmi'
	item_state = "kilanosuit_mob" //Don't add the "_s" in the icon's name to the reference here, otherwise it's going to read it as "_s_s". The actual icon in the .dmi should have "_s" though. --Joan Risu

	species_restricted = null
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 5, bullet = 25, laser = 15,energy = 15, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/shoes/boots/winter/command/netra_boots
	name = "NT Magistrate Officer boots"
	desc = "Some black and Gold Colored Boots, the colors of the NT Magistrate Division."

	icon = 'icons/boh/fluff.dmi'
	icon_state = "netra_boots"
	icon_override = 'icons/boh/onmobfluff.dmi'
	item_state = "netra_boots" //You don't really have to specify this since the code is just gonna use the override and the icon_state. I don't fucking know why, whoever coded it this way is a fucking idiot. --Joan Risu
	item_icons = null
	armor = list(melee = 5, bullet = 5, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/accessory/storage/black_vest/fluff/netra_vest
	name = "NT Magistrate Officer vest"
	desc = "A black and gold Camoflauged Webbing Vest, The Colors of the NT Magistrate Division."

	icon = 'icons/boh/fluff.dmi'
	icon_state = "netra_vest"
	icon_override = 'icons/boh/onmobfluff.dmi'
	//No need for an item_state for accessories, just specify the icon_override and the code will look for the name specified in icon_state for the item_state. --Joan Risu
	armor = list(melee = 5, bullet = 5, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/weapon/storage/belt/fluff/netra_belt
	name = "NT Magistrate Officer belt"
	desc = "A black and gold belt, The Colors of the NT Magistrate Division."

	icon = 'icons/boh/fluff.dmi'
	icon_state = "swat"

	icon_override = 'icons/boh/onmobfluff.dmi'
	item_state = "swat_m"

	storage_slots = 9

/obj/item/clothing/gloves/fluff/netra_gloves
	name = "NT Magistrate Officer gloves"
	desc = "Some black and Gold Colored Gloves, the colors of the NT Magistrate Division."

	icon = 'icons/boh/fluff.dmi'
	icon_state = "kilanogloves"

	icon_override = 'icons/boh/onmobfluff.dmi'
	item_state = "kilanogloves_m"
	armor = list(melee = 5, bullet = 5, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

// DragonKo - Solar Attia
/obj/item/clothing/under/fluff/solar_uniform
	name = "Fancy Suit"
	desc = "A very fancy gold flecked suit. Looks worn in."

	icon = 'icons/boh/fluff.dmi'
	icon_state = "solar_uniform"

	icon_override = 'icons/boh/onmobfluff.dmi'
	item_state = "solar_uniform-on"

//----

// Random BoH fluff
/obj/item/weapon/rig/light/ccsec
	name = "\improper SDC \"ARMD\" suit control module"
	desc = "A lighter, decently armoured rig for Spyra surface work."
	icon_state = "ninja_rig"
	suit_type = "light suit"
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs,/obj/item/weapon/tank,/obj/item/device/suit_cooling_unit,/obj/item/weapon/cell)
	armor = list(melee = 65, bullet = 15, laser = 65, energy = 15, bomb = 25, bio = 0, rad = 0)
	emp_protection = 10
	slowdown = 0
	item_flags = STOPPRESSUREDAMAGE | THICKMATERIAL
	offline_slowdown = 0
	offline_vision_restriction = 0

	chest_type = /obj/item/clothing/suit/space/rig/light/ccsec
	helm_type =  /obj/item/clothing/head/helmet/space/rig/light/ccsec
	boot_type =  /obj/item/clothing/shoes/magboots/rig/light/ccsec
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/light/ccsec

/obj/item/clothing/suit/space/rig/light/ccsec
	name = "suit"
	breach_threshold = 18 //comparable to voidsuits

/obj/item/clothing/gloves/gauntlets/rig/light/ccsec
	name = "gloves"

/obj/item/clothing/shoes/magboots/rig/light/ccsec
	name = "shoes"

/obj/item/clothing/head/helmet/space/rig/light/ccsec
	name = "hood"

//--------------------