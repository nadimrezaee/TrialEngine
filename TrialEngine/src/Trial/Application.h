#pragma once
#include "TrialDllImpExp.h"

namespace Trial
{
	class DllImpExp Application
	{
	public:
		Application();
		virtual ~Application();
		void Run();
	};

	Application* CreateApplication();
}

