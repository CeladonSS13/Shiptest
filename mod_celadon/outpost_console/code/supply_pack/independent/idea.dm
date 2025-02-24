// IDEA была сделана для силиконов и интересных ящиков с карго для сборки весёлых вещей. Это позволит сделать их доступнее вне РнД кораблей, что и без того редко имели тех.
// Именно поэтому ценники на ИИ и Боргов столь низки
/obj/item/paper/idea
	name = "IDEA assembly Instruction"
	desc = "Average IDEA boring instructions with bunch of pictures and text"

/datum/supply_pack/faction/independent/idea
	group = "IDEA"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/faction/independent/idea/silicon
	name = "This is silicon IDEA"
	crate_name = "IDEA"

/datum/supply_pack/faction/independent/idea/silicon/ai
	name = "AI core assembly crate"
	desc = "Get an AI today! Contains everything for AI assembly, empty shell assembly, law changing circuits."
	cost = 2000
	contains = list(
					/obj/item/paper/idea{
					default_raw_text = "<center><h1 style='background-color:red;'>Thank you for shopping in Space IDEA!</h1></center><h2 align='center'>Instructions for assembling AI shell</h2><p>1. Secure AI core bolts with the provided wrench</p><p>2. Insert 'AI core' circuit board inside the slot in core</p><p>3. Secure circuit board screws with the provided screwdriver</p><p>4. Add wires according to the instructions</p><p>5. (Optional) Upload any custom laws that you'd like to this AI core with an AI module. Laws vary.</p><p>6. Turn on positronic brain by clicking on a big button on it, while its loading, it will glow yellow</p><p>7. Wait for brain to activate, now, it should beep loudly and now glow with light blue actively moving lines. </p><p>8. Place active positronic brain inside</p><p>9. Add two (2) reinforced glass to the AI shell</p><p>10. Secure glass screws with screwdriver</p><i><p><center> Note: Warranty void if exposed to: High Humidity, High Temperatures, Grass, Mud, The Jungle, lonely Robotists.</center></p></i>"
					},
// Pars for AI shell
					/obj/structure/AIcore,
					/obj/item/circuitboard/aicore,
					/obj/item/stack/sheet/rglass,
					/obj/item/stack/sheet/rglass,
					/obj/item/stack/cable_coil/red,
					/obj/item/mmi/posibrain/ipc,
//Instruments
					/obj/item/screwdriver,
					/obj/item/wrench/crescent,
// Law circuits
					/obj/item/aiModule/reset/purge,
					/obj/item/aiModule/reset,
					/obj/item/aiModule/core/full/corp,
					/obj/item/aiModule/core/full/asimov,
					/obj/item/aiModule/core/freeformcore,
// Cameras
					/obj/item/wallframe/camera,
					/obj/item/wallframe/camera,
					/obj/item/wallframe/camera,
					/obj/item/wallframe/camera,
					/obj/item/wallframe/camera,
					/obj/item/wallframe/camera,
					/obj/item/wallframe/camera,
					/obj/item/wallframe/camera,
					/obj/item/wallframe/camera)
	crate_name = "AI core assembly crate"

/datum/supply_pack/faction/independent/idea/silicon/ai_shell
	name = "Cyborg shell for AI"
	desc = "Cyborg shell for your AI! Contains cyborg shell assembly kit for an AI and B.O.R.I.S module"
	cost = 1500
	contains = list(
					/obj/item/paper/idea{
					default_raw_text = "<center><h1 style='background-color:red;'>Thank you for shopping in Space IDEA!</h1></center><h2 align='center'>Instructions for assembling AI shell</h2><p>1. Insert into borg body one (1) power cell and five (5) parts of coil</p><p>2. Insert into borg head two (2) flashes</p><p>3. Place all cyborg parts on exoskeleton of borg</p><p>4. Turn on positronic brain by clicking on a big button on it, while its loading, it will glow yellow</p><p>5. Wait for brain to activate, now, it should beep loudly and now glow with light blue actively moving lines. </p><p>6. Insert 'B.O.R.I.S Module' module board into the finished shell</p><p>7. Shell is ready to be entered by AI.</p><i><p><center> Note: Warranty void if exposed to: High Humidity, High Temperatures, Grass, Mud, The Jungle, lonely Robotists.</center></p></i>"
					},
					/obj/item/borg/upgrade/ai,
					/obj/item/bodypart/head/robot,
					/obj/item/bodypart/chest/robot,
					/obj/item/bodypart/r_arm/robot,
					/obj/item/bodypart/l_arm/robot,
					/obj/item/bodypart/leg/left/robot,
					/obj/item/bodypart/leg/right/robot,
					/obj/item/robot_suit,
					/obj/item/stock_parts/cell/high,
					/obj/item/stock_parts/cell/high,
					/obj/item/assembly/flash/handheld,
					/obj/item/assembly/flash/handheld,
					/obj/item/stack/cable_coil/red)
	crate_name = "AI cyborg shell assembly crate"

