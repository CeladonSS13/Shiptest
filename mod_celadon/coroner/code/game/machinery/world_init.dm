// World initialization for coroner systems
/world/New()
	. = ..()
	spawn(50) // Delay to ensure world is loaded
		new /obj/effect/body_recovery_drone(locate(1,1,1))
		to_chat(world, "<span class='boldnotice'>SYSTEM: Body recovery drone initialized on world start</span>")