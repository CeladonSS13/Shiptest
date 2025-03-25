/obj/structure/curtain/cloth/purpl
	icon = 'mod_celadon/_storge_icons/icons/structures/fancy.dmi'
	icon_type = "purpl_fancy"
	icon_state = "purpl_fancy-open"

/obj/structure/curtain/cloth/blacknormal
	icon = 'mod_celadon/_storge_icons/icons/structures/fancy.dmi'
	icon_type = "black_fancy"
	icon_state = "black_fancy-open"


/turf/open/floor/plating/asteroid/sand/wet
	icon = 'icons/turf/floors.dmi'
	icon_state = "wet_soft0"
	base_icon_state = "wet_soft"

/turf/open/floor/plating/asteroid/whitesandsdriedair
	name = "dried sand air"
	baseturfs = /turf/open/floor/plating/asteroid/whitesandsdriedair
	icon = 'icons/turf/floors/ws_floors.dmi'
	icon_state = "dried_up"
	icon_plating = "dried_up"
	base_icon_state = WHITESANDS_DRIED_ENV
	digResult = /obj/item/stack/ore/glass/whitesands

/turf/open/floor/whitesandsdriedair
	name = "dried sand air"
	baseturfs = /turf/open/floor/whitesandsdriedair
	icon = 'icons/turf/floors/ws_floors.dmi'
	icon_state = "dried_up"
	icon_plating = "dried_up"
	base_icon_state = WHITESANDS_DRIED_ENV
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND

// Новая разновидность снега, просто рескин
/turf/open/floor/plating/asteroid/snow/temperatre/snow
	icon = 'mod_celadon/_storge_icons/icons/structures/snow.dmi'
	icon_state = "snow"
	icon_plating = "snow"

// А вот это уже глубокий снег и он ещё сильнее замедляет передвижение
/turf/open/floor/plating/asteroid/snow/temperatre/snow_rough
	name = "snow rough"
	desc = "It's so rough snow."
	slowdown = 2.5
	icon = 'mod_celadon/_storge_icons/icons/structures/snow.dmi'
	icon_state = "snow_rough"
	icon_plating = "snow_rough"


// Растительность для снега
/obj/structure/flora/rock/pile/icy_stone
	name = "icey stone"
	icon = 'mod_celadon/_storge_icons/icons/structures/snow.dmi'
	icon_state = "snowstone"

/obj/structure/flora/rock/pile/icy_stone/Initialize()
	. = ..()
	icon_state = "snowstone"

/obj/structure/flora/ausbushes/snowshrub
	icon = 'mod_celadon/_storge_icons/icons/structures/snow.dmi'
	icon_state = "snowshrub"

/obj/structure/flora/ausbushes/snowshrub/Initialize()
	. = ..()
	icon_state = "snowshrub"

// MARK: DARK

/turf/open/floor/plasteel/strongdark
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "dark"
	base_icon_state = "dark"
	floor_tile = /obj/item/stack/tile/plasteel/strongdark

/turf/open/floor/plasteel/strongdark/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/dark_2
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "dark"
	base_icon_state = "dark"
	floor_tile = /obj/item/stack/tile/plasteel/dark_2

/turf/open/floor/plasteel/dark_2/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/lightdark
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "lightdark"
	base_icon_state = "lightdark"
	floor_tile = /obj/item/stack/tile/plasteel/lightdark

/turf/open/floor/plasteel/lightdark/airless
	initial_gas_mix = AIRLESS_ATMOS

// MARK:  yellow
/turf/open/floor/plasteel/darkyellowfull
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkyellowfull"
	base_icon_state = "darkyellowfull"
	floor_tile = /obj/item/stack/tile/plasteel/darkyellowfull

/turf/open/floor/plasteel/darkyellowfull/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkyellowfull/darkyellow
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkyellow"
	base_icon_state = "darkyellow"
	floor_tile = /obj/item/stack/tile/plasteel/darkyellow

/turf/open/floor/plasteel/darkyellowfull/darkyellow/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkyellowfull/darkyellowcorners
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkyellowcorners"
	base_icon_state = "darkyellowcorners"
	floor_tile = /obj/item/stack/tile/plasteel/darkyellowcorners

/turf/open/floor/plasteel/darkyellowfull/darkyellowcorners/airless
	initial_gas_mix = AIRLESS_ATMOS

// MARK:  green
/turf/open/floor/plasteel/darkgreenfull
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkgreenfull"
	base_icon_state = "darkgreenfull"
	floor_tile = /obj/item/stack/tile/plasteel/darkgreenfull

/turf/open/floor/plasteel/darkgreenfull/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkgreenfull/darkgreen
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkgreen"
	base_icon_state = "darkgreen"
	floor_tile = /obj/item/stack/tile/plasteel/darkgreen

/turf/open/floor/plasteel/darkgreenfull/darkgreen/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkgreenfull/darkgreencorners
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkgreencorners"
	base_icon_state = "darkgreencorners"
	floor_tile = /obj/item/stack/tile/plasteel/darkgreencorners

