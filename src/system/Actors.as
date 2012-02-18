package system
{
	import net.flashpunk.graphics.Spritemap;

	public class Actors
	{
		// PLAYER actor
		[Embed(source="assets/sprites/player.png")]
		public static const ACTOR_PLAYER:Class;
		
		public function Actors() {
			// Construct PLAYER actor
		}
	}
}