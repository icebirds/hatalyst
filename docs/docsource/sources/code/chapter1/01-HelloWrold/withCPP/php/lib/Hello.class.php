<?php

class Hello {
	public function __construct() { if(!php_Boot::$skip_constructor) {
		haxe_Log::trace("Hello Wrold!", _hx_anonymous(array("fileName" => "Hello.hx", "lineNumber" => 12, "className" => "Hello", "methodName" => "new")));
	}}
	static function main() {
		new Hello();
	}
	function __toString() { return 'Hello'; }
}
