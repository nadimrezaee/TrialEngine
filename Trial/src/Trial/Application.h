#pragma once
#include "Events/Event.h"
#include "Trial/Events/ApplicationEvent.h"
#include "Window.h"
#include "TrialDllImpExp.h"

namespace Trial
{
	class DllImpExp Application
	{
	public:
		Application();
		virtual ~Application();
		void Run();
		void OnEvent(Event& e);
	private:
		bool OnWindowClose(WindowCloseEvent& e);
		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	Application* CreateApplication();
}

