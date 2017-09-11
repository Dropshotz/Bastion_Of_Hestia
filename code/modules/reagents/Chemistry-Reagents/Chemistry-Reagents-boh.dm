datum
	reagent
// Shamelessly ripped from Y.W., with large changes.
		benzilate
			name = "Odd Goo"
			id = "benzilate"
			description = "Grey... goo? This smells like hot acid. Consuming this likely wouldn't be good for your health."
			taste_description = "raw iron"
			metabolism = REM * 0.2
			overdose = REAGENTS_OVERDOSE * 1
			taste_mult = 0.4
			color = "#929292"

		phenethylamine
			name = "Phenethylamine"
			id = "phenethylamine"
			description = "Just looking at this makes you feel odd. Whether or not this would be good to consume is likely a gamble."
			color = "#463667"
			data = list("count"=1)
			on_mob_life(var/mob/living/M as mob)
				if(!M) M = holder.my_atom
				if(data)
					switch(data["count"])
						if(1 to 30)
							if(prob(9)) M.emote("me",1,"blushes")
							if(prob(9)) M << "\red You feel so needy.."
						if (30 to INFINITY)
							if(prob(3)) M.emote("me",1,"blushes")
							if(prob(5)) M.say("!moans out lewdly!")
							if(prob(9)) M << "\red You can't help but want to touch yourself then and now!"
					data["count"]++
				holder.remove_reagent(src.id, 0.2)
				//..()
				return

/datum/chemical_reaction/benzilate
	name = "Benzilate"
	id = "benzilate"
	result = "benzilate"
	required_reagents = list("paracetamol" = 1, "mindbreaker" = 1)
	result_amount = 2

/datum/chemical_reaction/phenethylamine
	name = "Phenethylamine"
	id = "phenethylamine"
	result = "phenethylamine"
	required_reagents = list("paroxetine" = 1, "benzilate" = 1)
	result_amount = 2

/datum/reagent/benzilate/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	var/drug_strength = 12
	if(alien == IS_SKRELL)
		drug_strength = drug_strength * 0.8
	M.make_dizzy(drug_strength)
	M.Confuse(drug_strength * 14)