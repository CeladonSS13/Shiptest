/obj/machinery/rnd/production/techfab/department
	icon = 'mod_celadon/_storge_icons/icons/machinery/research.dmi'
	icon_state = "techfab"

/obj/machinery/rnd/production/protolathe/department
	icon = 'mod_celadon/_storge_icons/icons/machinery/research.dmi'
	icon_state = "protolathe"

/obj/machinery/rnd/production/proc/add_department_stripe(obj/machinery/rnd/production/M, list/overlays)
    if(M.department_tag)
        var/stripe_icon = "techfab_stripe_[lowertext(M.department_tag)]"
        var/mutable_appearance/stripe_overlay = mutable_appearance('mod_celadon/_storge_icons/icons/machinery/research.dmi', stripe_icon)
        overlays += stripe_overlay

/obj/machinery/rnd/production/update_overlays()
    . = ..()
    add_department_stripe(src, .)
    return .
