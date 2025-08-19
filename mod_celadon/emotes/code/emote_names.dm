/datum/emote
	var/name

/datum/emote/New()
	. = ..()
	if(!name)
		name = key

/// MARK:  Emote Living

/datum/emote/flip
	name = EMOTE_FLIP

/datum/emote/spin
	name = EMOTE_SPIN

/datum/emote/living/blush
	name = EMOTE_BLUSH

/datum/emote/living/bow
	name = EMOTE_BOW

/datum/emote/living/burp
	name = EMOTE_BURP

/datum/emote/living/choke
	name = EMOTE_CHOKE

/datum/emote/living/collapse
	name = EMOTE_COLLAPSE

/datum/emote/living/dance
	name = EMOTE_DANCE

/datum/emote/living/deathgasp
	name = EMOTE_DEATHGASP

/datum/emote/living/drool
	name = EMOTE_DROOL

// /datum/emote/living/quiver
// 	name = EMOTE_QUIVER

/datum/emote/living/frown
	name = EMOTE_FROWN

/datum/emote/living/gag
	name = EMOTE_GAG

/datum/emote/living/glare
	name = EMOTE_GLARE

/datum/emote/living/grin
	name = EMOTE_GRIN

/datum/emote/living/groan
	name = EMOTE_GROAN

/datum/emote/living/grimace
	name = EMOTE_GRIMACE

/datum/emote/living/jump
	name = EMOTE_JUMP

/datum/emote/living/look
	name = EMOTE_LOOK

/datum/emote/living/nightmare
	name = EMOTE_NIGHTMARE

/datum/emote/living/bshake
	name = EMOTE_BSHAKE

/datum/emote/living/shudder
	name = EMOTE_SHUDDER

/datum/emote/living/point
	name = EMOTE_POINT

/datum/emote/living/pout
	name = EMOTE_POUT

/datum/emote/living/scream
	name = EMOTE_SCREAM

/datum/emote/living/shake
	name = EMOTE_SHAKE

/datum/emote/living/shiver
	name = EMOTE_SHIVER

/datum/emote/living/sigh
	name = EMOTE_SIGH

/datum/emote/living/sigh/happy
	name = EMOTE_SIGH_HAPPY

/datum/emote/living/sit
	name = EMOTE_SIT

/datum/emote/living/smile
	name = EMOTE_SMILE

/datum/emote/living/smug
	name = EMOTE_SMUG

/datum/emote/living/sniff
	name = EMOTE_SNIFF

/datum/emote/living/snore
	name = EMOTE_SNORE

/datum/emote/living/stare
	name = EMOTE_STARE

/datum/emote/living/strech
	name = EMOTE_STRECH

/datum/emote/living/sulk
	name = EMOTE_SULK

/datum/emote/living/sway
	name = EMOTE_SWAY

/datum/emote/living/tilt
	name = EMOTE_TILT

/datum/emote/living/tremble
	name = EMOTE_TREMBLE

/datum/emote/living/twitch
	name = EMOTE_TWITCH

/datum/emote/living/twitch_s
	name = EMOTE_TWITCHS

/datum/emote/living/carbon/wave
	name = EMOTE_CARBON_WAVE

/datum/emote/living/whimper
	name = EMOTE_WHIMPER

/datum/emote/living/wsmile
	name = EMOTE_WSMILE

/datum/emote/living/swear
	name = EMOTE_SWEAR

/datum/emote/living/glasses
	name = EMOTE_GLASSES

/// MARK:  Emote Brain

/datum/emote/living/brain/alarm
	name = EMOTE_BRAIN_ALARM

/datum/emote/living/brain/alert
	name = EMOTE_BRAIN_ALERT

/datum/emote/living/brain/flash
	name = EMOTE_BRAIN_FLASH

/datum/emote/living/brain/notice
	name = EMOTE_BRAIN_NOTICE

// /datum/emote/living/brain/whistle
// 	name = EMOTE_BRAIN_WHISTLE

/datum/emote/living/brain/beep
	name = EMOTE_BRAIN_BEEP

/datum/emote/living/brain/boop
	name = EMOTE_BRAIN_BOOP

/// MARK:  Emote Carbon

/datum/emote/living/carbon/blink
	name = EMOTE_CARBON_BLINK

/datum/emote/living/carbon/blink_r
	name = EMOTE_CARBON_BLINKR

/datum/emote/living/carbon/cough
	name = EMOTE_CARBON_COUGH

/datum/emote/living/carbon/cross
	name = EMOTE_CARBON_CROSS

/datum/emote/living/carbon/chuckle
	name = EMOTE_CARBON_CHUCKLE

/datum/emote/living/carbon/faint
	name = EMOTE_CARBON_FAINT

