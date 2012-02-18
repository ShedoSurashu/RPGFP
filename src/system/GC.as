/*

utilities.GC
------------
This class contains all the constant declarations for the whole game. Be
it section configurations, map constants, etc. The options should be easy
to understand enough to know what they are for.

*/

package system
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class GC
	{
		// Game Details
		public static const GD_NAME:String = "Blaarpgh";
		public static const GD_WIDTH:int = 800;
		public static const GD_HEIGHT:int = 450;
		public static const GD_FPS:int = 60;
		public static const GD_SCALE:int = 2; // Minimum value is 1. 
		public static const GD_FLASHPUNKCONSOLE:Boolean = true;
		
		// Configure Game Controls
		Input.define("walk_down", Key.S, Key.DOWN);
		Input.define("walk_left", Key.A, Key.LEFT);
		Input.define("walk_right", Key.D, Key.RIGHT);
		Input.define("walk_up", Key.W, Key.UP);
		
		// Marker Details
		public static const MD_TOTAL:int = 3;
		
		// Marker Names
		public static const MT_COLLISION:String = "tile_collision";
		public static const MT_TRIGGER:String = "tile_trigger";
		public static const MT_COLLISIONTRIGGER:String = "tile_collisiontrigger";
		
		// Marker Identifiers
		public static const MI_COLLISION:int = 1;
		public static const MI_TRIGGER:int = 2;
		public static const MI_COLLISIONTRIGGER:int = 3;
		
		// Actor Details
		public static const AD_PLAYERSPRITEWIDTH:int = 32;
		public static const AD_PLAYERSPRITEHEIGHT:int = 48;
		public static const AD_PLAYERDEFAULTANIM:String = "stand_down";
		public static const AD_PLAYERDEFAULTSPEED:int = 2;
		
		public function GC(){}
	}
}