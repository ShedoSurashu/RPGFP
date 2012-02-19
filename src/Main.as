package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	import system.*;
	
	import worlds.*;
	
	[SWF(width="920", height="600", frameRate="60")]
	public class Main extends Engine
	{
		public function Main()
		{
			super(GC.GD_WIDTH/GC.GD_SCALE, GC.GD_HEIGHT/GC.GD_SCALE, GC.GD_FPS, false);
			FP.screen.scale = GC.GD_SCALE;
			
			if (GC.GD_FLASHPUNKCONSOLE) {
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
			Maps.setup();
			
			FP.world = new Game;
		}
	}
}