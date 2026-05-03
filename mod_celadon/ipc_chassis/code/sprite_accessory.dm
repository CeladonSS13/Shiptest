
/// sprite_accessory

/datum/sprite_accessory/ipc_screens/none
	name = "None"
	icon_state = "none"

// MARK: DATUMS IPS

/datum/sprite_accessory/ipc_chassis/standart // Used for changing limb icons, doesn't need to hold the actual icon. That's handled in ipc.dm
	name = "EX - Custom Android chassis"
	icon = 'mod_celadon/_storage_icons/icons/species/ipc/bodyparts.dmi'
	icon_state = "android" // In order to pull the chassis correctly, we need AN icon_state(see line 36-39). It doesn't have to be useful, because it isn't used.
	color_src = 0
	/// Associated list of bodyparts by zone.
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart,
	)
	/// Associated list of features granted by this chassis and their default values.
	chassis_features = list()

/datum/sprite_accessory/ipc_chassis/standart/bishop_android_main
	name = "EX - Bishop AC"
	limbs_id = "bm"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/bishop_android_main,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/bishop_android_main,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/bishop_android_main,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/bishop_android_main,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/bishop_android_main,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/bishop_android_main,
	)

/datum/sprite_accessory/ipc_chassis/standart/bishop_android_alternative
	name = "EX - Bishop AC - alternative"
	limbs_id = "bm_alt"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/bishop_android_alternative,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/bishop_android_alternative,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/bishop_android_alternative,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/bishop_android_alternative,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/bishop_android_alternative,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/bishop_android_alternative,
	)

/datum/sprite_accessory/ipc_chassis/standart/bishop_android_rook
	name = "EX - Bishop AC - rook"
	limbs_id = "bm_rook"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/bishop_android_rook,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/bishop_android_rook,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/bishop_android_rook,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/bishop_android_rook,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/bishop_android_rook,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/bishop_android_rook,
	)

/datum/sprite_accessory/ipc_chassis/standart/cpu4mu
	name = "EX - CPU 4 MU"
	limbs_id = "cpu4mu"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/cpu4mu,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/cpu4mu,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/cpu4mu,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/cpu4mu,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/cpu4mu,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/cpu4mu,
	)

/datum/sprite_accessory/ipc_chassis/standart/hephaestus_main
	name = "EX - Hephaestus AC"
	limbs_id = "hs"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/hephaestus_main,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/hephaestus_main,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/hephaestus_main,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/hephaestus_main,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/hephaestus_main,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/hephaestus_main,
	)

/datum/sprite_accessory/ipc_chassis/standart/hephaestus_alt
	name = "EX - Hephaestus AC - alternative"
	limbs_id = "hs_alt"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/hephaestus_alt,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/hephaestus_alt,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/hephaestus_alt,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/hephaestus_alt,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/hephaestus_alt,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/hephaestus_alt,
	)

/datum/sprite_accessory/ipc_chassis/standart/hephaestus_titan
	name = "EX - Hephaestus AC - titan"
	limbs_id = "hs_t"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/hephaestus_titan,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/hephaestus_titan,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/hephaestus_titan,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/hephaestus_titan,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/hephaestus_titan,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/hephaestus_titan,
	)

/datum/sprite_accessory/ipc_chassis/standart/morpheus_main
	name = "EX - Morpheus AC"
	limbs_id = "ms"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/morpheus_main,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/morpheus_main,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/morpheus_main,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/morpheus_main,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/morpheus_main,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/morpheus_main,
	)

/datum/sprite_accessory/ipc_chassis/standart/morpheus_airborne
	name = "EX - Morpheus AC - airborne"
	limbs_id = "ms_ab"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/morpheus_airborne,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/morpheus_airborne,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/morpheus_airborne,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/morpheus_airborne,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/morpheus_airborne,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/morpheus_airborne,
	)

/datum/sprite_accessory/ipc_chassis/standart/morpheus_atlantis
	name = "EX - Morpheus AC - atlantis"
	limbs_id = "ms_at"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/morpheus_atlantis,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/morpheus_atlantis,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/morpheus_atlantis,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/morpheus_atlantis,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/morpheus_atlantis,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/morpheus_atlantis,
	)

/datum/sprite_accessory/ipc_chassis/standart/morpheus_blitz
	name = "EX - Morpheus AC - blitz"
	limbs_id = "ms_bl"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/morpheus_blitz,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/morpheus_blitz,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/morpheus_blitz,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/morpheus_blitz,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/morpheus_blitz,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/morpheus_blitz,
	)

