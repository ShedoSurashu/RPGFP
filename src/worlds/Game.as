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
		
		// Camera
		public var gameCamera:Camera;
		
		public function Game()
		{
//			player = new Player(new Point(500,250));
			player = new Player(new Point(500,250));
			npc_italy01 = new NPC(new Point(100,50));
			maps = Maps.list;
			
			// Set default camera location
			gameCamera = new Camera();
			
			MapLoad();
		}
		
		override public function update():void {
			gameCamera.followPlayer(currentMap.width, currentMap.height, player);
			mapAboveEntity.layer = -player.bottom;
			mapAboveAll.layer = -(player.bottom+1);
			FP.log(FP.screen.width);
			super.update();
		}
		
		public function MapLoad():void {
			currentMap = maps[currentMapIndex];
			gameCamera.adjust(currentMap.width, currentMap.height, player);
			
			mapMarkerCollisions = new _Collisions(currentMap.xml);
			mapMarkerTriggers = new _Triggers(currentMap.xml);
			mapMarkerCollisionTriggers = new _CollisionTriggers(currentMap.xml);
			mapUnderGround = new UnderGround(currentMap.xml, Tilesets.NEWTOWN5);
			mapGround = new Ground(currentMap.xml, Tilesets.NEWTOWN5);
			mapAboveGround = new AboveGround(currentMap.xml, Tilesets.NEWTOWN5);
			mapAboveEntity = new AboveEntity(currentMap.xml, Tilesets.NEWTOWN5);
			mapAboveAll = new AboveAll(currentMap.xml, Tilesets.NEWTOWN5);
			
//			mapAboveAll.layer = 0;
//			mapAboveEntity.layer = 1;
//			player.layer = 3;
//			npc_italy01.layer = 4;
//			mapAboveGround.layer = 5;
//			mapGround.layer = 6;
//			mapUnderGround.layer = 7;
//			mapMarkerCollisionTriggers.layer = 8;
//			mapMarkerTriggers.layer = 9;
//			mapMarkerCollisions.layer = 10;
			
			add(mapMarkerCollisions);
			add(mapMarkerTriggers);
			add(mapMarkerCollisionTriggers);
			add(mapUnderGround);
			add(mapGround);
			add(mapAboveGround);
			add(player);
			add(npc_italy01);
			add(mapAboveEntity);
			add(mapAboveAll);
			FP.log("Layer: "+player.layer.toString());
			
			FP.log("Map has been loaded.");
		}
		
	}
}