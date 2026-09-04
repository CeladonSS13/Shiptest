//********************
// 		Spacesuits
//********************

//MARK: NT
//LP
/obj/item/clothing/suit/space/hardsuit/ert/lp
	name = "Loss Prevention Lieutenant Hardsuit"
	desc = "The middlemanagement of the ERT world, the Lieutenant of the LP team is given this slightly downgraded version of the ERT Commander hardsuit."
	armor = list("melee" = 50, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 60, "fire" = 50, "acid" = 80)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/lp
	resistance_flags = null
	max_heat_protection_temperature = null
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION

/obj/item/clothing/head/helmet/space/hardsuit/ert/lp
	armor = list("melee" = 50, "bullet" = 40, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 60, "fire" = 50, "acid" = 80)
	name = "Loss Prevention Lieutenant Hardsuit Helmet"
	desc = "The helmet that comes attached to the LP Team Lieutenant Hardsuit."
	resistance_flags = null
	max_heat_protection_temperature = null

/obj/item/clothing/suit/space/hardsuit/ert/lp/jani
	name = "Loss Prevention Janitorial Hardsuit"
	desc = "The best of the best janitorial staff get assigned to the ERT. Second best are given this Hardsuit as a part of the LP Team."
	armor = list("melee" = 50, "bullet" = 25, "laser" = 20, "energy" = 20, "bomb" = 20, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90, "wound" = 20)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/lp/jani
	resistance_flags = null
	max_heat_protection_temperature = null
	icon_state = "ert_janitor"
	item_state = "ert_janitor"

/obj/item/clothing/head/helmet/space/hardsuit/ert/lp/jani
	name = "Loss Prevention Janitorial Hardsuit Helmet"
	desc = "The helmet that comes attached to the LP Team Janitorial Hardsuit."
	resistance_flags = null
	max_heat_protection_temperature = null
	icon_state = "hardsuit0-ert_janitor"
	item_state = "hardsuit0-ert_janitor"
	hardsuit_type = "ert_janitor"
	armor = list("melee" = 50, "bullet" = 20, "laser" = 20, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 80, "wound" = 20)

/obj/item/clothing/suit/space/hardsuit/ert/lp/sec
	armor = list("melee" = 40, "bullet" = 40, "laser" = 20, "energy" = 20, "bomb" = 20, "bio" = 100, "rad" = 50, "fire" = 40, "acid" = 40)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/lp/sec
	name = "Loss Prevention Security Hardsuit"
	desc = "The best of the best security staff get assigned to the ERT. Second best are given this Hardsuit as a part of the LP Team."
	icon_state = "ert_security"
	item_state = "ert_security"

/obj/item/clothing/head/helmet/space/hardsuit/ert/lp/sec
	armor = list("melee" = 40, "bullet" = 40, "laser" = 20,"energy" = 20, "bomb" = 20, "bio" = 100, "rad" = 50, "fire" = 40, "acid" = 40)
	hardsuit_type = "ert_security"
	name = "Loss Prevention Security Hardsuit Helmet"
	desc = "The helmet that comes attached to the LP Team Security Hardsuit."
	icon_state = "hardsuit0-ert_security"
	item_state = "hardsuit0-ert_security"

/obj/item/clothing/suit/space/hardsuit/ert/lp/engi
	armor = list("melee" = 30, "bullet" = 20, "laser" = 30, "energy" = 30, "bomb" = 25, "bio" = 100, "rad" = 75, "fire" = 90, "acid" = 75)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/lp/engi
	name = "Loss Prevention Engineering Hardsuit"
	desc = "The best of the best engineering staff get assigned to the ERT. Second best are given this Hardsuit as a part of the LP Team."
	icon_state = "ert_engineer"
	item_state = "ert_engineer"

/obj/item/clothing/head/helmet/space/hardsuit/ert/lp/engi
	armor = list("melee" = 38, "bullet" = 20, "laser" = 30, "energy" = 30, "bomb" = 25, "bio" = 100, "rad" = 75, "fire" = 90, "acid" = 75)
	name = "Loss Prevention Engineering Hardsuit Helmet"
	desc = "The helmet that comes attached to the LP Team Engineering Hardsuit."
	icon_state = "hardsuit0-ert_engineer"
	item_state = "hardsuit0-ert_engineer"
	hardsuit_type = "ert_engineer"

