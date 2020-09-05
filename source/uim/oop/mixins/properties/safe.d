module uim.oop.mixins.properties.safe;

import uim.oop;

// Mixin for a safe getter 
auto SPropertyGet(string dataType, string propertyName) { return "@safe @property "~dataType~" "~propertyName~"() { return _"~propertyName~"; }"; }
template SProperty_get(string dataType, string propertyName) {
	const char[] SProperty_get = SPropertyGet(dataType, propertyName);
}
unittest {
	class Test{ int _a = 1; mixin(SProperty_get!("int", "a")); }
 	assert((new Test).a == 1);
}

// Mixin for a safe setter 
auto SPropertySet(string dataType, string propertyName) { return "@safe @property O "~propertyName~"(this O)("~dataType~" value) { _"~propertyName~" = value; return cast(O)this; }"; }
template SProperty_set(string dataType, string propertyName) {
	const char[] SProperty_set = SPropertySet(dataType, propertyName);
}
unittest {
	class Test{ int _a = 1; mixin(SProperty_set!("int", "a")); }
 	assert((new Test).a(1)._a == 1);
}

// Mixin for a safe getter and setter 
template SProperty_getset(string dataType, string propertyName, bool getter = false, bool setter = false) { 
	const char[] SProperty_set = "@safe @property O "~propertyName~"(this O)("~dataType~" value) { _"~propertyName~" = value; return cast(O)this; }";
}
unittest {
	class Test{ int _a = 1; mixin(SProperty_set!("int", "a")); }
 	assert((new Test).a(1)._a == 1);
}
