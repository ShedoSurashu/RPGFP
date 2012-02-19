package worlds
{
	import actors.*;
	
	import flash.geom.Point;
	
	import layers.*;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Spritemap;
	
	import system.*;
	
	public class Game extends World
	{
		public var player:Player;
		public var npc_italy01:NPC;
		
		// Tile Layers
		public var mapMarkerCollisions:_Collisions;
		public var mapMarkerTriggers:_Triggers;
		public var mapMarkerCollisionTriggers:_CollisionTriggers;
		public var mapUnderGround:UnderGround;
		public var mapGround:Ground;
		public var mapAboveGround:AboveGround;
		public var mapAboveEntity:AboveEntity;
		public var mapAboveAll:AboveAll;
		
		// Map Info
		public var maps:Array;
		public var currentMapIndex:int = 0;
		public var currentMap:Map;
		
		public function Game()
		{
			player = new Player(new Point(50,50));
			npc_italy01 = new NPC(new Point(100,50));
			maps = Maps.list;
			
			MapLoad();
		}
		
		
		public function MapLoad():void {
			currentMap = maps[currentMapIndex];
			
			mapUnderGround = new UnderGround(currentMap.xml, Tilesets.NEWTOWN5);
			mapGround = new Ground(currentMap.xml, Tilesets.NEWTOWN5);
			mapAboveGround = new AboveGround(currentMap.xml, Tilesets.NEWTOWN5);
			mapAboveEntity = new AboveEntity(currentMap.xml, Tilesets.NEWTOWN5);
			mapAboveAll = new AboveAll(currentMap.xml, Tilesets.NEWTOWN5);
			
			add(mapUnderGround);
			add(mapGround);
			add(mapAboveGround);
			add(npc_italy01);
			add(player);
			add(mapAboveEntity);
			add(mapAboveAll);
			FP.log("Character test started. Currently testing: America");
			
//			RPGFP.currentMap = RPGFP.maps[RPGFP.currentMapIndex];
			
//			add(new UnderGround(currentMap.xml,TILE_SET));
//			FP.world.add(new Ground(currentMap.xml, TILE_SET));
//			FP.world.add(new AboveGround(currentMap.xml, TILE_SET));
//			FP.world.add(new Player(new Point(50,50)));
//			FP.world.add(new AboveEntity(currentMap.xml, TILE_SET));
//			FP.world.add(new AboveAll(currentMap.xml, TILE_SET));
		}
		
	}
}