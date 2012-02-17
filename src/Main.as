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
			
			FP.log("Engine started.");
		}
		
		override public function init():void {
			if (stage.wmodeGPU) {
				FP.log("GPU is used.");
			} else {
				FP.log("CPU is used.");
			}
			
			FP.log("Setting up map(s)...");
			RPGFP.MapSetup();
			
			
		}
	}
}