module uim.oop.keypair.keypair;

import uim.oop;

class DOPKeypair {
	this() {
	}
	this(DOPObject aKey) { this().key(aKey); }
	this(DOPObject aKey, DOPObject aValue) { this().key(aKey).value(aValue); }

	DOPObject _key;
	auto key() { return _key; }
	O key(this O)(DOPObject newKey) { _key = newKey; return cast(O)this; }
	unittest { /// TODO 
	}

	DOPObject _value;
	auto value() { return _value; }
	O value(this O)(DOPObject newValue) { _value = newValue; return cast(O)this; }
	unittest { /// TODO 
	}
}
auto OPKeypair() { return new DOPKeypair; }
auto OPKeypair(DOPObject aKey) { return new DOPKeypair(aKey); }
auto OPKeypair(DOPObject aKey, DOPObject aValue) { return new DOPKeypair(aKey, aValue); }

unittest { /// TODO 
}
