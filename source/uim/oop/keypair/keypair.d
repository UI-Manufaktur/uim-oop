module uim.oop.keypair.keypair;

import uim.oop;

class DOPKeypair {
	this() {
	}
	this(DOOPObject aKey) { this().key(aKey); }
	this(DOOPObject aKey, DOOPObject aValue) { this().key(aKey).value(aValue); }

	DOOPObject _key;
	auto key() { return _key; }
	O key(this O)(DOOPObject newKey) { _key = newKey; return cast(O)this; }
	unittest { /// TODO 
	}

	DOOPObject _value;
	auto value() { return _value; }
	O value(this O)(DOOPObject newValue) { _value = newValue; return cast(O)this; }
	unittest { /// TODO 
	}
}
auto OPKeypair() { return new DOPKeypair; }
auto OPKeypair(DOOPObject aKey) { return new DOPKeypair(aKey); }
auto OPKeypair(DOOPObject aKey, DOOPObject aValue) { return new DOPKeypair(aKey, aValue); }

unittest { /// TODO 
}
