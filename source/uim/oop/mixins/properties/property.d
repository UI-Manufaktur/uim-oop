module uim.oop.mixins.properties.property;

import std.string;

auto PROPERTYPREFIX(string dataType, string propertyName, string defaultValue = null) {
	return "
protected "~dataType~" _"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
protected "~dataType~" _default"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";

auto "~propertyName~"Default() { return _default"~propertyName~"; }
void "~propertyName~"Reset() { _"~propertyName~" = _default"~propertyName~"; }
void "~propertyName~"Default("~dataType~" value) { _default"~propertyName~" = value; }
bool "~propertyName~"IsDefault() { return (_"~propertyName~" == _default"~propertyName~"); }";
}

template OProperty_get(string dataType, string propertyName, string defaultValue = null) {
	const char[] OProperty_get = PROPERTYPREFIX(dataType, propertyName, defaultValue) ~"
@property "~dataType~" "~propertyName~"() { return _"~propertyName~"; }";
}

template OProperty_set(string dataType, string propertyName, string defaultValue = null) {
	const char[] OProperty_set = PROPERTYPREFIX(dataType, propertyName, defaultValue) ~"
@property O "~propertyName~"(this O)("~dataType~" value) { _"~propertyName~" = value; }";
}

template OProperty(string dataType, string propertyName, string defaultValue = null, string get = null, string set = null) {
	const char[] getFkt = (get.length > 0) ? get : "return _"~propertyName~";";
	const char[] setFkt = (set.length > 0) ? set : "_"~propertyName~" = newValue;";
	
	const char[] OProperty = "
	protected "~dataType~" _"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	protected "~dataType~" _default"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	
	auto "~propertyName~"Default() { return _default"~propertyName~"; }
	O "~propertyName~"Reset(this O)() { _"~propertyName~" = _default"~propertyName~"; return cast(O)this; }
	O "~propertyName~"Default(this O)("~dataType~" v) { _default"~propertyName~" = v; return cast(O)this; }
	bool "~propertyName~"IsDefault() { return (_"~propertyName~" == _default"~propertyName~"); }

	@property "~dataType~" "~propertyName~"() { "~getFkt~" }
	@property O "~propertyName~"(this O)("~dataType~" newValue) { "~setFkt~" return cast(O)this; }";
}
unittest {
	class Test {mixin(OProperty!("string", "name", "`someThing`"));}
	assert((new Test).name == "someThing");
	assert((new Test).name("test").name == "test");
	assert((new Test).name("test").name("test2").name == "test2");
}
// mixins for Template based properties

template TProperty(string dataType, string propertyName, string defaultValue = null, string get = null, string set = null) {
	const char[] getFkt = (get.length > 0) ? get : "return _"~propertyName~";";
	const char[] setFkt = (set.length > 0) ? set : "_"~propertyName~" = newValue;";
	
	const char[] TProperty = "
	protected "~dataType~" _"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	protected "~dataType~" _default"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	
//	O "~propertyName~"Reset(this O)() { _"~propertyName~" = _default"~propertyName~"; return cast(O)this;}
//	auto "~propertyName~"Default() { return _default"~propertyName~"; }
//	O "~propertyName~"Default(this O)("~dataType~" newValue) { _default"~propertyName~" = newValue; return cast(O)this; }
//	bool "~propertyName~"IsDefault() { return (this._"~propertyName~" == _default"~propertyName~"); }

	@property "~dataType~" "~propertyName~"(this O)() { "~getFkt~" }
	@property O "~propertyName~"(this O)("~dataType~" newValue) { "~setFkt~" return cast(O)this; }";
}

template TPropertyAA(string keyDataType, string valueDataType, string propertyName, string defaultValue = null, string get = null, string set = null) {
	const char[] getFkt = (get.length > 0) ? get : "return _"~propertyName~";";
	const char[] setFkt = (set.length > 0) ? set : "_"~propertyName~" = newValue;";
	const char[] aaDataType = valueDataType~"["~keyDataType~"]";
	
	const char[] TPropertyAA = "
	protected "~aaDataType~" _"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	protected "~aaDataType~" _default"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	
	O "~propertyName~"Reset(this O)() { _"~propertyName~" = _default"~propertyName~"; return cast(O)this;}
	auto "~propertyName~"Default() { return _default"~propertyName~"; }
	O "~propertyName~"Default(this O)("~aaDataType~" newValue) { _default"~propertyName~" = newValue; return cast(O)this; }
	bool "~propertyName~"IsDefault() { return (this._"~propertyName~" == _default"~propertyName~"); }

	@property "~aaDataType~" "~propertyName~"(this O)() { "~getFkt~" }
	@property O "~propertyName~"(this O)("~aaDataType~" newValue) { "~setFkt~" return cast(O)this; }
	O "~propertyName~"(this O)("~keyDataType~" key, "~valueDataType~" value) { _"~propertyName~"[key] = value; return cast(O)this; }
	O "~propertyName~"Add(this O)("~aaDataType~" values) { foreach(k,v;values) _"~propertyName~"[k] = v; return cast(O)this; }";
}

// mixins for Extended Template based properties

template TXProperty_get(string dataType, string propertyName, string defaultValue = null, string get = null) {
	const char[] getFkt = (get.length > 0) ? get : "return _"~propertyName~";";

	const char[] TXProperty_get = "
	protected "~dataType~" _"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	protected "~dataType~" _default"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	
	O "~propertyName~"Reset(this O)() { _"~propertyName~" = _default"~propertyName~"; return cast(O)this;}
	auto "~propertyName~"Default() { return _default"~propertyName~"; }
	O "~propertyName~"Default(this O)("~dataType~" newValue) { _default"~propertyName~" = newValue; return cast(O)this; }
	bool "~propertyName~"IsDefault() { return (this._"~propertyName~" == _default"~propertyName~"); }

	@property "~dataType~" "~propertyName~"(this O)() { "~getFkt~" }";
}

template TXProperty(string dataType, string propertyName, string defaultValue = null, string get = null, string set = null) {
	const char[] getFkt = (get.length > 0) ? get : "return _"~propertyName~";";
	const char[] setFkt = (set.length > 0) ? set : "_"~propertyName~" ~= newValue;";
	
	const char[] TXProperty = "
	protected "~dataType~" _"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	protected "~dataType~" _default"~propertyName~(defaultValue.length > 0 ? " = "~defaultValue : "")~";
	
	O "~propertyName~"Reset(this O)() { _"~propertyName~" = _default"~propertyName~"; return cast(O)this;}
	auto "~propertyName~"Default() { return _default"~propertyName~"; }
	O "~propertyName~"Default(this O)("~dataType~" newValue) { _default"~propertyName~" = newValue; return cast(O)this; }
	bool "~propertyName~"IsDefault() { return (this._"~propertyName~" == _default"~propertyName~"); }

	@property "~dataType~" "~propertyName~"(this O)() { "~getFkt~" }
	@property O "~propertyName~"(this O)("~dataType~" newValue) { "~setFkt~" return cast(O)this; }";
}

unittest {

}

