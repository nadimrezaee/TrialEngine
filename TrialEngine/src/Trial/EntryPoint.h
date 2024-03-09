#pragma once
#include "Log.h"

extern Trial::Application* Trial::CreateApplication();

int main(int argc, char* argv[])
{
	auto app = Trial::CreateApplication();
	app->Run();
	delete app;
}