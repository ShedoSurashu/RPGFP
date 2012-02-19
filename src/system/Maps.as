package system
{
	public class Maps
	{
		// PARK_01
		[Embed(source="assets/maps/PARK_01.tmx", mimeType="application/octet-stream")]
		public static const PARK_01:Class;
		
		public static var list:Array = new Array();
		public function Maps(){}
		
		public static function setup():void {
			var map:Map;
			
			// PARK_01;
			map = new Map(Maps.PARK_01);
			map.index = 0;
			list.push(map);
		}
	}
}