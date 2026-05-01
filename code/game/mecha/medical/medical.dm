/obj/mecha/medical
// [CELADON-EDIT] - QoL
//	internals_req_access = list(ACCESS_MECH_SCIENCE, ACCESS_MECH_MEDICAL)
	internals_req_access = 0
// [/CELADON-EDIT]

/obj/mecha/medical/mechturn(direction)
	. = ..()
	if(!strafe && !occupant.client.keys_held["Alt"])
		mechstep(direction) //agile mechs get to move and turn in the same step
