/obj/item/lock_buster
	name = "pod lock buster"
	desc = "Destroys a podlock in mere seconds once applied. Waranty void if used."
	icon = 'mod_celadon/_storge_icons/icons/64x64/lock_buster.dmi'
	icon_state = "lock_buster_off"
	var/on = FALSE

/obj/item/lock_buster/attack_self(mob/user as mob)
	on = !on
	if(on)
		icon_state = "lock_buster_on"
	else
		icon_state = "lock_buster_off"
	update_icon(UPDATE_ICON_STATE)
	to_chat(usr, "<span class='notice'>You turn the [src] [on ? "on" : "off"].</span>")
