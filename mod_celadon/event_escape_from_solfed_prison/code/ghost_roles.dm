
/obj/effect/mob_spawn/human/event_escape_from_prison
	death = FALSE
	roundstart = FALSE
	random = FALSE
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "cryopod"
	// mob_species = /datum/species/human
	/// Whether this role should be replenished when player leaves via cryopod
	var/replenish_role = TRUE
	/// Reference to the cryopod that will handle respawning
	var/datum/weakref/linked_cryopod

/obj/effect/mob_spawn/human/event_escape_from_prison/prisoner
	name = "Prisoner"
	id_job = "Prisoner"
	icon = 'icons/obj/objects.dmi'
	icon_state = "bottom_bunk"
	assignedrole = "Prisoner"
	outfit = /datum/outfit/event_escape_from_prison/prisoner
	important_info = "Это ивентовая роль!"
	short_desc = "Вы один из многих заключенных в этой тюрьме солфеда. Ваша задача, найти способ выбраться из этого места!"
	flavour_text = "Солфед схватили вас, когда вы были на деле, дома, неважно, где бы вы не были, СолФедовцы вас силой забрали на каторги. Пора прекратить этот произвол, и начать думать как выбраться с этого места. Хм, кажется вы слышали от охраны, что есть некий БС коридор"
	replenish_role = FALSE

/obj/effect/mob_spawn/human/event_escape_from_prison/prisoner/Destroy()
	new /obj/structure/bed/event_escape_from_prison/prisoner(drop_location())
	return ..()

/obj/effect/mob_spawn/human/event_escape_from_prison/prisoner/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("Вы просыпаетесь в одиночной камере. Ваше сознание смутно припоминает, то кем вы были раньше, но вы точно помните что вас зовут \the [A.name]. Пора думать над очередным планом побега...", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)

