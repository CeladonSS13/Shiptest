// Part from "code/modules/projectiles/boxes_magazines/_box_magazine.dm"

// Adds "shuffler" variable for spent bullets check
/obj/item/ammo_box
	/// used to check for spent ammo when picking up (if true then it will pick up spent ammo)
	var/shuffler = FALSE
