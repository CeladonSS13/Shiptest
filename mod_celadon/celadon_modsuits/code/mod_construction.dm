/obj/item/mod/construction/plating
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_construction.dmi'

/obj/item/mod/construction/plating/locked
	desc = "Внешнее покрытие, используемое для создания боевых МОДсьютов. Требует детали из RnD для завершения."
	var/prebuilt = FALSE
	var/can_be_removed = TRUE
	var/finished = FALSE

/obj/item/mod/construction/plating/locked/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/millitary_locked_module, list(/obj/item/millitary_tech/mod_armor_components), prebuilt, can_be_removed, PROC_REF(on_core_inserted),PROC_REF(core_remove_callback))

/obj/item/mod/construction/plating/locked/proc/on_core_inserted()
	finished = TRUE

/obj/item/mod/construction/plating/locked/proc/core_remove_callback()
	finished = FALSE
/*
/obj/item/mod/construction/plating/locked/proc/get_milltech()
	var/datum/component/millitary_locked_module/mill_tech = GetComponent(/datum/component/millitary_locked_module)
	return mill_tech.milltech
*/
/obj/item/mod/construction/plating/locked/syndicate
	theme = /datum/mod_theme/syndicate

/obj/item/mod/construction/plating/locked/syndicate/elite
	theme = /datum/mod_theme/elite

/obj/item/mod/construction/plating/locked/inteq
	theme = /datum/mod_theme/inteq

/obj/item/mod/construction/plating/locked/inteq/elite
	theme = /datum/mod_theme/inteq/elite

/obj/item/mod/construction/plating/locked/safeguard
	theme = /datum/mod_theme/safeguard

/obj/item/mod/construction/plating/locked/responsory
	theme = /datum/mod_theme/responsory

/obj/item/mod/construction/plating/locked/falke
	theme = /datum/mod_theme/falke

/obj/item/mod/construction/plating/locked/storch
	theme = /datum/mod_theme/storch
