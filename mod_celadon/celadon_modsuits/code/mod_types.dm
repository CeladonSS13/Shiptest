/obj/item/mod/control/pre_equipped/revolutionizer
	req_access = list(ACCESS_OUTPOST_FACTION_NT)
	theme = /datum/mod_theme/revolutionizer
	applied_cell = /obj/item/stock_parts/cell
	initial_modules = list(
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/welding,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/flashlight,
	)


/obj/item/mod/control/pre_equipped/falke
	req_access = list(ACCESS_OUTPOST_FACTION_SOLFED)
	theme = /datum/mod_theme/falke
	applied_cell = /obj/item/stock_parts/cell/super
	initial_modules = list(
		/obj/item/mod/module/blood_replika,
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/welding,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/anomaly_locked/kinesis/prebuilt,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/flashlight,
	)


/obj/item/mod/control/pre_equipped/storch
	req_access = list(ACCESS_OUTPOST_FACTION_SOLFED)
	theme = /datum/mod_theme/storch
	applied_cell = /obj/item/stock_parts/cell/super
	initial_modules = list(
		/obj/item/mod/module/blood_replika,
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/welding,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/flashlight,
	)

/obj/item/mod/control/pre_equipped/responsory
	req_access = list(ACCESS_OUTPOST_FACTION_NT)

/obj/item/mod/control/pre_equipped/magnate
	req_access = list(ACCESS_OUTPOST_FACTION_NT)

/obj/item/mod/control/pre_equipped/safeguard
	req_access = list(ACCESS_OUTPOST_FACTION_NT)

/obj/item/mod/control/pre_equipped/syndicate
	req_access = list(ACCESS_OUTPOST_FACTION_SYNDICATE)

/obj/item/mod/control/pre_equipped/elite
	req_access = list(ACCESS_OUTPOST_FACTION_SYNDICATE)


// MARK: Пустые для карго

/obj/item/mod/control/pre_equipped/safeguard/empty
	theme = /datum/mod_theme/safeguard
	applied_cell = /obj/item/stock_parts/cell/super
	initial_modules = list(
		/obj/item/mod/module/storage,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/megaphone,
		/obj/item/mod/module/holster,
		/obj/item/mod/module/visor/sechud
	)

/obj/item/mod/control/pre_equipped/responsory/empty
	applied_cell = /obj/item/stock_parts/cell/super
	initial_modules = list(
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/welding,
		/obj/item/mod/module/flashlight,
	)
	insignia_type = /obj/item/mod/module/insignia
	additional_module = null

/obj/item/mod/control/pre_equipped/syndicate/empty
	applied_cell = /obj/item/stock_parts/cell/hyper
	initial_modules = list(
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/flashlight,
	)

/obj/item/mod/control/pre_equipped/elite/empty
	applied_cell = /obj/item/stock_parts/cell/hyper
	initial_modules = list(
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/jetpack/advanced,
		/obj/item/mod/module/flashlight,
	)

/obj/item/mod/control/pre_equipped/falke/empty
	applied_cell = /obj/item/stock_parts/cell/super
	initial_modules = list(
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/welding,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/flashlight,
	)

/obj/item/mod/control/pre_equipped/storch/empty
	applied_cell = /obj/item/stock_parts/cell/super
	initial_modules = list(
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/welding,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/flashlight,
	)