/datum/emote/living/carbon/giggle
	name = EMOTE_CARBON_GIGGLE

/datum/emote/living/carbon/moan
	name = EMOTE_CARBON_MOAN

/datum/emote/living/carbon/sign
	name = EMOTE_CARBON_SIGN

/datum/emote/living/carbon/yawn
	name = EMOTE_CARBON_YAWN

/datum/emote/living/carbon/gurgle
	name = EMOTE_CARBON_GURGLE

/datum/emote/living/carbon/inhale
	name = EMOTE_CARBON_INHALE

/datum/emote/living/carbon/inhale/sharp
	name = EMOTE_CARBON_INHALE_SHARP

/datum/emote/living/carbon/kiss
	name = EMOTE_CARBON_KISS

/datum/emote/living/carbon/exhale
	name = EMOTE_CARBON_EXHALE

/datum/emote/living/carbon/laugh
	name = EMOTE_CARBON_LAUGH

/datum/emote/living/carbon/laugh_evil
	name = EMOTE_CARBON_LAUGH_EVIL

/datum/emote/living/carbon/scowl
	name = EMOTE_CARBON_SCOWL

/datum/emote/living/carbon/twirl
	name = EMOTE_CARBON_TWIRL

/// MARK:  Emote Alien

/datum/emote/living/carbon/alien/humanoid/gnarl
	name = EMOTE_ALIEN_GNARL

/datum/emote/living/carbon/alien/humanoid/hiss
	name = EMOTE_ALIEN_HISS

/datum/emote/living/carbon/alien/humanoid/roar
	name = EMOTE_ALIEN_ROAR

/// MARK:  Emote Human

/datum/emote/living/carbon/human/airguitar
	name = EMOTE_SPECIES_AIRGUITAR

/datum/emote/living/carbon/human/clap
	name = EMOTE_SPECIES_CLAP

/datum/emote/living/carbon/human/crack
	name = EMOTE_SPECIES_CRACK

/datum/emote/living/carbon/human/cry
	name = EMOTE_SPECIES_CRY

/datum/emote/living/carbon/human/eyebrow
	name = EMOTE_SPECIES_EYEBROW

/datum/emote/living/carbon/human/wince
	name = EMOTE_SPECIES_WINCE

/datum/emote/living/carbon/human/squint
	name = EMOTE_SPECIES_SQUINT

/datum/emote/living/carbon/human/facepalm
	name = EMOTE_SPECIES_FACEPALM

/datum/emote/living/carbon/human/palm
	name = EMOTE_SPECIES_PALM

/datum/emote/living/carbon/sign/signal
	name = EMOTE_SPECIES_SIGNAL

/datum/emote/living/carbon/human/gasp
	name = EMOTE_SPECIES_GASP

/datum/emote/living/carbon/human/shake
	name = EMOTE_SPECIES_SHAKE

/datum/emote/living/carbon/human/grumble
	name = EMOTE_SPECIES_GRUMBLE

// /datum/emote/living/carbon/human/highfive
// 	name = EMOTE_SPECIES_HIGHFIVE

// /datum/emote/living/carbon/human/highfive/dap
// 	name = EMOTE_SPECIES_DAP

// /datum/emote/living/carbon/human/highfive/handshake
// 	name = EMOTE_SPECIES_HANDSHAKE

// /datum/emote/living/carbon/human/highfive/rps
// 	name = EMOTE_SPECIES_RPS

/datum/emote/living/carbon/human/hug
	name = EMOTE_SPECIES_HUG

/datum/emote/living/carbon/human/mumble
	name = EMOTE_SPECIES_MUMBLE

/datum/emote/living/carbon/human/scratch
	name = EMOTE_SPECIES_SCRATCH

/datum/emote/living/carbon/human/scream
	name = EMOTE_SPECIES_SCREAM

/datum/emote/living/carbon/human/scream/screech
	name = EMOTE_SPECIES_SCREECH

/datum/emote/living/carbon/human/sneeze
	name = EMOTE_SPECIES_SNEEZE

/datum/emote/living/carbon/human/slap
	name = EMOTE_SPECIES_SLAP

/datum/emote/living/carbon/human/snap
	name = EMOTE_SPECIES_SNAP

/datum/emote/living/carbon/human/tailthump
	name = EMOTE_SPECIES_TAILTHUMP

/datum/emote/living/carbon/human/kepiclick
	name = EMOTE_SPECIES_KEPICLICK

/datum/emote/living/carbon/human/kepiwhistle
	name = EMOTE_SPECIES_KEPIWHISTLE

/datum/emote/living/carbon/human/fart
	name = EMOTE_SPECIES_FART

/datum/emote/living/carbon/human/wag
	name = EMOTE_SPECIES_WAG

/datum/emote/living/carbon/human/wag/stop
	name = EMOTE_SPECIES_WAG_STOP

