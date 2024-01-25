#include "Trial.h"

class SandboxApp : public Trial::Application
{
public:
	SandboxApp(){}
	~SandboxApp(){}
};

Trial::Application* Trial::CreateApplication()
{
	return new SandboxApp();
}