//#define NOOVERMAP //uncomment this to load centcom and runtime station and thats it.
//#define MINIMAL //uncomment this to load a smaller centcomm and smaller runtime station, only works together with NOOVERMAP

#ifdef MINIMAL
#define NOOVERMAP
#endif

#ifdef ALL_MAPS
	#ifdef CIBUILDING
		#include "templates.dm"
	#endif
#endif

// [CELADON-ADD] - CELADON_CONFIGS_MAPS
#include "_mod_celadon\map_files\centcomm_ship.dmm"
// [/CELADON-ADD]
