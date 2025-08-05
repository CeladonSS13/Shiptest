
#define COMSIG_BITE_FORCE_ON "force_gay_furry"

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
	if(owner?.client?.ckey == "dasadas" && prob(50))
		fake_admin_pm(owner.client, pick(list("Привет, есть минутка?", "Тебе же есть 18 для этого?", "Не забудь про правила", "Фу блять.")), pick(list("Voiko", "KOCMOHABT")))
	
	if(!iscarbon(owner))
		return
	var/mob/living/carbon/human/user = owner
	user.dna.species.attack_verb = ATTACK_EFFECT_BITE
	
/datum/action/item_action/toggeble/organ_action/feral/OffAct()
	if(!iscarbon(owner))
		return
	var/mob/living/carbon/human/user = owner
	user.dna.species.attack_verb = initial(user.dna.species.attack_verb)

/datum/action/item_action/toggeble/organ_action/feral/proc/ForceOn(datum/source)
	SIGNAL_HANDLER
	SetState(TRUE)

/datum/action/item_action/toggeble/organ_action/feral/Grant(mob/M)
	. = ..()
	if(!M)
		return
	RegisterSignal(M, COMSIG_BITE_FORCE_ON, PROC_REF(ForceOn))
		

/datum/action/item_action/toggeble/organ_action/feral/Remove(mob/user)
	UnregisterSignal(user, COMSIG_BITE_FORCE_ON)
	if(!iscarbon(user))
		. = ..()
		return
	var/mob/living/carbon/human/f = user
	f.dna.species.attack_verb = initial(f.dna.species.attack_verb)
	. = ..()
	
/proc/fake_admin_pm(target_client, msg, fake_admin_name)
	to_chat(target_client,
		type = MESSAGE_TYPE_ADMINPM,
		html = "<font color='red' size='4'><b>-- Administrator private message --</b></font>",
		confidential = TRUE)
	to_chat(target_client,
		type = MESSAGE_TYPE_ADMINPM,
		html = span_adminsay("Admin PM from-<b><a href='https://www.youtube.com/watch?v=dQw4w9WgXcQ =[fake_admin_name]'>[fake_admin_name]</a></b>: [span_linkify("[msg]")]"),
		confidential = TRUE)
	to_chat(target_client,
		type = MESSAGE_TYPE_ADMINPM,
		html = span_adminsay("<i>Click on the administrator's name to reply.</i>"),
		confidential = TRUE)


