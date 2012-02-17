package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	import system.*;
	
	[SWF(width="800", height="450", frameRate="60")]
	public class Main extends Engine
	{
		public function Main()
		{
			super(GC.GI_WIDTH/GC.GI_SCALE, GC.GI_HEIGHT/GC.GI_SCALE, GC.GI_FPS, false);
			FP.screen.scale = GC.GI_SCALE;
			
			if (GC.GI_FLASHPUNKCONSOLE) {
				FP.console.enable();
			}
		}
		
		override public function init():void {
			RPGFP.MapSetup();
		}
	}
}