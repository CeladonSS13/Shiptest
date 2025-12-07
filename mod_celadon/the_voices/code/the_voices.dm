//Datums for voices and the_voices accessories

/datum/the_voices
	var/name = "Default"
	var/id = "Default"
	var/soundpath //Path for the actual sound file used for the the_voices

	// Pitch vars. The actual range for a the_voices is [(pitch - (maxvariance*0.5)) to (pitch + (maxvariance*0.5))]
	// Make absolutely sure to take variance into account when curating a sound for the_voices purposes.
	var/minpitch = THE_VOICES_DEFAULT_MINPITCH
	var/maxpitch = THE_VOICES_DEFAULT_MAXPITCH
	var/minvariance = THE_VOICES_DEFAULT_MINVARY
	var/maxvariance = THE_VOICES_DEFAULT_MAXVARY

	// Speed vars. Speed determines the number of characters required for each the_voices, with lower speeds being faster with higher the_voices density
	var/minspeed = THE_VOICES_DEFAULT_MINSPEED
	var/maxspeed = THE_VOICES_DEFAULT_MAXSPEED

	// Visibility vars. Regardless of what's set below, these can still be obtained via adminbus and genetics. Rule of fun.
	var/list/ckeys_allowed
	var/ignore = FALSE //Controls whether or not this can be chosen in chargen
	var/allow_random = FALSE //Allows chargen randomization to use this. This is mainly to restrict the pool to sounds that fit well for most characters


// So the basic jist of the sound design here: We make use primarily of shorter instrument samples for voices. We would've went with animalese instead, but doing so would've involved quite a bit of overhead to saycode.
// Short instrument samples tend to sound surprisingly nice for voices, being able to be played in rapid succession without being outright obnoxious.
// It isn't just instruments that work well here, however. Anything that works well as a stab? Short attack, no sustain, a decent amount of release? Also works extremely well for voices.

// MARK: Music instrumentals

/datum/the_voices/mutedc2
	name = "Muted String (Low)"
	id = "mutedc2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/guitar/crisis_muted/C2.ogg'
	allow_random = TRUE

/datum/the_voices/mutedc3
	name = "Muted String (Medium)"
	id = "mutedc3"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/guitar/crisis_muted/C3.ogg'
	allow_random = TRUE

/datum/the_voices/mutedc4
	name = "Muted String (High)"
	id = "mutedc4"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/guitar/crisis_muted/C4.ogg'
	allow_random = TRUE

/datum/the_voices/banjoc3
	name = "Banjo (Medium)"
	id = "banjoc3"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/banjo/Cn3.ogg'
	allow_random = TRUE

/datum/the_voices/banjoc4
	name = "Banjo (High)"
	id = "banjoc4"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/banjo/Cn4.ogg'
	allow_random = TRUE

// MARK: Main

/datum/the_voices/squeaky
	name = "Squeaky"
	id = "squeak"
	soundpath = 'sound/items/toysqueak1.ogg'
	maxspeed = 4

/datum/the_voices/beep
	name = "Beepy"
	id = "beep"
	soundpath = 'sound/machines/terminal_select.ogg'
	maxpitch = 1 //Bringing the pitch higher just hurts your ears :<
	maxspeed = 4 //This soundbyte's too short for larger speeds to not sound awkward

/datum/the_voices/synthetic_grunt
	name = "Synthetic (Grunt)"
	id = "synthgrunt"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/misc/bloop.ogg'

/datum/the_voices/synthetic
	name = "Synthetic (Normal)"
	id = "synth"
	soundpath = 'sound/machines/uplinkerror.ogg'

/datum/the_voices/bullet
	name = "Windy"
	id = "bullet"
	maxpitch = 1.6 //This works well with higher pitches!
	soundpath = 'sound/weapons/bulletflyby.ogg' //This works... Surprisingly well as a the_voices? It's neat!

/datum/the_voices/coggers
	name = "Brassy"
	id = "coggers"
	soundpath = 'sound/machines/clockcult/integration_cog_install.ogg' //Yet another unexpectedly good the_voices sound

// Genetics-only/admin-only sounds. These either clash hard with the audio design of the above sounds, or have some other form of audio design issue, but aren't *too* awful as a sometimes thing.
// Rule of fun very much applies to this section. Audio design is extremely important for the above section, but down here? No gods, no masters, pure anarchy.
// The min/max variables simply don't apply to these, as only chargen cares about them. As such, there's no need to define those.

