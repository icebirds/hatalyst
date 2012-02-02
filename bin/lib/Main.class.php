<?php

class Main {
	public function __construct() { if(!php_Boot::$skip_constructor) {
		switch($_SERVER['SERVER_NAME']) {
		case "zhhost":{
			_hx_deref(new app_distributer_ZhDist())->distribute();
		}break;
		default:{
			_hx_deref(new app_distributer_EnDist())->distribute();
		}break;
		}
	}}
	static $urlRule;
	static $temp_dir = "lib/app/templates/";
	static $err_dir = "lib/app/errors/";
	static function main() {
		new Main();
	}
	function __toString() { return 'Main'; }
}
Main::$urlRule = new EReg("^/index.php/|^/index.php|^/|.html\$", "g");
