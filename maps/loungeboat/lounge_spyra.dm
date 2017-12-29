var/datum/planet/spyra/planet_spyra = null

/datum/time/spyra
	seconds_in_day = 3 HOURS

/datum/planet/spyra
	name = "Spyra"
	desc = "An extremely arid planet with little to no life on the surface. \
	A run-of-the-mill Human would find trouble staying alive in such an environment,\
	the random changes of both weather and harmfully warm temperatures contributing to this.\
	Fortunately, agressive terraforming has made it more liveable, albeit \
	with a now sporadically changing atmosphere and multiple (hostile) weather patterns."
	current_time = new /datum/time/spyra()
	expected_z_levels = list(
						Z_LEVEL_SURFACE_LOW,
						Z_LEVEL_SURFACE_MID,
						Z_LEVEL_SURFACE_HIGH,
						Z_LEVEL_HUB,
						Z_LEVEL_DESERT
						)

	planetary_wall_type = /turf/unsimulated/wall/planetary/spyra

/datum/planet/spyra/New()
	..()
	planet_spyra = src
	weather_holder = new /datum/weather_holder/spyra(src)

/datum/planet/spyra/update_sun()
	..()
	var/datum/time/time = current_time
	var/length_of_day = time.seconds_in_day / 10 / 60 / 60
	var/noon = length_of_day / 2
	var/distance_from_noon = abs(text2num(time.show_time("hh")) - noon)
	sun_position = distance_from_noon / noon
	sun_position = abs(sun_position - 1)

	var/low_brightness = null
	var/high_brightness = null

	var/low_color = null
	var/high_color = null
	var/min = 0

	switch(sun_position)
		if(0 to 0.40) // Night
			low_brightness = 0.2
			low_color = "#000066"

			high_brightness = 0.5
			high_color = "#66004D"
			min = 0

		if(0.40 to 0.50) // Twilight
			low_brightness = 0.6
			low_color = "#66004D"

			high_brightness = 0.8
			high_color = "#CC3300"
			min = 0.40

		if(0.50 to 0.70) // Sunrise/set
			low_brightness = 0.8
			low_color = "#CC3300"

			high_brightness = 0.9
			high_color = "#FF9933"
			min = 0.50

		if(0.70 to 1.00) // Noon
			low_brightness = 0.9
			low_color = "#DDDDDD"

			high_brightness = 1.0
			high_color = "#FFFFFF"
			min = 0.70

	var/lerp_weight = (abs(min - sun_position)) * 4
	var/weather_light_modifier = 1
	if(weather_holder && weather_holder.current_weather)
		weather_light_modifier = weather_holder.current_weather.light_modifier

	var/new_brightness = (Interpolate(low_brightness, high_brightness, weight = lerp_weight) ) * weather_light_modifier

	var/new_color = null
	if(weather_holder && weather_holder.current_weather && weather_holder.current_weather.light_color)
		new_color = weather_holder.current_weather.light_color
	else
		var/list/low_color_list = hex2rgb(low_color)
		var/low_r = low_color_list[1]
		var/low_g = low_color_list[2]
		var/low_b = low_color_list[3]

		var/list/high_color_list = hex2rgb(high_color)
		var/high_r = high_color_list[1]
		var/high_g = high_color_list[2]
		var/high_b = high_color_list[3]

		var/new_r = Interpolate(low_r, high_r, weight = lerp_weight)
		var/new_g = Interpolate(low_g, high_g, weight = lerp_weight)
		var/new_b = Interpolate(low_b, high_b, weight = lerp_weight)

		new_color = rgb(new_r, new_g, new_b)

	spawn(1)
		update_sun_deferred(2, new_brightness, new_color)

