// Other
/obj/item/grown/bananapeel/specialpeel     //used by /obj/item/clothing/shoes/clown_shoes/banana_shoes
	name = "synthesized banana peel"
	desc = "A synthetic banana peel."

/obj/item/grown/bananapeel/specialpeel/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/slippery, 40)
