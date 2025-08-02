/* base guys */
/obj/effect/mob_spawn/human/corpse/solfed
	name = "SolFed Gehilfe"
	id_job = "Gehilfe"
	outfit = /datum/outfit/solfed

/datum/outfit/solfed
	name = "SolFed Gehilfe Corpse"
	uniform = /obj/item/clothing/under/solfed/assistant
	head = /obj/item/clothing/head/solfed/cap
	shoes = /obj/item/clothing/shoes/sneakers/black
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/card/id/solfed

/obj/effect/mob_spawn/human/corpse/solfed/guard
	name = "SolFed Patrol Officer"
	id_job = "Patrol Officer"
	outfit = /datum/outfit/solfed/guard

/datum/outfit/solfed/guard
	name = "SolFed Patrol Officer Corpse"
	uniform = /obj/item/clothing/under/rank/security/officer/blueshirt
	head = /obj/item/clothing/head/solfed/cap
	mask = /obj/item/clothing/mask/balaclava
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	belt = /obj/item/storage/belt/grenade
	id = /obj/item/card/id/solfed

/* marines */

/obj/effect/mob_spawn/human/corpse/solfed/marine
	name = "SolFed Marine"
	id_job = "Marine"
	outfit = /datum/outfit/solfed/marine

/datum/outfit/solfed/marine
	name = "SolFed Marine Corpse"
	uniform = /obj/item/clothing/under/solfed
	head = /obj/item/clothing/head/helmet/solfed/m11
	suit = /obj/item/clothing/suit/armor/vest/marine
	belt = /obj/item/storage/belt/military/solfed
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat/solfed
	glasses = /obj/item/clothing/glasses/sunglasses/ballistic
	mask = /obj/item/clothing/mask/balaclava
	id = /obj/item/card/id/solfed

/obj/effect/mob_spawn/human/corpse/solfed/marine/elysium
	name = "Elysium Brigade Haris"
	id_job = "Haris"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/solfed/marine/elysium

/datum/outfit/solfed/marine/elysium
	name = "Elysium Brigade Haris Corpse"
	uniform = /obj/item/clothing/under/solfed/camo/elysium
	head = /obj/item/clothing/head/helmet/solfed/m11/elysium
	suit = /obj/item/clothing/suit/armor/vest/bulletproof
	belt = /obj/item/storage/belt/military/solfed/elysium
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	glasses = null
	mask = /obj/item/clothing/mask/gas/solfed/elysium
	id = /obj/item/card/id/solfed

/obj/effect/mob_spawn/human/corpse/solfed/marine/melee
	name = "SolFed Nahkampfkrieger"
	id_job = "Nahkampfkrieger"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/solfed/marine/melee

/datum/outfit/solfed/marine/melee
	name = "SolFed Nahkampfkrieger Corpse"
	uniform = /obj/item/clothing/under/solfed
	head = /obj/item/clothing/head/helmet/sec
	suit = /obj/item/clothing/suit/armor/vest/alt
	belt = /obj/item/storage/belt/bandolier
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	glasses = /obj/item/clothing/glasses/sunglasses
	mask = /obj/item/clothing/mask/bandana/black
	id = /obj/item/card/id/solfed

/obj/effect/mob_spawn/human/corpse/solfed/marine/melee/heavy
	name = "SolFed Energy Nahkampfkrieger"
	id_job = "Energy Nahkampfkrieger"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/solfed/marine/melee/heavy

/datum/outfit/solfed/marine/melee/heavy
	name = "SolFed Energy Nahkampfkrieger Corpse"
	head = /obj/item/clothing/head/helmet/solfed/m11
	glasses = /obj/item/clothing/glasses/night
	id = /obj/item/card/id/solfed/commander

/obj/effect/mob_spawn/human/corpse/solfed/marine/pistol
	name = "SolFed Seitenwaffenmeister"
	id_job = "Seitenwaffenmeister"
	outfit = /datum/outfit/solfed/marine/pistol

/datum/outfit/solfed/marine/pistol
	name = "SolFed Seitenwaffenmeister Corpse"
	uniform = /obj/item/clothing/under/solfed/camo
	head = /obj/item/clothing/head/beret/command
	suit = /obj/item/clothing/suit/armor/vest/marine
	belt = null
	mask = /obj/item/clothing/mask/balaclava

/obj/effect/mob_spawn/human/corpse/solfed/marine/shotgun
	name = "SolFed Wachter"
	id_job = "Wachter"
	outfit = /datum/outfit/solfed/marine/shotgun

/datum/outfit/solfed/marine/shotgun
	name = "SolFed Wachter Corpse"
	uniform = /obj/item/clothing/under/solfed/camo
	head = /obj/item/clothing/head/helmet/solfed/m11
	suit = /obj/item/clothing/suit/armor/vest/marine/medium
	belt = /obj/item/storage/belt/military/solfed
	mask = /obj/item/clothing/mask/gas/welding

/obj/effect/mob_spawn/human/corpse/solfed/marine/gauss
	name = "SolFed Gaussmarine"
	id_job = "Gaussmarine"
	outfit = /datum/outfit/solfed/marine/gauss

