/// THE VERY IMPORTANT, FAST DEVELOPER ENVIRONMENT LOADING DEFINE!
/// If you define this flag, centcom will load. It's also supposed to preload planetoids, but that is disabled.
//#define FULL_INIT

#ifdef FULL_INIT
	#include "_mod_celadon\map_files\centcomm_ship.dmm" // [CELADON-ADD] - CELADON_CONFIGS_MAPS
#else
	#include "map_files\generic\blank.dmm"
#endif

#ifdef ALL_MAPS
	#ifdef CIBUILDING
		#include "templates.dm"
	#endif
#endif