/datum/the_voices/bikehorn
	name = "Bikehorn"
	id = "horn"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/bikeborn/Cn4.ogg'
	ignore = TRUE // Genetics only. This is an unusually quiet sound, but genetics should be allowed to have some !!fun!!

/datum/the_voices/bwoink
	name = "Bwoink"
	id = "bwoink"
	soundpath = 'sound/effects/adminhelp.ogg'
	ignore = TRUE // Emergent heart attack generation

/datum/the_voices/merp
	name = "Merp"
	id = "merp"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/misc/merp.ogg'
	ignore = FALSE

/datum/the_voices/bark
	name = "Bark"
	id = "the_voices"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/misc/bark1.ogg'
	ignore = FALSE

/datum/the_voices/nya
	name = "Nya"
	id = "nya"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/misc/nya.ogg'
	minspeed = 6
	maxspeed = 12

/datum/the_voices/moff
	name = "Moff"
	id = "moff"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/misc/mothsqueak.ogg'

/datum/the_voices/moff/short
	name = "Moff squeak"
	id = "moffsqueak"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/mothsqueak.ogg'
	allow_random = TRUE
	ignore = FALSE

/datum/the_voices/weh
	name = "Weh"
	id = "weh"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/misc/weh.ogg'
	ignore = FALSE

/datum/the_voices/honk
	name = "Annoying Honk"
	id = "honk"
	soundpath = 'sound/creatures/goose1.ogg'
	ignore = TRUE

/datum/the_voices/meow //Meow the_voices?
	name = "Meow"
	id = "meow"
	allow_random = TRUE
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/misc/meow1.ogg'
	minspeed = 5
	maxspeed = 11

/datum/the_voices/mrowss
	name = "Mrowss"
	id = "mrowss"
	allow_random = TRUE
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/misc/mrowss.ogg'
	minspeed = 5
	maxspeed = 11

/datum/the_voices/purrsfox
	name = "Purrs fox"
	id = "purrsfox"
	allow_random = TRUE
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/fox_purr.ogg'
	minspeed = 5
	maxspeed = 11

/datum/the_voices/gaster
	name = "Gaster"
	id = "gaster"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/voice_gaster_1.ogg'
	minvariance = 0

/datum/the_voices/chirp
	name = "Chirp"
	id = "chirp"
	allow_random = TRUE
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/chirp.ogg'

/datum/the_voices/bleat
	name = "Bleat"
	id = "bleat"
	allow_random = TRUE
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/bleat_bark.ogg'
	minspeed = 5
	maxspeed = 11

// MARK: Undertale
/datum/the_voices/alphys
	name = "Alphys"
	id = "alphys"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_alphys.ogg'
	minvariance = 0

/datum/the_voices/asgore
	name = "Asgore"
	id = "asgore"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_asgore.ogg'
	minvariance = 0

/datum/the_voices/flowey
	name = "Flowey (normal)"
	id = "flowey1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_flowey_1.ogg'
	minvariance = 0

/datum/the_voices/flowey/evil
	name = "Flowey (evil)"
	id = "flowey2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_flowey_2.ogg'
	minvariance = 0

/datum/the_voices/papyrus
	name = "Papyrus"
	id = "papyrus"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_papyrus.ogg'
	minvariance = 0

/datum/the_voices/ralsei
	name = "Ralsei"
	id = "ralsei"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_ralsei.ogg'
	minvariance = 0

/datum/the_voices/sans //real
	name = "Sans"
	id = "sans"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_sans.ogg'
	minvariance = 0

/datum/the_voices/toriel
	name = "Toriel"
	id = "toriel"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_toriel.ogg'
	minvariance = 0
	maxpitch = THE_VOICES_DEFAULT_MAXPITCH*2 //Just because if it's high enough you get Asriel's voice

/datum/the_voices/undyne
	name = "Undyne"
	id = "undyne"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_undyne.ogg'
	minvariance = 0

/datum/the_voices/temmie
	name = "Temmie"
	id = "temmie"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_temmie.ogg'
	minvariance = 0

/datum/the_voices/susie
	name = "Susie"
	id = "susie"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_susie.ogg'
	minvariance = 0

/datum/the_voices/mettaton
	name = "Mettaton"
	id = "mettaton"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_metta_1.ogg'
	minvariance = 0

/datum/the_voices/gen_monster
	name = "Generic Monster 1"
	id = "gen_monster_1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_monster1.ogg'
	minvariance = 0

/datum/the_voices/gen_monster/alt
	name = "Generic Monster 2"
	id = "gen_monster_2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/undertale/voice_monster2.ogg'
	minvariance = 0

