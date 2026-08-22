#define POSTER_SUBTYPES 1

//general NT-related posters
/obj/item/poster/random_nanotrasen
	name = "random official nanotrasen poster"
	poster_type = /obj/structure/sign/poster/nanotrasen/random
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'
	icon_state = "rolled_nt"

/obj/structure/sign/poster/nanotrasen
	poster_item_name = "motivational poster"
	poster_item_desc = "An official nanotrasen-issued poster to foster a compliant and obedient workforce. It comes with state-of-the-art adhesive backing, for easy pinning to any vertical surface."
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'
	poster_item_icon_state = "rolled_nt"

/obj/structure/sign/poster/nanotrasen/random
	name = "random nanotrasen poster"
	random_basetype = /obj/structure/sign/poster/nanotrasen
	icon_state = "random_nanotrasen"
	never_random = TRUE
	random_type = POSTER_SUBTYPES

/obj/structure/sign/poster/nanotrasen/ns_logistics_ad
	name = "N+S Logistics Advertisment"
	desc = "A poster telling the reader about how advanced N+S Mining operations are and why YOU should join them."
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'
	icon_state = "poster_ns"

/obj/structure/sign/poster/nanotrasen/vigilitas_nonlethal
	name = "VI Nonlethal Advances"
	desc = "A poster advertising VI's advances in nonlethal detainment strategies, using Sharplite's disabling tech."
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'
	icon_state = "poster_vigilitas"

/obj/structure/sign/poster/nanotrasen/deforest_hypospray
	name = "DeForest Hypospray Tech Ad"
	desc = "A poster displaying DeForest's classic hypospray, a technology used everywhere in the medical field today."
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'
	icon_state = "poster_deforest"

/obj/structure/sign/poster/nanotrasen/nakamura_advtools
	name = "Nakamura Engineering Tools"
	desc = "A poster displaying details on how NE 'Jaws Of Life' work."
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'
	icon_state = "poster_nakamura"

//corporate propaganda

/obj/structure/sign/poster/nanotrasen/here_for_your_safety
	name = "Here For Your Safety"
	desc = "A poster glorifying Vigilitas private security forces."
	icon_state = "poster_saftey"

/obj/structure/sign/poster/nanotrasen/nanotrasen_logo
	name = "\improper Nanotrasen logo"
	desc = "A poster depicting the Nanotrasen logo."
	icon_state = "poster_nanotrasen"

/obj/structure/sign/poster/nanotrasen/cleanliness
	name = "Cleanliness"
	desc = "A poster warning of the dangers of poor hygiene."
	icon_state = "poster_cleanhands"

/obj/structure/sign/poster/nanotrasen/help_others
	name = "Help Others"
	desc = "A poster encouraging you to help fellow crewmembers."
	icon_state = "poster_help"

/obj/structure/sign/poster/nanotrasen/build
	name = "Build"
	desc = "A poster glorifying the engineering team."
	icon_state = "poster_build"

/obj/structure/sign/poster/nanotrasen/bless_this_spess
	name = "Bless This Spess"
	desc = "A poster blessing this area."
	icon_state = "poster_bless"

/obj/structure/sign/poster/nanotrasen/science
	name = "Science"
	desc = "A poster depicting an beaker."
	icon_state = "poster_science"

/obj/structure/sign/poster/nanotrasen/ian
	name = "Ian"
	desc = "Arf arf. Yap."
	icon_state = "poster_arf"

/obj/structure/sign/poster/nanotrasen/obey
	name = "Obey"
	desc = "A poster instructing the viewer to obey authority."
	icon_state = "poster_obey"

/obj/structure/sign/poster/nanotrasen/walk
	name = "Walk"
	desc = "A poster instructing the viewer to walk instead of running."
	icon_state = "poster_walk"

/obj/structure/sign/poster/nanotrasen/love_ian
	name = "Love Ian"
	desc = "Ian is love, Ian is life."
	icon_state = "poster_love_ian"

/obj/structure/sign/poster/nanotrasen/ue_no
	name = "Ue No."
	desc = "This thing is all in a foreign language."
	icon_state = "poster_anime"

/obj/structure/sign/poster/nanotrasen/get_your_legs
	name = "Get Your LEGS"
	desc = "LEGS: Leadership, Experience, Genius, Subordination."
	icon_state = "poster_legs"

/obj/structure/sign/poster/nanotrasen/do_not_question
	name = "Do Not Question"
	desc = "A poster instructing the viewer not to ask about things they aren't meant to know."
	icon_state = "poster_question"

