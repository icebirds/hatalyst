<?php

class app_distributer_EnDist extends system_core_BaseDistributer {
	public function __construct() { if(!php_Boot::$skip_constructor) {
		$this->uris = _hx_anonymous(array("defaultpage" => (isset($this->siteIndex) ? $this->siteIndex: array($this, "siteIndex")), "site" => _hx_anonymous(array("index" => (isset($this->siteIndex) ? $this->siteIndex: array($this, "siteIndex")))), "paramsample" => (isset($this->paramSample) ? $this->paramSample: array($this, "paramSample")), "license" => (isset($this->license) ? $this->license: array($this, "license"))));
		parent::__construct();
	}}
	public function show404($site) {
		parent::show404("en");
	}
	public function siteIndex($params) {
		if($params->length > 0) {
			$this->show404(null);
			return;
		}
		$this->showTemplate("en/index", null);
	}
	public function paramSample($params) {
		if($params->length > 2) {
			$this->show404(null);
			return;
		}
		$text = "The parameters is -- " . $params->toString();
		$param = _hx_anonymous(array("content" => $text));
		$this->showTemplate("en/paramsample", $param);
	}
	public function license($params) {
		if($params->length > 0) {
			$this->show404(null);
			return;
		}
		$this->showTemplate("en/license", null);
	}
	function __toString() { return 'app.distributer.EnDist'; }
}
