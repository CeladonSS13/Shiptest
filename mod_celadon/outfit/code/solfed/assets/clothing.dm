// Uniforms

/obj/item/clothing/under/solgov
	name = "\improper SolFed tunic"
	desc = "Standard combat tunic used by Marine."
	icon = 'icons/obj/clothing/faction/solgov/uniforms.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/uniforms.dmi'
	icon_state = "solgov_tunic"
	item_state = "solgov_tunic"
	armor = list("melee" = 0, "fire" = 30, "acid" = 30)
	strip_delay = 50
	supports_variations = DIGITIGRADE_VARIATION

/obj/item/clothing/under/solgov/terragov
	name = "\improper TerraGov tunic"
	desc = "Specialized combat tunic utilized by Marine serving the Terran Regency."
	icon_state = "terragov_tunic"
	item_state = "terragov_tunic"
	armor = list("melee" = 0, "fire" = 30, "acid" = 30)

/obj/item/clothing/under/solgov/dress
	name = "\improper SolFed dress"
	desc = "A formal SolFed white dress, used by civilians and officials alike."
	icon_state = "solgov_dress"
	item_state = "solgov_dress"

/obj/item/clothing/under/solgov/formal
	name = "\improper SolFed formal suit"
	desc = "A formal SolFed uniform, commonly used by representatives and officials."
	icon_state = "formal_solgov"
	item_state = "formal_solgov"

/obj/item/clothing/under/solgov/formal/skirt
	name = "\improper SolFed formal suitskirt"
	desc = "A formal SolFed uniform, commonly used by representatives and officials."
	icon_state = "formal_solgov_skirt"
	item_state = "formal_solgov_skirt"

/obj/item/clothing/under/solgov/formal/terragov
	name = "\improper TerraGov formal uniform"
	desc = "A formal SolFed uniform, for special occasions. This one is colored in original TerraGov green."
	icon_state = "formal_terragov"
	item_state = "formal_terragov"

/obj/item/clothing/under/solgov/formal/captain
	name = "\improper SolFed captain uniform"
	desc = "A formal SolFed uniform, utilized by captains of SolFed vessels."
	icon_state = "solgov_captain"
	item_state = "solgov_captain"


/obj/item/clothing/under/plasmaman/solgov
	name = "\improper SolFed envirosuit"
	desc = "The pride of Solarian plasmamen everywhere- though this tends to be a somewhat exclusive club, due to Sol's aggressive workplace safety regulations."
	icon = 'icons/obj/clothing/faction/solgov/uniforms.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/uniforms.dmi'
	icon_state = "plasma_solgov"
	item_state = "plasma_solgov"


/obj/item/clothing/head/helmet/space/plasmaman/solgov
	name = "\improper SolFed envirosuit helmet"
	desc = "A generic white envirohelmet with a secondary blue."
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon_state = "solgov_envirohelm"
	item_state = "solgov_envirohelm"

// Oversuits

/obj/item/clothing/suit/armor/vest/solgov
	name = "\improper Marine gambison"
	desc = "A standard armor vest fielded for SolFed's Marine."
	icon = 'icons/obj/clothing/faction/solgov/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/suits.dmi'
	icon_state = "solgov_gambison"
	item_state = "solgov_gambison"
	supports_variations = DIGITIGRADE_VARIATION
	body_parts_covered = CHEST|GROIN
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS

/obj/item/clothing/suit/armor/vest/solgov/overseer
	name = "\improper SolFed Overseer robe"
	desc = "An elaborately designed robe utilized by SolFed overseers."
	icon_state = "solgov_overseer_robe"
	item_state = "solgov_overseer_robe"
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 10)
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/suit/armor/vest/solgov/captain
	name = "\improper SolFed Captain coat"
	desc = "An armored coat typically used by SolFed captains."
	icon_state = "solgov_coat"
	item_state = "solgov_coat"
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 10)
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/suit/armor/vest/solgov/Initialize()
	. = ..()
	allowed |= list(/obj/item/gun/ballistic/automatic/assault/swiss_cheese, /obj/item/tank)

