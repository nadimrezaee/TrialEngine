#pragma once
#include "Events/Event.h"
#include "TrialDllImpExp.h"
#include "Window.h"

namespace Trial
{
	class DllImpExp Application
	{
	public:
		Application();
		virtual ~Application();
		void Run();
	private:
		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	Application* CreateApplication();
}

