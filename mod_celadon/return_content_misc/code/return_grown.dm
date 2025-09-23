//Cherry Bombs
/obj/item/seeds/cherry/bomb
	name = "pack of cherry bomb pits"
	desc = "They give you vibes of dread and frustration."
	icon_state = "seed-cherry_bomb"
	species = "cherry_bomb"
	plantname = "Cherry Bomb Tree"
	product = /obj/item/food/grown/cherry_bomb
	mutatelist = list()
	reagents_add = list(/datum/reagent/consumable/nutriment = 0.1, /datum/reagent/consumable/sugar = 0.1, /datum/reagent/gunpowder = 0.7)
	rarity = 60 //See above
	research = PLANT_RESEARCH_TIER_5

/obj/item/food/grown/cherry_bomb
	name = "cherry bombs"
	desc = "You think you can hear the hissing of a tiny fuse."
	icon_state = "cherry_bomb"
	filling_color = rgb(20, 20, 20)
	seed = /obj/item/seeds/cherry/bomb
	bite_consumption_mod = 2
//	volume = 125 //Gives enough room for the gunpowder at max potency
	max_integrity = 40
	wine_power = 80
	wine_flavor = "smokey sweetness and poprocks" //WS edit: new wine flavors

/obj/item/food/grown/cherry_bomb/attack_self(mob/living/user)
	user.visible_message(span_warning("[user] plucks the stem from [src]!"), span_userdanger("You pluck the stem from [src], which begins to hiss loudly!"))
	log_bomber(user, "primed a", src, "for detonation")
	prime()

/obj/item/food/grown/cherry_bomb/deconstruct(disassembled = TRUE)
	if(!disassembled)
		prime()
	if(!QDELETED(src))
		qdel(src)

/obj/item/food/grown/cherry_bomb/ex_act(severity)
	qdel(src) //Ensuring that it's deleted by its own explosion. Also prevents mass chain reaction with piles of cherry bombs

/obj/item/food/grown/cherry_bomb/proc/prime()
	icon_state = "cherry_bomb_lit"
	playsound(src, 'sound/effects/fuse.ogg', seed.potency, FALSE)
	reagents.chem_temp = 1000 //Sets off the gunpowder
	reagents.handle_reactions()
