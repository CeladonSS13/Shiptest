// Респрайты от roisi165. Спасибо ему за эти классные спрайты.
// Коротко про спрайты:
// mass produced (_m) - оффовские спрайты пушек КЛИПов. Спасибо им за спрайты! UPD: Я их убил, т.к. по заверениям других такие себе + слишком много спрайтов 1 файле будут.
// navy ( ) - голубые миллитари спрайты под цвета солфедов.
// ceremonial (_c) - деревянные версии пушек с мелкой "позолотой"

// Дополняем код пулеметов ради поддержки скинов
/obj/item/gun/ballistic/automatic/hmg/update_icon_state()
	. = ..()
	if(current_skin)
		item_state = "[unique_reskin[current_skin]][bipod_deployed ? "_deployed" : ""]"
	else
		item_state = "[initial(item_state)][bipod_deployed ? "_deployed" : ""]"

/obj/item/gun/ballistic/automatic/hmg/update_overlays()
	. = ..()
	if(has_bipod)
		if(current_skin)
			. += "[unique_reskin[current_skin]][bipod_deployed ? "_deployed" : "_undeployed"]"
		else
			. += "[base_icon_state || initial(icon_state)][bipod_deployed ? "_deployed" : "_undeployed"]"


//########### PISTOLS ###########//
/obj/item/gun/ballistic/automatic/pistol/cm23 // Единственный без рескинов
	name = "\improper CM-23"
	desc = "Solar Federation's standard service pistol. 10 rounds of 10mm ammunition make the CM-23 deadlier than many other service pistols, but its weight and bulk have made it unpopular as a sidearm. It has largely been phased out everywhere, but \"civilised\" space, where officiality may reign. Chambered in 10mm."
	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_onmob.dmi'
	icon_state = "cm23"
	item_state = "clip_generic"

	manufacturer = MANUFACTURER_SOLARARMORIES

/obj/item/gun/ballistic/automatic/pistol/cm70
	name = "CM-70 machine pistol"
	desc = "A compact machine pistol designed to rapidly fire 3-round bursts. Popular with officers and certain special units, the CM-70 is incredibly dangerous at close range. Chambered in 9mm."
	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_onmob.dmi'
	icon_state = "cm70"
	item_state = "clip_generic"

	manufacturer = MANUFACTURER_SOLARARMORIES

/obj/item/gun/ballistic/automatic/pistol/cm357
	name = "\improper CM-357"
	desc = "This powerful semi-automatic handgun was designed after it was realised that space was too dangerous in the form of megafauna, and that standard handguns were ineffective as backup weapons. The weapon's heft and power have made it a status symbol among the few Solarian officers able to requisition one. Chambered in .357."
	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_onmob.dmi'

	icon_state = "cm357"
	item_state = "clip_generic"

	manufacturer = MANUFACTURER_SOLARARMORIES

//########### SMGS ###########//
/obj/item/gun/ballistic/automatic/smg/cm5
	name = "\improper CM-5"
	desc = "SolFed's standard-issue submachine gun. Well-liked for its accuracy, stability, and ease of use compared to other submachineguns. Chambered in 9mm."
	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_onmob.dmi'

	icon_state = "cm5"
	item_state = "cm5"
	unique_reskin = list(\
		//"Mass Produced" = "cm5_m",
		"Navy" = "cm5",
		"Ceremonial" = "cm5_c"
		)
	unique_reskin_changes_inhand = TRUE

	manufacturer = MANUFACTURER_SOLARARMORIES

/obj/item/gun/ballistic/automatic/smg/cm5/compact
	name = "\improper CM-5c"
	desc = "A modification of the CM-5 featuring a dramatically shortened barrel and removed stock. Designed for covert operatives to maximize portability without sacrificing firepower, though accuracy at range is abysmal at best. Chambered in 9mm."
	icon_state = "cm5c"
	item_state = "cm5c"
	unique_reskin = list(\
		//"Mass Produced" = "cm5c_m",
		"Navy" = "cm5c",
		"Ceremonial" = "cm5c_c"
		)
	unique_reskin_changes_inhand = TRUE

//########### MARKSMAN ###########//
/obj/item/gun/ballistic/automatic/marksman/f4
	name = "CM-F4"
	desc = "SolFed's marksman rifle, used by both military and law enforcement units. Designed not long after the CM-24, the venerable F4 has adapted well to continued upgrades. Chambered in .308."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_onmob.dmi'

	icon_state = "f4"
	item_state = "f4"
	unique_reskin = list(\
		//"Mass Produced" = "cm70_m",
		"Navy" = "f4",
		"Ceremonial" = "f4_c"
		)
	unique_reskin_changes_inhand = TRUE

	manufacturer = MANUFACTURER_SOLARARMORIES