/obj/item/clothing/suit/space/hardsuit/ert/lp/med
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/lp/med
	name = "Loss Prevention Medical Hardsuit"
	desc = "The best of the best medical staff get assigned to the ERT. Second best are given this Hardsuit as a part of the LP Team."
	icon_state = "ert_medical"
	item_state = "ert_medical"
	slowdown = 0.5

/obj/item/clothing/head/helmet/space/hardsuit/ert/lp/med
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60)
	name = "Loss Prevention Medical Hardsuit Helmet"
	desc = "The helmet that comes attached to the LP Team Medical Hardsuit."
	icon_state = "hardsuit0-ert_medical"
	item_state = "hardsuit0-ert_medical"
	hardsuit_type = "ert_medical"
	clothing_flags = SCAN_REAGENTS | STOPSPRESSUREDAMAGE | THICKMATERIAL | SNUG_FIT | BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS

/obj/item/clothing/head/helmet/space/hardsuit/lp
	name = "RIG heatsuit helmet"
	desc = "The helmet to the RIG heat suit. It's packed with heat diverting materials, coolant pipes, and a two inch thick face screen."
	armor = list("melee" = 5, "bullet" = 5, "laser" = 1, "energy" = 1, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 75)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = ACID_PROOF | FIRE_PROOF

/obj/item/clothing/suit/space/hardsuit/ancient/lp
	name = "RIG heat suit"
	desc = "A fully heat-resistant suit based on an early RIG hardsuit prototype. It sacrifices armor of any kind for intricate heatsinks. It remains rather bulky as a result."
	armor = list("melee" = 5, "bullet" = 5, "laser" = 1, "energy" = 1, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 75)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/lp
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = ACID_PROOF | FIRE_PROOF

	//ERT Skybreaker Commander classic
/obj/item/clothing/head/helmet/space/hardsuit/ert/classic //are they really classic at this point?
	name = "special forces command helmet"
	desc = "The integrated helmet of a special forces hardsuit, this one has blue highlights."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-spec_command"
	item_state = "hardsuit1-spec_command"
	hardsuit_type = "spec_command"
	armor = list("melee" = 50, "bullet" = 55, "laser" = 40, "energy" = 50, "bomb" = 35, "bio" = 100, "rad" = 65, "fire" = 50, "acid" = 90, "wound" = 20)

/obj/item/clothing/suit/space/hardsuit/ert/classic
	name = "special forces command hardsuit"
	desc = "A superb combat hardsuit produced by Vigilitas Interstellar and issued only to high-ranking assault squads associated with Nanotrasen. This one has blue highlights and provides excellent protection against most common threats."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/spacesuits_celadon.dmi'
	icon_state = "spec_command"
	item_state = "spec_command"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/classic
	armor = list("melee" = 50, "bullet" = 55, "laser" = 40, "energy" = 50, "bomb" = 35, "bio" = 100, "rad" = 65, "fire" = 50, "acid" = 90, "wound" = 20)
	slowdown = 0.1

	//ERT Skybreaker Security classic
/obj/item/clothing/head/helmet/space/hardsuit/ert/classic/sec
	name = "special forces operative helmet"
	desc = "The integrated helmet of a special forces hardsuit, this one has red highlights."
	icon_state = "hardsuit0-spec_security"
	item_state = "hardsuit1-spec_security"
	hardsuit_type = "spec_security"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90, "wound" = 20)

/obj/item/clothing/suit/space/hardsuit/ert/classic/sec
	name = "special forces security hardsuit"
	desc = "A superb combat hardsuit produced by Vigilitas Interstellar and issued only to high-ranking assault squads associated with Nanotrasen. This one has red highlights and provides decent protection against most common threats."
	icon_state = "spec_security"
	item_state = "spec_security"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/classic/sec
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90, "wound" = 20)
	slowdown = 0.2

	//ERT Skybreaker Engineer classic
/obj/item/clothing/head/helmet/space/hardsuit/ert/classic/engi
	name = "special forces engineering helmet"
	desc = "The integrated helmet of a special forces hardsuit, this one has yellow highlights."
	icon_state = "hardsuit0-spec_engineer"
	item_state = "hardsuit1-spec_engineer"
	hardsuit_type = "spec_engineer"
	armor = list("melee" = 25, "bullet" = 20, "laser" = 50, "energy" = 40, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 50, "wound" = 20)

