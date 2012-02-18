package actors
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	import system.GC;
	
	public class Player extends Entity
	{
		public var playerSprite:Spritemap;
		
		public var currentAnim:String = GC.AD_PLAYERDEFAULTANIM;
		public var speed:int = GC.AD_PLAYERDEFAULTSPEED;
		
		public function Player(position:Point, _playerSprite:Spritemap) {
			
			playerSprite = _playerSprite;
			graphic = playerSprite;
			
			playerSprite.play(currentAnim);
			
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
			
			playerSprite.play(currentAnim);
			
			if (Input.check("walk_right")) {
				
				if (!colliding(new Point(x + speed, y))) {
					x += speed;
					currentAnim = "walk_right";
				}
				
			} else if (Input.check("walk_left")) {
				
				if (!colliding(new Point(x - speed, y))) {
					x -= speed;
					currentAnim = "walk_left";
				}
				
			} else if (Input.check("walk_down")) {
				
				if (!colliding(new Point(x, y + speed))) {
					y += speed;
					currentAnim = "walk_down";
				}
				
			} else if (Input.check("walk_up")) {
				
				if (!colliding(new Point(x, y - speed))) {
					y -= speed;
					currentAnim = "walk_up";
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
	}
}