/obj/structure/sign/poster/nanotrasen/work_for_a_future
	name = "Work For A Future"
	desc = " A poster encouraging you to work for your future."
	icon_state = "poster_future"

/obj/structure/sign/poster/nanotrasen/soft_cap_pop_art
	name = "Soft Cap Pop Art"
	desc = "A poster reprint of some cheap pop art."
	icon_state = "poster_art"

/obj/structure/sign/poster/nanotrasen/safety_internals
	name = "Safety: Internals"
	desc = "A poster instructing the viewer to wear internals in the rare environments where there is no oxygen or the air has been rendered toxic."
	icon_state = "poster_internals"

/obj/structure/sign/poster/nanotrasen/safety_eye_protection
	name = "Safety: Eye Protection"
	desc = "A poster instructing the viewer to wear eye protection when dealing with chemicals, smoke, or bright lights."
	icon_state = "poster_goggles"

/obj/structure/sign/poster/nanotrasen/safety_report
	name = "Safety: Report"
	desc = "A poster instructing the viewer to report suspicious activity to the security force."
	icon_state = "poster_warden"

/obj/structure/sign/poster/nanotrasen/report_crimes
	name = "Report Crimes"
	desc = "A poster encouraging the swift reporting of crime or seditious behavior to security personnel."
	icon_state = "poster_report_crimes"

/obj/structure/sign/poster/nanotrasen/ion_carbine
	name = "Ion Carbine"
	desc = "A poster advertising the SL L-791 Carbine."
	icon_state = "poster_l791"

/obj/structure/sign/poster/nanotrasen/foam_force_ad
	name = "Foam Force Ad"
	desc = "Foam Force, it's Foam or be Foamed!"
	icon_state = "poster_foam_force"

/obj/structure/sign/poster/nanotrasen/cohiba_robusto_ad
	name = "Cohiba Robusto Ad"
	desc = "Cohiba Robusto, the classy cigar straight from Centcom."
	icon_state = "poster_cohiba"

/obj/structure/sign/poster/nanotrasen/fruit_bowl
	name = "Fruit Bowl"
	desc = " Simple, yet awe-inspiring."
	icon_state = "poster_fruitbowl"

/obj/structure/sign/poster/nanotrasen/pda_ad
	name = "PDA Ad"
	desc = "A poster advertising the latest PDA from Nanotrasen suppliers."
	icon_state = "poster_pda"

/obj/structure/sign/poster/nanotrasen/mini_energy_gun
	name = "Mini energy gun"
	desc = "A poster advertising the new and technically impressive SL X-26. 'Power in a pocket!'"
	icon_state = "poster_x26"

/obj/structure/sign/poster/nanotrasen/enlist
	name = "Enlist" // but I thought deathsquad was never acknowledged
	// desc = "Join the Death Squad today!" // I refuse to acknowledge this bullshit - Zeta
	desc = "Merchandise for the popular Death Squad comic series, done up as a convincingly fake recruitment poster for the titular Death Squad. True fans know you don't choose the Death Squad - the Death Squad chooses you."
	icon_state = "poster_enlist"

/obj/structure/sign/poster/nanotrasen/high_class_martini
	name = "High-Class Martini"
	desc = "I told you to shake it, no stirring."
	icon_state = "poster_martini"

/obj/structure/sign/poster/nanotrasen/the_owl
	name = "The Owl"
	desc = "The Owl would do his best to protect the colonies. Will you?"
	icon_state = "poster_owl"

/obj/structure/sign/poster/nanotrasen/no_erp
	name = "No ERP"
	desc = "This poster reminds viewers to immediately stop what they are doing right now. Yes, you. You know what you're doing."
	icon_state = "poster_noerp"
	never_random = TRUE //removes from the random  poster pool, effectively admin onlying it

/obj/structure/sign/poster/nanotrasen/wtf_is_co2
	name = "Carbon Dioxide"
	desc = "This informational poster teaches the viewer what carbon dioxide is."
	icon_state = "poster_co2"

/obj/structure/sign/poster/nanotrasen/focus
	name = "Focus! Motivational Poster"
	desc = "\"Focus! Let your energy be pinpointed!\""
	icon_state = "poster-focus"

/obj/structure/sign/poster/nanotrasen/miners
	name = "Nanotrasen Mining-Exploratory Corps Recruitment" //Shouldn't this be N+S?
	desc = "A poster recruiting more miners and explorers for new Nanotrasen holdings. It tells about how advanced Nanotrasen mining equipment and how it relates to the history of the company."
	icon_state = "posters-minersneeded"