/turf/open/floor/plasteel/darkgreenfull/darkgreencorners/airless
	initial_gas_mix = AIRLESS_ATMOS

// MARK:  blue
/turf/open/floor/plasteel/darkbluefull
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkbluefull"
	base_icon_state = "darkbluefull"
	floor_tile = /obj/item/stack/tile/plasteel/darkbluefull

/turf/open/floor/plasteel/darkbluefull/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkbluefull/darkblue
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkblue"
	base_icon_state = "darkblue"
	floor_tile = /obj/item/stack/tile/plasteel/darkblue

/turf/open/floor/plasteel/darkbluefull/darkblue/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkbluefull/darkbluecorners
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkbluecorners"
	base_icon_state = "darkbluecorners"
	floor_tile = /obj/item/stack/tile/plasteel/darkbluecorners

/turf/open/floor/plasteel/darkbluefull/darkbluecorners/airless
	initial_gas_mix = AIRLESS_ATMOS

// MARK:  red
/turf/open/floor/plasteel/darkredfull
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkredfull"
	base_icon_state = "darkredfull"
	floor_tile = /obj/item/stack/tile/plasteel/darkredfull

/turf/open/floor/plasteel/darkredfull/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkredfull/darkred
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkred"
	base_icon_state = "darkred"
	floor_tile = /obj/item/stack/tile/plasteel/darkred

/turf/open/floor/plasteel/darkredfull/darkred/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkredfull/darkredcorners
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkredcorners"
	base_icon_state = "darkredcorners"
	floor_tile = /obj/item/stack/tile/plasteel/darkredcorners

/turf/open/floor/plasteel/darkredfull/darkredcorners/airless
	initial_gas_mix = AIRLESS_ATMOS

// MARK:  purple
/turf/open/floor/plasteel/darkpurplefull
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkpurplefull"
	base_icon_state = "darkpurplefull"
	floor_tile = /obj/item/stack/tile/plasteel/darkpurplefull

/turf/open/floor/plasteel/darkpurplefull/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkpurplefull/darkpurple
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkpurple"
	base_icon_state = "darkpurple"
	floor_tile = /obj/item/stack/tile/plasteel/darkpurple

/turf/open/floor/plasteel/darkpurplefull/darkpurple/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkpurplefull/darkpurplecorners
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkpurplecorners"
	base_icon_state = "darkpurplecorners"
	floor_tile = /obj/item/stack/tile/plasteel/darkpurplecorners

/turf/open/floor/plasteel/darkpurplefull/darkpurplecorners/airless
	initial_gas_mix = AIRLESS_ATMOS

// MARK:  brown
/turf/open/floor/plasteel/darkbrownfull
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkbrownfull"
	base_icon_state = "darkbrownfull"
	floor_tile = /obj/item/stack/tile/plasteel/darkbrownfull

/turf/open/floor/plasteel/darkbrownfull/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkbrownfull/darkbrown
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkbrown"
	base_icon_state = "darkbrown"
	floor_tile = /obj/item/stack/tile/plasteel/darkbrown

/turf/open/floor/plasteel/darkbrownfull/darkbrown/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/darkbrownfull/darkbrowncorners
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/dark.dmi'
	icon_state = "darkbrowncorners"
	base_icon_state = "darkbrowncorners"
	floor_tile = /obj/item/stack/tile/plasteel/darkbrowncorners

/turf/open/floor/plasteel/darkbrownfull/darkbrowncorners/airless
	initial_gas_mix = AIRLESS_ATMOS

// MARK: HEAVY METALL

/turf/open/floor/plasteel/heavymetal
	icon = 'mod_celadon/_storge_icons/icons/structures/floors/metal_2.dmi'
	icon_state = "metal_1"
	base_icon_state = "metal_1"
	floor_tile = /obj/item/stack/tile/plasteel/heavymetal

/turf/open/floor/plasteel/heavymetal/var1
	icon_state = "metal_2"
	base_icon_state = "metal_2"
	floor_tile = /obj/item/stack/tile/plasteel/heavymetal/var1

/turf/open/floor/plasteel/heavymetal/var2
	icon_state = "metal_3"
	base_icon_state = "metal_3"
	floor_tile = /obj/item/stack/tile/plasteel/heavymetal/var2

/turf/open/floor/plasteel/heavymetal/var3
	icon_state = "metal_4"
	base_icon_state = "metal_4"
	floor_tile = /obj/item/stack/tile/plasteel/heavymetal/var3

/turf/open/floor/plasteel/heavymetal/var4
	icon_state = "metal_5"
	base_icon_state = "metal_5"
	floor_tile = /obj/item/stack/tile/plasteel/heavymetal/var4

/turf/open/floor/plasteel/heavymetal/var5
	icon_state = "metal_6"
	base_icon_state = "metal_6"
	floor_tile = /obj/item/stack/tile/plasteel/heavymetal/var5

/obj/structure/railing/thin
	icon_state = "railing_thin"

/obj/structure/railing/thin/corner
	icon_state = "railing_thin_corner"
	density = FALSE
	climbable = FALSE
	buildstackamount = 1
