#pragma once

int main(int argc, char* argv[])
{
	auto app = Trial::CreateApplication();
	app->Run();
	delete app;
}