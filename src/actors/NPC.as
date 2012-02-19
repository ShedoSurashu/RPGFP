package actors
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import system.Actors;
	import system.GC;
	
	public class NPC extends Entity
	{
		public var npcSprite:Spritemap = new Spritemap(Actors.NPC_ITALY01, GC.AD_PLAYERSPRITEWIDTH, GC.AD_PLAYERSPRITEHEIGHT);
		
		public var currentAnim:String = GC.AD_PLAYERDEFAULTANIM;
		public var speed:int = GC.AD_PLAYERDEFAULTSPEED;
		
		public function NPC(position:Point) {
			
			setupSprite();
			
			type = "npc";
			
			graphic = npcSprite;
			
			npcSprite.play(currentAnim);
			
			x = position.x;
			y = position.y;
			
			// Temporary until I can think of a way to make this dynamic.
			setHitbox(32,32,0,-16);
			
		}
		
		public function colliding(position:Point):Boolean {
			// Check for collision against any of the existing tile types.
			var tileType:String = "tile_collision";
			if (collide(tileType, position.x, position.y)) {
				return true;
			} else {
				return false;
			}
		}
		
		override public function update():void {			
			layer = -y;
		}
		
		public function setupSprite():void {
			npcSprite.add("walk_down", [0, 1, 2, 3], 8, true);
			npcSprite.add("walk_left", [4, 5, 6, 7], 8, true);
			npcSprite.add("walk_right", [8, 9, 10, 11], 8, true);
			npcSprite.add("walk_up", [12, 13, 14, 15], 8, true);
			npcSprite.add("stand_down", [0], 0, false);
			npcSprite.add("stand_left", [4], 0, false);
			npcSprite.add("stand_right", [8], 0, false);
			npcSprite.add("stand_up", [12], 0, false);
		}
	}
}