/obj/item/clothing/head/helmet/space/solgov
	name = "\improper SolFed Vacuum Helmet"
	desc = "This space-proof helmet is meant to be worn with a matching T-MA suit."
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon_state = "vachelmet_solgov"
	item_state = "vachelmet_solgov"
	armor = list("bio" = 100, "rad" = 50, "fire" = 60, "acid" = 75)

/obj/item/clothing/suit/space/solgov
	name = "\improper SolFed Vacuum Suit"
	desc = "Originally designed by independent contractors on Luna for the purposes of survival in hazardous environments, the lightweight Tortoise Microlite Armored Suit now sees widespread use by SolGov's exploration teams."
	icon = 'icons/obj/clothing/faction/solgov/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/suits.dmi'
	icon_state = "vacsuit_solgov"
	item_state = "vacsuit_solgov"
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/energy, /obj/item/tank/internals)
	armor = list("bio" = 100, "rad" = 50, "fire" = 60, "acid" = 75, "wound" = 10)
	slowdown = 0.5
	w_class = WEIGHT_CLASS_NORMAL
	supports_variations = DIGITIGRADE_VARIATION

/obj/item/clothing/head/helmet/space/hardsuit/solgov
	name = "\improper SolFed hardsuit helmet"
	desc = "An armored spaceproof helmet, its visor is reminiscent of knights of yore."
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon_state = "hardsuit0-solgov"
	item_state = "hardsuit0-solgov"
	hardsuit_type = "solgov"
	armor = list("melee" = 50, "bullet" = 45, "laser" = 40, "energy" = 30, "bomb" = 60, "bio" = 100, "rad" = 60, "fire" = 90, "acid" = 75, "wound" = 30)

/obj/item/clothing/suit/space/hardsuit/solgov

	name = "\improper SolFed hardsuit"
	desc = "An armored spaceproof suit. A powered exoskeleton keeps the suit light and mobile."
	icon = 'icons/obj/clothing/faction/solgov/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/suits.dmi'
	icon_state = "hardsuit_solgov"
	item_state = "hardsuit_solgov"
	armor = list("melee" = 50, "bullet" = 45, "laser" = 40, "energy" = 30, "bomb" = 60, "bio" = 100, "rad" = 60, "fire" = 90, "acid" = 75, "wound" = 30)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/solgov
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	slowdown = 0.2
	supports_variations = DIGITIGRADE_VARIATION | TAJARA_VARIATION | RIOL_VARIATION

/obj/item/clothing/suit/hazardvest/solgov
	name = "SolFed hazard vest"
	desc = "A high-visibility vest used in work zones by solarian engineers."
	icon = 'icons/obj/clothing/faction/solgov/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/suits.dmi'
	icon_state = "hazard_solgov"
	item_state = "hazard_solgov"
	blood_overlay_type = "armor"
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/t_scanner, /obj/item/radio)
	resistance_flags = NONE
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/exo/large

/obj/item/clothing/suit/solgov
	name = "SolFed robe"
	desc = "A set of plain SolFed robes, commonly used by civilians."
	body_parts_covered = CHEST|GROIN|ARMS
	icon = 'icons/obj/clothing/faction/solgov/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/suits.dmi'
	icon_state = "solgov_robe"
	item_state = "solgov_robe"

	equipping_sound = EQUIP_SOUND_SHORT_GENERIC
	unequipping_sound = UNEQUIP_SOUND_SHORT_GENERIC
	equip_delay_self = EQUIP_DELAY_COAT
	equip_delay_other = EQUIP_DELAY_COAT * 1.5
	strip_delay = EQUIP_DELAY_COAT * 1.5

