module uim.oop.values.obj;

import uim.oop;

//class Value : DOOPObject {
//	this() {
//	super();
//	}
//}
//
//class ValueTempl(T) : Value {
// T value;
// 
//	this() {
//	super();
//	}
//}

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
