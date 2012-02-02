/**
Copyright (c) from 2010, Icebirds Team
All rights reserved.

Redistribution and use in source and binary forms,
with or without modification, are permitted provided
that the following conditions are met:

    * Redistributions of source code must retain the
      above copyright notice, this list of conditions
      and the following disclaimer.
    * Redistributions in binary form must reproduce
      the above copyright notice, this list of
      conditions and the following disclaimer in the
      documentation and/or other materials provided
      with the distribution.
    * Neither the name of the Icebirds Team nor the
      names of its contributors may be used to endorse
      or promote products derived from this software
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/
package system.core;

#if php
import php.io.File;
import php.Lib;
import php.Sys;
import php.Web;
#elseif neko
import neko.io.File;
import neko.Lib;
import neko.Sys;
import neko.Web;
#end

class BaseDistributer
{
	var uris:Dynamic;
	public function new()
	{
		
	}

	public function distribute()
	{
		//处理uri
		var uri = processURI(Web.getURI());
		if(uri.length == 0)
		{
			Reflect.callMethod(uris, "defaultpage", [[]]);
			return;
		}
		if(!findURI(uris, uri, 0))
		{
			show404();
		}
	}

	function getTxtFile(filePath:String):String
	{
		return File.getContent(Sys.getCwd() + "txt/" + filePath + ".data");
	}


	function showTemplate(template:String, ?params:Dynamic = null)
	{
		if(params == null)
		{
			params = {};
		}
		var template = new haxe.Template(File.getContent(Sys.getCwd() + Main.temp_dir + template + ".mtt"));
		Lib.print(template.execute(params));
	}

	function show404(?site:String)
	{
		//Lib.print(output);
		var error404 = new haxe.Template(File.getContent(Sys.getCwd() + Main.err_dir + site + "/404.mtt"));
		Web.setReturnCode(404);
		Lib.print(error404.execute({}));
	}

	function findURI(uris:Dynamic,uri:Array<String>, offset:Int):Bool
	{
		switch(Type.typeof(Reflect.field(uris, uri[offset])))
		{
			case TObject:
				return findURI(Reflect.field(uris, uri[offset]),uri, offset+1);
			case TFunction:
				if(offset < uri.length -1)
				{
					var tempParams:Array<String> = uri.slice(offset + 1);
					Reflect.callMethod(uris, uri[offset], [tempParams]);
				}
				else
				{
					var tempParams:Array<String> = new Array();
					Reflect.callMethod(uris, uri[offset], [[]]);
				}
				return true;
			case TNull:
				return false;
			default:
				return false;
		}
	}

	function processURI(uri:String):Array<String>
	{
		var tempURI:String = Main.urlRule.replace(uri, "");
		var returnURI:Array<String> = tempURI.split("/");
		if(returnURI.length == 1 && returnURI[0] == "")
		{
			returnURI = new Array();
		}
		return returnURI;
	}
}