// MARK: Don't starve
/datum/the_voices/wilson
	name = "Wilson"
	id = "wilson"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/dont_starve/wilson_bark.ogg'

/datum/the_voices/wolfgang
	name = "Wolfgang"
	id = "wolfgang"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/dont_starve/wolfgang_bark.ogg'
	minspeed = 4
	maxspeed = 10

/datum/the_voices/woodie
	name = "Woodie"
	id = "woodie"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/dont_starve/woodie_bark.ogg'
	minspeed = 4
	maxspeed = 10

/datum/the_voices/wurt
	name = "Wurt"
	id = "wurt"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/dont_starve/wurt_bark.ogg'

/datum/the_voices/wx78
	name = "wx78"
	id = "wx78"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/dont_starve/wx78_bark.ogg'
	minspeed = 3
	maxspeed = 9

// MARK: Goon
/datum/the_voices/blub
	name = "Blub"
	id = "blub"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/blub.ogg'

/datum/the_voices/bottalk
	name = "Bottalk 1"
	id = "bottalk1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/bottalk_1.ogg'
	minspeed = 3
	maxspeed = 9

/datum/the_voices/bottalk/alt1
	name = "Bottalk 2"
	id = "bottalk2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/bottalk_2.ogg'

/datum/the_voices/bottalk/alt2
	name = "Bottalk 3"
	id = "bottalk3"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/bottalk_3.ogg'

/datum/the_voices/bottalk/alt3
	name = "Bottalk 4"
	id = "bottalk4"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/bottalk_4.ogg'

/datum/the_voices/buwoo
	name = "Buwoo"
	id = "buwoo"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/buwoo.ogg'

/datum/the_voices/cow
	name = "Cow"
	id = "cow"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/cow.ogg'

/datum/the_voices/lizard
	name = "Lizard"
	id = "lizard"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/lizard.ogg'

/datum/the_voices/pug
	name = "Pug"
	id = "pug"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/pug.ogg'

/datum/the_voices/pugg
	name = "Pugg"
	id = "pugg"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/pugg.ogg'

/datum/the_voices/radio
	name = "Radio 1"
	id = "radio1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/radio.ogg'

/datum/the_voices/radio/short
	name = "Radio 2"
	id = "radio2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/radio2.ogg'

/datum/the_voices/radio/ai
	name = "Radio (AI)"
	id = "radio_ai"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/radio_ai.ogg'

/datum/the_voices/roach //Turkish characters be like
	name = "Roach"
	id = "roach"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/roach.ogg'

/datum/the_voices/skelly
	name = "Skelly"
	id = "skelly"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/skelly.ogg'

/datum/the_voices/speak
	name = "Speak 1"
	id = "speak1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/speak_1.ogg'

/datum/the_voices/speak/alt1
	name = "Speak 2"
	id = "speak2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/speak_2.ogg'

/datum/the_voices/speak/alt2
	name = "Speak 3"
	id = "speak3"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/speak_3.ogg'

/datum/the_voices/speak/alt3
	name = "Speak 4"
	id = "speak4"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/goon/speak_4.ogg'

/datum/the_voices/chitter
	name = "Chittery"
	id = "chitter"
	minspeed = 4 //Even with the sound being replaced with a unique, shorter sound, this is still a little too long for higher speeds
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/misc/chitter.ogg'

/datum/the_voices/chitter/alt
	name = "Chittery Alt"
	id = "chitter2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/mothchitter2.ogg'

// MARK: The Mayhem Special
/datum/the_voices/whistle
	name = "Whistle 1"
	id = "whistle1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/birdwhistle.ogg'

/datum/the_voices/whistle/alt1
	name = "Whistle 2"
	id = "whistle2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/birdwhistle2.ogg'

/datum/the_voices/caw
	name = "Caw"
	id = "caw"
	allow_random = TRUE
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/caw.ogg'

/datum/the_voices/caw/alt1
	name = "Caw 2"
	id = "caw2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/caw.ogg'
	minspeed = 4
	maxspeed = 9

/datum/the_voices/caw/alt2
	name = "Caw 3"
	id = "caw3"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/caw2.ogg'
	minspeed = 3
	maxspeed = 9

/datum/the_voices/caw/alt3
	name = "Caw 4"
	id = "caw4"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/caw3.ogg'
	minspeed = 3
	maxspeed = 9

/datum/the_voices/ehh
	name = "Ehh 1"
	id = "ehh1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/ehh.ogg'
	minspeed = 3
	maxspeed = 9

