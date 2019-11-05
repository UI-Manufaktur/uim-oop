module source.uim.oop.datatypes.string;

import uim.oop;

class DOOPString : DOOPSimpleObject {
	string _value;

	this() { super(); }
	this(string newValue) { super(); _value = newValue; }
	this(T)(T newValue) { super(); _value = to!string(newValue); }

	O opAssign(this O)(string newValue) { _value = newValue; return cast(O)this; }
	O opEqual(this O)(string aValue) { return (_value == aValue); return cast(O)this; }
	O opEqual(this O)(DOOPString aValue) { return (aValue == _value); return cast(O)this; }

	O opCall(this O)(string[] values...) { foreach(v; values) _value ~= v; return cast(O)this; }
	O opCall(this O)(string[] values) { foreach(v; values) _value ~= v; return cast(O)this; }
	O opCall(this O, T)(T newValue) { _value ~= to!string(newValue); return cast(O)this; }

	bool empty() { return (_value.length == 0); }
	O empty(this O)(bool setEmpty) { if (setEmpty) _value = ""; return cast(O)this; }
	unittest { /// TODO 
	}

	override string toString() {
		return _value;
	}
}
auto OOPString() { return new DOOPString; }

unittest { /// TODO 
}
