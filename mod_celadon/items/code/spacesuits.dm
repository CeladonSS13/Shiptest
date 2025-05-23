//********************
// 		Spacesuits
//********************
/obj/item/clothing/suit/space/hardsuit/ert/lp/jani
	name = "Loss Prevention Janitorial Hardsuit"
	desc = "The best of the best janitorial staff get assigned to the ERT. Second best are given this Hardsuit as a part of the LP Team."
	armor = list("melee" = 50, "bullet" = 25, "laser" = 20, "energy" = 20, "bomb" = 20, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/lp/jani
	resistance_flags = null
	max_heat_protection_temperature = null
	icon_state = "ert_janitor"
	item_state = "ert_janitor"

/obj/item/clothing/head/helmet/space/hardsuit/ert/lp/jani
	armor = list("melee" = 50, "bullet" = 20, "laser" = 20, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 80)
	name = "Loss Prevention Janitorial Hardsuit Helmet"
	desc = "The helmet that comes attached to the LP Team Janitorial Hardsuit."
	resistance_flags = null
	max_heat_protection_temperature = null
	icon_state = "hardsuit0-ert_janitor"
	item_state = "hardsuit0-ert_janitor"
	hardsuit_type = "ert_janitor"

	//ERT Skybreaker Commander classic
/obj/item/clothing/head/helmet/space/hardsuit/ert/classic
	name = "special forces command helmet"
	desc = "The integrated helmet of a special forces hardsuit, this one has blue highlights."
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/head.dmi'
	icon = 'mod_celadon/_storge_icons/icons/obj/head.dmi'
	icon_state = "hardsuit0-ert_commanderold"
	item_state = "hardsuit1-ert_commanderold"
	hardsuit_type = "ert_commanderold"
	armor = list("melee" = 50, "bullet" = 55, "laser" = 40, "energy" = 50, "bomb" = 35, "bio" = 100, "rad" = 65, "fire" = 50, "acid" = 90)

/obj/item/clothing/suit/space/hardsuit/ert/classic
	name = "special forces command hardsuit"
	desc = "The standard issue hardsuit of the Nanotrasen special forces squad, this one has blue highlights. Provides a really good amount of protection against environmental hazards."
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storge_icons/icons/obj/spacesuits_celadon.dmi'
	icon_state = "ert_commandold"
	item_state = "ert_commandold"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/classic
	armor = list("melee" = 50, "bullet" = 55, "laser" = 40, "energy" = 50, "bomb" = 35, "bio" = 100, "rad" = 65, "fire" = 50, "acid" = 90)
	slowdown = 0.1

	//ERT Skybreaker Security classic
/obj/item/clothing/head/helmet/space/hardsuit/ert/classic/sec
	name = "special forces security helmet"
	desc = "The integrated helmet of a special forces hardsuit, this one has red highlights."
	icon_state = "hardsuit0-ert_securityold"
	item_state = "hardsuit1-ert_securityold"
	hardsuit_type = "ert_securityold"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)

/obj/item/clothing/suit/space/hardsuit/ert/classic/sec
	name = "special forces security hardsuit"
	desc = "The standard issue hardsuit of the Nanotrasen special forces squad, this one has red highlights. Provides a good amount of protection against environmental hazards."
	icon_state = "ert_securityold"
	item_state = "ert_securityold"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/classic/sec
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	slowdown = 0.2

	//ERT Skybreaker Engineer classic
/obj/item/clothing/head/helmet/space/hardsuit/ert/classic/engi
	name = "special forces engineering helmet"
	desc = "The integrated helmet of a special forces hardsuit, this one has orange highlights."
	icon_state = "hardsuit0-ert_engineerold"
	item_state = "hardsuit1-ert_engineerold"
	hardsuit_type = "ert_engineerold"
	armor = list("melee" = 25, "bullet" = 20, "laser" = 50, "energy" = 40, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 50)

/obj/item/clothing/suit/space/hardsuit/ert/classic/engi
	name = "special forces engineering hardsuit"
	desc = "The standard issue hardsuit of the Nanotrasen special forces squad, this one has orange highlights. Provides a good amount of protection against environmental hazards."
	icon_state = "ert_engineerold"
	item_state = "ert_engineerold"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/classic/engi
	armor = list("melee" = 25, "bullet" = 20, "laser" = 50, "energy" = 40, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 50)
	slowdown = 0.2

	//ERT Skybreaker Medical classic
/obj/item/clothing/head/helmet/space/hardsuit/ert/classic/med
	name = "special forces medical helmet"
	desc = "The integrated helmet of a special forces hardsuit, this one has white highlights."
	icon_state = "hardsuit0-ert_medicalold"
	item_state = "hardsuit1-ert_medicalold"
	hardsuit_type = "ert_medicalold"
	armor = list("melee" = 25, "bullet" = 40, "laser" = 30, "energy" = 40, "bomb" = 20, "bio" = 100, "rad" = 65, "fire" = 75, "acid" = 40)

/obj/item/clothing/suit/space/hardsuit/ert/classic/med
	name = "special forces medical hardsuit"
	desc = "The standard issue hardsuit of the Nanotrasen special forces squad, this one has white highlights. Provides a good amount of protection against environmental hazards."
	icon_state = "ert_medicalold"
	item_state = "ert_medicalold"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/classic/med
	armor = list("melee" = 25, "bullet" = 40, "laser" = 30, "energy" = 40, "bomb" = 20, "bio" = 100, "rad" = 65, "fire" = 75, "acid" = 40)

	//ERT Skybreaker Janitor classic
/obj/item/clothing/head/helmet/space/hardsuit/ert/classic/jani
	name = "special forces janitorial helmet"
	desc = "The integrated helmet of a special forces hardsuit, this one has purple highlights."
	icon_state = "hardsuit0-ert_janitorold"
	item_state = "hardsuit1-ert_janitorold"
	hardsuit_type = "ert_janitorold"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 20, "energy" = 30, "bomb" = 20, "bio" = 100, "rad" = 65, "fire" = 50, "acid" = 100)

/obj/item/clothing/suit/space/hardsuit/ert/classic/jani
	name = "special forces janitorial hardsuit"
	desc = "The standard issue hardsuit of the Nanotrasen special forces squad, this one has purple highlights. Provides a good amount of protection against environmental hazards."
	icon_state = "ert_janitorold"
	item_state = "ert_janitorold"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/classic/jani
	armor = list("melee" = 40, "bullet" = 30, "laser" = 20, "energy" = 30, "bomb" = 20, "bio" = 100, "rad" = 65, "fire" = 50, "acid" = 100)
	slowdown = 0.2

//респрайт кэпарморма
/obj/item/clothing/head/helmet/space/hardsuit/swat/captain
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/caparmor_new.dmi'
	icon = 'mod_celadon/_storge_icons/icons/obj/capspacesuit_new.dmi'
	icon_state = "capspacehelmet"
	item_state = "capspacehelmet"

/obj/item/clothing/suit/space/hardsuit/swat/captain
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/caparmor_new.dmi'
	icon = 'mod_celadon/_storge_icons/icons/obj/capspacesuit_new.dmi'
	icon_state = "capspacesuit"
	item_state = "capspacesuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/swat/captain