// Snow, hail and so on is to be disabled for the time being. Need to implement a persistent season system. -Carl
/datum/weather_holder/spyra
	temperature = T0C
	allowed_weather_types = list(
		WEATHER_CLEAR		= new /datum/weather/spyra/clear(),
		WEATHER_OVERCAST	= new /datum/weather/spyra/overcast(),
//		WEATHER_LIGHT_SNOW	= new /datum/weather/spyra/light_snow(),
//		WEATHER_SNOW		= new /datum/weather/spyra/snow(),
//		WEATHER_BLIZZARD	= new /datum/weather/spyra/blizzard(),
		WEATHER_RAIN		= new /datum/weather/spyra/rain(),
		WEATHER_STORM		= new /datum/weather/spyra/storm(),
//		WEATHER_HAIL		= new /datum/weather/spyra/hail(),
		WEATHER_BLOOD_MOON	= new /datum/weather/spyra/blood_moon(),
		WEATHER_SANDSTORM	= new /datum/weather/spyra/sandstorm()
		)
	roundstart_weather_chances = list(
		WEATHER_CLEAR		= 30,
		WEATHER_OVERCAST	= 30,
		WEATHER_RAIN		= 5,
		WEATHER_STORM		= 2.5,
		WEATHER_SANDSTORM	= 32.5
		)

datum/weather/spyra
	name = "spyra base"
	temp_high = 344.15 // 71c
	temp_low = 313.15  // 40c

/datum/weather/spyra/clear
	name = "clear"
	transition_chances = list(
		WEATHER_CLEAR = 60,
		WEATHER_OVERCAST = 40
		)

/datum/weather/spyra/overcast
	name = "overcast"
	light_modifier = 0.8
	transition_chances = list(
		WEATHER_CLEAR = 25,
		WEATHER_OVERCAST = 50,
//		WEATHER_LIGHT_SNOW = 10,
//		WEATHER_SNOW = 5,
		WEATHER_RAIN = 5,
//		WEATHER_HAIL = 5
		)

/datum/weather/spyra/light_snow
	name = "light snow"
	icon_state = "snowfall_light"
	temp_high = 238.15 // -25c
	temp_low = 228.15  // -35c
	light_modifier = 0.7
	transition_chances = list(
		WEATHER_OVERCAST = 20,
		WEATHER_LIGHT_SNOW = 50,
		WEATHER_SNOW = 25,
		WEATHER_HAIL = 5
		)

/datum/weather/spyra/snow
	name = "moderate snow"
	icon_state = "snowfall_med"
	temp_high = 233.15 // -30c
	temp_low = 223.15  // -40c
	light_modifier = 0.5
	transition_chances = list(
		WEATHER_LIGHT_SNOW = 20,
		WEATHER_SNOW = 50,
		WEATHER_BLIZZARD = 20,
		WEATHER_HAIL = 5,
		WEATHER_OVERCAST = 5
		)

/datum/weather/spyra/snow/process_effects()
	for(var/turf/simulated/floor/outdoors/snow/S in outdoor_turfs)
		if(S.z in holder.our_planet.expected_z_levels)
			for(var/dir_checked in cardinal)
				var/turf/simulated/floor/T = get_step(S, dir_checked)
				if(istype(T))
					if(istype(T, /turf/simulated/floor/outdoors) && prob(33))
						T.chill()

/datum/weather/spyra/blizzard
	name = "blizzard"
	icon_state = "snowfall_heavy"
	temp_high = 223.15 // -40c
	temp_low = 203.15  // -60c
	light_modifier = 0.3
	transition_chances = list(
		WEATHER_SNOW = 45,
		WEATHER_BLIZZARD = 40,
		WEATHER_HAIL = 10,
		WEATHER_OVERCAST = 5
		)

/datum/weather/spyra/blizzard/process_effects()
	for(var/turf/simulated/floor/outdoors/snow/S in outdoor_turfs)
		if(S.z in holder.our_planet.expected_z_levels)
			for(var/dir_checked in cardinal)
				var/turf/simulated/floor/T = get_step(S, dir_checked)
				if(istype(T))
					if(istype(T, /turf/simulated/floor/outdoors) && prob(50))
						T.chill()

