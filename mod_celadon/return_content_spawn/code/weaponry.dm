/obj/item/legion_staff
	icon_state = "legion_staff"
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'
	name = "legionnaire staff"
	desc = "The remnants of a legionnaire, reconstructed around a pole of bone. The skulls it produces are loyal to the wielder, seeming to recognize them as their host body."
	icon = 'icons/obj/guns/magic.dmi'
	block_chance = 20
	force = 20
	throwforce = 10
	throw_speed = 4
	attack_verb = list("bit", "gnawed", "chomped")
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_BELT
	hitsound = 'sound/weapons/bite.ogg'
	var/next_use_time

/obj/item/legion_staff/attack_self(mob/user)
	if(next_use_time > world.time)
		user.visible_message(span_warning("[src] rattles in [user]'s hands, but nothing happens..."))
		to_chat(user, span_warning("<b>You need to wait longer to use this again.</b>"))
		return
	user.visible_message(span_warning("[user] raises the [src] and summons a legion skull!"))
	for(var/i in 1 to 3)
		var/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/staff/LegionSkull = new /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/staff(user.loc)
		LegionSkull.faction = user.faction.Copy()
		LegionSkull.friends += user
	next_use_time = world.time + 6 SECONDS