/obj/item/clothing/suit/space/hardsuit/ert/classic/engi
	name = "special forces engineering hardsuit"
	desc = "A superb combat hardsuit produced by Vigilitas Interstellar and issued only to high-ranking assault squads associated with Nanotrasen. This one has yellow highlights and provides excellent protection against burn-related injuries."
	icon_state = "spec_engineer"
	item_state = "spec_engineer"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/classic/engi
	armor = list("melee" = 25, "bullet" = 20, "laser" = 50, "energy" = 40, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 50, "wound" = 20)
	slowdown = 0.2

	//ERT Skybreaker Medical classic
/obj/item/clothing/head/helmet/space/hardsuit/ert/classic/med
	name = "special forces medical helmet"
	desc = "The integrated helmet of a special forces hardsuit, this one has white highlights."
	icon_state = "hardsuit0-spec_medical"
	item_state = "hardsuit1-spec_medical"
	hardsuit_type = "spec_medical"
	armor = list("melee" = 25, "bullet" = 40, "laser" = 30, "energy" = 40, "bomb" = 20, "bio" = 100, "rad" = 65, "fire" = 75, "acid" = 40, "wound" = 20)

/obj/item/clothing/suit/space/hardsuit/ert/classic/med
	name = "special forces medical hardsuit"
	desc = "A superb combat hardsuit produced by Vigilitas Interstellar and issued only to high-ranking assault squads associated with Nanotrasen. This one has white highlights and provides fairly decent protection for running a field hospital."
	icon_state = "spec_medical"
	item_state = "spec_medical"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/classic/med
	armor = list("melee" = 25, "bullet" = 40, "laser" = 30, "energy" = 40, "bomb" = 20, "bio" = 100, "rad" = 65, "fire" = 75, "acid" = 40, "wound" = 20)

//респрайт кэпарморма
/obj/item/clothing/head/helmet/space/hardsuit/swat/captain
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/overlay/caparmor_new.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/capspacesuit_new.dmi'
	icon_state = "capspacehelmet"
	item_state = "capspacehelmet"

/obj/item/clothing/suit/space/hardsuit/swat/captain
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/overlay/caparmor_new.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/capspacesuit_new.dmi'
	icon_state = "capspacesuit"
	item_state = "capspacesuit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/swat/captain

//MARK: Syndie

//нам действительно не нужен отдельный модуль под пару хардсьютов
//old Syndie elite hardsuits and sunset stuff - by SnRbydlo & Quinalion
//TODO: refactor paths

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/oldsst
	name = "elite SST hardsuit helmet"
	desc = "An elite version of the SST helmet, with improved armour and fireproofing. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the SST helmet, with improved armour and fireproofing. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiesst"
	item_state = "hardsuit1-syndiesst"
	hardsuit_type = "syndiesst"

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/shabbysst
	name = "shabby elite SST hardsuit helmet"
	desc = "An elite version of the SST helmet, with improved armour and fire . Shows clear signs of wear and tear, with scuffs and scratches hinting at past battles. Some pshieldingarts of the armour even seem to have a bit of cardboard reinforcement. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the SST helmet, with improved armour and fireproofing. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiesst"
	item_state = "hardsuit1-syndiesst"
	hardsuit_type = "syndiesst"
	armor = list("melee" = 45, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 70, "wound" = 20)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/shabbymedical
	name = "shabby elite medical syndicate hardsuit helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fire shielding. This one is made special for medics and shows clear signs of wear and tear, with scuffs and scratches hinting at past battles. Some parts of the armour even seem to have a bit of cardboard reinforcement. Gives you a strong feeling of Déjà vu"
	alt_desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiemed"
	item_state = "hardsuit1-syndiemed"
	hardsuit_type = "syndiemed"
	armor = list("melee" = 45, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 70, "wound" = 20)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/shabbyengineer
	name = "shabby engineer elite syndicate hardsuit helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fire shielding. This one has a contractor style and shows clear signs of wear and tear, with scuffs and scratches hinting at past battles. Some parts of the armour even seem to have a bit of cardboard reinforcement. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiecontractor"
	item_state = "hardsuit1-syndiecontractor"
	hardsuit_type = "syndiecontractor"
	armor = list("melee" = 45, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 70, "wound" = 20)