/obj/item/gun/ballistic/automatic/marksman/f4/indie
	name = "\improper F3"
	desc = "An old model of Solarian F4 rifle, designed very early into the history of the humanity. Most have been sold off as surplus by this point and tend to suffer from internal wear due to their age. Chambered in .308."
	unique_reskin = null // Фикс возможности их рескинить по альт-клику
	unique_reskin_changes_inhand = FALSE

/obj/item/gun/ballistic/automatic/marksman/f4/inteq
	unique_reskin = null // Фикс возможности их рескинить по альт-клику

/obj/item/gun/ballistic/automatic/marksman/f90
	name = "CM-F90"
	desc = "A powerful sniper rifle used by vanishingly rare sniper specialists, capable of impressive range and penetrating power. Chambered in 6.5x57mm."
	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_onmob.dmi'

	icon_state = "f90"
	item_state = "f90"
	unique_reskin = list(\
		//"Mass Produced" = "f90_m",
		"Navy" = "f90",
		"Ceremonial" = "f90_c"
		)
	unique_reskin_changes_inhand = TRUE

	manufacturer = MANUFACTURER_SOLARARMORIES

/obj/item/gun/ballistic/automatic/marksman/f90/inteq
	unique_reskin = null // Фикс возможности их рескинить по альт-клику

//########### RIFLES ###########//
/obj/item/gun/ballistic/automatic/assault/cm82
	name = "\improper CM-82"
	desc = "Solar Federation's most standard assault rifle, a \"relatively\" new service weapon. Accurate, reliable, and easy to use, the CM-82 replaced the CM-24 as SolFed's assault rifle almost overnight, and has proven immensely popular since. Chambered in 5.56x40mm."
	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_onmob.dmi'

	icon_state = "cm82"
	item_state = "cm82"
	unique_reskin = list(\
		//"Mass Produced" = "cm82_m",
		"Navy" = "cm82",
		"Ceremonial" = "cm82_c"
		)
	unique_reskin_changes_inhand = TRUE

	manufacturer = MANUFACTURER_SOLARARMORIES

/obj/item/gun/ballistic/automatic/assault/skm
	desc = "An obsolete model of assault rifle once used by a humanity. Legendary for its durability and low cost, surplus rifles are commonplace on the Frontier, and the design has been widely copied. Chambered in 7.62x40mm."

/obj/item/gun/ballistic/automatic/assault/skm/cm24
	name = "\improper CM-24"
	desc = "An obsolete and very rugged assault rifle with a heavy projectile and slow action for its class. Once standard assault rifle of entire humanity, produced in phenomenal numbers for the \"mostly unknown reasons\", if rare, battle rifle. Chambered in 7.62x40mm."
	// Не имеет уникального спрайта
	icon = 'icons/obj/guns/manufacturer/frontier_import/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/frontier_import/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/frontier_import/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/frontier_import/onmob.dmi'
	icon_state = "skm"
	item_state = "skm"

	manufacturer = MANUFACTURER_NONE

//########### MACHINEGUN ###########//
/obj/item/gun/ballistic/automatic/hmg/cm40
	name = "\improper CM-40"
	desc = "A light machine gun used by SolFed's heavy weapons teams, capable of withering suppressive fire. The weight and recoil make it nearly impossible to use without deploying the bipod against appropriate cover, such as a table, or bracing against solid cover. Chambered in 7.62x40mm."
	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_onmob.dmi'
	base_icon_state = "cm40"
	icon_state = "cm40"
	item_state = "cm40"
	unique_reskin = list(\
		//"Mass Produced" = "cm40_m",
		"Navy" = "cm40",
		"Ceremonial" = "cm40_c"
		)
	unique_reskin_changes_inhand = TRUE

	manufacturer = MANUFACTURER_SOLARARMORIES

//########### MISC ###########//

/obj/item/gun/ballistic/shotgun/cm15
	name = "\improper CM-15"
	desc = "A large automatic shotgun used by Solar Federation. It is generally employed by law enforcement and breaching specialists, and is sometimes used with incendiary ammunition, if the rules are stretched \"differently\". Chambered in 12 gauge."
	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_guns/clip_onmob.dmi'

	icon_state = "cm15"
	item_state = "cm15"
	unique_reskin = list(\
		//"Mass Produced" = "cm15_m",
		"Navy" = "cm15",
		"Ceremonial" = "cm15_c"
		)
	unique_reskin_changes_inhand = TRUE

	manufacturer = MANUFACTURER_SOLARARMORIES
