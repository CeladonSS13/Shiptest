/obj/mecha/combat/tanklp
	name = "\improper Armored Combat Vehicle \"Tank\""
	desc = "What the? Where the hell did that tank come from?!? "

	icon = 'mod_celadon/_storge_icons/icons/mecha/mecha_96x96.dmi'
	icon_state = "red"

	stepsound = 'sound/mecha/mechstep.ogg'
	turnsound = 'sound/mecha/mechturn.ogg'

	armor = list("melee" = 40, "bullet" = 20, "laser" = 10, "energy" = 20, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)

	wreckage = /obj/structure/mecha_wreckage/tank
	max_equip = 1
	exit_delay = 40
	step_in = 5
	dir_in = 1 //Facing North.
	max_integrity = 200
	pixel_x = -32
	pixel_y = -32
// Modular red tank without equipment //
