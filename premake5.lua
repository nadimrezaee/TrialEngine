workspace "Trial"
	architecture "x64"
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "Trial/vendor/GLFW/include"

include "Trial/vendor/GLFW"

project "Trial"
	location "Trial"
	kind "SharedLib"
	language "C++"
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")
	
	pchheader "tepch.h"
	pchsource "Trial/src/tepch.cpp"
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/src/Trial",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}
	links 
	{ 
		"GLFW",
		"opengl32.lib"
	}
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		defines
		{
			"TrialModule"
		}
		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}		
	filter "configurations:Debug"
		defines "TRIAL_DEBUG"
		symbols "On"
	filter "configurations:Release"
		defines "TRIAL_RELEASE"
		optimize "On"
	filter "configurations:Dist"
		defines "TRIAL_DIST"
		optimize "On"
	
	
project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	includedirs
	{
		"Trial/vendor/spdlog/include",
		"Trial/src"
	}
	links
	{
		"Trial"
	}
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
	filter "configurations:Debug"
		defines "TRIAL_DEBUG"
		symbols "On"
	filter "configurations:Release"
		defines "TRIAL_RELEASE"
		optimize "On"
	filter "configurations:Dist"
		defines "TRIAL_DIST"
		optimize "On"