/obj/item/clothing/suit/solgov/dress
	name = "SolFed dress"
	desc = "A plain SolFed dress, commonly used by civilians."
	body_parts_covered = CHEST|GROIN
	icon_state = "solgov_dress"
	item_state = "solgov_dress"

/obj/item/clothing/suit/solgov/suit
	name = "SolFed suit"
	desc = "A formal SolFed suit, commonly used by civilians."
	body_parts_covered = CHEST|GROIN
	icon_state = "solgov_suit"
	item_state = "solgov_suit"

/obj/item/clothing/suit/solgov/bureaucrat
	name = "SolFed bureaucrat robe"
	desc = "A set of unique SolFed robes, utilized by Solarian Bureaucrats."
	body_parts_covered = CHEST|GROIN|ARMS
	icon_state = "solgov_bureaucrat_robe"
	item_state = "solgov_bureaucrat_robe"

/obj/item/clothing/suit/solgov/overcoat
	name = "SolFed overcoat"
	desc = "A traditional solarian overcoat, used by cilivians and ship crews alike."
	body_parts_covered = CHEST|GROIN|ARMS
	icon_state = "solgov_overcoat"
	item_state = "solgov_overcoat"
	supports_variations = DIGITIGRADE_VARIATION

/obj/item/clothing/suit/solgov/jacket
	name = "SolFed jacket"
	desc = "A plain SolFed jacket, commonly used by civilians."
	body_parts_covered = CHEST|GROIN|ARMS
	icon_state = "solgov_jacket"
	item_state = "solgov_jacket"

/obj/item/clothing/suit/toggle/solgov
	name = "\improper SolFed coat"
	desc = "An armored coat worn for special occasions. This one is dyed in SolFed blue."
	icon = 'icons/obj/clothing/faction/solgov/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/suits.dmi'
	body_parts_covered = CHEST|GROIN|ARMS|HANDS
	icon_state = "coat_solgov"
	item_state = "coat_solgov"
	blood_overlay_type = "coat"
	togglename = "buttons"
	armor = list("melee" = 35, "bullet" = 30, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 10)

/obj/item/clothing/suit/toggle/solgov/terragov
	name = "\improper Terragov coat"
	desc = "An armored coat worn for special occasions. This one is still dyed in original TerraGov green."
	icon_state = "coat_terragov"
	item_state = "coat_terragov"

/obj/item/clothing/suit/armor/solgov_trenchcoat
	name = "\improper SolFed trenchcoat"
	desc = "A SolFed official's trenchcoat. Has a lot of pockets."
	icon = 'icons/obj/clothing/faction/solgov/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/suits.dmi'
	icon_state = "armor_solgov_trenchcoat"
	item_state = "trenchcoat_solgov"
	armor = list("melee" = 25, "bullet" = 10, "laser" = 25, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 10)
	cold_protection = CHEST|LEGS|ARMS
	heat_protection = CHEST|LEGS|ARMS
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/hooded/wintercoat/solgov
	name = "SolFed winter coat"
	desc = "An environment-resistant wintercoat in the colors of the Solarian Confederation."
	icon = 'icons/obj/clothing/faction/solgov/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/suits.dmi'
	icon_state = "coatsolgov"
	item_state = "coatsolgov"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/solgov

/obj/item/clothing/head/hooded/winterhood/solgov
	icon_state = "hood_solgov"



// Headgear

/obj/item/clothing/head/solgov
	name = "\improper SolFed officer's cap"
	desc = "A blue cap worn by high-ranking officers of SolFed."
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon_state = "cap_solgov"
	item_state = "cap_solgov"
	strip_delay = 80

/obj/item/clothing/head/solgov/terragov
	name = "\improper TerraGov officer's cap"
	desc = "A cap worn by high-ranking officers of SolFed. This one is still in original TerraGov green."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	icon_state = "cap_terragov"
	item_state = "cap_terragov"

