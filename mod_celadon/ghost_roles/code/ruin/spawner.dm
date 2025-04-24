/obj/effect/mob_spawn/human/oldstation
	death = FALSE
	roundstart = FALSE
	random = FALSE
	name = "old cryogenics pod"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	short_desc = "Work as a team with your fellow survivors aboard a ruined, ancient space station."
	mob_species = /datum/species/human
	assignedrole = "Ancient Crew"

/obj/effect/mob_spawn/human/oldstation/oldsec
	desc = "A humming cryo pod. You can barely recognise a security uniform underneath the built up ice. The machine is attempting to wake up its occupant."
	mob_name = "a security officer"
	outfit = /datum/outfit/oldstation/officer
	important_info = ""
	flavour_text = "You are a security officer working for Elusium, stationed onboard a state of the art research station. You vaguely recall rushing into a \
	cryogenics pod due to an oncoming radiation storm. The last thing you remember is the station's Artificial Program telling you that you would only be asleep for eight hours. As you open \
	your eyes, everything seems rusted and broken, a dark feeling swells in your gut as you climb out of your pod."

/obj/effect/mob_spawn/human/oldstation/oldmed
	desc = "A humming cryo pod. You can barely recognise a medical uniform underneath the built up ice. The machine is attempting to wake up its occupant."
	mob_name = "a medical doctor"
	outfit = /datum/outfit/oldstation/medic
	important_info = ""
	flavour_text = "You are a medical doctor working for Elusium, stationed onboard a state of the art research station. You vaguely recall rushing into a \
	cryogenics pod due to an oncoming radiation storm. The last thing you remember is the station's Artificial Program telling you that you would only be asleep for eight hours. As you open \
	your eyes, everything seems rusted and broken, a dark feeling swells in your gut as you climb out of your pod."

/obj/effect/mob_spawn/human/oldstation/oldeng
	desc = "A humming cryo pod. You can barely recognise an engineering uniform underneath the built up ice. The machine is attempting to wake up its occupant."
	mob_name = "an engineer"
	outfit = /datum/outfit/oldstation/engineer
	important_info = ""
	flavour_text = "You are an engineer working for Elusium, stationed onboard a state of the art research station. You vaguely recall rushing into a \
	cryogenics pod due to an oncoming radiation storm. The last thing you remember is the station's Artificial Program telling you that you would only be asleep for eight hours. As you open \
	your eyes, everything seems rusted and broken, a dark feeling swells in your gut as you climb out of your pod."

/obj/effect/mob_spawn/human/oldstation/oldsci
	desc = "A humming cryo pod. You can barely recognise a science uniform underneath the built up ice. The machine is attempting to wake up its occupant."
	mob_name = "a scientist"
	outfit = /datum/outfit/oldstation/scientist
	important_info = ""
	flavour_text = "You are a scientist working for Elusium, stationed onboard a state of the art research station. You vaguely recall rushing into a \
	cryogenics pod due to an oncoming radiation storm. The last thing you remember is the station's Artificial Program telling you that you would only be asleep for eight hours. As you open \
	your eyes, everything seems rusted and broken, a dark feeling swells in your gut as you climb out of your pod."

/obj/structure/showcase/machinery/oldpod
	name = "damaged cryogenic pod"
	desc = "A damaged cryogenic pod long since lost to time, including its former occupant..."
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper-open"

/obj/structure/showcase/machinery/oldpod/used
	name = "opened cryogenic pod"
	desc = "A cryogenic pod that has recently discharged its occupant. The pod appears non-functional."

/datum/outfit/oldstation/officer
	name = "Old station officer"
	uniform = /obj/item/clothing/under/utility
	shoes = /obj/item/clothing/shoes/jackboots
	id = /obj/item/card/id/elysium
	r_pocket = /obj/item/restraints/handcuffs
	l_pocket = /obj/item/assembly/flash

/datum/outfit/oldstation/medic
	name = "Old station medic"
	uniform = /obj/item/clothing/under/utility
	shoes = /obj/item/clothing/shoes/sneakers/black
	id = /obj/item/card/id/elysium
	l_pocket = /obj/item/stack/medical/ointment
	r_pocket = /obj/item/stack/medical/ointment

/datum/outfit/oldstation/engineer
	name = "Old station engineer"
	uniform = /obj/item/clothing/under/utility
	shoes = /obj/item/clothing/shoes/workboots
	id = /obj/item/card/id/elysium
	gloves = /obj/item/clothing/gloves/color/fyellow/old
	l_pocket = /obj/item/tank/internals/emergency_oxygen

/datum/outfit/oldstation/scientist
	name = "Old station scientist"
	uniform = /obj/item/clothing/under/utility
	shoes = /obj/item/clothing/shoes/sneakers/black
	id = /obj/item/card/id/elysium
	l_pocket = /obj/item/stack/medical/bruise_pack

/obj/effect/mob_spawn/human/oldstation/Destroy()
	new /obj/structure/showcase/machinery/oldpod/used(drop_location())
	return ..()

/obj/effect/mob_spawn/human/oldstation/special(mob/living/new_spawn)
	new_spawn.fully_replace_character_name(null,random_unique_name(gender))

/obj/effect/mob_spawn/human/oldstation/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("Обнаружен сигнал старой криогенной капсулы \the [A.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)

/obj/effect/mob_spawn/human/elysium_town
	death = FALSE
	roundstart = FALSE
	random = FALSE
	name = "Glory to the nation!"
	icon = 'icons/obj/objects.dmi'
	icon_state = "bed"
	short_desc = "You are a Separatist of Elysium."
	mob_species = /datum/species/human
	assignedrole = "Separatist of Elysium"
	outfit = /datum/outfit/job/elysium
	flavour_text = "You must cleanse this world of xenospecies and all those who oppose it."

/obj/effect/mob_spawn/human/elysium_town/Destroy()
	new /obj/structure/bed(drop_location())
	return ..()

/obj/effect/mob_spawn/human/elysium_town/special(mob/living/new_spawn)
	new_spawn.fully_replace_character_name(null,random_unique_name(gender))

/obj/effect/mob_spawn/human/elysium_town/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("Ахмад взывает пробудиться своих соплеменников \the [A.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)
