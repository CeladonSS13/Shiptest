/obj/item/upgradescroll
	name = "item fortification scroll"
	desc = "Somehow, this piece of paper can be applied to items to make them \"better\". Apparently there's a risk of losing the item if it's already \"too good\". <i>This all feels so arbitrary...</i>"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "scroll"
	w_class = WEIGHT_CLASS_TINY

	var/upgrade_amount = 1
	var/can_backfire = TRUE
	var/uses = 1

/obj/item/upgradescroll/afterattack(obj/item/target, mob/user , proximity)
	. = ..()
	if(!proximity || !istype(target))
		return

	target.AddComponent(/datum/component/fantasy, upgrade_amount, null, null, can_backfire, TRUE)

	if(--uses <= 0)
		qdel(src)

/obj/item/upgradescroll/unlimited
	name = "unlimited foolproof item fortification scroll"
	desc = "Somehow, this piece of paper can be applied to items to make them \"better\". This scroll is made from the tongues of dead paper wizards, and can be used an unlimited number of times, with no drawbacks."
	uses = INFINITY
	can_backfire = FALSE