/datum/outfit/solfed/marine/gauss
	name = "SolFed Gaussmarine Corpse"
	uniform = /obj/item/clothing/under/solfed/camo
	head = /obj/item/clothing/head/helmet/blueshirt
	suit = /obj/item/clothing/suit/armor/vest/blueshirt
	belt = null

/* heavy marines */

/obj/effect/mob_spawn/human/corpse/solfed/marine/gauss/heavy
	name = "SolFed Heavy Gaussmarine"
	id_job = "Heavy Gaussmarine"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/solfed/marine/gauss/heavy

/datum/outfit/solfed/marine/gauss/heavy
	name = "SolFed Heavy Gaussmarine Corpse"
	uniform = /obj/item/clothing/under/solfed/camo
	head = /obj/item/clothing/head/helmet/solfed/m11
	suit = /obj/item/clothing/suit/armor/vest/marine/heavy
	shoes = /obj/item/clothing/shoes/combat
	mask = /obj/item/clothing/mask/gas/sechailer

/obj/effect/mob_spawn/human/corpse/solfed/marine/sniper
	name = "SolFed Scharfschutze"
	id_job = "Scharfschutze"
	outfit = /datum/outfit/solfed/marine/sniper

/datum/outfit/solfed/marine/sniper
	name = "SolFed Scharfschutze Corpse"
	uniform = /obj/item/clothing/under/solfed/camo
	head = /obj/item/clothing/head/fedora/det_hat
	suit = /obj/item/clothing/suit/armor/vest/det_suit
	belt = null
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses
	r_pocket = /obj/item/binoculars

/obj/effect/mob_spawn/human/corpse/solfed/marine/sergeant
	name = "SolFed Feldwebel"
	id_job = "Feldwebel"
	outfit = /datum/outfit/solfed/marine/sergeant

/datum/outfit/solfed/marine/sergeant
	name = "SolFed Feldwebel Corpse"
	uniform = /obj/item/clothing/under/solfed
	suit = /obj/item/clothing/suit/armor/vest/marine/heavy
	head = /obj/item/clothing/head/solfed/beret
	mask = /obj/item/clothing/mask/balaclava/combat
	shoes = /obj/item/clothing/shoes/combat/coldres
	gloves = /obj/item/clothing/gloves/combat/solfed/captain
	glasses = /obj/item/clothing/glasses/hud/health/night

/* space guys */

/obj/effect/mob_spawn/human/corpse/solfed/space
	name = "SolFed Space Gehilfe"
	id_job = "Gehilfe"
	outfit = /datum/outfit/solfed/space

/datum/outfit/solfed/space
	name = "SolFed Space Gehilfe Corpse"
	uniform = /obj/item/clothing/under/solfed/assistant
	head = /obj/item/clothing/head/helmet/space/solgov
	suit = /obj/item/clothing/suit/space/solgov
	r_pocket = /obj/item/tank/internals/emergency_oxygen
	id = /obj/item/card/id/solfed

/obj/effect/mob_spawn/human/corpse/solfed/space/captain
	name = "SolFed Kommandant"
	id_job = "Kommandant"
	outfit = /datum/outfit/solfed/space/captain

/datum/outfit/solfed/space/captain
	name = "SolFed Kommandant Corpse"
	uniform = /obj/item/clothing/under/solfed/formal
	head = /obj/item/clothing/head/helmet/space/solgov
	suit = /obj/item/clothing/suit/space/solgov
	belt = /obj/item/storage/belt/sabre/solgov
	gloves = /obj/item/clothing/gloves/combat/solfed/captain
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	r_pocket = /obj/item/tank/internals/emergency_oxygen
	id = /obj/item/card/id/solfed/commander

/obj/effect/mob_spawn/human/corpse/solfed/space/elysium
	name = "Elysium Brigade Space Haris"
	id_job = "Haris"
	outfit = /datum/outfit/solfed/space/elysium

/datum/outfit/solfed/space/elysium
	name = "Elysium Brigade Haris Corpse"
	uniform = /obj/item/clothing/under/solfed/camo/elysium
	head = /obj/item/clothing/head/helmet/space/hardsuit/solfed/elysium
	suit = /obj/item/clothing/suit/space/hardsuit/solfed/elysium
	belt = /obj/item/storage/belt/military/solfed/elysium
	gloves = /obj/item/clothing/gloves/combat
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	r_pocket = /obj/item/tank/internals/emergency_oxygen
	id = /obj/item/card/id/solfed

/* the tank */

/obj/effect/mob_spawn/human/corpse/solfed/elite
	name = "SolFed Panzermarine"
	id_job = "Panzermarine"
	outfit = /datum/outfit/solfed/heavy/elite

/datum/outfit/solfed/heavy/elite
	name = "SolFed Panzermarine Corpse"
	uniform = /obj/item/clothing/under/solfed/camo
	suit = /obj/item/clothing/suit/space/hardsuit/solgov
	head = /obj/item/clothing/head/helmet/space/hardsuit/solgov
	mask = /obj/item/clothing/mask/balaclava/combat
	back = /obj/item/tank/jetpack/oxygen
	id = /obj/item/card/id/solfed/commander
