/*

utilities.GC
------------
This class contains all the constant declarations for the whole game. Be
it section configurations, map constants, etc. The options should be easy
to understand enough to know what they are for.

*/

package system
{
	public class GC
	{
		// Game Internal
		public static const GI_NAME:String = "Blaarpgh";
		public static const GI_WIDTH:int = 800;
		public static const GI_HEIGHT:int = 450;
		public static const GI_FPS:int = 60;
		public static const GI_SCALE:int = 2;
		// The minimum value for GI_SCALE is 1. Putting 0, will break it. 
		public static const GI_FLASHPUNKCONSOLE = true;
		
		public function GC(){}
	}
}