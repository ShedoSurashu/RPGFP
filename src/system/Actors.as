package system
{
	import net.flashpunk.graphics.Spritemap;

	public class Actors
	{
		// PLAYER actor
		[Embed(source="assets/sprites/player.png")]
		public static const ACTOR_PLAYER:Class;
		
		public function Actors() {
			var spriteMap:Spritemap;
			
			// Construct PLAYER actor
			spriteMap.add("walk_down", [0, 1, 2, 3], 8, true);
			spriteMap.add("walk_left", [4, 5, 6, 7], 8, true);
			spriteMap.add("walk_right", [8, 9, 10, 11], 8, true);
			spriteMap.add("walk_up", [12, 13, 14, 15], 8, true);
			spriteMap.add("stand_down", [0], 0, false);
			spriteMap.add("stand_left", [4], 0, false);
			spriteMap.add("stand_right", [8], 0, false);
			spriteMap.add("stand_up", [12], 0, false);
		}
	}
}