#pragma once

#ifdef TrialModule
	#define DllImpExp __declspec(dllexport)
#else
	#define DllImpExp __declspec(dllimport)
#endif