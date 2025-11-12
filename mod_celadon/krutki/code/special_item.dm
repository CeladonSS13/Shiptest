/obj/item/card/emag/disposable
	name = "одноразовый криптографический секвенсор"
	desc = "Дешевая версия ЕМАГ, которая самоуничтожается после использования."

/obj/item/card/emag/disposable/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(. && proximity)
		to_chat(user, span_warning("[src] начинает дымиться и рассыпается в пепел!"))
		new /obj/effect/decal/cleanable/ash(get_turf(src))
		qdel(src)
