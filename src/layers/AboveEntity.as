package layers
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.Grid;
	
	import system.GC;
	
	public class AboveEntity extends Entity
	{
		public var tilemap:Tilemap;
		
		public function AboveEntity(map:XML,tileset:Class):void
		{
			graphic = tilemap = new Tilemap(tileset, (map.@width * map.@tilewidth), (map.@height * map.@tileheight), map.@tilewidth, map.@tileheight);
			
			var horizontalPos:int = 0;
			var verticalPos:int = 0;
			var gid:int = 0;
			for each (var tile:XML in map.layer.(@name == "AboveEntity").data.tile) {
				
				if (horizontalPos > (map.@width-1)) {
					horizontalPos = 0;
					verticalPos++;
				}
				
				if (tile.@gid > GC.MD_TOTAL) {
					gid = (tile.@gid-(GC.MD_TOTAL+1));
					tilemap.setTile(horizontalPos,verticalPos,gid);
				}
				
				horizontalPos++;
			}
			
			FP.log("AboveEntity layer generated.");
		}
	}
}