/obj/structure/sign/poster/radio/ntra
	name = "NTRA"
	desc = "A Nanotrasen Radio poster. Despite all that's happened, communication is still NT's game, and the airwaves are just another Frontier to establish market dominance in."
	icon_state = "poster-radio_NTRA"

/obj/structure/sign/poster/radio/ntra
	name = "NTRA"
	desc = "A Nanotrasen Radio poster. Despite all that's happened, communication is still NT's game, and the airwaves are just another Frontier to establish market dominance in."
	icon_state = "poster-radio_NTRA"

//contraband related posters
/obj/structure/sign/poster/contraband/inteq_nanotrasen
	name = "Inteq Recruitment"
	desc = "Tired of your underpaying and abusive job at Nanotrasen? Join the IRMG Artificers! You won't get bullshit from us. Retrofit spacecraft and weaponry, field test weaponry, and earn higher pay!"
	icon_state = "poster-inteq_poaching_nt"
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'

/obj/structure/sign/poster/contraband/atmosia_independence
	name = "Atmosia Declaration of Independence"
	desc = "A relic of a failed rebellion on a Nanotrasen station, highly ridiculed due to the absurdity of it."
	icon_state = "poster_independence"
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'

/obj/structure/sign/poster/contraband/ntos
	name = "Ntos V"
	desc = "A advertisement for Ntos V. Unlike earlier iterations of the system, Nanotrasen has opted to update this version continously, instead of release a new version every so often, much to the dismay of older system users."
	icon_state = "poster_ntos"
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'

/obj/structure/sign/poster/contraband/aclf
	name = "Syndicate Support Poster"
	desc = "An poster made by ACLF protestors in support of the Syndicate, listing Nanotrasen's abuses of their workers. While considered as propaganda by many, some still keep this on their ships as this resonates with them."
	icon_state = "poster-aclf_antint"
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'

/obj/structure/sign/poster/contraband/tools
	name = "Tools"
	desc = "This poster looks like an advertisement for tools, but is in fact a subliminal jab at the tools on Nanotrasen stations."
	icon_state = "poster_tools"
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'

/obj/structure/sign/poster/contraband/engis_unite
	name = "Engineers Unite!"
	desc = "A poster sponsered by the Galactic Engineer's Concordat urging to vote YES to the formation of a engineers union on a Nanotrasen-Spaceworks Shipyard 22-A."
	icon_state = "poster_unite"
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'

/obj/structure/sign/poster/contraband/fun_police
	name = "Fun Police"
	desc = "A poster condemning Vigilitas security officers for being the 'fun police.' The creator of this poster is currently in jail for 2 counts of manslaughter and 1 murder."
	icon_state = "poster_fun_police"
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'

//retro nanotrasen posters. very inspired by the early apple logos and 70s-90s tech logos. Expect to see these on ancient Nanotrasen ships and stations, collectables, or callbacks to retro NT
/obj/structure/sign/poster/retro/nanotrasen
	poster_item_name = "retro poster"
	poster_item_desc = "A really old Nanotrasen poster that probably sells for a lot now days. It comes with adhesive backing, for easy pinning to any vertical surface."
	poster_item_icon_state = "rolled_legit"
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'

/obj/structure/sign/poster/retro/nanotrasen/random
	name = "random retro poster"
	icon_state = "random_retro"
	never_random = TRUE
	random_basetype = /obj/structure/sign/poster/retro/nanotrasen
	random_type = POSTER_SUBTYPES
	icon = 'mod_celadon/_storage_icons/icons/structures/posters/posters.dmi'

/obj/structure/sign/poster/retro/nanotrasen/nanotrasen_logo_70s
	name = "\improper Ancient Nanotrasen logo"
	desc = "A poster depicting an older Nanotrasen logo. This thing is ancient."
	icon_state = "poster-nanotrasen70s_retro"

/obj/structure/sign/poster/retro/nanotrasen/nanotrasen_logo_80s
	name = "\improper Nanotrasen logo"
	desc = "A poster depicting Nanotrasen's logo of the first bluespace exploration phase. It has a nice aesthetic."
	icon_state = "poster-nanotrasen_retro"

/obj/structure/sign/poster/retro/nanotrasen/smile
	name = "Smile"
	desc = "Turn that frown upside down! It has a nice aesthetic."
	icon_state = "poster-smile_retro"

/obj/structure/sign/poster/retro/nanotrasen/we_watch
	name = "We Watch"
	desc = "Big Brother is always watching. But instead of controlling you, he's trying to get you to stop loitering. It has a nice aesthetic."
	icon_state = "poster-watch_retro"

/obj/structure/sign/poster/retro/nanotrasen/build
	name = "Build"
	desc = "A poster glorifying the engineering team. It has a nice aesthetic."
	icon_state = "poster-build_retro"

