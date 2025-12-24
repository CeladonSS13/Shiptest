/obj/structure/snowflakes
	name = "снежинки"
	desc = "Выглядят ужасно."
	icon = 'mod_celadon/_storage_icons/icons/obj/ny.dmi'
	icon_state = "snowflakes_1"
	layer = ABOVE_ALL_MOB_LAYER
	anchored = TRUE

/obj/structure/snowflakes/Initialize(mapload)
	. = ..()
	icon_state = "snowflakes_[rand(1, 4)]"

/obj/structure/garland
	name = "гирлянда"
	desc = "Зима близко!"
	anchored = TRUE
	opacity = FALSE
	icon = 'mod_celadon/_storage_icons/icons/obj/ny.dmi'
	icon_state = "garland"
	layer = SIGN_LAYER
	max_integrity = 100
	var/on = FALSE
	var/brightness = 4

/obj/structure/garland/Initialize(mapload)
	. = ..()
	light_color = pick("#ff0000", "#6111ff", "#ffa500", "#44faff")
	update_garland()

/obj/structure/garland/proc/update_garland()
	if(!on)
		icon_state = "garland_on"
		set_light(brightness)
	else
		icon_state = "garland"
		set_light(0)

/obj/structure/garland/attacked_by(obj/item/I, mob/living/user)
	. = ..()
	if(I.tool_behaviour == TOOL_MULTITOOL)
		to_chat(user, span_notice("[on ? "Выключаю" : "Включаю"] гирлянду."))
		update_garland()

/obj/structure/garland/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	to_chat(user, span_notice("Начинаю снимать [src]..."))
	if(do_after(user, 50, target = src))
		var/obj/item/stack/garland_pack/M = new(loc)
		transfer_fingerprints_to(M)
		if(!user.put_in_hands(M, TRUE))
			qdel(M)
			return
		playsound(src, 'sound/items/deconstruct.ogg', 50, TRUE)
		qdel(src)

// MARK: SIGN

// Things at your PLACE
/obj/structure/sign/christmas
	icon = 'mod_celadon/_storage_icons/icons/obj/items.dmi'
	icon_state = "xmastreeballoon"

/obj/structure/sign/christmas/lights
	name = "christmas lights"
	desc = "Flashy."
	icon_state = "xmaslights"
	layer = 4.9

/obj/structure/sign/christmas/wreath
	name = "wreath"
	desc = "Prickly and very festive."
	icon_state = "doorwreath"
	layer = 5

// MARK: PROPS

/obj/structure/sign/christmas/props
	icon = 'mod_celadon/_storage_icons/icons/obj/props.dmi'
	icon_state = "garland_on"

/obj/structure/sign/christmas/props/garland
	name = "festive garland"
	desc = "Very festive lights. How nice."
	icon_state = "garland_on"
	layer = 4.9

/obj/structure/sign/christmas/props/tinsel
	name = "tinsel"
	desc = "There used to be more tinsel."
	icon_state = "tinsel_g"
	layer = 5

/obj/structure/sign/christmas/props/tinsel/red
	name = "red tinsel"
	icon_state = "tinsel_r"

/obj/structure/sign/christmas/props/tinsel/yellow
	name = "yellow tinsel"
	icon_state = "tinsel_y"

/obj/structure/sign/christmas/props/tinsel/white
	name = "white tinsel"
	icon_state = "tinsel_w"

/obj/structure/sign/christmas/props/snowman
	name = "snowman sticker"
	desc = "A cheaply made adhesive sticker, looking like a snowman. At least it doesn't melt."
	icon_state = "snowman_s"

/obj/structure/sign/christmas/props/snowman/hat
	name = "hat snowman sticker"
	desc = "A cheaply made adhesive sticker, looking like a snowman, but wearing a hat. At least it doesn't melt."
	icon_state = "snowman_hat"

/obj/structure/sign/christmas/props/snowflakes
	name = "snowflake stickers"
	desc = "Adhesive stickers, sticking really everywhere and looking like a stylized snowflake. Just like the one you are."
	icon_state = "snowflakes_1"

/obj/structure/sign/christmas/props/snowflakes/alt
	icon_state = "snowflakes_2"

/obj/structure/sign/christmas/props/snowflakes/alt_2
	icon_state = "snowflakes_3"

/obj/structure/sign/christmas/props/snowflakes/alt_3
	icon_state = "snowflakes_4"

/obj/item/toy/xmastree
	name = "miniature Christmas tree"
	desc = "Now with 99% less pine needles."
	icon = 'mod_celadon/_storage_icons/icons/obj/items.dmi'
	icon_state = "tinyxmastree"
	w_class = WEIGHT_CLASS_TINY
	force = 1
	throwforce = 1
	drop_sound = 'mod_celadon/_storage_sounds/sound/items/drop_cardboardbox.ogg'
	pickup_sound = 'mod_celadon/_storage_sounds/sound/items/pickup_cardboardbox.ogg'

/obj/item/toy/balloon/xmastree
	name = "giant christmas tree balloon"
	desc = "Mandatory at inter-generational christmas gatherings and office parties."
	icon = 'mod_celadon/_storage_icons/icons/obj/items.dmi'
	icon_state = "xmastreeballoon"

/obj/item/toy/balloon/candycane
	name = "giant candy cane balloon"
	desc = "Kris Kringle ain't got nothing on this candied confection."
	icon = 'mod_celadon/_storage_icons/icons/obj/items.dmi'
	icon_state = "candycaneballoon"
