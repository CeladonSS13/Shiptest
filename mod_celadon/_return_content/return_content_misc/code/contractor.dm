// RETURN-CONTRACTOR
// MARK: Разум
// code/datums/mind.dm
/datum/mind/proc/make_Contractor_Support()
	if(!(has_antag_datum(/datum/antagonist/traitor/contractor_support)))
		add_antag_datum(/datum/antagonist/traitor/contractor_support)

// MARK: Контрактор
// code/modules/antagonists/traitor/equipment/contractor.dm
/// Support unit gets it's own very basic antag datum for admin logging.
/datum/antagonist/traitor/contractor_support
	name = "Contractor Support Unit"
	antag_moodlet = /datum/mood_event/focused

	show_in_roundend = FALSE /// We're already adding them in to the contractor's roundend.
	give_objectives = TRUE /// We give them their own custom objective.
	show_in_antagpanel = FALSE /// Not a proper/full antag.
	should_equip = FALSE /// Don't give them an uplink.

	var/datum/team/contractor_team/contractor_team

/// Team for storing both the contractor and their support unit - only really for the HUD and admin logging.
/datum/team/contractor_team
	show_roundend_report = FALSE

/datum/antagonist/traitor/contractor_support/forge_traitor_objectives()
	var/datum/objective/generic_objective = new

	generic_objective.name = "Follow Contractor's Orders"
	generic_objective.explanation_text = "Follow your orders. Assist agents in this mission area."

	generic_objective.completed = TRUE

	add_objective(generic_objective)

/datum/contractor_hub
	var/contract_rep = 0
	var/list/hub_items = list()
	var/list/purchased_items = list()
	var/static/list/contractor_items = typecacheof(/datum/contractor_item/, TRUE)

	var/datum/syndicate_contract/current_contract
	var/list/datum/syndicate_contract/assigned_contracts = list()

	var/list/assigned_targets = list() // used as a blacklist to make sure we're not assigning targets already assigned

	var/contracts_completed = 0
	var/contract_TC_payed_out = 0 // Keeping track for roundend reporting
	var/contract_TC_to_redeem = 0 // Used internally and roundend reporting - what TC we have available to cashout.

/datum/contractor_hub/proc/create_hub_items()
	for(var/path in contractor_items)
		var/datum/contractor_item/contractor_item = new path

		hub_items.Add(contractor_item)

/datum/contractor_hub/proc/create_contracts(datum/mind/owner)

	// 6 initial contracts
	var/list/to_generate = list(
		CONTRACT_PAYOUT_LARGE,
		CONTRACT_PAYOUT_MEDIUM,
		CONTRACT_PAYOUT_SMALL,
		CONTRACT_PAYOUT_SMALL,
		CONTRACT_PAYOUT_SMALL,
		CONTRACT_PAYOUT_SMALL
	)

	//What the fuck
	if(length(to_generate) > length(GLOB.data_core.locked))
		to_generate.Cut(1, length(GLOB.data_core.locked))

	// We don't want the sum of all the payouts to be under this amount
	var/lowest_TC_threshold = 30

	var/total = 0
	var/lowest_paying_sum = 0
	var/datum/syndicate_contract/lowest_paying_contract

	// Randomise order, so we don't have contracts always in payout order.
	to_generate = shuffle(to_generate)

	// Support contract generation happening multiple times
	var/start_index = 1
	if (assigned_contracts.len != 0)
		start_index = assigned_contracts.len + 1

	// Generate contracts, and find the lowest paying.
	for (var/i = 1; i <= to_generate.len; i++)
		var/datum/syndicate_contract/contract_to_add = new(owner, assigned_targets, to_generate[i])
		var/contract_payout_total = contract_to_add.contract.payout + contract_to_add.contract.payout_bonus

		assigned_targets.Add(contract_to_add.contract.target)

		if (!lowest_paying_contract || (contract_payout_total < lowest_paying_sum))
			lowest_paying_sum = contract_payout_total
			lowest_paying_contract = contract_to_add

		total += contract_payout_total
		contract_to_add.id = start_index
		assigned_contracts.Add(contract_to_add)

		start_index++

	// If the threshold for TC payouts isn't reached, boost the lowest paying contract
	if (total < lowest_TC_threshold)
		lowest_paying_contract.contract.payout_bonus += (lowest_TC_threshold - total)	// ХУЙ

