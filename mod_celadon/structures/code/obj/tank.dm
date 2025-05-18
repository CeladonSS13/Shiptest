/obj/mecha/combat/combat_tank/tank1984
	name = "\improper Armored Combat Vehicle \"Tank\""

	icon = 'mod_celadon/_storge_icons/icons/mecha/mecha_114x59.dmi'
	icon_state = "jotun"

	stepsound = 'sound/mecha/mechstep.ogg'
	turnsound = 'sound/mecha/mechturn.ogg'

	armor = list("melee" = 90, "bullet" = 85, "laser" = 55, "energy" = 45, "bomb" = 50, "bio" = 100, "rad" = 60, "fire" = 100, "acid" = 100)

	wreckage = /obj/structure/mecha_wreckage/tank
	exit_delay = 40
	step_in = 5
	dir_in = 1 //Facing North.
	max_integrity = 1600
	pixel_x = -32
	pixel_y = -32
