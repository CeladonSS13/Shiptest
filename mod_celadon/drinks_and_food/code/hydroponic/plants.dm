/obj/item/seeds/tea/mint
	name = "mint seed pack"
	icon = 'mod_celadon/_storge_icons/icons/obj/hydroponics/seeds.dmi'
	icon_state = "seed-mint"
	growing_icon = 'mod_celadon/_storge_icons/icons/obj/hydroponics/growing.dmi'
	desc = "Long stalks with flowering tips, they contain a chemical that attracts felines."
	species = "mint"
	plantname = "Mint Plant"
	icon_dead = null
	growthstages = 3
	product = /obj/item/food/grown/tea/mint
	reagents_add = list(/datum/reagent/pax/mint = 0.2, /datum/reagent/consumable/nutriment/vitamin = 0.06, /datum/reagent/toxin/teapowder = 0.1)
	rarity = 50

/obj/item/food/grown/tea/mint
	seed = /obj/item/seeds/tea/mint
	name = "mint buds"
	icon = 'mod_celadon/_storge_icons/icons/obj/hydroponics/harvest.dmi'
	icon_state = "mint"
	filling_color = "#4582B4"
	grind_results = list(/datum/reagent/pax/mint = 2, /datum/reagent/water = 1)
	distill_reagent = /datum/reagent/consumable/pinkmilk //Don't ask, cats speak in poptart
	can_distill = TRUE //override for tea's FALSE