/obj/item/clothing/head/solgov/sonnensoldner
	name = "\improper Marine Hat"
	desc = "A standard-issue SolFed hat adorned with a feather, commonly used by Marine."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	icon_state = "sonnensoldner_hat"
	item_state = "sonnensoldner_hat"
	worn_y_offset = 4
	dog_fashion = null
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35,"energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 20)

/obj/item/clothing/head/solgov/captain
	name = "\improper SolFed bicorne hat"
	desc = "A unique bicorne hat given to Solarian Captains on expeditionary missions."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	icon_state = "solgov_bicorne"
	item_state = "solgov_bicorne"
	worn_y_offset = 2
	dog_fashion = null
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35,"energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 20)

/obj/item/clothing/head/beret/solgov
	name = "\improper SolFed beret"
	desc = "A beret with SolFed's emblem emblazoned on it. Colored in SolFed blue."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	icon_state = "beret_solgov"

/obj/item/clothing/head/beret/solgov/plain
	name = "\improper SolFed beret"
	desc = "A plain blue beret. It looks like it's missing something."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	icon_state = "beret_solgovplain"

/obj/item/clothing/head/beret/solgov/terragov
	name = "\improper TerraGov beret"
	desc = "A beret with SolFed's emblem emblazoned on it. It's still colored in original TerraGov green."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	icon_state = "beret_terragov"

/obj/item/clothing/head/beret/solgov/terragov/plain
	name = "\improper TerraGov beret"
	desc = "A plain beret colored in original TerraGov green. It looks like it's missing something."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	icon_state = "beret_terragovplain"

/obj/item/clothing/head/fedora/solgov
	name = "Solarian Hat"
	desc = "A slick blue hat used by both solarian civilians and physicists."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	icon_state = "hat_solgov"
	item_state = "hat_solgov"

/obj/item/clothing/head/flatcap/solgov
	name = "solarian flat cap"
	desc = "A working solarian's hat, commonly used by Logistics Deck Officers."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	icon_state = "flatcap_solgov"
	item_state = "detective"

/obj/item/clothing/head/hardhat/solgov
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'
	icon_state = "hardhat_solgov"
	dog_fashion = null

/obj/item/clothing/head/solgov_surgery
	name = "SolFed surgery cap"
	desc = "It's a surgery cap utilized by solarian doctors."
	icon_state = "solgov_surgery"
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/head.dmi'
	icon = 'icons/obj/clothing/faction/solgov/head.dmi'

// Neckwear

/obj/item/clothing/neck/stripedsolgovscarf
	name = "striped SolFed scarf"
	icon_state = "stripedsolgovscarf"
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/neck.dmi'
	icon = 'icons/obj/clothing/faction/solgov/neck.dmi'
	custom_price = 10
	supports_variations = VOX_VARIATION

/obj/item/clothing/neck/cloak/overseer
	name = "SolFed overseer's cloak"
	desc = "Worn by the Overseer. It smells faintly of bureaucracy."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/neck.dmi'
	icon = 'icons/obj/clothing/faction/solgov/neck.dmi'
	icon_state = "solgov_cloak"

/obj/item/clothing/neck/cloak/solgov
	name = "SolFed weibel"
	desc = "Worn by SolFed officials. It smells faintly of bureaucracy."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/neck.dmi'
	icon = 'icons/obj/clothing/faction/solgov/neck.dmi'
	icon_state = "solgov_weibel"

/obj/item/clothing/neck/cloak/solgovcap
	name = "SolFed captain's cloak"
	desc = "Worn by SolFed captains. It smells faintly of bureaucracy."
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/neck.dmi'
	icon = 'icons/obj/clothing/faction/solgov/neck.dmi'
	icon_state = "solgov_cap_cloak"

// Accesories

/obj/item/clothing/accessory/waistcoat/solgov
	name = "SolFed waistcoat"
	desc = "A standard issue waistcoat in SolFed colors."
	icon_state = "solgov_waistcoat"
	icon = 'icons/obj/clothing/faction/solgov/accessory.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/solgov/accessory.dmi'