/obj/structure/sign/poster/retro/nanotrasen/science
	name = "Science"
	desc = "A poster depicting an atom. It has a nice aesthetic."
	icon_state = "poster-science_retro"

/obj/structure/sign/poster/retro/nanotrasen/pdaancient
	name = "PDA Ad"
	desc = "A poster advertising the original Thinkitronic PDA after the company was aquired by Nanotrasen. This thing shipped with severe problems such as PDA message 'bombing' and memory errors. Despite this, it's fondly remembered. This thing is ancient."
	icon_state = "poster-pda70_retro"

/obj/structure/sign/poster/retro/nanotrasen/lasergun
	name = "Retro Laser Gun"
	desc = "A poster advertising the retro laser gun, back when it was new and called the L-104. This thing is ancient."
	icon_state = "poster-l102_retro"

/obj/structure/sign/poster/retro/nanotrasen/lasergun_new
	name = "Old Laser Gun"
	desc = "A poster advertising an older version of the L-704, the L-204 model. It has a nice aesthetic."
	icon_state = "poster-newl204_retro"

/obj/structure/sign/poster/retro/nanotrasen/radio
	name = "Radio"
	desc = "A poster advertising one of Nanotrasen's earliest products, a radio. One of its main selling points was a integrated OS and two way automatic translation for Solarian Common and Gezenan, which made it a smash hit. This thing is ancient."
	icon_state = "poster-radio70_retro"

//Safety moth posters, credit to AspEv for the art which the below posters are based on and to Ayy-Robotics for the sprites.

/obj/structure/sign/poster/nanotrasen/moth
	name = "Safety Moth - Poisoning"
	desc = "This informational poster uses Safety Moth(TM) to tell the viewer not to poison important goods, and to be wary of suspect foods. It's signed by 'AspEv'."
	icon_state = "poster_moth_poisoning"

/obj/structure/sign/poster/nanotrasen/moth/boh
	name = "Safety Moth - BoH"
	desc = "This informational poster uses Safety Moth(TM) to inform the viewer of the dangers of Bags of Holding. It's signed by 'AspEv'."
	icon_state = "poster_moth_boh"

/obj/structure/sign/poster/nanotrasen/moth/hardhats
	name = "Safety Moth - Hardhats"
	desc = "This informational poster uses Safety Moth(TM) to tell the viewer to wear hardhats in cautious areas. It's like a lamp for your head! It's signed by 'AspEv'."
	icon_state = "poster_moth_hardhats"

/obj/structure/sign/poster/nanotrasen/moth/smokey
	name = "Safety Moth - Smokey?"
	desc = "This informational poster uses Safety Moth(TM) to promote safe handling of plasma, or promoting crew to combat plasmafires. We can't tell. It's signed by 'AspEv'."
	icon_state = "poster_moth_smokey"

/obj/structure/sign/poster/nanotrasen/moth/piping
	name = "Safety Moth - Piping"
	desc = "This informational poster uses Safety Moth(TM) to tell atmospheric technicians correct types of piping to be used. Proper pipe placement prevents poor preformance! It's signed by 'AspEv'."
	icon_state = "poster_moth_piping"

/obj/structure/sign/poster/nanotrasen/moth/supermatter
	name = "Safety Moth - Supermatter"
	desc = "This informational poster uses Safety Moth(TM) to promote proper safety equipment when working near a Supermatter Crystal. It's signed by 'AspEv'."
	icon_state = "poster_moth_supermatter"

/obj/structure/sign/poster/nanotrasen/moth/meth
	name = "Safety Moth - Methamphetamine"
	desc = "This informational poster uses Safety Moth(TM) to tell the viewer to seek CMO approval before cooking methamphetamine. You shouldn't even be making this. It's signed by 'AspEv'."
	icon_state = "poster_moth_meth"

/obj/structure/sign/poster/nanotrasen/moth/epi
	name = "Safety Moth - Epinephrine"
	desc = "This informational poster uses Safety Moth(TM) to inform the viewer to help injured/deceased crewmen with their epinephrine injectors. It's signed by 'AspEv'."
	icon_state = "poster_moth_epi"

/obj/structure/sign/poster/nanotrasen/moth/delam
	name = "Safety Moth - Delamination Safety Precautions"
	desc = "This informational poster uses Safety Moth(TM) to tell the viewer to hide in lockers when the Supermatter Crystal has delaminated. Running away might be a better strategy. It's signed by 'AspEv'."
	icon_state = "poster_moth_delam"

#undef POSTER_SUBTYPES
