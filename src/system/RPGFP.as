/*

utilities.RPGFP
---------------
All the internal core functions are stored in this class. I don't think
there's any need for you to mess around with code that's located here.

*/

package system
{
	public class RPGFP
	{
		public static var maps:Array = new Array();
		public static var currentMapIndex:int = 0;
		public static var currentMap:Map;
		
		public function RPGFP(){}
		
		// Setup all the maps needed in-game.
		public static function MapSetup():void {
			var map:Map;
			
			// PARK_01;
			map = new Map(Maps.PARK_01);
			map.index = 0;
			maps.push(map);
		}
	}
}