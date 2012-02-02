md bin\lib\app
	if "%1" == "" goto build
	if "%1" == "build" goto build
	if "%1" == "debug" goto debug
	if "%1" == "clean" goto clean
	goto end
:build
	haxe build.hxml
	xcopy src\app\errors bin\lib\app\ /e /y
	xcopy src\app\templates bin\lib\app\ /e /y
	goto end
:debug
	haxe builddebug.hxml
	xcopy src\app\errors bin\lib\app\ /e /y
	xcopy src\app\templates bin\lib\app\ /e /y
	goto end
:clean
	del /s /q bin\*.*
	rd /s /q bin\lib
:end
