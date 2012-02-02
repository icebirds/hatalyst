#include <hxcpp.h>

#ifndef INCLUDED_Hello
#include <Hello.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif

Void Hello_obj::__construct()
{
{
	HX_SOURCE_POS("Hello.hx",12)
	::haxe::Log_obj::trace(HX_CSTRING("Hello Wrold!"),hx::SourceInfo(HX_CSTRING("Hello.hx"),12,HX_CSTRING("Hello"),HX_CSTRING("new")));
}
;
	return null();
}

Hello_obj::~Hello_obj() { }

Dynamic Hello_obj::__CreateEmpty() { return  new Hello_obj; }
hx::ObjectPtr< Hello_obj > Hello_obj::__new()
{  hx::ObjectPtr< Hello_obj > result = new Hello_obj();
	result->__construct();
	return result;}

Dynamic Hello_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Hello_obj > result = new Hello_obj();
	result->__construct();
	return result;}

Void Hello_obj::main( ){
{
		HX_SOURCE_PUSH("Hello_obj::main")
		HX_SOURCE_POS("Hello.hx",7)
		::Hello_obj::__new();
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Hello_obj,main,(void))


Hello_obj::Hello_obj()
{
}

void Hello_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Hello);
	HX_MARK_END_CLASS();
}

Dynamic Hello_obj::__Field(const ::String &inName)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"main") ) { return main_dyn(); }
	}
	return super::__Field(inName);
}

Dynamic Hello_obj::__SetField(const ::String &inName,const Dynamic &inValue)
{
	return super::__SetField(inName,inValue);
}

void Hello_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("main"),
	String(null()) };

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
};

Class Hello_obj::__mClass;

void Hello_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("Hello"), hx::TCanCast< Hello_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics);
}

void Hello_obj::__boot()
{
}

