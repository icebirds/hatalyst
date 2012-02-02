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

/**
 * The Index class.
 * @author Icebird
 */
package;
#if php
import php.Lib;
import php.Web;
#elseif neko
import neko.Lib;
import neko.Web;
#end
//import your defined classes here
import app.distributer.EnDist;
import app.distributer.ZhDist;

class Main
{
	/**
	 * URL rule , This will controll the url process action.
	 * As default, it will remove "index.php/" and the define
	 * a surfix ".html", so you can make your site url looks
	 * like static html page.
	 **/
	public static inline var urlRule:EReg = ~/^\/index.php\/|^\/index.php|^\/|.html$/g;

	public static inline var temp_dir:String = "lib/app/templates/";

	public static inline var err_dir:String = "lib/app/errors/";
	function new()
	{
		switch(Web.getHostName())
		{
			//Process domain zhhost
			case "zhhost":
				new ZhDist().distribute();
			//Process other domains
			default:
				new EnDist().distribute();
		}
	}

	static function main()
	{
		new Main();
	}
}
