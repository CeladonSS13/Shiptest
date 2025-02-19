/datum/supply_pack/faction/independent/ammo
	group = "Bulk Ammunition"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "ammo crate"

/* Прочее */

/datum/supply_pack/faction/independent/ammo/blank_ammo_disk
	name = "Blank Ammo Design Disk Crate"
	desc = "Run your own training drills!"
	cost = 1000
	contains = list(/obj/item/disk/design_disk/blanks)

/* 9mm */

/datum/supply_pack/faction/independent/ammo/c9mm_ammo_box
	name = "9mm Ammo Box Crate"
	desc = "Contains a 60-round 9mm box for pistols and SMGs such as the Commander or Saber."
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 300

/datum/supply_pack/faction/independent/ammo/c9mmrubber_ammo_box
	name = "9mm Rubber Ammo Box Crate"
	desc = "Contains a 60-round 9mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 200


/* .22LR */

/datum/supply_pack/faction/independent/ammo/c22lr
	name = ".22 LR Ammo Box Crate"
	desc = "Contains a 100-round ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr)
	cost = 250

/* .38 */

/datum/supply_pack/faction/independent/ammo/c38
	name = ".38 Ammo Boxes Crate"
	desc = "Contains two 50 round ammo boxes for refilling .38 weapons."
	cost = 350
	contains = list(/obj/item/storage/box/ammo/c38,
					/obj/item/storage/box/ammo/c38)
	crate_name = "ammo crate"

/* 10mm */

/datum/supply_pack/faction/independent/ammo/c10mm_ammo_box
	name = "10mm Ammo Box Crate"
	desc = "Contains a 48-round 10mm box for pistols and SMGs like the Ringneck or the SkM-44(k)."
	contains = list(/obj/item/storage/box/ammo/c10mm)
	cost = 350

/datum/supply_pack/faction/independent/ammo/c10mmrubber_ammo_box
	name = "10mm Rubber Ammo Box Crate"
	desc = "Contains a 48-round 10mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c10mm_rubber)
	cost = 250

/* .45 */

/datum/supply_pack/faction/independent/ammo/c45_ammo_box
	name = ".45 Ammo Box Crate"
	desc = "Contains a 48-round .45 box for pistols and SMGs like the Candor or the C-20r."
	contains = list(/obj/item/storage/box/ammo/c45)
	cost = 350

/datum/supply_pack/faction/independent/ammo/c45mmrubber_ammo_box
	name = ".45 Rubber Ammo Box Crate"
	desc = "Contains a 48-round .45 box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c45_rubber)
	cost = 250

/* .357 */

/datum/supply_pack/faction/independent/ammo/a357_ammo_box
	name = ".357 Ammo Box Crate"
	desc = "Contains a 48-round .357 box for revolvers such as the Scarborough Revolver and the HP Firebrand."
	contains = list(/obj/item/storage/box/ammo/a357)
	cost = 350

/* .44 */

/datum/supply_pack/faction/independent/ammo/a44roum
	name = ".44 Roumain Ammo Box Crate"
	desc = "Contains a 48-round box of .44 roumain ammo for revolvers such as the Shadow and Montagne."
	contains = list(/obj/item/storage/box/ammo/a44roum)
	cost = 350

/datum/supply_pack/faction/independent/ammo/a44roum_rubber
	name = ".44 Roumain Rubber Ammo Box Crate"
	desc = "Contains a 48-round box of .44 roumain ammo loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/a44roum_rubber)
	cost = 250

/* .45-70 */

/datum/supply_pack/faction/independent/ammo/a4570_box
	name = ".45-70 Ammo Box Crate"
	desc = "Contains a 24-round box containing devastatingly powerful .45-70 caliber ammunition."
	contains = list(/obj/item/storage/box/ammo/a4570)
	cost = 300

/* 12 Gauge */

/datum/supply_pack/faction/independent/ammo/buckshot
	name = "12G Buckshot Crate"
	desc = "Contains a box of 32 buckshot shells for use in lethal persuasion."
	cost = 750
	contains = list(/obj/item/storage/box/ammo/a12g_buckshot)

/datum/supply_pack/faction/independent/ammo/slugs
	name = "12G Shotgun Slug Crate"
	desc = "Contains a box of 32 slug shells for use in lethal persuasion."
	cost = 750
	contains = list(/obj/item/storage/box/ammo/a12g_slug)

/datum/supply_pack/faction/independent/ammo/blank_shells
	name = "12G Blank Shell Crate"
	desc = "Contains a box of blank shells."
	cost = 500
	contains = list(/obj/item/storage/box/ammo/a12g_blank)

/datum/supply_pack/faction/independent/ammo/rubbershot
	name = "12G Rubbershot Crate"
	desc = "Contains a box of 32 12 gauge rubbershot shells. Perfect for crowd control and training."
	cost = 550
	contains = list(/obj/item/storage/box/ammo/a12g_rubbershot)


/* 7.62 */

/datum/supply_pack/faction/independent/ammo/a762_ammo_box
	name = "7.62x40mm CLIP Ammo Box Crate"
	desc = "Contains two 60-round 7.62x40mm CLIP boxes for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40,
					/obj/item/storage/box/ammo/a762_40)
	cost = 700

/* .300 */

/datum/supply_pack/faction/independent/ammo/a300_box
	name = ".300 Ammo Box Crate"
	desc = "Contains a twenty-round .300 Magnum ammo box for sniper rifles such as the HP Scout."
	contains = list(/obj/item/storage/box/ammo/a300)
	cost = 400

/* 6.5 */

/datum/supply_pack/faction/independent/ammo/a65clip_box
	name = "6.5x57mm CLIP Ammo Box Crate"
	desc = "Contains a twenty-round 6.5x57mm CLIP ammo box for various sniper rifles such as the CM-F90 and the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip)
	cost = 400

/* 8x50 */

/datum/supply_pack/faction/independent/ammo/c8x50mm_boxcrate
	name = "8x50mm Ammo Box Crate"
	desc = "Contains a 40-round 8x50mm ammo box for rifles such as the Illestren."
	contains = list(/obj/item/storage/box/ammo/a8_50r)
	cost = 450
