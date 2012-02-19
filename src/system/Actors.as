package system
{
	import net.flashpunk.graphics.Spritemap;

	public class Actors
	{
		// PLAYER actor
		[Embed(source="assets/sprites/player.png")]
		public static const PLAYER:Class;
		
		// NPC_ITALY01 actor
		[Embed(source="assets/sprites/npc_italy01.png")]
		public static const NPC_ITALY01:Class;
		
		public function Actors() {}
	}
}