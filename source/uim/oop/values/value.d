module uim.oop.values.value;

import uim.oop;

class DValue {
	this() {}
}

//class Integer : ValueTempl(T) {
//	this() {
//	  super();
//	}
//}

import std.conv;

class ValueObj : Obj {
	@safe this() { super(); }
}
@safe auto VALUEOBJ() { return new ValueObj; }
