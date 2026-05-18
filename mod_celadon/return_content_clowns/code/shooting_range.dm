/obj/item/target/clown
	icon_state = "target_c"
	desc = "A shooting target that looks like a useless clown."
	hp = 2000

/obj/item/target/clown/bullet_act(obj/projectile/P)
	. = ..()
	playsound(src.loc, 'sound/items/bikehorn.ogg', 50, TRUE)
