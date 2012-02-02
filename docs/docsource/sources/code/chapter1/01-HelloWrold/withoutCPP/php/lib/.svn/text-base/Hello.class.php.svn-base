<?php

class Hello {
	public function __construct($aaa) { if( !php_Boot::$skip_constructor ) {
		if($aaa === null) {
			$aaa = 3;
			;
		}
		haxe_Log::trace("Hello Wrold!" . Std::string($aaa), _hx_anonymous(array("fileName" => "Hello.hx", "lineNumber" => 12, "className" => "Hello", "methodName" => "new")));
		;
	}}
	static function main() {
		new Hello(null);
		;
	}
	function __toString() { return 'Hello'; }
}
