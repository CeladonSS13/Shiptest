/obj/item/robot_module/syndicate_medical/rebuild_modules()
	..()
	var/mob/living/silicon/robot/Syndi = loc
	Syndi.faction -= "silicon" //ai turrets

/obj/item/robot_module/syndicate_medical/remove_module(obj/item/I, delete_after)
	..()
	var/mob/living/silicon/robot/Syndi = loc
	Syndi.faction += "silicon" //ai is your bff now!