/datum/sprite_accessory/ipc_chassis/standart/morpheus_prime
	name = "EX - Morpheus AC - prime"
	limbs_id = "ms_pr"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/morpheus_prime,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/morpheus_prime,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/morpheus_prime,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/morpheus_prime,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/morpheus_prime,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/morpheus_prime,
	)

/datum/sprite_accessory/ipc_chassis/standart/morpheus_mantis
	name = "EX - Morpheus AC - mantis"
	limbs_id = "ms_mantis"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/morpheus_mantis,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/morpheus_mantis,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/morpheus_mantis,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/morpheus_mantis,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/morpheus_mantis,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/morpheus_mantis,
	)

/datum/sprite_accessory/ipc_chassis/standart/nanotrasen_main
	name = "EX - Nanotrasen AC"
	limbs_id = "ns"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/nanotrasen_main,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/nanotrasen_main,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/nanotrasen_main,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/nanotrasen_main,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/nanotrasen_main,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/nanotrasen_main,
	)

/datum/sprite_accessory/ipc_chassis/standart/shellg_main
	name = "EX - Shellguard AC"
	limbs_id = "sg_m"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/shellg_main,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/shellg_main,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/shellg_main,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/shellg_main,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/shellg_main,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/shellg_main,
	)

/datum/sprite_accessory/ipc_chassis/standart/shellg_alt
	name = "EX - Shellguard AC - alternative"
	limbs_id = "sg_alt"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/shellg_alt,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/shellg_alt,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/shellg_alt,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/shellg_alt,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/shellg_alt,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/shellg_alt,
	)

/datum/sprite_accessory/ipc_chassis/standart/veymed_female
	name = "EX - Veymed AC - female"
	limbs_id = "veymed_f"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/veymed_female,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/veymed_female,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/veymed_female,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/veymed_female,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/veymed_female,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/veymed_female,
	)

/datum/sprite_accessory/ipc_chassis/standart/veymed_male
	name = "EX - Veymed AC - male"
	limbs_id = "veymed_m"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/veymed_male,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/veymed_male,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/veymed_male,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/veymed_male,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/veymed_male,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/veymed_male,
	)

/datum/sprite_accessory/ipc_chassis/standart/wardtakahashi_main
	name = "EX - Wardtakahashi AC"
	limbs_id = "wt"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/wardtakahashi_main,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/wardtakahashi_main,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/wardtakahashi_main,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/wardtakahashi_main,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/wardtakahashi_main,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/wardtakahashi_main,
	)

/datum/sprite_accessory/ipc_chassis/standart/wardtakahashi_alt
	name = "EX - Wardtakahashi AC - alternative"
	limbs_id = "wt_alt"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/wardtakahashi_alt,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/wardtakahashi_alt,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/wardtakahashi_alt,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/wardtakahashi_alt,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/wardtakahashi_alt,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/wardtakahashi_alt,
	)

/datum/sprite_accessory/ipc_chassis/standart/wardtakahashi_economy
	name = "EX - Wardtakahashi AC - economy"
	limbs_id = "wt_eco"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/wardtakahashi_economy,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/wardtakahashi_economy,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/wardtakahashi_economy,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/wardtakahashi_economy,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/wardtakahashi_economy,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/wardtakahashi_economy,
	)

/datum/sprite_accessory/ipc_chassis/standart/xion_main
	name = "EX - Xion AC"
	limbs_id = "xn"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/xion_main,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/xion_main,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/xion_main,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/xion_main,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/xion_main,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/xion_main,
	)

/datum/sprite_accessory/ipc_chassis/standart/xion_alt
	name = "EX - Xion AC - alternative"
	limbs_id = "xn_alt"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/xion_alt,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/xion_alt,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/xion_alt,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/xion_alt,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/xion_alt,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/xion_alt,
	)

/datum/sprite_accessory/ipc_chassis/standart/xion_economy
	name = "EX - Xion AC - economy"
	limbs_id = "xn_eco"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/xion_economy,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/xion_economy,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/xion_economy,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/xion_economy,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/xion_economy,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/xion_economy,
	)

/datum/sprite_accessory/ipc_chassis/standart/zion_main
	name = "EX - Zion AC"
	limbs_id = "zen"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/zion_main,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/zion_main,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/zion_main,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/zion_main,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/zion_main,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/zion_main,
	)

/datum/sprite_accessory/ipc_chassis/standart/morpheus
	name = "EX - Zion AC - spirit"
	limbs_id = "zen_sp"
	chassis_bodyparts = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ipc/standart/zion_spirit,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ipc/standart/zion_spirit,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/ipc/standart/zion_spirit,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/ipc/standart/zion_spirit,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ipc/standart/zion_spirit,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ipc/standart/zion_spirit,
	)
