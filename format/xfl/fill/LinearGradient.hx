package format.xfl.fill;


import format.xfl.geom.Matrix;
import haxe.xml.Fast;


class LinearGradient {
	
	
	public var entries:Array <GradientEntry>;
	public var matrix:Matrix;
	public var spreadMethod:String;
	
	
	public function new () {
		
		entries = new Array <GradientEntry> ();
		
	}
	
	
	public static function parse (xml:Fast):LinearGradient {
		
		var linearGradient = new LinearGradient ();
		
		if (xml.has.spreadMethod) linearGradient.spreadMethod = xml.att.spreadMethod;
		
		for (element in xml.elements) {
			
			switch (element.name) {
				
				case "matrix":
					
					linearGradient.matrix = Matrix.parse (element.elements.next ());
				
				case "GradientEntry":
					
					linearGradient.entries.push (GradientEntry.parse (element));
				
			}
			
		}
		
		return linearGradient;
		
	}
	
	
}