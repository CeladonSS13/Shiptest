/obj/effect/portal/permanent/random
	name = "random portal"
	desc = "A mysterious portal that leads to random destinations."
	var/list/portal_ids = list()

/obj/effect/portal/permanent/random/set_linked()
	if(!portal_ids.len)
		return

	var/list/possible_portals = list()
	for(var/obj/effect/portal/permanent/P in GLOB.portals - src)
		if(P.id in portal_ids)
			possible_portals += P

	if(possible_portals.len)
		linked = pick(possible_portals)
	else
		linked = null

/obj/effect/portal/permanent/random/teleport(atom/movable/M, force = FALSE)
	set_linked()
	if(!linked)
		do_teleport(M, get_turf(src), 10)
		return
	. = ..(M, force)
