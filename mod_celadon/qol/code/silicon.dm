/obj/item/robot_module/Initialize()
	. = ..()
	if(!(/obj/item/extinguisher in basic_modules))
		basic_modules += /obj/item/extinguisher/mini
	if(!(/obj/item/weldingtool in basic_modules))
		basic_modules += /obj/item/weldingtool/mini
	if(!(/obj/item/gps/cyborg in basic_modules))
		basic_modules += /obj/item/gps/cyborg
	for(var/i in basic_modules)
		var/obj/item/I = new i(src)
		basic_modules += I
		basic_modules -= i
	for(var/i in emag_modules)
		var/obj/item/I = new i(src)
		emag_modules += I
		emag_modules -= i

/obj/item/gun/energy/kinetic_accelerator/cyborg
	name = "chassis_mounted kinetic accelerator"
	icon_state = "kineticgun_b"
	holds_charge = TRUE
	unique_frequency = TRUE
	max_mod_capacity = 100
