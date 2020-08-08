module uim.oop.map.obj;

import uim.oop;
public import uim.oop.map;

class MapObj : Obj{
	this() {}

	@safe bool empty() { return true; }
	@safe size_t length() { return 0; }
	@safe O clear(this O)() { return cast(O)this; }

	override string toString() {
		return super.toString;
	}
}

unittest {
	

	auto map = new MapObj;
}
