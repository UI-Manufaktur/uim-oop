module uim.oop.values._int;

import uim.oop;

class ValueInt : ValueTempl!int {
	@safe this() { super(); }
	@safe this(int aValue) { super(aValue); }
}
@safe auto VALUEINT() { return new ValueInt; }
@safe auto VALUEINT(int value) { return new ValueInt(value); }

unittest {
	assert(VALUEINT(1).value == 1);
	assert(VALUEINT(1).value(2).value == 2);
}