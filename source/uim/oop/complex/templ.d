module uim.oop.complex.templ;

import uim.oop;

class DOOPComplexTempl(T) : DOOPComplexObj {
	this() { super(); }
}
auto OOPComplexTempl(T)() { return new DOOPComplexTempl!T; }

unittest {
	writeln("Testing ", __MODULE__);	
}