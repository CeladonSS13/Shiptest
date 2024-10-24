// False wall

/obj/machinery/button/door/false_wall
	name = "Skull button"
	desc = "Ancient mechanism, looks like button with shape of skull"
	icon = 'icons/obj/mining.dmi'
	icon_state = "skull"
	skin = "skull"
	use_power = 0

/turf/closed/indestructible/riveted/boss/fake
	var/id = null

/turf/closed/indestructible/riveted/boss/fake/proc/open()
	density = 0
	opacity = 0
	icon = 'icons/turf/floors.dmi'
	icon_state = "clockwork_floor"
	playsound (src, 'sound/machines/clockcult/steam_whoosh.ogg')

/turf/closed/indestructible/riveted/boss/fake/proc/close()
	density = 1
	opacity = 1
	icon = 'icons/turf/walls/boss_wall.dmi'
	icon_state = "wall"
	playsound (src, 'sound/machines/clockcult/steam_whoosh.ogg')

/obj/machinery/button/door/false_wall/attack_hand(mob/user as mob)
	for(var/turf/closed/indestructible/riveted/boss/fake/W)
		if(W.id == id)
			if(W.density)
				spawn(10)
					W.open()
					return
			else
				spawn(10)
					W.close()
					return

/obj/structure/temple/plassure_plate
	name = "strange stone slab"
	desc = "This slab shimmers strangely, is it really a trap? No, too obvious."
	icon = 'icons/turf/boss_floors.dmi'
	icon_state = "pristine_pressure_plate"
	layer = 3
	invisibility = 0
	var/id = null
	var/once = 1
	var/plassure_plate_list // лист для одновременного отключения нескольких плит в широких проходах

/obj/structure/temple/plassure_plate/Initialize()
	plassure_plate_list += src
	. = ..()

/obj/structure/temple/plassure_plate/Bump(datum/source, atom/movable/AM)
	if(iscarbon(AM))
		for(var/turf/closed/indestructible/riveted/boss/fake/W)
			if(W.id == id)
				if(W.density)
					spawn(10)
						W.open()
						return
				else
					spawn(10)
						W.close()
						return
		if(once)
			for(var/obj/structure/temple/plassure_plate/S in plassure_plate_list)
				if(S.id == id)
					new /obj/structure/stone_tile/slab
					qdel(src)

/obj/effect/spawner/lootdrop/templestuff // Основные предметы для лутания в данже
	name = "random temple loot"
	lootcount = 1
	loot = list(
	/obj/structure/fluff/clockwork/blind_eye,
	/obj/structure/fluff/clockwork/clockgolem_remains,
	/obj/structure/fluff/clockwork/fallen_armor,
	/obj/item/lighter/clockwork,
	/obj/structure/fluff/clockwork/alloy_shards,
	/obj/structure/fluff/clockwork/alloy_shards/small,
	/obj/structure/fluff/clockwork/alloy_shards/medium,
	/obj/structure/fluff/clockwork/alloy_shards/medium_gearbit,
	/obj/structure/fluff/clockwork/alloy_shards/large,
	/obj/item/stack/sheet/mineral/gold/five,
	/obj/item/coin/silver,
	/obj/item/coin/gold,
	/obj/item/coin/diamond,
	/obj/item/reagent_containers/glass/mortar/gold,
	/mob/living/simple_animal/hostile/asteroid/goldgrub,
	/obj/item/ectoplasm,
	/obj/item/stack/ore/diamond
	)

/obj/item/keycard/gatedrop/temple // Ключ с босса, дающий проход к сокровищнице
	name = "Treasure Key"
	desc = "A dusty key, smudged with dried blood."
	puzzle_id = "templekey"

/obj/effect/mob_spawn/human/ruin/temple
	var/list/pocketloot = list( // Разного уровня полезности предметы для карманов трупов
		/obj/item/storage/fancy/cigarettes/cigpack_robust,
		/obj/item/storage/fancy/cigarettes/cigpack_uplift,
		/obj/item/storage/fancy/cigarettes/derringer,
		/obj/item/cigbutt,
		/obj/item/clothing/mask/cigarette/rollie,
		/obj/item/clothing/mask/cigarette,
		/obj/item/clothing/mask/cigarette/rollie/cannabis,
		/obj/item/lighter,
		/obj/item/assembly/igniter,
		/obj/item/storage/box/matches,
		/obj/item/match,
		/obj/item/reagent_containers/food/snacks/donut,
		/obj/item/reagent_containers/food/snacks/energybar,
		/obj/item/reagent_containers/food/snacks/spacetwinkie,
		/obj/item/reagent_containers/food/drinks/soda_cans/cola,
		/obj/item/pen,
		/obj/item/folder,
		/obj/item/screwdriver,
		/obj/item/stack/sticky_tape,
		/obj/item/radio,
		/obj/item/coin,
		/obj/item/coin/twoheaded,
		/obj/item/coin/iron,
		/obj/item/coin/silver,
		/obj/item/flashlight,
		/obj/item/stock_parts/cell,
		/obj/item/paper/crumpled,
		/obj/item/extinguisher/mini,
		/obj/item/toy/cards/deck,
		/obj/item/reagent_containers/pill/salbutamol,
		/obj/item/reagent_containers/pill/patch/silver_sulf,
		/obj/item/reagent_containers/pill/patch/styptic,
		/obj/item/reagent_containers/pill/salicylic,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/ointment,
		/obj/item/tank/internals/emergency_oxygen,
		/obj/item/weldingtool/mini,
		/obj/item/flashlight/glowstick,
		/obj/item/flashlight/glowstick/red,
		/obj/item/flashlight/glowstick/blue,
		/obj/item/flashlight/flare,
		/obj/item/toy/crayon/white,
		)

/obj/effect/mob_spawn/human/ruin/temple/archeologist // Основной способ с рандомным шансом пополнить некоторые ресурсы, не возвращаясь обратно
	name = "Archeologist"
	outfit = /datum/outfit/job/ruin/temple/archeologist
	icon_state = "corpsescientist"

/datum/outfit/job/ruin/temple/archeologist
	mask = /obj/item/clothing/mask/gas/explorer
	shoes = /obj/item/clothing/shoes/workboots/mining
	gloves = /obj/item/clothing/gloves/explorer
	uniform = /obj/item/clothing/under/rank/rnd/scientist
	suit = /obj/item/clothing/suit/hazardvest
	back = /obj/item/storage/backpack/satchel/explorer

/obj/effect/mob_spawn/human/ruin/temple/archeologist/Initialize()
	l_pocket = pick(pocketloot)
	r_pocket = pick(pocketloot)
	belt = pick(pocketloot)
	backpack_contents = list(pick(pocketloot), pick(pocketloot), pick(pocketloot))
	return ..()
