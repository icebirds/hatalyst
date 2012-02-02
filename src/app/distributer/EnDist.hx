package app.distributer;

import system.core.BaseDistributer;


class EnDist extends BaseDistributer
{
	override function show404(?site:String)
	{
		super.show404("en");
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
			trace("Too many parameters");
			show404();
			return;
		}
		showTemplate("en/index");
	}

	function paramSample(?params:Array<String>)
	{
		if(params.length > 2)
		{
			trace("Too many parameters");
			show404();
			return;
		}
		var text:String = "The parameters is -- " + params.toString();
		var param = {content:text}
		showTemplate("en/paramsample", param);
	}

	function license(?params:Array<String>)
	{
		if(params.length > 0)
		{
			trace("Too many parameters");
			show404();
			return;
		}
		showTemplate("en/license");
	}

}