/datum/weather/spyra/rain
	name = "rain"
	icon_state = "rain"
	light_modifier = 0.5
	transition_chances = list(
		WEATHER_OVERCAST = 25,
//		WEATHER_LIGHT_SNOW = 10,
		WEATHER_RAIN = 50,
		WEATHER_STORM = 10,
//		WEATHER_HAIL = 5
		)

/datum/weather/spyra/rain/process_effects()
	for(var/mob/living/L in living_mob_list)
		if(L.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(L)
			if(!T.outdoors)
				return // They're indoors, so no need to rain on them.

			L.adjust_fire_stacks(-5)
			to_chat(L, "<span class='warning'>Rain falls on you.</span>")

/datum/weather/spyra/storm
	name = "storm"
	icon_state = "storm"
	temp_high = 321.15 // 48c
	temp_low = 304.15  // 31C
	light_modifier = 0.3
	transition_chances = list(
		WEATHER_RAIN = 45,
		WEATHER_STORM = 40,
//		WEATHER_HAIL = 10,
		WEATHER_OVERCAST = 5
		)

/datum/weather/spyra/rain/process_effects()
	for(var/mob/living/L in living_mob_list)
		if(L.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(L)
			if(!T.outdoors)
				return // They're indoors, so no need to rain on them.

			L.adjust_fire_stacks(-10)
			to_chat(L, "<span class='warning'>Rain falls on you, drenching you in water.</span>")

/datum/weather/spyra/hail
	name = "hail"
	icon_state = "hail"
	temp_high = 233.15 // -30c
	temp_low = 213.15  // -50c
	light_modifier = 0.3
	transition_chances = list(
		WEATHER_RAIN = 45,
		WEATHER_STORM = 10,
		WEATHER_HAIL = 40,
		WEATHER_OVERCAST = 5
		)

/datum/weather/spyra/hail/process_effects()
	for(var/mob/living/L in living_mob_list)
		if(L.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(L)
			if(!T.outdoors)
				return // They're indoors, so no need to pelt them with ice.

			var/target_zone = pick(BP_ALL)
			var/amount_blocked = L.run_armor_check(target_zone, "melee")
			var/amount_soaked = L.get_armor_soak(target_zone, "melee")

			if(amount_blocked >= 100)
				return // No need to apply damage.

			if(amount_soaked >= 10)
				return // No need to apply damage.

			L.apply_damage(rand(5, 10), BRUTE, target_zone, amount_blocked, amount_soaked, used_weapon = "hail")
			to_chat(L, "<span class='warning'>The hail raining down on you [L.can_feel_pain() ? "hurts" : "damages you"]!</span>")

/datum/weather/spyra/blood_moon
	name = "blood moon"
	light_modifier = 0.5
	light_color = "#FF0000"
	transition_chances = list(
		WEATHER_BLOODMOON = 100
		)


// Odd Below
/datum/weather/spyra/sandstorm
	name = "sandstorm"
	icon_state = "sandstorm_temp" //Gotta change this at some point. -Carl
	temp_high = 344.15 // 71c
	temp_low = 313.15  // 40c
	light_modifier = 0.9
	light_color = "#ECAC3F"
	transition_chances = list(
		WEATHER_CLEAR = 60,
		WEATHER_OVERCAST = 40
		)

/datum/weather/spyra/sandstorm/process_effects()
	for(var/mob/living/L in living_mob_list)
		if(L.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(L)
			if(!T.outdoors)
				return // They're indoors.

			var/target_zone = pick(BP_ALL)
			var/amount_blocked = L.run_armor_check(target_zone, "melee")
			var/amount_soaked = L.get_armor_soak(target_zone, "melee")

			if(amount_blocked >= 100)
				return // No need to apply damage.

			if(amount_soaked >= 10)
				return // No need to apply damage.

			L.apply_damage(rand(5, 10), BRUTE, target_zone, amount_blocked, amount_soaked, used_weapon = "hail")
			to_chat(L, "<span class='warning'>The small chunks of dust and debris raining down on you [L.can_feel_pain() ? "hurts" : "damages you"]!</span>")