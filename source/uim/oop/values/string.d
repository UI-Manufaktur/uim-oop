module uim.oop.values.string;

import uim.oop;

class ValueString : ValueTempl!string {
	this() { super(); }
	this(string aValue) { super(aValue); }
}
auto VALUESTRING() { return new ValueString; }
auto VALUESTRING(string value) { return new ValueString(value); }

unittest {
	assert(VALUESTRING("Test").value == "Test");
	assert(VALUESTRING("Test").value("Test2").value == "Test2");
}