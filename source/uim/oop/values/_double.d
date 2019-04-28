module uim.oop.values._double;

import uim.oop;

class ValueDouble : ValueTempl!double {
	@safe this() { super(); }
	@safe this(double aValue) { super(aValue); }
}
@safe auto VALUEDOUBLE() { return new ValueInt; }
@safe auto VALUEDOUBLE(double value) { return new ValueDouble(value); }

unittest {
	assert(VALUEDOUBLE(1).value == 1);
	assert(VALUEDOUBLE(1).value(2).value == 2);

	assert((VALUEDOUBLE(1) + 2).value == 3);
}