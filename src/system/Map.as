package system
{
	import net.flashpunk.FP;

	public class Map
	{
		public var index:int;
		public var name:String;
		public var width:int;
		public var height:int;
		public var resource:Class;
		public var xml:XML;
		
		public function Map(_resource:Class) {
			resource = _resource;
			xml = FP.getXML(resource);
			
			width = (xml.@width * xml.@tilewidth);
			height = (xml.@height * xml.@tileheight);
		}
	}
}