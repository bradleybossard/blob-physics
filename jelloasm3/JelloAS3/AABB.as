package JelloAS3 {	
  public class AABB {
    // PRIVATE VARIABLES
    public var PointValidity:Array = [0, 1];

    /// Minimum point of this bounding box.
    public var Min:Vector2 = new Vector2();

    /// Maximum point of this bounding box.
    public var Max:Vector2 = new Vector2();

    /// Property that indicated whether or not this bounding box is valid.
    public var Validity:int = 0;

    /// create a boundingbox with the given min and max points.
    public function AABB(minPt:Vector2 = null, maxPt:Vector2 = null) {
      if(minPt == null)
        Min.setTo(0, 0);
      else
        Min.setToVec(minPt);
      if(maxPt == null)
        Max.setTo(0, 0);
      else
        Max.setToVec(maxPt);
      Validity = (minPt == null || maxPt == null ? PointValidity[0] : PointValidity[1]);
    }
		
    // CLEAR
    // Resets a bounding box to invalid.
    public function clear() : void {
      Max.X = Max.Y = 0;
      Min.X = Min.Y = 0;
      Validity = PointValidity[0];
    }

    // EXPANSION
    public function expandToInclude(pt:Vector2) : void {
      if (Validity == PointValidity[1]) {
        if (pt.X < Min.X) { Min.X = pt.X; }
        else if (pt.X > Max.X) { Max.X = pt.X;}

        if (pt.Y < Min.Y) { Min.Y = pt.Y; }
        else if (pt.Y > Max.Y) { Max.Y = pt.Y;}
      } else {
        Min.setToVec(pt);
        Max.setToVec(pt);
        Validity = PointValidity[1];
      }
    }
		
    public function expandToIncludePos(ptX:Number, ptY:Number) : void {
      if (Validity == PointValidity[1]) {
        if (ptX < Min.X) { Min.X = ptX; }
        else if (ptX > Max.X) { Max.X = ptX;}

        if (ptY < Min.Y) { Min.Y = ptY; }
        else if (ptY > Max.Y) { Max.Y = ptY;}
      } else {
        Min.setTo(ptX, ptY);
        Max.setTo(ptX, ptY);
        Validity = PointValidity[1];
      }
    }
		
    // COLLISION / OVERLAP
    public function contains(ptX:Number, ptY:Number) : Boolean {
      if (Validity == PointValidity[0]) { 
        return false;
      }

      return ((ptX >= Min.X) && (ptX <= Max.X) && (ptY >= Min.Y) && (ptY <= Max.Y));
    }
		
    public function containsVec(pt:Vector2) : Boolean {
      if (Validity == PointValidity[0]) { return false; }

      return ((pt.X >= Min.X) && (pt.X <= Max.X) && (pt.Y >= Min.Y) && (pt.Y <= Max.Y));
    }
		
    public function intersects(box:AABB) : Boolean {
      // X overlap check.
      if((Min.X <= box.Max.X) && (Max.X >= box.Min.X)) {
        // Y overlap check
        if((Min.Y <= box.Max.Y) && (Max.Y >= box.Min.Y)) {
          return true;
        }
      }

      return false;
    }
		
		public function toString() : String {
			return "[AABB: " + Min + " : " + Max + "]";
		}
  }
}
