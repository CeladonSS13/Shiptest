/datum/export/tools
	cost = 4
	unit_name = "toolbox"
	export_types = list(/obj/item/storage/toolbox)

// mechanical toolbox:	22cr
// emergency toolbox:	17-20cr
// electrical toolbox:	36cr
// robust: priceless

// Basic tools
/datum/export/tools/screwdriver
	cost = 2
	unit_name = "screwdriver"
	export_types = list(/obj/item/screwdriver)
	include_subtypes = FALSE

/datum/export/tools/wrench
	cost = 2
	unit_name = "wrench"
	export_types = list(/obj/item/wrench)

/datum/export/tools/crowbar
	cost = 2
	unit_name = "crowbar"
	export_types = list(/obj/item/crowbar)

/datum/export/tools/wirecutters
	cost = 2
	unit_name = "pair of wirecutters"
	export_types = list(/obj/item/wirecutters)


/datum/export/tools/weldingtool
	cost = 5
	unit_name = "welding tool"
	export_types = list(/obj/item/weldingtool)
	include_subtypes = FALSE

/datum/export/tools/weldingtool/emergency
	cost = 2
	unit_name = "emergency welding tool"
	export_types = list(/obj/item/weldingtool/mini)

/datum/export/tools/weldingtool/industrial
	cost = 10
	unit_name = "industrial welding tool"
	export_types = list(/obj/item/weldingtool/largetank,
						/obj/item/weldingtool/hugetank)


/datum/export/tools/extinguisher
	cost = 15
	unit_name = "fire extinguisher"
	export_types = list(/obj/item/extinguisher)
	include_subtypes = FALSE

/datum/export/tools/extinguisher/mini
	cost = 2
	unit_name = "pocket fire extinguisher"
	export_types = list(/obj/item/extinguisher/mini)


/datum/export/tools/flashlight
	cost = 5
	unit_name = "flashlight"
	export_types = list(/obj/item/flashlight)
	include_subtypes = FALSE

/datum/export/tools/flashlight/flare
	cost = 2
	unit_name = "flare"
	export_types = list(/obj/item/flashlight/flare)

/datum/export/tools/flashlight/seclite
	cost = 10
	unit_name = "seclite"
	export_types = list(/obj/item/flashlight/seclite)


/datum/export/tools/analyzer
	cost = 5
	unit_name = "analyzer"
	export_types = list(/obj/item/analyzer)

/datum/export/tools/analyzer/t_scanner
	cost = 10
	unit_name = "t-ray scanner"
	export_types = list(/obj/item/t_scanner)


/datum/export/tools/radio
	cost = 5
	unit_name = "radio"
	export_types = list(/obj/item/radio)
	exclude_types = list(/obj/item/radio/mech)

//Advanced/Power Tools.
/datum/export/tools/weldingtool/electric
	cost = 45
	unit_name = "electrical welding tool"
	export_types = list(/obj/item/weldingtool/electric)

/datum/export/tools/jawsoflife
	cost = 50
	unit_name = "jaws of life"
	export_types = list(/obj/item/crowbar/power)

/datum/export/tools/handdrill
	cost = 50
	unit_name = "hand drill"
	export_types = list(/obj/item/screwdriver/power)

/datum/export/tools/rld_mini
	cost = 150
	unit_name = "mini rapid lighting device"
	export_types = list(/obj/item/construction/rld/mini)

/datum/export/tools/rsf
	cost = 100
	unit_name = "rapid service fabricator"
	export_types = list(/obj/item/rsf)

/datum/export/tools/rcd
	cost = 100
	unit_name = "rapid construction device"
	export_types = list(/obj/item/construction/rcd)

/datum/export/tools/rcd_ammo
	cost = 40
	unit_name = "compressed matter cardridge"
	export_types = list(/obj/item/rcd_ammo)

/datum/export/tools/rpd
	cost = 50
	unit_name = "rapid pipe dispenser"
	export_types = list(/obj/item/pipe_dispenser)