/datum/emote/living/carbon/human/wink
	name = EMOTE_SPECIES_WINK

/datum/emote/living/carbon/human/pale
	name = EMOTE_SPECIES_PALE

/datum/emote/living/carbon/human/raise
	name = EMOTE_SPECIES_RAISE

/datum/emote/living/carbon/human/salute
	name = EMOTE_SPECIES_SALUTE

/datum/emote/living/carbon/human/shrug
	name = EMOTE_SPECIES_SHRUG

/datum/emote/living/carbon/human/sniff
	name = EMOTE_SPECIES_SNIFF

/datum/emote/living/carbon/human/nod
	name = EMOTE_SPECIES_NOD

/datum/emote/living/carbon/human/drask_talk/drone
	name = EMOTE_SPECIES_DRONE

/datum/emote/living/carbon/human/drask_talk/hum
	name = EMOTE_SPECIES_HUM

/datum/emote/living/carbon/human/drask_talk/rumble
	name = EMOTE_SPECIES_RUMBLE

// /datum/emote/living/carbon/human/monkey/gnarl
// 	name = EMOTE_SPECIES_GNARL

/datum/emote/living/carbon/human/monkey/roll
	name = EMOTE_SPECIES_ROLL

/datum/emote/living/carbon/human/monkey/tail
	name = EMOTE_SPECIES_TAIL

/datum/emote/living/carbon/human/monkey/scratch
	name = EMOTE_SPECIES_SCRATCH

/datum/emote/living/carbon/human/bark
	name = EMOTE_SPECIES_BARK

/datum/emote/living/carbon/human/wbark
	name = EMOTE_SPECIES_WBARK

/datum/emote/living/carbon/human/ururu
	name = EMOTE_SPECIES_RUMBLE

/// MARK: Emote Silicon

/datum/emote/living/silicon/scream
	name = EMOTE_SILICON_SCREAM

/datum/emote/living/silicon/ping
	name = EMOTE_SILICON_PING

/datum/emote/living/silicon/buzz
	name = EMOTE_SILICON_BUZZ

/datum/emote/living/silicon/buzz2
	name = EMOTE_SILICON_BUZZ2

/datum/emote/living/silicon/beep
	name = EMOTE_SILICON_BEEP

/datum/emote/living/silicon/boop
	name = EMOTE_SILICON_BOOP

/datum/emote/living/silicon/yes
	name = EMOTE_SILICON_YES

/datum/emote/living/silicon/no
	name = EMOTE_SILICON_NO

/datum/emote/living/silicon/law
	name = EMOTE_SILICON_LAW

/datum/emote/living/silicon/halt
	name = EMOTE_SILICON_HALT

/// MARK: Species specific

/datum/emote/living/carbon/human/hiss
	name = EMOTE_SPECIES_HISS

/datum/emote/living/carbon/human/creak
	name = EMOTE_SPECIES_CREAK

/datum/emote/living/carbon/human/quill
	name = EMOTE_SPECIES_QUILL

/datum/emote/living/carbon/human/warble
	name = EMOTE_SPECIES_WARBLE

/datum/emote/living/carbon/human/croak
	name = EMOTE_SPECIES_CROAK

/datum/emote/living/carbon/human/croak/anger
	name = EMOTE_SPECIES_CROAK_ANGER

/datum/emote/living/carbon/human/clack
	name = EMOTE_SPECIES_CLACK

/datum/emote/living/carbon/human/clack/click
	name = EMOTE_SPECIES_CLICK

/datum/emote/living/carbon/human/flap
	name = EMOTE_SPECIES_FLAP

/datum/emote/living/carbon/human/flutter
	name = EMOTE_SPECIES_FLUTTER

/datum/emote/living/carbon/human/flap/aflap
	name = EMOTE_SPECIES_AFLAP

/datum/emote/living/carbon/human/howl
	name = EMOTE_SPECIES_HOWL

/datum/emote/living/carbon/human/growl
	name = EMOTE_SPECIES_GROWL

/datum/emote/living/carbon/human/rattle
	name = EMOTE_SPECIES_RATTLE

/datum/emote/living/carbon/human/slime/squish
	name = EMOTE_SPECIES_SQUISH

/datum/emote/living/carbon/human/slime/bubble
	name = EMOTE_SPECIES_BUBBLE

/datum/emote/living/carbon/human/slime/pop
	name = EMOTE_SPECIES_POP

/datum/emote/living/carbon/human/tajaran/meow
	name = EMOTE_SPECIES_MEOW

/datum/emote/living/carbon/human/tajaran/mrow
	name = EMOTE_SPECIES_MROW

/datum/emote/living/carbon/human/tajaran/mrowss
	name = EMOTE_SPECIES_MROWSS

