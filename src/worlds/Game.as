package worlds
{
	import actors.*;
	
	import flash.geom.Point;
	
	import layers.*;
	
	import net.flashpunk.World;
	import net.flashpunk.graphics.Spritemap;
	
	import system.*;
	
	public class Game extends World
	{
		public var player:Player
		
		// Tile Layers
		public var mapMarkerCollisions:_Collisions;
		public var mapMarkerTriggers:_Triggers;
		public var mapMarkerCollisionTriggers:_CollisionTriggers;
		public var mapUnderGround:UnderGround;
		public var mapGround:Ground;
		public var mapAboveGround:AboveGround;
		public var mapAboveEntity:AboveEntity;
		public var mapAboveAll:AboveAll;
		
		
		public function Game()
		{
			player = new Player(new Point(50,50),new Spritemap(Actors.ACTOR_PLAYER, GC.AD_PLAYERSPRITEWIDTH, GC.AD_PLAYERSPRITEHEIGHT));
			
			RPGFP.MapLoad();
		}
		
	}
}