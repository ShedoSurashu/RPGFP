/*

layers._CollisionTriggers
-------------------------
The class that defines the collision-trigger areas on a map.

*/

package layers
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Grid;
	
	import system.GC;
	
	public class _CollisionTriggers extends Entity
	{
		public var grid:Grid;
		
		public function _CollisionTriggers(map:XML)
		{
			// Set the type.
			type = GC.MT_COLLISIONTRIGGER;
			
			mask = grid = new Grid((map.@width * map.@tilewidth), (map.@height * map.@tileheight), map.@tilewidth, map.@tileheight);
			
			var horizontalInc:int = 0;
			var verticalInc:int = 0;
			for each (var marker:XML in map.layer.(@name == "Markers").data.tile) {
				
				if (horizontalInc > (map.@width-1)) {
					horizontalInc = 0;
					verticalInc++;
				}
				
				if (marker.@gid == GC.MI_COLLISIONTRIGGER) {
					grid.setRect(horizontalInc, verticalInc, 1, 1, true);
				}
				
				horizontalInc++;
				
			}
			
			FP.log("Collision-trigger layer generated.");
		}
	}
}