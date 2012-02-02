<?php

class system_core_BaseDistributer {
	public function __construct() {
		;
	}
	public $uris;
	public function distribute() {
		$uri = $this->processURI(php_Web::getURI());
		if($uri->length === 0) {
			Reflect::callMethod($this->uris, "defaultpage", new _hx_array(array(new _hx_array(array()))));
			return;
		}
		if(!$this->findURI($this->uris, $uri, 0)) {
			$this->show404(null);
		}
	}
	public function getTxtFile($filePath) {
		return php_io_File::getContent(php_Sys::getCwd() . "txt/" . $filePath . ".data");
	}
	public function showTemplate($template, $params) {
		if($params === null) {
			$params = _hx_anonymous(array());
		}
		$template1 = new haxe_Template(php_io_File::getContent(php_Sys::getCwd() . "lib/app/templates/" . $template . ".mtt"));
		php_Lib::hprint($template1->execute($params, null));
	}
	public function show404($site) {
		$error404 = new haxe_Template(php_io_File::getContent(php_Sys::getCwd() . "lib/app/errors/" . $site . "/404.mtt"));
		php_Lib::hprint($error404->execute(_hx_anonymous(array()), null));
	}
	public function findURI($uris, $uri, $offset) {
		$»t = (Type::typeof(Reflect::field($uris, $uri[$offset])));
		switch($»t->index) {
		case 4:
		{
			return $this->findURI(Reflect::field($uris, $uri[$offset]), $uri, $offset + 1);
		}break;
		case 5:
		{
			if($offset < $uri->length - 1) {
				$tempParams = $uri->slice($offset + 1, null);
				Reflect::callMethod($uris, $uri[$offset], new _hx_array(array($tempParams)));
			} else {
				$tempParams = new _hx_array(array());
				Reflect::callMethod($uris, $uri[$offset], new _hx_array(array(new _hx_array(array()))));
			}
			return true;
		}break;
		case 0:
		{
			return false;
		}break;
		default:{
			return false;
		}break;
		}
	}
	public function processURI($uri) {
		$tempURI = _hx_deref(new EReg("^/index.php/|^/index.php|^/|.html\$", "g"))->replace($uri, "");
		$returnURI = _hx_explode("/", $tempURI);
		if($returnURI->length === 1 && $returnURI[0] === "") {
			$returnURI = new _hx_array(array());
		}
		return $returnURI;
	}
	public function __call($m, $a) {
		if(isset($this->$m) && is_callable($this->$m))
			return call_user_func_array($this->$m, $a);
		else if(isset($this->»dynamics[$m]) && is_callable($this->»dynamics[$m]))
			return call_user_func_array($this->»dynamics[$m], $a);
		else if('toString' == $m)
			return $this->__toString();
		else
			throw new HException('Unable to call «'.$m.'»');
	}
	function __toString() { return 'system.core.BaseDistributer'; }
}
