
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

/obj/effect/mob_spawn/human/event_escape_from_prison/guard
	name = "Guard"
	id_job = "Officer"
	icon = 'icons/obj/objects.dmi'
	icon_state = "bed"
	assignedrole = "Officer"
	outfit = /datum/outfit/job/cel/solfed/marine
	important_info = "Это ивентовая роль!"
	short_desc = "Вы один обычный охранник, приставленный откуда-то сверхов к богом забытому руднику, чтобы Вы удерживали тут зэков, полит заключенных, или просто бомжей каких-то!"
	flavour_text = "Солфед вас с силой или вы сами сюда пришли, знаете только вы это. Ваша задача сделать так чтобы ваша жизнь не закончилась в этой тюрьме на посту охраны. Сделайте все возможным чтобы зэки соблюдали дисциплину и продолжали добывать полезные ископаемые во имя Великой и Могущественной Солнечной Федерации!"
	replenish_role = FALSE

/obj/effect/mob_spawn/human/event_escape_from_prison/guard/Destroy()
	new /obj/structure/bed(drop_location())
	return ..()

/obj/effect/mob_spawn/human/event_escape_from_prison/guard/special(mob/living/new_spawn)
	new_spawn.fully_replace_character_name(null,random_unique_name(gender))

/obj/effect/mob_spawn/human/event_escape_from_prison/guard/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("СФ вызывает охранника с именем \the [A.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)