/obj/item/clothing/suit/space/hardsuit/syndi/elite/oldsst
	name = "elite SST hardsuit"
	desc = "An elite version of the SST hardsuit, with improved armour and fire shielding. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the SST hardsuit, with improved armour and fire shielding. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiesst"
	item_state = "hardsuit1-syndiesst"
	hardsuit_type = "syndiesst"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/oldsst

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/oldelite
	name = "elite syndicate hardsuit helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndieoldelite"
	item_state = "hardsuit1-syndieoldelite"
	hardsuit_type = "syndieoldelite"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/oldelite
	name = "elite syndicate hardsuit"
	desc = "An elite version of the syndicate hardsuit, with improved armour and fire shielding. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the syndicate hardsuit, with improved armour and fire shielding. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndieoldelite"
	item_state = "hardsuit1-syndieoldelite"
	hardsuit_type = "syndieoldelite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/oldelite

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/oldmedical
	name = "elite medical syndicate hardsuit helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. This one is made special for medics. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiemed"
	item_state = "hardsuit1-syndiemed"
	hardsuit_type = "syndiemed"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/oldmedical
	name = "elite medical syndicate hardsuit"
	desc = "An elite version of the syndicate hardsuit, with improved armour and fire shielding. This one is made special for medics. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the syndicate hardsuit, with improved armour and fire shielding. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiemed"
	item_state = "hardsuit1-syndiemed"
	hardsuit_type = "syndiemed"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/oldmedical

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/oldcontractor
	name = "contractor elite syndicate hardsuit helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. This one has contractor style. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiecontractor"
	item_state = "hardsuit1-syndiecontractor"
	hardsuit_type = "syndiecontractor"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/oldcontractor
	name = "contractor elite syndicate hardsuit"
	desc = "An elite version of the syndicate hardsuit, with improved armour and fire shielding. This one has contractor style. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the syndicate hardsuit, with improved armour and fire shielding. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiecontractor"
	item_state = "hardsuit1-syndiecontractor"
	hardsuit_type = "syndiecontractor"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/oldcontractor
/obj/item/clothing/suit/space/hardsuit/syndi/elite/shabbyengineer
	name = "shabby engineer elite syndicate hardsuit"
	desc = "An elite version of the syndicate hardsuit, with improved armour and fire shielding. This one has a contractor style and shows clear signs of wear and tear, with scuffs and scratches hinting at past battles. Some parts of the armour even seem to have a bit of cardboard reinforcement. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the syndicate hardsuit, with improved armour and fire shielding. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiecontractor"
	item_state = "hardsuit1-syndiecontractor"
	hardsuit_type = "syndiecontractor"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/shabbyengineer
	armor = list("melee" = 45, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 70, "wound" = 20)

/obj/item/clothing/suit/space/hardsuit/syndi/elite/shabbymedical
	name = "shabby elite medical syndicate hardsuit"
	desc = "An elite version of the syndicate hardsuit, with improved armour and fire shielding. This one is made special for medics and shows clear signs of wear and tear, with scuffs and scratches hinting at past battles. Some parts of the armour even seem to have a bit of cardboard reinforcement. Gives you a strong feeling of Déjà vu"
	alt_desc = "An elite version of the syndicate hardsuit, with improved armour and fire shielding. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiemed"
	item_state = "hardsuit1-syndiemed"
	hardsuit_type = "syndiemed"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/shabbymedical
	armor = list("melee" = 45, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 70, "wound" = 20)

/obj/item/clothing/suit/space/hardsuit/syndi/elite/shabbyoldsst
	name = "shabby elite SST hardsuit"
	desc = "An elite version of the SST hardsuit, with improved armour and fire shielding. Shows clear signs of wear and tear, with scuffs and scratches hinting at past battles. Some parts of the armour even seem to have a bit of cardboard reinforcement. Gives you a strong feeling of Déjà vu."
	alt_desc = "An elite version of the SST hardsuit, with improved armour and fire shielding. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/overlay/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/space_suit/spacesuits_celadon.dmi'
	icon_state = "hardsuit0-syndiesst"
	item_state = "hardsuit1-syndiesst"
	hardsuit_type = "syndiesst"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/shabbysst
	armor = list("melee" = 45, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 70, "wound" = 20)
