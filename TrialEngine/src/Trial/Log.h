#pragma once
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"
#include "TrialDllImpExp.h"

namespace Trial
{
	class DllImpExp Log
	{
	public:
		static void Init();
		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

#define TRIAL_CORE_TRACE(...)    ::Trial::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define TRIAL_CORE_INFO(...)     ::Trial::Log::GetCoreLogger()->info(__VA_ARGS__)
#define TRIAL_CORE_WARN(...)     ::Trial::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define TRIAL_CORE_ERROR(...)    ::Trial::Log::GetCoreLogger()->error(__VA_ARGS__)
#define TRIAL_CORE_CRITICAL(...) ::Trial::Log::GetCoreLogger()->critical(__VA_ARGS__)

#define TRIAL_TRACE(...)         ::Trial::Log::GetClientLogger()->trace(__VA_ARGS__)
#define TRIAL_INFO(...)          ::Trial::Log::GetClientLogger()->info(__VA_ARGS__)
#define TRIAL_WARN(...)          ::Trial::Log::GetClientLogger()->warn(__VA_ARGS__)
#define TRIAL_ERROR(...)         ::Trial::Log::GetClientLogger()->error(__VA_ARGS__)
#define TRIAL_CRITICAL(...)      ::Trial::Log::GetClientLogger()->critical(__VA_ARGS__)

