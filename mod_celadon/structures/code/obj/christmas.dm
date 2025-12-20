// MARK: ITEM
/obj/item/stack/garland_pack
	name = "упаковка с гирляндами"
	singular_name = "упаковка с гирляндой"
	desc = "Похоже, пришло время вешать это на стены."
	icon = 'mod_celadon/_storage_icons/icons/obj/ny.dmi'
	icon_state = "garland_pack"
	merge_type = /obj/item/stack/garland_pack
	max_amount = 50
	novariants = TRUE

/obj/item/stack/garland_pack/fifty
	amount = 50

/obj/item/stack/garland_pack/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(isclosedturf(target) && proximity)
		user.changeNext_move(1)
		var/turf/closed/T = target
		if(locate(/obj/structure/garland) in T)
			to_chat(user, span_warning("Здесь уже есть гирлянда!"))
			return
		if(use(1))
			user.visible_message(span_notice("[user] вешает [src] на [T].") , \
								span_notice("Вешаю гирлянду на [T]."))
			playsound(T, 'sound/items/deconstruct.ogg', 50, TRUE)
			var/obj/structure/garland/S = new(T)
			transfer_fingerprints_to(S)

/obj/structure/streetdecor
	icon = 'mod_celadon/_storage_icons/icons/structures/obj/new_year/32x64icons.dmi'

/obj/structure/streetdecor/lamp
	name = "lamp pole"
	desc = "A metal pole with latern. Very effective at lighting up the cold streets on a breezy night."
	icon_state = "lamp_post"
	layer = 4
	density = TRUE
	anchored = TRUE
	light_power = 1.4
	light_range = 15
	light_color = "#ffffdd"
	max_integrity = 9999999

/obj/structure/streetdecor/lamp/festive
	name = "festive lamp pole"
	desc = "A metal pole with latern and christmas decorations. Very effective at warming up the spirits of people."
	icon_state = "lamp_post_festive"
	layer = 4
	density = TRUE
	anchored = TRUE
	light_power = 1.6
	light_range = 15
	light_color = "#ffffdd"
	max_integrity = 9999999

/obj/structure/streetdecor/lamp/wreathpole
	name = "wreath pole"
	desc = "A metal pole with a fancy wreath."
	icon_state = "wreath_post"
	layer = 4
	density = TRUE
	anchored = TRUE

/obj/structure/streetdecor/bigtree
	name = "Big festive tree"
	desc = "Big tree. Big heck. Big festive cheer!"
	layer = 4
	density = TRUE
	anchored = TRUE
	light_power = 2
	light_range = 30
	light_color = "#ffeeab"
	icon = 'mod_celadon/_storage_icons/icons/structures/obj/new_year/bigtree.dmi'
	icon_state = "bigtree"
	max_integrity = 9999999
