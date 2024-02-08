workplace "TrialEngine"
	architecture "x64"
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
outputdir = "%{cfg.buildcfg}_%{cfg.system}_%{cfg.architecture}"

project "TrialEngine"
	location "TrialEngine"
	kind "SharedLib"
	language "C++"
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-obj" .. outputdir .. "/%{prj.name}")
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	includedirs
	{
		%{prj.name}/vendor/spdlog/include"
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
			("{COPY} %{cfg.buildtarget.relpath} .. /bin/" .. outputdir .. "/Sandbox")
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
		"TrialEngine/vendor/spdlog/include",
		"TrialEngine/src"
	}
	links
	{
		"Hazel"
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
	