/datum/contractor_item
	var/name // Name of item
	var/desc // description of item
	var/item // item path, no item path means the purchase needs it's own handle_purchase()
	var/item_icon = "broadcast-tower" // fontawesome icon to use inside the hub - https://fontawesome.com/icons/
	var/limited = -1 // Any number above 0 for how many times it can be bought in a round for a single traitor. -1 is unlimited.
	var/cost // Cost of the item in contract rep.

/datum/contractor_item/contract_reroll
	name = "Contract Reroll"
	desc = "Request a reroll of your current contract list. Will generate a new target, payment, and dropoff for the contracts you currently have available."
	item_icon = "dice"
	limited = 2
	cost = 0

/datum/contractor_item/contract_reroll/handle_purchase(datum/contractor_hub/hub)
	. = ..()

	if (.)
		/// We're not regenerating already completed/aborted/extracting contracts, but we don't want to repeat their targets.
		var/list/new_target_list = list()
		for(var/datum/syndicate_contract/contract_check in hub.assigned_contracts)
			if (contract_check.status != CONTRACT_STATUS_ACTIVE && contract_check.status != CONTRACT_STATUS_INACTIVE)
				if (contract_check.contract.target)
					new_target_list.Add(contract_check.contract.target)
				continue

		/// Reroll contracts without duplicates
		for(var/datum/syndicate_contract/rerolling_contract in hub.assigned_contracts)
			if (rerolling_contract.status != CONTRACT_STATUS_ACTIVE && rerolling_contract.status != CONTRACT_STATUS_INACTIVE)
				continue

			rerolling_contract.generate(new_target_list)
			new_target_list.Add(rerolling_contract.contract.target)

		/// Set our target list with the new set we've generated.
		hub.assigned_targets = new_target_list

/datum/contractor_item/contractor_pinpointer
	name = "Contractor Pinpointer"
	desc = "A pinpointer that finds targets even without active suit sensors. Due to taking advantage of an exploit within the system, it can't pinpoint to the same accuracy as the traditional models. Becomes permanently locked to the user that first activates it."
	item = /obj/item/pinpointer/crew/contractor
	item_icon = "search-location"
	limited = 2
	cost = 1

/datum/contractor_item/fulton_extraction_kit
	name = "Fulton Extraction Kit"
	desc = "For getting your target across the station to those difficult dropoffs. Place the beacon somewhere secure, and link the pack. Activating the pack on your target in space will send them over to the beacon - make sure they're not just going to run away though!"
	item = /obj/item/storage/box/contractor/fulton_extraction
	item_icon = "parachute-box"
	limited = 1
	cost = 1

/datum/contractor_item/contractor_partner
	name = "Reinforcements"
	desc = "Upon purchase we'll contact available units in the area. Should there be an agent free, we'll send them down to assist you immediately. If no units are free, we give a full refund."
	item_icon = "user-friends"
	limited = 1
	cost = 2
	var/datum/mind/partner_mind = null

/datum/contractor_item/contractor_partner/handle_purchase(datum/contractor_hub/hub, mob/living/user)
	. = ..()

	if (.)
		to_chat(user, span_notice("The uplink vibrates quietly, connecting to nearby agents..."))

		var/list/mob/dead/observer/candidates = pollGhostCandidates("Do you want to play as the Contractor Support Unit for [user.real_name]?", ROLE_PAI, null, FALSE, 100, POLL_IGNORE_CONTRACTOR_SUPPORT)

		if(LAZYLEN(candidates))
			var/mob/dead/observer/C = pick(candidates)
			spawn_contractor_partner(user, C.key)
		else
			to_chat(user, span_notice("No available agents at this time, please try again later."))

			// refund and add the limit back.
			limited += 1
			hub.contract_rep += cost
			hub.purchased_items -= src

