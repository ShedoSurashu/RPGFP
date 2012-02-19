package system
{
	import actors.Player;
	
	import net.flashpunk.FP;

	public class Camera
	{
		private var debugCoord:int;
		
		public function Camera(){}
		
		public function adjust(mapWidth:int, mapHeight:int, player:Player):void {
			var newCameraX:int = ((player.x + player.width)/2) - (FP.width/2);
			var newCameraY:int = ((player.y + player.height)/2) - (FP.height/2);
			
			// Checks for outbound locations then sets them inside the limit.
			if (newCameraX < 0) {
				newCameraX = 0;
			} else if ((newCameraX + FP.width) > mapWidth) {
				newCameraX = mapWidth - FP.width;
			}
			if (newCameraY < 0) {
				newCameraY = 0;
			} else if ((newCameraY + FP.height) > mapHeight) {
				newCameraY = mapHeight - FP.height;
			}
			
			FP.camera.x = newCameraX;
			FP.camera.y = newCameraY;
		}
		
		public function followPlayer(mapWidth:int, mapHeight:int, player:Player):void {
			
			// Horizontal Checking
			if ((player.x - FP.camera.x) < GC.CD_OFFSET) {
				if (FP.camera.x > 0) {
					// Will execute if the left-most edge is not yet reached.
					FP.camera.x -= GC.CD_SPEED;
				}
			} else if (((FP.camera.x + FP.width) - (player.x + player.width)) < GC.CD_OFFSET) {
				if ((FP.camera.x + FP.width) < mapWidth) {
					// Will execute if the right-most edge is not yet reached.
					FP.camera.x += GC.CD_SPEED;
				}
			}
			
			// Vertical Checking
			if ((player.y - FP.camera.y) < GC.CD_OFFSET) {
				if (FP.camera.y > 0) {
					// Will execute if the top-most edge is not yet reached.
					FP.camera.y -= GC.CD_SPEED;
				}
			} else if (((FP.camera.y + FP.height) - (player.y + player.height)) < GC.CD_OFFSET) {
				if ((FP.camera.y + FP.height) < mapHeight) {
					// Will execute if the bottom-most edge is not yet reached.
					FP.camera.y += GC.CD_SPEED;
				}
			}
			
			
//			FP.log("Camera: x="+FP.camera.x.toString()+" y="+FP.camera.y.toString());
//			FP.log(FP.width.toString()+" "+mapHeight.toString()+" Sprite: x="+player.x.toString()+" y="+(player.y + (-player.originY)+ player.height).toString());
			
		}
	}
}