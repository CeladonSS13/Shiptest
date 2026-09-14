/datum/outfit/vigilitas
	name = "VI Corpse"
	uniform = /obj/item/clothing/under/nanotrasen/security
	suit = /obj/item/clothing/suit/armor/nanotrasen
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset/headset_sec/alt
	mask = /obj/item/clothing/mask/gas/vigilitas
	head = /obj/item/clothing/head/nanotrasen/cap/security
	back = /obj/item/storage/backpack/messenger
	id = /obj/item/card/id

/datum/outfit/vigilitas/space
	name = "VI Responder"
	suit = /obj/item/clothing/suit/space/hardsuit/security
	head = /obj/item/clothing/head/helmet/space/hardsuit/security
	back = /obj/item/tank/jetpack/carbondioxide

/datum/outfit/vigilitas/space/hos
	name = "VI Breacher"
	suit = /obj/item/clothing/suit/space/hardsuit/security/hos
	head = /obj/item/clothing/head/helmet/space/hardsuit/security/hos
	back = /obj/item/tank/jetpack/carbondioxide

/datum/outfit/vigilitas/director
	name = "VI director"
	uniform = /obj/item/clothing/under/nanotrasen/security/director
	suit = /obj/item/clothing/suit/armor/nanotrasen/sec_director
	head = /obj/item/clothing/head/nanotrasen/beret/security/command

/datum/outfit/vigilitas/private
	name = "VI Private"

/obj/effect/mob_spawn/human/corpse/vigilitas_private
	name = "VI Private"
	id_job = "Vigilitas Interstellar"
	outfit = /datum/outfit/vigilitas/private

/obj/effect/mob_spawn/human/corpse/vigilitas_director
	name = "VI Director"
	id_job = "Vigilitas Interstellar"
	outfit = /datum/outfit/vigilitas/director

/datum/outfit/vigilitas/trooper
	name = "VI Trooper"
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/m10
	back = /obj/item/storage/backpack/security

/obj/effect/mob_spawn/human/corpse/vigilitas_trooper
	name = "VI Trooper"
	id_job = "Vigilitas Assault Force"
	outfit = /datum/outfit/vigilitas/trooper

/datum/outfit/vigilitas/elite
	name = "VI Response Team"
	suit = /obj/item/clothing/suit/space/hardsuit/ert/sec
	head = /obj/item/clothing/head/helmet/space/hardsuit/ert/sec
	back = /obj/item/storage/backpack/security
	gloves = /obj/item/clothing/gloves/combat

/obj/effect/mob_spawn/human/corpse/vigilitas_hos
	name = "VI Breacher"
	id_job = "Vigilitas Assault Force"
	outfit = /datum/outfit/vigilitas/space/hos

/obj/effect/mob_spawn/human/corpse/vigilitas_space
	name = "VI Responder"
	id_job = "Vigilitas Assault Force"
	outfit = /datum/outfit/vigilitas/space

/obj/effect/mob_spawn/human/corpse/vigilitas_elite
	name = "VI Response Team"
	id_job = "Vigilitas Assault Force"
	outfit = /datum/outfit/vigilitas/elite

/datum/outfit/vigilitas/sniper
	name = "VI Ranger"
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/nanotrasen/beret/security
	back = /obj/item/storage/backpack/duffelbag/sec

/obj/effect/mob_spawn/human/corpse/vigilitas_sniper
	name = "VI Ranger"
	id_job = "Vigilitas Assault Force"
	outfit = /datum/outfit/vigilitas/sniper
