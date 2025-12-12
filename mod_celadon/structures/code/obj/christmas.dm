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
