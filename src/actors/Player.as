package actors
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import system.Actors;
	import system.GC;
	
	public class Player extends Entity
	{
		public var playerSprite:Spritemap = new Spritemap(Actors.PLAYER, GC.AD_PLAYERSPRITEWIDTH, GC.AD_PLAYERSPRITEHEIGHT);
		
		public var currentAnim:String = GC.AD_PLAYERDEFAULTANIM;
		public var speed:int = GC.AD_PLAYERDEFAULTSPEED;
		
		public function Player(position:Point) {
			
			setupSprite();
			
//			playerSprite = _playerSprite;
			graphic = playerSprite;
			
			playerSprite.play(currentAnim);
			
			x = position.x;
			y = position.y;
			
			// Temporary until I can think of a way to make this dynamic.
			setHitbox(32,48,0,0);
			
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
			
			playerSprite.play(currentAnim);
			
			if (Input.check("walk_right")) {
				
				if (!colliding(new Point(x + speed, y))) {
					currentAnim = "walk_right";
					x += speed;
				}
				
			} else if (Input.check("walk_left")) {
				
				if (!colliding(new Point(x - speed, y))) {
					currentAnim = "walk_left";
					x -= speed;
				}
				
			} else if (Input.check("walk_down")) {
				
				if (!colliding(new Point(x, y + speed))) {
					currentAnim = "walk_down";
					y += speed;
				}
				
			} else if (Input.check("walk_up")) {
				
				if (!colliding(new Point(x, y - speed))) {
					currentAnim = "walk_up";
					y -= speed;
				}
				
			}
			
			
			// CHeck if the buttons have been released.
			if (Input.released("walk_right")) {
				currentAnim = "stand_right";
			} else if (Input.released("walk_left")) {
				currentAnim = "stand_left";
			} else if (Input.released("walk_down")) {
				currentAnim = "stand_down";
			} else if (Input.released("walk_up")) {
				currentAnim = "stand_up";
			}
			
		}
		
		public function setupSprite():void {
			playerSprite.add("walk_down", [0, 1, 2, 3], 8, true);
			playerSprite.add("walk_left", [4, 5, 6, 7], 8, true);
			playerSprite.add("walk_right", [8, 9, 10, 11], 8, true);
			playerSprite.add("walk_up", [12, 13, 14, 15], 8, true);
			playerSprite.add("stand_down", [0], 0, false);
			playerSprite.add("stand_left", [4], 0, false);
			playerSprite.add("stand_right", [8], 0, false);
			playerSprite.add("stand_up", [12], 0, false);
		}
	}
}