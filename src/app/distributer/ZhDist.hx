package app.distributer;

import system.core.BaseDistributer;


class ZhDist extends BaseDistributer
{
	override function show404(?site:String)
	{
		super.show404("zh");
	}

	public function new()
	{
		uris = 
		{
			defaultpage: this.siteIndex,
			site:
			{
				index: this.siteIndex
			},
			paramsample: this.paramSample,
			license: this.license
		};
		super();
	}


	function siteIndex(?params:Array<String>)
	{
		if(params.length > 0)
		{
			trace("太多參數");
			show404();
			return;
		}
		showTemplate("zh/index");
	}

	function paramSample(?params:Array<String>)
	{
		if(params.length > 2)
		{
			trace("太多參數");
			show404();
			return;
		}
		var text:String = "參數爲-- " + params.toString();
		var param = {content:text}
		showTemplate("zh/paramsample", param);
	}

	function license(?params:Array<String>)
	{
		if(params.length > 0)
		{
			trace("太多參數");
			show404();
			return;
		}
		showTemplate("zh/license");
	}


}