/datum/the_voices/ehh/alt1
	name = "Ehh 2"
	id = "ehh2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/ehh2.ogg'

/datum/the_voices/ehh/alt2
	name = "Ehh 3"
	id = "ehh3"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/ehh3.ogg'

/datum/the_voices/ehh/alt3
	name = "Ehh 4"
	id = "ehh4"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/ehh4.ogg'
	minspeed = 3
	maxspeed = 9

/datum/the_voices/ehh/alt5
	name = "Ehh 5"
	id = "ehh5"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/ehh5.ogg'

/datum/the_voices/eugh
	name = "Eugh"
	id = "eugh"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/eugh.ogg'
	minspeed = 6
	maxspeed = 11

/datum/the_voices/faucet
	name = "Faucet 1"
	id = "faucet1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/faucet.ogg'

/datum/the_voices/faucet/alt1
	name = "Faucet 2"
	id = "faucet2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/faucet2.ogg'

/datum/the_voices/haha
	name = "Haha"
	id = "haha"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/haha.ogg'
	minspeed = 7
	maxspeed = 12

/datum/the_voices/ribbit
	name = "Ribbit"
	id = "ribbit"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/ribbit.ogg'

/datum/the_voices/hoot
	name = "Hoot"
	id = "hoot"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/hoot.ogg'
	minspeed = 4
	maxspeed = 9

/datum/the_voices/tweet
	name = "Tweet"
	id = "tweet"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/tweet.ogg'

/datum/the_voices/ahuh
	name = "Ahuh"
	id = "ahuh"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/ahuh.ogg'

/datum/the_voices/cry
	name = "Cry"
	id = "cry"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/cry.ogg'
	minspeed = 3
	maxspeed = 9

/datum/the_voices/dwoop
	name = "Dwoop"
	id = "dwoop"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/dwoop.ogg'
	minspeed = 3
	maxspeed = 9

/datum/the_voices/growl
	name = "Growl 1"
	id = "growl1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/growl.ogg'
	minspeed = 3
	maxspeed = 9

/datum/the_voices/growl/alt1
	name = "Growl 2"
	id = "growl2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/growl2.ogg'

/datum/the_voices/moan
	name = "Moan 1"
	id = "moan1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/moan1.ogg'
	minspeed = 5
	maxspeed = 9

/datum/the_voices/moan/alt1
	name = "Moan 2"
	id = "moan2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/moan2.ogg'
	minspeed = 4
	maxspeed = 9

/datum/the_voices/moan/alt2
	name = "Moan 3"
	id = "moan3"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/moan3.ogg'
	minspeed = 5
	maxspeed = 9

/datum/the_voices/raah
	name = "Raah 1"
	id = "raah1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/raah1.ogg'
	minspeed = 6
	maxspeed = 10

/datum/the_voices/raah/alt1
	name = "Raah 2"
	id = "raah2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/raah2.ogg'
	minspeed = 5
	maxspeed = 9

/datum/the_voices/slurp
	name = "Slurp"
	id = "slurp"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/slurp.ogg'

/datum/the_voices/uhm
	name = "Uhm"
	id = "uhm"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/uhm.ogg'

/datum/the_voices/zap
	name = "Zap"
	id = "zap"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/kazooie/zap.ogg'
	minspeed = 8
	maxspeed = 12

/datum/the_voices/poyo
	name = "Belial"
	id = "poyo"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/poyo.ogg'
	minspeed = 3
	maxspeed = 10

/datum/the_voices/ace_blip
	name = "Ace Talk 1"
	id = "acetalk1"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/ace_attorney/aa_blip.ogg'
	allow_random = TRUE
	minspeed = 4
	minvariance = 0

/datum/the_voices/ace_blip/alt1
	name = "Ace Talk 2"
	id = "acetalk2"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/ace_attorney/aa_dd_blip.ogg'

/datum/the_voices/ace_blip/alt2
	name = "Ace Talk 3"
	id = "acetalk3"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/ace_attorney/aa_tgaa_blip.ogg'

/datum/the_voices/ace_typewriter
	name = "Ace Typewriter"
	id = "acewrite"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/ace_attorney/aa_blip_typewriter.ogg'
	minspeed = 4
	minvariance = 0

/datum/the_voices/nomi // Mrayu?
	name = "Nomi"
	id = "nomi"
	soundpath = 'mod_celadon/_storage_sounds/sound/the_voices/voice/nomi.ogg'
