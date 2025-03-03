/obj/item/clothing/shoes/combat/sneakboots
	name = "sneakboots"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/feet.dmi'
	desc = "These boots have special noise cancelling soles. Perfect for stealth, if it wasn't for the color scheme."
	icon_state = "sneakboots"
	item_state = "sneakboots"
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FIRE_PROOF |  ACID_PROOF

/obj/item/clothing/shoes/combat/sneakboots/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_FEET)
		ADD_TRAIT(user, TRAIT_SILENT_FOOTSTEPS, SHOES_TRAIT)

/obj/item/clothing/shoes/combat/sneakboots/dropped(mob/living/carbon/human/user)
	REMOVE_TRAIT(user, TRAIT_SILENT_FOOTSTEPS, SHOES_TRAIT)
	return ..()

/obj/item/clothing/shoes/galoshes/dry
	name = "absorbent galoshes"
	desc = "A pair of orange rubber boots, designed to prevent slipping on wet surfaces while also drying them."
	icon_state = "galoshes_dry"

/obj/item/clothing/shoes/galoshes/dry/step_action()
	var/turf/open/t_loc = get_turf(src)
	SEND_SIGNAL(t_loc, COMSIG_TURF_MAKE_DRY, TURF_WET_WATER, TRUE, INFINITY)

/obj/item/clothing/shoes/clown_shoes
	desc = "The prankster's standard-issue clowning shoes. Damn, they're huge! Ctrl-click to toggle waddle dampeners."
	name = "clown shoes"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/feet.dmi'
	icon_state = "clown"
	item_state = "clown_shoes"
	slowdown = SHOES_SLOWDOWN+1
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes/clown
	var/enabled_waddle = TRUE
	lace_time = 20 SECONDS // how the hell do these laces even work??

/obj/item/clothing/shoes/clown_shoes/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/effects/clownstep1.ogg'=1,'sound/effects/clownstep2.ogg'=1), 50, falloff_exponent = 20) //die off quick please)

/obj/item/clothing/shoes/clown_shoes/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_FEET)
		if(enabled_waddle)
			user.AddElement(/datum/element/waddling)
		if(user.mind && user.mind.assigned_role == "Clown")
			SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "clownshoes", /datum/mood_event/clownshoes)

/obj/item/clothing/shoes/clown_shoes/dropped(mob/user)
	. = ..()
	user.RemoveElement(/datum/element/waddling)
	if(user.mind && user.mind.assigned_role == "Clown")
		SEND_SIGNAL(user, COMSIG_CLEAR_MOOD_EVENT, "clownshoes")

/obj/item/clothing/shoes/clown_shoes/CtrlClick(mob/living/user)
	if(!isliving(user))
		return
	if(user.get_active_held_item() != src)
		to_chat(user, "<span class='warning'>You must hold the [src] in your hand to do this!</span>")
		return
	if (!enabled_waddle)
		to_chat(user, "<span class='notice'>You switch off the waddle dampeners!</span>")
		enabled_waddle = TRUE
	else
		to_chat(user, "<span class='notice'>You switch on the waddle dampeners!</span>")
		enabled_waddle = FALSE

/obj/item/clothing/shoes/clown_shoes/jester
	name = "jester shoes"
	desc = "A court jester's shoes, updated with modern squeaking technology."
	icon_state = "jester_shoes"

/obj/item/clothing/shoes/cyborg
	name = "cyborg boots"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/feet.dmi'
	desc = "Shoes for a cyborg costume."
	icon_state = "boots"

/obj/item/clothing/shoes/roman
	name = "roman sandals"
	desc = "Sandals with buckled leather straps on it."
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/feet.dmi'
	icon_state = "roman"
	item_state = "roman"
	strip_delay = 100
	equip_delay_other = 100
	permeability_coefficient = 0.9
	can_be_tied = FALSE

/obj/item/clothing/shoes/griffin
	name = "griffon boots"
	desc = "A pair of costume boots fashioned after bird talons."
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/feet.dmi'
	icon_state = "griffinboots"
	item_state = "griffinboots"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	lace_time = 8 SECONDS
	greyscale_icon_state = "boots"

/obj/item/clothing/shoes/bronze
	name = "bronze boots"
	desc = "A giant, clunky pair of shoes crudely made out of bronze. Why would anyone wear these?"
	icon = 'icons/obj/clothing/clockwork_garb.dmi'
	icon_state = "clockwork_treads"
	lace_time = 8 SECONDS
	greyscale_icon_state = "boots"

/obj/item/clothing/shoes/bronze/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/machines/clockcult/integration_cog_install.ogg' = 1, 'sound/magic/clockwork/fellowship_armory.ogg' = 1), 50, extrarange = SHORT_RANGE_SOUND_EXTRARANGE)

/obj/item/clothing/shoes/wheelys
	name = "Wheely-Heels"
	desc = "Uses patented retractable wheel technology. Never sacrifice speed for style - not that this provides much of either." //Thanks Fel
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/feet.dmi'
	icon_state = "wheelys"
	item_state = "wheelys"
	actions_types = list(/datum/action/item_action/wheelys)
	var/wheelToggle = FALSE //False means wheels are not popped out
	var/obj/vehicle/ridden/scooter/wheelys/W

/obj/item/clothing/shoes/wheelys/Initialize()
	. = ..()
	W = new /obj/vehicle/ridden/scooter/wheelys(null)

/obj/item/clothing/shoes/wheelys/ui_action_click(mob/user, action)
	if(!isliving(user))
		return
	if(!istype(user.get_item_by_slot(ITEM_SLOT_FEET), /obj/item/clothing/shoes/wheelys))
		to_chat(user, "<span class='warning'>You must be wearing the wheely-heels to use them!</span>")
		return
	if(!(W.is_occupant(user)))
		wheelToggle = FALSE
	if(wheelToggle)
		W.unbuckle_mob(user)
		wheelToggle = FALSE
		return
	W.forceMove(get_turf(user))
	W.buckle_mob(user)
	wheelToggle = TRUE

/obj/item/clothing/shoes/wheelys/dropped(mob/user)
	if(wheelToggle)
		W.unbuckle_mob(user)
		wheelToggle = FALSE
	..()

/obj/item/clothing/shoes/wheelys/Destroy()
	QDEL_NULL(W)
	. = ..()

/obj/item/clothing/shoes/cookflops
	desc = "All this talk of antags, greytiding, and griefing... I just wanna grill for god's sake!"
	name = "grilling sandals"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/feet.dmi'
	icon_state = "cookflops"
	can_be_tied = FALSE

/obj/item/clothing/shoes/yakuza
	name = "tojo clan shoes"
	desc = "Steel-toed and intimidating."
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/feet.dmi'
	icon_state = "MajimaShoes"
	item_state = "MajimaShoes_worn"

/obj/item/clothing/shoes/jackbros
	name = "frosty boots"
	desc = "For when you're stepping on up to the plate."
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/feet.dmi'
	icon_state = "JackFrostShoes"
	item_state = "JackFrostShoes_worn"























































