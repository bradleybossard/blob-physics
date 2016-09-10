package JelloAS3 {
	public class Bitmask {
    public var mask:int;
		
		public function Bitmask(m:int = 0) {
			mask = m;
		}
		
    public function clear() : void {
      mask = 0x00;
    }

    public function setOn(bit:int) : void {
      mask |= (0x01 << ((bit > 0) ? (bit - 1) : 0));
    }

    public function setOff(bit:int) : void {
      mask &= ~(0x01 << ((bit > 0) ? (bit - 1) : 0));
    }

    public function clone() : Bitmask {
      return new Bitmask(mask);
    }
  }
}
