/datum/surgery/brain_surgery
	self_operable = FALSE

//open shell
/datum/surgery_step/mechanic_open
	implements = list(
		TOOL_SCREWDRIVER		= 100,
		TOOL_SCALPEL 			= 75, // med borgs could try to unscrew shell with scalpel
		/obj/item/melee/knife	= 50)

//close shell
/datum/surgery_step/mechanic_close
	implements = list(
		TOOL_SCREWDRIVER		= 100,
		TOOL_SCALPEL 			= 75,
		/obj/item/melee/knife	= 50)