/// MARK: Emote Animal

/datum/emote/living/simple_animal/gorilla/ooga
	name = EMOTE_ANIMAL_OOGA

/datum/emote/living/simple_animal/diona_chirp
	name = EMOTE_ANIMAL_CHIRP

/datum/emote/living/simple_animal/gorilla_ooga
	name = EMOTE_ANIMAL_OOGA

/datum/emote/living/simple_animal/pet/dog/bark
	name = EMOTE_ANIMAL_BARK

/datum/emote/living/simple_animal/pet/dog/yelp
	name = EMOTE_ANIMAL_YELP

/datum/emote/living/simple_animal/pet/dog/growl
	name = EMOTE_ANIMAL_GROWL

/datum/emote/living/simple_animal/mouse/squeak
	name = EMOTE_ANIMAL_SQUEAK

/datum/emote/living/simple_animal/pet/cat/meow
	name = EMOTE_ANIMAL_MEOW

/datum/emote/living/simple_animal/pet/cat/hiss
	name = EMOTE_ANIMAL_HISS

/datum/emote/living/simple_animal/pet/cat/purr
	name = EMOTE_ANIMAL_PURR

/datum/emote/living/simple_animal/pet/cat/sit
	name = EMOTE_ANIMAL_SIT

/// MARK: New Emotes

/datum/emote/living/carbon/human/whistle
	name = EMOTE_SPECIES_WHISTLE

/datum/emote/living/carbon/human/johnny
	name = EMOTE_SPECIES_JOHNNY

/datum/emote/living/carbon/human/snuffle
	name = EMOTE_SPECIES_SNUFFLE

/datum/emote/living/carbon/human/hem
	name = EMOTE_SPECIES_HEM

/datum/emote/living/carbon/human/scratch
	name = EMOTE_SPECIES_SCRATCH

/datum/emote/living/carbon/human/roar
	name = EMOTE_SPECIES_ROAR

/datum/emote/living/carbon/human/rumble
	name = EMOTE_SPECIES_RUMBLE

/datum/emote/living/carbon/human/threat
	name = EMOTE_SPECIES_THREAT

/datum/emote/living/carbon/human/purr
	name = EMOTE_SPECIES_PURR

/datum/emote/living/carbon/human/purrl
	name = EMOTE_SPECIES_PURRL

/datum/emote/living/carbon/human/fpurrl
	name = EMOTE_SPECIES_FPURR

/datum/emote/living/carbon/human/waves_k
	name = EMOTE_SPECIES_WAVES_K

/datum/emote/living/carbon/human/wiggles
	name = EMOTE_SPECIES_WIGGLES

/datum/emote/living/carbon/human/whip
	name = EMOTE_SPECIES_WHIP

/datum/emote/living/carbon/human/whip/whips
	name = EMOTE_SPECIES_WHIPS

/datum/emote/living/carbon/human/chitter
	name = EMOTE_SPECIES_CHITTER

/datum/emote/living/carbon/human/shame
	name = EMOTE_SPECIES_SHAME

/datum/emote/living/carbon/human/collapse
	name = EMOTE_SPECIES_COLLAPSE

/datum/emote/living/carbon/human/warcray
	name = EMOTE_SPECIES_WARCRY

/datum/emote/living/carbon/human/grimace
	name = EMOTE_SPECIES_GRIMACE

/datum/emote/living/carbon/human/jump
	name = EMOTE_SPECIES_JUMP

/datum/emote/living/carbon/human/kiss
	name = EMOTE_SPECIES_AIRKISS

/datum/emote/living/carbon/human/msqueak
	name = EMOTE_SPECIES_MSQUEAK

/datum/emote/living/carbon/human/peace
	name = EMOTE_SPECIES_PEACE

/datum/emote/living/carbon/human/pout
	name = EMOTE_SPECIES_POUT

/datum/emote/living/carbon/human/scowl
	name = EMOTE_SPECIES_SCOWL

/datum/emote/living/carbon/human/smug
	name = EMOTE_SPECIES_SMUG

/datum/emote/living/carbon/human/spin
	name = EMOTE_SPECIES_SPIN

/datum/emote/living/carbon/human/strech
	name = EMOTE_SPECIES_STRECH

/datum/emote/living/carbon/human/sulk
	name = EMOTE_SPECIES_SULK

/datum/emote/living/carbon/human/surprised
	name = EMOTE_SPECIES_SURPRISED

/datum/emote/living/carbon/human/surrender
	name = EMOTE_SPECIES_SURRENDER

/datum/emote/living/carbon/human/wsmile
	name = EMOTE_SPECIES_WSMILE

/datum/emote/living/carbon/human/clack_spider
	name = EMOTE_SPECIES_CLACK_SPIDER
