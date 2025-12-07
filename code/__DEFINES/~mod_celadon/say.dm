#define THE_VOICES_DEFAULT_MINPITCH 0.6
#define THE_VOICES_DEFAULT_MAXPITCH 1.4
#define THE_VOICES_DEFAULT_MINVARY 0.1
#define THE_VOICES_DEFAULT_MAXVARY 0.4
#define THE_VOICES_DEFAULT_MINSPEED 2
#define THE_VOICES_DEFAULT_MAXSPEED 8

#define THE_VOICES_SPEED_BASELINE 4 //Used to calculate delay between voices, any Voice speeds below this feature higher Voice density, any speeds above feature lower Voice density. Keeps voices length consistent

#define THE_VOICES_MAX_VOICES 128
#define THE_VOICES_MAX_TIME (10 SECONDS) // More or less the amount of time the above takes to process through with a Voice speed of 2.

#define THE_VOICES_PITCH_RAND(gend) ((gend == MALE ? rand(60, 120) : (gend == FEMALE ? rand(80, 140) : rand(60,140))) / 100) //Macro for determining random pitch based off gender
#define THE_VOICES_VARIANCE_RAND (rand(THE_VOICES_DEFAULT_MINVARY * 100, THE_VOICES_DEFAULT_MAXVARY * 100) / 100) //Macro for randomizing Voice variance to reduce the amount of copy-pasta necessary for that

#define THE_VOICES_DO_VARY(pitch, variance) (rand(((pitch * 100) - (variance*50)), ((pitch*100) + (variance*50))) / 100)

#define THE_VOICES_SOUND_FALLOFF_EXPONENT(distance) (distance/7) //At lower ranges, we want the exponent to be below 1 so that whispers don't sound too awkward. At higher ranges, we want the exponent fairly high to make yelling less obnoxious
