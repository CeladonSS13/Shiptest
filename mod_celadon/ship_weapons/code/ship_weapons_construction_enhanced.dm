// Enhanced ship weapon construction examples

// Light weapons - fast, accurate, low damage
/obj/machinery/porta_turret/ship/weapon_system/laser/light
	name = "light pulse laser"
	desc = "A rapid-fire laser turret designed for point defense and light targets."
	weapon_class = WEAPON_CLASS_LIGHT
	weapon_range = 18
	charge_cost = 200
	charge_time = 15
	base_damage = 30
	cooldown_time = 5
	base_accuracy = 95
	accuracy_falloff = 1
	tracking_speed = 1.5
	weapon_burst_count = 2

// Anti-fighter weapons
/obj/machinery/porta_turret/ship/weapon_system/ballistic/point_defense
	name = "point defense cannon"
	desc = "A high-rate ballistic weapon designed to intercept small, fast targets."
	weapon_class = WEAPON_CLASS_LIGHT
	weapon_range = 12
	charge_cost = 50
	charge_time = 5
	weapon_burst_count = 8
	base_damage = 20
	cooldown_time = 3
	base_accuracy = 90
	accuracy_falloff = 3
	tracking_speed = 2.0
	armor_penetration = 5

// Long-range sniper weapons
/obj/machinery/porta_turret/ship/weapon_system/laser/sniper
	name = "long-range laser cannon"
	desc = "A precision laser weapon optimized for long-range engagements."
	weapon_class = WEAPON_CLASS_MEDIUM
	weapon_range = 28
	charge_cost = 600
	charge_time = 40
	base_damage = 90
	cooldown_time = 25
	base_accuracy = 95
	accuracy_falloff = 0.5
	tracking_speed = 0.8

// Armor-piercing weapons
/obj/machinery/porta_turret/ship/weapon_system/ballistic/armor_piercing
	name = "armor-piercing cannon"
	desc = "A heavy ballistic weapon designed to penetrate thick armor plating."
	weapon_class = WEAPON_CLASS_HEAVY
	weapon_range = 20
	charge_cost = 500
	charge_time = 35
	weapon_burst_count = 1
	base_damage = 140
	cooldown_time = 30
	base_accuracy = 70
	accuracy_falloff = 2
	tracking_speed = 0.6
	armor_penetration = 40

// Rapid-fire weapons
/obj/machinery/porta_turret/ship/weapon_system/ballistic/gatling
	name = "gatling cannon"
	desc = "A multi-barrel rotary cannon capable of sustained rapid fire."
	weapon_class = WEAPON_CLASS_MEDIUM
	weapon_range = 16
	charge_cost = 300
	charge_time = 20
	weapon_burst_count = 12
	base_damage = 25
	cooldown_time = 8
	base_accuracy = 75
	accuracy_falloff = 3
	tracking_speed = 1.1
	armor_penetration = 8

// Specialized missile types
/obj/machinery/porta_turret/ship/weapon_system/explosive/torpedo
	name = "torpedo launcher"
	desc = "A heavy torpedo launcher for devastating long-range strikes."
	weapon_class = WEAPON_CLASS_HEAVY
	weapon_range = 30
	charge_cost = 1500
	charge_time = 120
	ammo_count = 4
	max_ammo = 4
	base_damage = 300
	cooldown_time = 60
	base_accuracy = 60
	accuracy_falloff = 0.5
	tracking_speed = 0.4

/obj/machinery/porta_turret/ship/weapon_system/explosive/cluster
	name = "cluster missile launcher"
	desc = "Fires missiles that split into multiple warheads for area damage."
	weapon_class = WEAPON_CLASS_MEDIUM
	weapon_range = 22
	charge_cost = 800
	charge_time = 45
	ammo_count = 8
	max_ammo = 8
	base_damage = 120
	cooldown_time = 25
	base_accuracy = 75
	accuracy_falloff = 1.5
	tracking_speed = 0.7
	weapon_burst_count = 3

// Experimental weapons
/obj/machinery/porta_turret/ship/weapon_system/beam/focused
	name = "focused beam projector"
	desc = "An experimental weapon that fires a concentrated energy beam."
	weapon_class = WEAPON_CLASS_HEAVY
	weapon_range = 25
	charge_cost = 2000
	charge_time = 150
	base_damage = 250
	cooldown_time = 80
	base_accuracy = 98
	accuracy_falloff = 0.2
	tracking_speed = 1.8
	armor_penetration = 60

/obj/machinery/porta_turret/ship/weapon_system/plasma/incendiary
	name = "incendiary plasma cannon"
	desc = "A plasma weapon that creates persistent fire effects on target."
	weapon_class = WEAPON_CLASS_HEAVY
	weapon_range = 20
	charge_cost = 1200
	charge_time = 90
	base_damage = 160
	cooldown_time = 50
	base_accuracy = 70
	accuracy_falloff = 4
	tracking_speed = 0.8