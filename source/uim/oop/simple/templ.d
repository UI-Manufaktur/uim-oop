module uim.oop.simple.templ;

import uim.oop;

class DOOPSimpleTempl(T) : DOOPSimpleObject {
	this() { super(); }
}
auto OOPSimpleTempl(T)() { return new DOOPSimpleTempl!T; }

unittest {
	
}