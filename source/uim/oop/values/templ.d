module uim.oop.values.templ;

import uim.oop;
import std.conv;

class ValueTempl(T) : ValueObj {
	this() { super(); }
	this(S)(S aValue) { this(); this.value = cast(T)aValue; }

	mixin(PropertyDefinition!("T", "_value", "value"));
	// alias value this;

	O opCall(this O, S:T)(S newValue) {
		this.value = newValue;
		return cast(O)this;
	}
	O opCall(this O, S)(S newValue) {
		this.value = to!T(newValue);
		return cast(O)this;
	}

	O opBinary(string op, this O)(T rhs) { 
		mixin("this.value = this.value "~op~" rhs;");
		return cast(O)this;
	}

	override string toString() {
		return to!string(value);
	}
}
auto VALUETEMPL(T)() { return new ValueTempl!T(); }
auto VALUETEMPL(T, S)(S value) { return new ValueTempl!T(value); }

unittest {
	assert(VALUETEMPL!int(1).value == 1);
	assert(VALUETEMPL!double(1.0).value == 1.0);
	assert(VALUETEMPL!string("1").value == "1");
	assert(VALUETEMPL!bool(false).value == false);

	assert(VALUETEMPL!int(1).value(2).value == 2);
	assert(VALUETEMPL!double(1.0).value(2.0).value == 2.0);
	assert(VALUETEMPL!string("1").value("2").value == "2");
	assert(VALUETEMPL!bool(false).value(true).value == true);

	assert(VALUETEMPL!int(1)(2).value == 2);
	assert(VALUETEMPL!double(1.0)(2.0).value == 2.0);
	assert(VALUETEMPL!string("1")("2").value == "2");
	assert(VALUETEMPL!bool(false)(true).value == true);

	assert(VALUETEMPL!string()(2).value == "2");
	assert(VALUETEMPL!string()(2.1).value == "2.1");
	assert(VALUETEMPL!string("0")(2).value == "2");
	assert(VALUETEMPL!string("0")(2.1).value == "2.1");
}