/obj/effect/proc_holder/spell/aimed/finger_guns
	name = "Finger Guns"
	desc = "Shoot a mimed bullet from your fingers that stuns and does some damage."
	school = "mime"
	panel = "Mime"
	charge_max = 300
	clothes_req = FALSE
	antimagic_allowed = TRUE
	invocation_type = INVOCATION_EMOTE
	invocation_emote_self = "<span class='dangers'>You fire your finger gun!</span>"
	range = 20
	projectile_type = /obj/projectile/bullet/mime
	projectile_amount = 3
	sound = null
	active_msg = "You draw your fingers!"
	deactive_msg = "You put your fingers at ease. Another time."
	active = FALSE

	action_icon = 'icons/mob/actions/actions_mime.dmi'
	action_icon_state = "finger_guns0"
	action_background_icon_state = "bg_mime"
	base_icon_state = "finger_guns"


/obj/effect/proc_holder/spell/aimed/finger_guns/Click()
	var/mob/living/carbon/human/owner = usr
	if(owner.incapacitated())
		to_chat(owner, "<span class='warning'>You can't properly point your fingers while incapacitated.</span>")
		return
	if(usr && usr.mind)
		if(!usr.mind.miming)
			to_chat(usr, "<span class='warning'>You must dedicate yourself to silence first!</span>")
			return
		invocation = "<B>[usr.real_name]</B> fires [usr.p_their()] finger gun!"
	else
		invocation_type ="none"
	..()

/obj/effect/proc_holder/spell/aimed/finger_guns/InterceptClickOn(mob/living/caller, params, atom/target)
	if(caller.incapacitated())
		to_chat(caller, "<span class='warning'>You can't properly point your fingers while incapacitated.</span>")
		if(charge_type == "recharge")
			var/refund_percent = current_amount/projectile_amount
			charge_counter = charge_max * refund_percent
			start_recharge()
		remove_ranged_ability()
		on_deactivation(caller)
	..()

/obj/item/book/granter/spell/mimery_guns
	spell = /obj/effect/proc_holder/spell/aimed/finger_guns
	spellname = "Finger Guns"
	name = "Guide to Advanced Mimery Vol 2"
	desc = "There aren't any words written..."
	icon_state ="bookmime"
	remarks = list("...")

/obj/item/book/granter/spell/mimery_guns/attack_self(mob/user)
	. = ..()
	if(!.)
		return
	if(!locate(/obj/effect/proc_holder/spell/targeted/mime/speak) in user.mind.spell_list)
		user.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/mime/speak)