/datum/outfit/contractor_partner
	name = "Contractor Support Unit"

	uniform = /obj/item/clothing/under/chameleon
	suit = /obj/item/clothing/suit/chameleon
	back = /obj/item/storage/backpack
	belt = /obj/item/pda/chameleon
	mask = /obj/item/clothing/mask/cigarette/syndicate
	shoes = /obj/item/clothing/shoes/chameleon/noslip
	ears = /obj/item/radio/headset/chameleon
	id = /obj/item/card/id/syndicate
	r_hand = /obj/item/storage/toolbox/syndicate

	backpack_contents = list(/obj/item/storage/box/survival, /obj/item/implanter/uplink, /obj/item/clothing/mask/chameleon,
							/obj/item/storage/fancy/cigarettes/cigpack_syndicate, /obj/item/lighter)

/datum/outfit/contractor_partner/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	var/obj/item/clothing/mask/cigarette/syndicate/cig = H.get_item_by_slot(ITEM_SLOT_MASK)

	// pre-light their cig
	cig.light()

/datum/contractor_item/contractor_partner/proc/spawn_contractor_partner(mob/living/user, key)
	var/mob/living/carbon/human/partner = new()
	var/datum/outfit/contractor_partner/partner_outfit = new()

	partner_outfit.equip(partner)

	var/obj/structure/closet/supplypod/arrival_pod = new()

	arrival_pod.style = STYLE_SYNDICATE
	arrival_pod.explosionSize = list(0,0,0,1)
	arrival_pod.bluespace = TRUE

	var/turf/free_location = find_obstruction_free_location(2, user)

	// We really want to send them - if we can't find a nice location just land it on top of them.
	if (!free_location)
		free_location = get_turf(user)

	partner.forceMove(arrival_pod)
	partner.ckey = key

	/// We give a reference to the mind that'll be the support unit
	partner_mind = partner.mind
	partner_mind.make_Contractor_Support()

	to_chat(partner_mind.current, "\n[span_alertwarning("[user.real_name] is your superior. Follow any, and all orders given by them. You're here to support their mission only.")]")
	to_chat(partner_mind.current, "[span_alertwarning("Should they perish, or be otherwise unavailable, you're to assist other active agents in this mission area to the best of your ability.")]\n\n")

	new /obj/effect/pod_landingzone(free_location, arrival_pod)

/datum/contractor_item/blackout
	name = "Blackout"
	desc = "Request Syndicate Command to distrupt the station's powernet. Disables power across the station for a short duration."
	item_icon = "bolt"
	limited = 2
	cost = 3

/datum/contractor_item/blackout/handle_purchase(datum/contractor_hub/hub)
	. = ..()

	if (.)
		power_fail(35, 50)
		priority_announce("Abnormal activity detected in [station_name()]'s powernet. As a precautionary measure, the station's power will be shut off for an indeterminate duration.", "Critical Power Failure", 'sound/ai/poweroff.ogg')

// Subtract cost, and spawn if it's an item.
/datum/contractor_item/proc/handle_purchase(datum/contractor_hub/hub, mob/living/user)

	if (hub.contract_rep >= cost)
		hub.contract_rep -= cost
	else
		return FALSE

	if (limited >= 1)
		limited -= 1
	else if (limited == 0)
		return FALSE

	hub.purchased_items.Add(src)

	user.playsound_local(user, 'sound/machines/uplinkpurchase.ogg', 100)

	if (item && ispath(item))
		var/atom/item_to_create = new item(get_turf(user))

		if(user.put_in_hands(item_to_create))
			to_chat(user, span_notice("Your purchase materializes into your hands!"))
		else
			to_chat(user, span_notice("Your purchase materializes onto the floor."))

		return item_to_create
	return TRUE

/obj/item/pinpointer/crew/contractor
	name = "contractor pinpointer"
	desc = "A handheld tracking device that locks onto certain signals. Ignores suit sensors, but is much less accurate."
	icon_state = "pinpointer_syndicate"
	minimum_range = 25
	has_owner = TRUE
	ignore_suit_sensor_level = TRUE

/obj/item/storage/box/contractor/fulton_extraction
	name = "Fulton Extraction Kit"
	icon_state = "syndiebox"
	illustration = "writing_syndie"

/obj/item/storage/box/contractor/fulton_extraction/PopulateContents()
	new /obj/item/extraction_pack(src)
	new /obj/item/fulton_core(src)

// MARK: Контрактор Синдиката
// code/modules/antagonists/traitor/syndicate_contract.dm
/datum/syndicate_contract
	var/id = 0
	var/status = CONTRACT_STATUS_INACTIVE
	var/datum/objective/contract/contract = new()
	var/target_rank
	var/ransom = 0
	var/payout_type
	var/wanted_message

	var/list/victim_belongings = list()

/datum/syndicate_contract/New(contract_owner, blacklist, type=CONTRACT_PAYOUT_SMALL)
	contract.owner = contract_owner
	payout_type = type

	generate(blacklist)

/datum/syndicate_contract/proc/generate(blacklist)
	contract.find_target(null, blacklist)

	var/datum/data/record/record
	if (contract.target)
		record = find_record("name", contract.target.name, GLOB.data_core.general)

	if (record)
		target_rank = record.fields["rank"]
	else
		target_rank = "Unknown"

	if (payout_type == CONTRACT_PAYOUT_LARGE)
		contract.payout_bonus = rand(9,13)
	else if (payout_type == CONTRACT_PAYOUT_MEDIUM)
		contract.payout_bonus = rand(6,8)
	else
		contract.payout_bonus = rand(2,4)

	contract.payout = rand(0, 2)
	contract.generate_dropoff()

	ransom = 100 * rand(18, 45)

	var/base = pick_list(WANTED_FILE, "basemessage")
	var/verb_string = pick_list(WANTED_FILE, "verb")
	var/noun = pick_list_weighted(WANTED_FILE, "noun")
	var/location = pick_list_weighted(WANTED_FILE, "location")
	wanted_message = "[base] [verb_string] [noun] [location]."

/datum/syndicate_contract/proc/handle_extraction(mob/living/user)
	if (contract.target && contract.dropoff_check(user, contract.target.current))

		var/turf/free_location = find_obstruction_free_location(3, user, contract.dropoff)

		if (free_location)
			// We've got a valid location, launch.
			launch_extraction_pod(free_location)
			return TRUE

	return FALSE

// Launch the pod to collect our victim.
/datum/syndicate_contract/proc/launch_extraction_pod(turf/empty_pod_turf)
	var/obj/structure/closet/supplypod/extractionpod/empty_pod = new()

	RegisterSignal(empty_pod, COMSIG_ATOM_ENTERED, PROC_REF(enter_check))

	empty_pod.stay_after_drop = TRUE
	empty_pod.reversing = TRUE
	empty_pod.explosionSize = list(0,0,0,1)
	empty_pod.leavingSound = 'sound/effects/podwoosh.ogg'

	new /obj/effect/pod_landingzone(empty_pod_turf, empty_pod)

/datum/syndicate_contract/proc/enter_check(datum/source, sent_mob)
	if (istype(source, /obj/structure/closet/supplypod/extractionpod))
		if (isliving(sent_mob))
			var/mob/living/M = sent_mob
			var/datum/antagonist/traitor/traitor_data = contract.owner.has_antag_datum(/datum/antagonist/traitor)

			if (M == contract.target.current)
				traitor_data.contractor_hub.contract_TC_to_redeem += contract.payout
				traitor_data.contractor_hub.contracts_completed += 1

				if (M.stat != DEAD)
					traitor_data.contractor_hub.contract_TC_to_redeem += contract.payout_bonus

				status = CONTRACT_STATUS_COMPLETE

				if (traitor_data.contractor_hub.current_contract == src)
					traitor_data.contractor_hub.current_contract = null

				traitor_data.contractor_hub.contract_rep += 2
			else
				status = CONTRACT_STATUS_ABORTED // Sending a target that wasn't even yours is as good as just aborting it

				if (traitor_data.contractor_hub.current_contract == src)
					traitor_data.contractor_hub.current_contract = null

			if (iscarbon(M))
				for(var/obj/item/W in M)
					if (ishuman(M))
						var/mob/living/carbon/human/H = M
						if(W == H.w_uniform)
							continue //So all they're left with are shoes and uniform.
						if(W == H.shoes)
							continue


					M.transferItemToLoc(W)
					victim_belongings.Add(W)

			var/obj/structure/closet/supplypod/extractionpod/pod = source

			// Handle the pod returning
			pod.startExitSequence(pod)

			if (ishuman(M))
				var/mob/living/carbon/human/target = M

				// After we remove items, at least give them what they need to live.
				target.dna.species.give_important_for_life(target)

			// After pod is sent we start the victim narrative/heal.
			handleVictimExperience(M)

			// This is slightly delayed because of the sleep calls above to handle the narrative.
			// We don't want to tell the station instantly.
			/*
			var/points_to_check
			var/datum/bank_account/D = SSeconomy.get_dep_account(ACCOUNT_CAR)
			if(D)
				points_to_check = D.account_balance
			if(points_to_check >= ransom)
				D.adjust_money(-ransom)
			else
				D.adjust_money(-points_to_check)
			priority_announce("One of your crew was captured by a rival organisation - we've needed to pay their ransom to bring them back. \
							As is policy we've taken a portion of the station's funds to offset the overall cost.", null, 'sound/ai/attention.ogg', null, "Nanotrasen Asset Protection")
			*/

			sleep(30)

			// Pay contractor their portion of ransom
			if (status == CONTRACT_STATUS_COMPLETE)
				var/mob/living/carbon/human/H
				var/obj/item/card/bank/C
				if(ishuman(contract.owner.current))
					H = contract.owner.current
					C = H.get_bankcard()

				if(C && C.registered_account)
					C.registered_account.adjust_money(ransom * 0.35, CREDIT_LOG_SYNDICATE_CONTRACT)

					C.registered_account.bank_card_talk("We've processed the ransom, agent. Here's your cut - your balance is now \
					[C.registered_account.account_balance] cr.", TRUE)

// They're off to holding - handle the return timer and give some text about what's going on.
/datum/syndicate_contract/proc/handleVictimExperience(mob/living/M)
	// Ship 'em back - dead or alive, 4 minutes wait.
	// Even if they weren't the target, we're still treating them the same.
	addtimer(CALLBACK(src, PROC_REF(returnVictim), M), (60 * 10) * 4)

	if (M.stat != DEAD)
		// Heal them up - gets them out of crit/soft crit. If omnizine is removed in the future, this needs to be replaced with a
		// method of healing them, consequence free, to a reasonable amount of health.
		M.reagents.add_reagent(/datum/reagent/medicine/omnizine, 20)

		M.flash_act()
		M.confused += 10
		M.blur_eyes(5)
		to_chat(M, span_warning("You feel strange..."))
		sleep(60)
		to_chat(M, span_warning("That pod did something to you..."))
		M.set_timed_status_effect(70 SECONDS, /datum/status_effect/dizziness, only_if_higher = TRUE)
		sleep(65)
		to_chat(M, span_warning("Your head pounds... It feels like it's going to burst out your skull!"))
		M.flash_act()
		M.confused += 20
		M.blur_eyes(3)
		sleep(30)
		to_chat(M, span_warning("Your head pounds..."))
		sleep(100)
		M.flash_act()
		M.Unconscious(200)
		to_chat(M, "<span class='reallybig hypnophrase'>A million voices echo in your head... <i>\"Your mind held many valuable secrets - \
					we thank you for providing them. Your value is expended, and you will be ransomed back to your station. We always get paid, \
					so it's only a matter of time before we ship you back...\"</i></span>")
		M.blur_eyes(10)
		M.set_timed_status_effect(30 SECONDS, /datum/status_effect/dizziness, only_if_higher = TRUE)
		M.confused += 20

// We're returning the victim
/datum/syndicate_contract/proc/returnVictim(mob/living/M)
	var/list/possible_drop_loc = list()

	for (var/turf/possible_drop in contract.dropoff.contents)
		if (!isspaceturf(possible_drop) && !isclosedturf(possible_drop))
			if (!possible_drop.is_blocked_turf())
				possible_drop_loc.Add(possible_drop)

	if (possible_drop_loc.len > 0)
		var/pod_rand_loc = rand(1, possible_drop_loc.len)

		var/obj/structure/closet/supplypod/return_pod = new()
		return_pod.bluespace = TRUE
		return_pod.explosionSize = list(0,0,0,0)
		return_pod.style = STYLE_SYNDICATE

		do_sparks(8, FALSE, M)
		M.visible_message(span_notice("[M] vanishes..."))

		for(var/obj/item/W in M)
			if (ishuman(M))
				var/mob/living/carbon/human/H = M
				if(W == H.w_uniform)
					continue //So all they're left with are shoes and uniform.
				if(W == H.shoes)
					continue
			M.dropItemToGround(W)

		for(var/obj/item/W in victim_belongings)
			W.forceMove(return_pod)

		M.forceMove(return_pod)

		M.flash_act()
		M.blur_eyes(30)
		M.set_timed_status_effect(70 SECONDS, /datum/status_effect/dizziness, only_if_higher = TRUE)
		M.confused += 20

		new /obj/effect/pod_landingzone(possible_drop_loc[pod_rand_loc], return_pod)
	else
		to_chat(M, "<span class='reallybig hypnophrase'>A million voices echo in your head... <i>\"Seems where you got sent here from won't \
					be able to handle our pod... You will die here instead.\"</i></span>")
		if (iscarbon(M))
			var/mob/living/carbon/C = M
			if (C.can_heartattack())
				C.set_heartattack(TRUE)

// MARK: Планшет контрактника
//code/modules/modular_computers/computers/item/tablet_presets.dm
/// Given by the syndicate as part of the contract uplink bundle - loads in the Contractor Uplink.
/obj/item/modular_computer/tablet/syndicate_contract_uplink/preset/uplink/Initialize()
	. = ..()
	var/obj/item/computer_hardware/hard_drive/small/syndicate/hard_drive = new
	var/datum/computer_file/program/contract_uplink/uplink = new

	active_program = uplink
	uplink.program_state = PROGRAM_STATE_ACTIVE
	uplink.computer = src

	hard_drive.store_file(uplink)

	install_component(new /obj/item/computer_hardware/processor_unit/small)
	install_component(new /obj/item/computer_hardware/battery(src, /obj/item/stock_parts/cell/computer))
	install_component(hard_drive)
	install_component(new /obj/item/computer_hardware/network_card)
	install_component(new /obj/item/computer_hardware/card_slot)
	install_component(new /obj/item/computer_hardware/printer/mini)

// code/modules/modular_computers/file_system/programs/antagonist/contract_uplink.dm
/datum/computer_file/program/contract_uplink
	filename = "contractor uplink"
	filedesc = "Syndicate Contractor Uplink"
	program_icon_state = "assign"
	extended_desc = "A standard, Syndicate issued system for handling important contracts while on the field."
	size = 10
	requires_ntnet = 0
	available_on_ntnet = 0
	unsendable = 1
	undeletable = 1
	tgui_id = "SyndContractor"
	program_icon = "tasks"
	var/error = ""
	var/info_screen = TRUE
	var/assigned = FALSE
	var/first_load = TRUE

/datum/computer_file/program/contract_uplink/run_program(mob/living/user)
	. = ..(user)

/datum/computer_file/program/contract_uplink/ui_act(action, params)
	. = ..()
	if(.)
		return

	var/mob/living/user = usr
	var/obj/item/computer_hardware/hard_drive/small/syndicate/hard_drive = computer.all_components[MC_HDD]

	switch(action)
		if("PRG_contract-accept")
			var/contract_id = text2num(params["contract_id"])

			// Set as the active contract
			hard_drive.traitor_data.contractor_hub.assigned_contracts[contract_id].status = CONTRACT_STATUS_ACTIVE
			hard_drive.traitor_data.contractor_hub.current_contract = hard_drive.traitor_data.contractor_hub.assigned_contracts[contract_id]

			program_icon_state = "single_contract"
			return TRUE
		if("PRG_login")
			var/datum/antagonist/traitor/traitor_data = user.mind.has_antag_datum(/datum/antagonist/traitor)

			// Bake their data right into the hard drive, or we don't allow non-antags gaining access to an unused
			// contract system.
			// We also create their contracts at this point.
			if (traitor_data)
				// Only play greet sound, and handle contractor hub when assigning for the first time.
				if (!traitor_data.contractor_hub)
					user.playsound_local(user, 'sound/effects/contractstartup.ogg', 100, FALSE)
					traitor_data.contractor_hub = new
					traitor_data.contractor_hub.create_hub_items()

				// Stops any topic exploits such as logging in multiple times on a single system.
				if (!assigned)
					traitor_data.contractor_hub.create_contracts(traitor_data.owner)

					hard_drive.traitor_data = traitor_data

					program_icon_state = "contracts"
					assigned = TRUE
			else
				error = "UNAUTHORIZED USER"
			return TRUE
		if("PRG_call_extraction")
			if (hard_drive.traitor_data.contractor_hub.current_contract.status != CONTRACT_STATUS_EXTRACTING)
				if (hard_drive.traitor_data.contractor_hub.current_contract.handle_extraction(user))
					user.playsound_local(user, 'sound/effects/confirmdropoff.ogg', 100, TRUE)
					hard_drive.traitor_data.contractor_hub.current_contract.status = CONTRACT_STATUS_EXTRACTING

					program_icon_state = "extracted"
				else
					user.playsound_local(user, 'sound/machines/uplinkerror.ogg', 50)
					error = "Either both you or your target aren't at the dropoff location, or the pod hasn't got a valid place to land. Clear space, or make sure you're both inside."
			else
				user.playsound_local(user, 'sound/machines/uplinkerror.ogg', 50)
				error = "Already extracting... Place the target into the pod. If the pod was destroyed, this contract is no longer possible."

			return TRUE
		if("PRG_contract_abort")
			var/contract_id = hard_drive.traitor_data.contractor_hub.current_contract.id

			hard_drive.traitor_data.contractor_hub.current_contract = null
			hard_drive.traitor_data.contractor_hub.assigned_contracts[contract_id].status = CONTRACT_STATUS_ABORTED

			program_icon_state = "contracts"

			return TRUE
		if("PRG_redeem_TC")
			if (hard_drive.traitor_data.contractor_hub.contract_TC_to_redeem)
				var/obj/item/stack/telecrystal/crystals = new /obj/item/stack/telecrystal(get_turf(user),
															hard_drive.traitor_data.contractor_hub.contract_TC_to_redeem)
				if(ishuman(user))
					var/mob/living/carbon/human/H = user
					if(H.put_in_hands(crystals))
						to_chat(H, span_notice("Your payment materializes into your hands!"))
					else
						to_chat(user, span_notice("Your payment materializes onto the floor."))

				hard_drive.traitor_data.contractor_hub.contract_TC_payed_out += hard_drive.traitor_data.contractor_hub.contract_TC_to_redeem
				hard_drive.traitor_data.contractor_hub.contract_TC_to_redeem = 0
				return TRUE
			else
				user.playsound_local(user, 'sound/machines/uplinkerror.ogg', 50)
			return TRUE
		if ("PRG_clear_error")
			error = ""
			return TRUE
		if("PRG_set_first_load_finished")
			first_load = FALSE
			return TRUE
		if("PRG_toggle_info")
			info_screen = !info_screen
			return TRUE
		if ("buy_hub")
			if (hard_drive.traitor_data.owner.current == user)
				var/item = params["item"]

				for (var/datum/contractor_item/hub_item in hard_drive.traitor_data.contractor_hub.hub_items)
					if (hub_item.name == item)
						hub_item.handle_purchase(hard_drive.traitor_data.contractor_hub, user)
			else
				error = "Invalid user... You weren't recognised as the user of this system."

/datum/computer_file/program/contract_uplink/ui_data(mob/user)
	var/list/data = list()
	var/obj/item/computer_hardware/hard_drive/small/syndicate/hard_drive = computer.all_components[MC_HDD]
	var/screen_to_be = null

	data["first_load"] = first_load

	if (hard_drive && hard_drive.traitor_data != null)
		var/datum/antagonist/traitor/traitor_data = hard_drive.traitor_data
		data += get_header_data()

		if (traitor_data.contractor_hub.current_contract)
			data["ongoing_contract"] = TRUE
			screen_to_be = "single_contract"
			if (traitor_data.contractor_hub.current_contract.status == CONTRACT_STATUS_EXTRACTING)
				data["extraction_enroute"] = TRUE
				screen_to_be = "extracted"
			else
				data["extraction_enroute"] = FALSE
		else
			data["ongoing_contract"] = FALSE
			data["extraction_enroute"] = FALSE

		data["logged_in"] = TRUE
		data["station_name"] = GLOB.station_name
		data["redeemable_tc"] = traitor_data.contractor_hub.contract_TC_to_redeem
		data["earned_tc"] = traitor_data.contractor_hub.contract_TC_payed_out
		data["contracts_completed"] = traitor_data.contractor_hub.contracts_completed
		data["contract_rep"] = traitor_data.contractor_hub.contract_rep

		data["info_screen"] = info_screen

		data["error"] = error

		for (var/datum/contractor_item/hub_item in traitor_data.contractor_hub.hub_items)
			data["contractor_hub_items"] += list(list(
				"name" = hub_item.name,
				"desc" = hub_item.desc,
				"cost" = hub_item.cost,
				"limited" = hub_item.limited,
				"item_icon" = hub_item.item_icon
			))

		for (var/datum/syndicate_contract/contract in traitor_data.contractor_hub.assigned_contracts)
			data["contracts"] += list(list(
				"target" = contract.contract.target,
				"target_rank" = contract.target_rank,
				"payout" = contract.contract.payout,
				"payout_bonus" = contract.contract.payout_bonus,
				"dropoff" = contract.contract.dropoff,
				"id" = contract.id,
				"status" = contract.status,
				"message" = contract.wanted_message
			))

		var/direction
		if (traitor_data.contractor_hub.current_contract)
			var/turf/curr = get_turf(user)
			var/turf/dropoff_turf
			data["current_location"] = "[get_area_name(curr, TRUE)]"

			for (var/turf/content in traitor_data.contractor_hub.current_contract.contract.dropoff.contents)
				if (isturf(content))
					dropoff_turf = content
					break

			if(curr.virtual_z() == dropoff_turf.virtual_z()) //Direction calculations for same z-level only
				direction = uppertext(dir2text(get_dir(curr, dropoff_turf))) //Direction text (East, etc). Not as precise, but still helpful.
				if(get_area(user) == traitor_data.contractor_hub.current_contract.contract.dropoff)
					direction = "LOCATION CONFIRMED"
			else
				direction = "???"

			data["dropoff_direction"] = direction

	else
		data["logged_in"] = FALSE

	program_icon_state = screen_to_be
	update_computer_icon()
	return data

// MARK: END ROUND
//code/modules/antagonists/traitor/datum_traitor.dm
/datum/antagonist/traitor/proc/contractor_round_end()
	var/result = ""
	var/total_spent_rep = 0

	var/completed_contracts = contractor_hub.contracts_completed
	var/tc_total = contractor_hub.contract_TC_payed_out + contractor_hub.contract_TC_to_redeem

	var/contractor_item_icons = "" // Icons of purchases
	var/contractor_support_unit = "" // Set if they had a support unit - and shows appended to their contracts completed

	/// Get all the icons/total cost for all our items bought
	for (var/datum/contractor_item/contractor_purchase in contractor_hub.purchased_items)
		contractor_item_icons += "<span class='tooltip_container'>\[ <i class=\"fas [contractor_purchase.item_icon]\"></i><span class='tooltip_hover'><b>[contractor_purchase.name] - [contractor_purchase.cost] Rep</b><br><br>[contractor_purchase.desc]</span> \]</span>"

		total_spent_rep += contractor_purchase.cost

		/// Special case for reinforcements, we want to show their ckey and name on round end.
		if (istype(contractor_purchase, /datum/contractor_item/contractor_partner))
			var/datum/contractor_item/contractor_partner/partner = contractor_purchase
			contractor_support_unit += "<br><b>[partner.partner_mind.key]</b> played <b>[partner.partner_mind.current.name]</b>, their contractor support unit."

	if (contractor_hub.purchased_items.len)
		result += "<br>(used [total_spent_rep] Rep) "
		result += contractor_item_icons
	result += "<br>"
	if (completed_contracts > 0)
		var/pluralCheck = "contract"
		if (completed_contracts > 1)
			pluralCheck = "contracts"

		result += "Completed [span_greentext("[completed_contracts]")] [pluralCheck] for a total of \
					[span_greentext("[tc_total] TC")]![contractor_support_unit]<br>"

	return result
