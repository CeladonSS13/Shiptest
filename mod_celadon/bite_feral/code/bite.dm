//Я забыл как добавлять просто к родительской залупе
/obj/item/organ/tongue/tajara
	actions_types = list(/datum/action/item_action/toggeble/organ_action/feral)

/obj/item/organ/tongue/riol
	actions_types = list(/datum/action/item_action/toggeble/organ_action/feral)

/datum/action/item_action/toggeble/organ_action/feral
	name = "Кусаться"
	icon_icon = 'mod_celadon/_storge_icons/icons/actions/actions.dmi'
	button_icon_state = "feral_mode_off"
	icon_state_on = "feral_mode_on"

/datum/action/item_action/toggeble/organ_action/feral/OnAct()
	if(!iscarbon(owner))
		return
		
	var/mob/living/carbon/human/user = owner
	user.dna.species.attack_verb = ATTACK_EFFECT_BITE
	
/datum/action/item_action/toggeble/organ_action/feral/OffAct()
	if(!iscarbon(owner))
		return
	var/mob/living/carbon/human/user = owner
	user.dna.species.attack_verb = initial(user.dna.species.attack_verb)

/datum/action/item_action/toggeble/organ_action/feral/Grant(mob/M)
	. = ..()
	if(!M)
		return
		

/datum/action/item_action/toggeble/organ_action/feral/Remove(mob/user)
	if(!iscarbon(user))
		. = ..()
		return
	var/mob/living/carbon/human/f = user
	f.dna.species.attack_verb = initial(f.dna.species.attack_verb)
	. = ..()
	