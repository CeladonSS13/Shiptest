/obj/item/card/emag/disposable
	name = "одноразовый криптографический секвенсор"
	desc = "Дешевая версия ЕМАГ, которая самоуничтожается после использования."

/obj/item/card/emag/disposable/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(. && proximity)
		to_chat(user, span_warning("[src] начинает дымиться и рассыпается в пепел!"))
		new /obj/effect/decal/cleanable/ash(get_turf(src))
		qdel(src)

/obj/item/admin_banhammer

/obj/item/kick_hammer
	name = "молоточек изгнания"
	desc = "Странный молоточек, который может выгнать кого-то с сервера. Используйте с осторожностью!"
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "toyhammer"
	force = 0

obj/item/kick_hammer/attack(mob/living/target, mob/living/user)
	if(!isliving(target))
		return
	if(target.client)
		visible_message(span_danger("[user] ударяет [target] [src]!"))
		to_chat(target, span_userdanger("Вас выгоняют с сервера!"))
		qdel(target.client)
		qdel(src)
