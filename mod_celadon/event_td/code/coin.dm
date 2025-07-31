/obj/item/coin/day_s
	name = "day 'S' coin"
	desc = "Стороны монетки напоминают вам одну историю о том, что в мире существуют цели, важнее даже собственной жизни."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/coin.dmi'
	icon_state = "coin_valid"
	sideslist = list("valid", "salad")
	material_flags = NONE

/obj/item/coin/day_s/attack_self(mob/user)
	if(cooldown < world.time)
		if(string_attached) 	//does the coin have a wire attached
			to_chat(user, span_warning("Монета не будет хорошо подбрасываться, если к ней что-то прикреплено!"))
			return FALSE	//do not flip the coin
		cooldown = world.time + 15
		flick("coin_[coinflip]_flip", src)
		coinflip = pick(sideslist)
		icon_state = "coin_[coinflip]"
		playsound(user.loc, 'sound/items/coinflip.ogg', 50, TRUE)
		var/oldloc = loc
		sleep(15)
		if(loc == oldloc && user && !user.incapacitated())
			if(coinflip == "salad")
				user.visible_message(
					span_notice("[user] подкидывает монетку в воздухе. Она приземляется, после чего на ней виднеется буква 'S'. <b>Защита любой ценой!</b>"), \
					span_notice("Вы подкидываете монетку в воздухе. Она приземляется, после чего на ней виднеется буква 'S'. <b>Защита любой ценой!</b>"), \
					span_hear("Вы слышите звук падения мелочи."))
			else
				user.visible_message(
					span_notice("[user] подкидывает монетку в воздухе. Она приземляется, после чего на ней виднеется буква 'M'. <b>Атака без учёта потерь!</b>"), \
					span_notice("Вы подкидываете монетку в воздухе. Она приземляется, после чего на ней виднеется буква 'M'. <b>Атака без учёта потерь!</b>"), \
					span_hear("Вы слышите звук падения мелочи."))
	return TRUE		//did the coin flip?

/obj/structure/reagent_dispensers/uranium
	name = "Enriched uranium"
	desc = "The Separatists of Elysium managed to steal a couple of activated uranium vaults from the Solar Federation, triggering Operation Sandstorm"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/uranium_storage.dmi'
	icon_state = "nuclear"
	density = TRUE
	anchored = FALSE
	pressure_resistance = 2*ONE_ATMOSPHERE
	max_integrity = 100000000000
	tank_volume = 0
