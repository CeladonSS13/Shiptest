/obj/item/disk/design_disk/syndie_mechs
	name = "design disk - Syndie mecha modifications"
	desc = "A design disk containing specifications for Syndie-custom mecha conversions."
	color = "#c41a00"
	max_blueprints = 3

/obj/item/disk/design_disk/syndie_mechs/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/syndie_murdysseus_upgrade()
	blueprints[2] = new /datum/design/syndie_gygax_upgrade()
	blueprints[3] = new /datum/design/syndie_durand_upgrade()

/obj/item/disk/design_disk/nt_mechs
	name = "design disk - NT mecha modifications"
	desc = "A design disk containing specifications for NT-custom mecha conversions."
	color = "#5ae8d9"
	max_blueprints = 1

/obj/item/disk/design_disk/nt_mechs/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/nt_gygax_upgrade()

/obj/item/disk/design_disk/inteq_mechs
	name = "design disk - InteQ mecha modifications"
	desc = "A design disk containing specifications for InteQ-custom mecha conversions."
	color = "#ea8927"
	max_blueprints = 2

/obj/item/disk/design_disk/inteq_mechs/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/inteq_gygax_upgrade()
	blueprints[2] = new /datum/design/inteq_durand_upgrade()

/obj/item/disk/design_disk/solgov_mechs
	name = "design disk - Solgov mecha modifications"
	desc = "A design disk containing specifications for SolFed-custom mecha conversions."
	color = "#0900c1"
	max_blueprints = 1

/obj/item/disk/design_disk/solgov_mechs/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/solgov_durand_upgrade()

/obj/item/disk/design_disk/pub_mechs
	name = "design disk - White mecha modifications"
	desc = "A design disk containing specifications for White-custom mecha conversions."
	color = "#c0c0c0"
	max_blueprints = 15

/obj/item/disk/design_disk/pub_mechs/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/flames_red_upgrade() // рипли
	blueprints[2] = new /datum/design/earth_upgrade()
	blueprints[3] = new /datum/design/titan_upgrade()
	blueprints[4] = new /datum/design/ripley_zairjah_upgrade()
	blueprints[5] = new /datum/design/aluminizer_upgrade()
	blueprints[6] = new /datum/design/white_gygax_upgrade() //гигаксы
	blueprints[7] = new /datum/design/proto_gygax_upgrade()
	blueprints[8] = new /datum/design/alt_gygax_upgrade()
	blueprints[9] = new /datum/design/pobeda_gygax_upgrade()
	blueprints[10] = new /datum/design/medgax_upgrade()
	blueprints[11] = new /datum/design/old_durand_upgrade() //дюранды
	blueprints[12] = new /datum/design/shire_durand_upgrade()
	blueprints[13] = new /datum/design/sarathi_durand_upgrade()
	blueprints[14] = new /datum/design/dollhouse_durand_upgrade()
	blueprints[15] = new /datum/design/executor_durand_upgrade()
