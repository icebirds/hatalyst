#include <hxcpp.h>

#include <haxe/Log.h>
#include <Hello.h>
#include <Std.h>

void __boot_all()
{
hx::RegisterResources( hx::GetResources() );
::haxe::Log_obj::__register();
::Hello_obj::__register();
::Std_obj::__register();
::Std_obj::__boot();
::Hello_obj::__boot();
::haxe::Log_obj::__boot();
}

