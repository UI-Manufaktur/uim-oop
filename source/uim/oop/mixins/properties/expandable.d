module uim.oop.mixins.properties.expandable;

import std.string;
import uim.core;

// Mixin for expandable string datatypes
template XString(string name) {
	const char[] XString = "
	string _"~name~";
	@safe auto "~name~"() { return _"~name~"; }

	@safe O "~name~"(this O)(string[] addValues...) { this."~name~"(addValues); return cast(O)this; }
	@safe O "~name~"(this O)(string[] addValues) { _"~name~" ~= addValues.join(); return cast(O)this; }

	@safe O clear"~name.capitalize~"(this O)() { _"~name~" = null; return cast(O)this; }	
	";
}
unittest {
	class Test { mixin(XString!"a"); }
	assert((new Test).a("x").a == "x");
	assert((new Test).a("x").a("x").a == "xx");
	assert((new Test).a("x", "x").a == "xx");
	assert((new Test).a(["x", "x"]).a == "xx");
	assert((new Test).a("x").clearA.a == "");
}

// Mixin for expandable string array datatypes
template XStringArray(string name) {
	const char[] Name = name.capitalize;
	const char[] XStringArray = "
	string[] _"~name~";
	@safe auto "~name~"() { return _"~name~"; }

	@safe O "~name~"(this O)(string[] values...) { this."~name~"(values); return cast(O)this; }
	@safe O "~name~"(this O)(string[] values) { _"~name~" ~= values; return cast(O)this; }
	
	@safe O remove"~Name~"(this O)(string[] values...) { this.remove"~Name~"(values); return cast(O)this; }	
	@safe O remove"~Name~"(this O)(string[] values) {
		foreach(value; values) _"~name~" = _"~name~".sub(value); return cast(O)this; }	
	
	@safe O clear"~Name~"(this O)() { _"~name~" = null; return cast(O)this; }	
	";
}
unittest {
	class Test { mixin(XStringArray!"a"); }
	assert((new Test).a("x").a == ["x"]);
	assert((new Test).a("x").a("x").a == ["x", "x"]);
	assert((new Test).a("x", "x").a == ["x", "x"]);
	assert((new Test).a("x").clearA.a == null);
	assert((new Test).a(["a", "b", "c"]).a == ["a", "b", "c"]);
 	assert((new Test).a(["a", "b", "c"]).removeA("x").a == ["a", "b", "c"]);
	assert((new Test).a(["a", "b", "c", "a"]).a == ["a", "b", "c", "a"]); 
  assert((new Test).a(["a", "b", "c", "a"]).removeA("a").a == ["b", "c", "a"]);
	assert((new Test).a(["a", "b", "c", "a"]).removeA(["a"]).a == ["b", "c", "a"]); 
	//assert((new Test).a(["a", "b", "c"]).removeA(["a"], true).a == ["b", "c"]);
}

// Mixin for expandable string associative array datatypes
template XStringAA(string name) {
	const char[] Name = name.capitalize;
	const char[] XStringAA = "
	string[string] _"~name~";
	@safe auto "~name~"() { return _"~name~"; }

	@safe O "~name~"(this O)(string key, string value) { _"~name~"[key] = value; return cast(O)this; }
	@safe O "~name~"(this O)(string[string] addValues) { foreach(kv; addValues.byKeyValue) _"~name~"[kv.key] = kv.value; return cast(O)this; }
	
	@safe O remove"~Name~"(this O)(string[] values...) { this.remove(values); return cast(O)this; }	
	@safe O remove"~Name~"(this O)(string[] values) { foreach(value; values) _name = _"~name~".remove(value); return cast(O)this; }	
	
	@safe O clear"~Name~"(this O)() { _"~name~" = null; return cast(O)this; }	
	";
}
unittest {
	class Test { mixin(XStringAA!"a"); }
	assert((new Test).a(["a":"x"]).a == ["a":"x"]);
	assert((new Test).a("a", "x").a == ["a":"x"]);
	assert((new Test).a("a", "x").clearA.a == null);
}

template XPropertyAA(string datatype, string name) {
	const char[] Name = capitalize(name);
	const char[] XPropertyAA = `
	`~datatype~`[string] _`~name~`; 
	@safe auto `~name~`() { return _`~name~`; }

	@safe O `~name~`(this O)(string name, `~datatype~` value) { _`~name~`[name] = value; return cast(O)this; }
	@safe O `~name~`(this O)(`~datatype~`[string] values) { foreach(kv; values.byKeyValue) _`~name~`[kv.key] = kv.value; return cast(O)this; }

	@safe O remove`~Name~`(this O)(string name) { _`~name~`.remove(name); return cast(O)this; }
	@safe O remove`~Name~`(this O)(string name) { _`~name~`.remove(name); return cast(O)this; }

	@safe O clear`~Name~`(this O)() { _`~name~` = _`~name~`.clear; return cast(O)this; }
`;
}

template XPropertyArray(string datatype, string name) {
	const char[] Name = capitalize(name);
	const char[] XPropertyArray = `
	`~datatype~`[] _`~name~`; 
	@safe auto `~name~`() { return _`~name~`; }

	@safe O `~name~`(this O)(`~datatype~`[] values...) { _`~name~` = _`~name~`.add(values); return cast(O)this; }
	@safe O `~name~`(this O)(`~datatype~`[] values, bool unique = false) { _`~name~` = _`~name~`.add(values, unique); return cast(O)this; }
	
	@safe O remove`~Name~`(this O)(`~datatype~`[] values...) { remove`~Name~`(values); return cast(O)this; }
	@safe O remove`~Name~`(this O)(`~datatype~`[] values) { 
		foreach(value; values) if (value.index(_`~name~`) != -1) _`~name~`.remove(value.index(_`~name~`)); 
		return cast(O)this; }

	@safe O clear`~Name~`(this O)() { _`~name~` = null; return cast(O)this; }
`;
}
unittest {
	class Test { mixin(XPropertyArray!("int", "a")); }
 	assert((new Test).a(0).a == [0]);
	assert((new Test).a(0).a(1).a == [0, 1]);
	assert((new Test).a(0, 1).a == [0, 1]);
	assert((new Test).a(0).clearA.a == null);
	assert((new Test).a([1, 2, 3]).a == [1, 2, 3]);
 	// assert((new Test).a([1, 2, 3]).removeA(4).a == [1, 2, 3]);
	/* assert((new Test).a([1, 2, 3, 1]).a == [1, 2, 3, 1]); 
  assert((new Test).a([1, 2, 3, 1]).removeA(1).a == [2, 3, 1]);
	assert((new Test).a([1, 2, 3, 1]).removeA([1]).a == [2, 3, 1]);  */
 	//assert((new Test).a(["a", "b", "c"]).removeA(["a"], true).a == ["b", "c"]);
}
