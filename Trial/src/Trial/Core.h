#pragma once

#ifdef TRIAL_ENABLE_ASSERTS
	#define TRIAL_ASSERT(x, ...) { if(!(x)) { TRIAL_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define TRIAL_CORE_ASSERT(x, ...) { if(!(x)) { TRIAL_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define TRIAL_ASSERT(x, ...)
	#define TRIAL_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)