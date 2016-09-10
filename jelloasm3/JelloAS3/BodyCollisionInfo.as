package JelloAS3 {
	// collision information
	public class BodyCollisionInfo {
		public function Clear() : void {
			bodyA = bodyB = null; bodyApm = bodyBpmA = bodyBpmB = -1; hitPt.setTo(0, 0); edgeD = 0; normal.setTo(0, 0); penetration = 0;
		}
		
		public var bodyA : Body;
		public var bodyApm : int;
		public var bodyB : Body;
		public var bodyBpmA : int;
		public var bodyBpmB : int;
		public var hitPt : Vector2 = new Vector2();
		public var edgeD : Number;
		public var normal : Vector2 = new Vector2();
		public var penetration : Number;
		
		public function clone() : BodyCollisionInfo {
			var r:BodyCollisionInfo = new BodyCollisionInfo();
			
			r.bodyA = this.bodyA;
			r.bodyApm = this.bodyApm;
			r.bodyB = this.bodyB;
			r.bodyBpmA = this.bodyBpmA;
			r.bodyBpmB = this.bodyBpmB;
			r.hitPt = this.hitPt.clone();
			r.edgeD = this.edgeD;
			r.normal = this.normal.clone();
			r.penetration = this.penetration;
			
			return r;
		}
		
		public function toString() : String {
			return /*bodyA + ":" + bodyB + ":" + */hitPt + ":" + edgeD + ":" + normal + ":" + penetration;
		}
	}
}
