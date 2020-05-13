module uim.oop.obj;

import uim.oop;

class DOPObject {
	@safe this() { _init; }
	@safe protected void _init() {}
}
@safe auto OPObject() { return new DOPObject; }

unittest {
	
}