/datum/supply_pack/faction/independent/idea/silicon/robot
	name = "Cyborg assembly crate"
	desc = "Build your own silicon friend only for 2000 credits! Contains all parts besides law changing circuits and carging station."
	cost = 1250
	contains = list(/obj/item/paper/idea{
					default_raw_text = "<center><h1 style='background-color:red;'>Thank you for shopping Space IDEA!</h1></center><h2 align='center'>Instructions for assembling YOUR Cyborg</h2><p>1. Insert into borg body one (1) power cell and five (5) parts of coil</p><p>2. Insert into borg head two (2) flashes</p><p>3. Place all cyborg parts on exoskeleton of borg</p><p>4. Turn on positronic brain by clicking on a big button on it, while its loading, it will glow yellow</p><p>5. Wait for brain to activate, now, it should beep loudly and now glow with light blue actively moving lines</p><p>6. Place positronic brain inside cyborg</p><i><p><center> Note: Warranty void if exposed to: High Humidity, High Temperatures, Grass, Mud, The Jungle, lonely Robotists.</center></p></i>"
					},
					/obj/item/bodypart/head/robot,
					/obj/item/bodypart/chest/robot,
					/obj/item/bodypart/r_arm/robot,
					/obj/item/bodypart/l_arm/robot,
					/obj/item/bodypart/leg/left/robot,
					/obj/item/bodypart/leg/right/robot,
					/obj/item/robot_suit,
					/obj/item/stock_parts/cell/high/plus,
					/obj/item/stock_parts/cell/high/plus,
					/obj/item/assembly/flash/handheld,
					/obj/item/assembly/flash/handheld,
					/obj/item/mmi/posibrain/ipc,
					/obj/item/stack/cable_coil/red)
	crate_name = "Cyborg assembly crate"

/datum/supply_pack/faction/independent/idea/robotics
	name = "Bots Assembly Crate"
	desc = "Get your own affordable little helpers, cheaper than a gun! Floor-cleaning, tile-placing, wound-tending, fire-extinguishing botters only for 2100 credits!"
	cost = 2500
	contains = list(/obj/item/paper/idea{
					default_raw_text = "<center><h1 style='background-color:red;'>Thank you for shopping Space IDEA!</h1></center><h2 align='center'>Instructions for assembling YOUR Bots</h2><p>For Cleanbot:</p><p>1. Attach a robot arm and your Cleanbot is ready!</p><p>For Firebot:</p><p>1. Attach robot arm to fire extinguisher </p><p>2. But on a helmet on the fire extinguisher</p><p>3. Insert proximity sensor inside and your Firebot is ready!</p><p>For Floorbot:</p><p>1. Insert 10 floor tiles in toolbox</p><p>2. Insert proximity sensor inside</p><p>3. Attach a robot arm and your Floorbot is ready!</p><p>For Medibot:</p><p>1. Attach robot arm to medkit</p><p>2. Attach health sensor for this construction</p><p>3. Insert the Proximity Sensor and your Medibot is ready</p><i><p><center> Note: Warranty void if exposed to: High Humidity, High Temperatures, Grass, Mud, The Jungle, lonely Robotists.</center></p></i>"
					},
					/obj/item/assembly/prox_sensor,
					/obj/item/assembly/prox_sensor,
					/obj/item/assembly/prox_sensor,
					/obj/item/assembly/prox_sensor,
					/obj/item/bodypart/r_arm/robot,
					/obj/item/bodypart/r_arm/robot,
					/obj/item/bodypart/r_arm/robot,
					/obj/item/bodypart/r_arm/robot,
					/obj/item/storage/firstaid,
					/obj/item/storage/firstaid,
					/obj/item/healthanalyzer,
					/obj/item/healthanalyzer,
					/obj/item/clothing/head/hardhat/red,
					/obj/item/clothing/head/hardhat/red,
					/obj/item/extinguisher,
					/obj/item/extinguisher,
					/obj/item/stack/tile/plasteel{
					amount = 20
					},
					/obj/item/storage/toolbox/,
					/obj/item/storage/toolbox/,
					/obj/item/bot_assembly/cleanbot,
					/obj/item/bot_assembly/cleanbot)
	crate_name = "Bots assembly crate"
