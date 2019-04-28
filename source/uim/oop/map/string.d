module uim.oop.map.string;

import std.conv;
import uim.oop;

class DMapString : MapTempl!(string, string) {
	this() { super(); }
	this(string[string] values) { this(); _items = values; }

	@property override string[string] items() { return _items; }
	@property string[string] items(string[] ignoreKeys) { 
		string[string] result = _items.dup;
		foreach(k; ignoreKeys) result.remove(k);
		return result; }
	@property O items(this O)(string[string] newItems) { _items = newItems.dup; return cast(O)this; }

	O add(this O)(string[string] values) {
		foreach(k, v; values) _items[k] = v;
		return cast(O)this;
	}
	O add(this O)(string[string][] values) {
		foreach(value; values) add(value);
		return cast(O)this;
	}

	O opCall(this O)(string[string] values) {
		add(values);
		return cast(O)this;
	}
	@safe override void opIndexAssign(V, K)(V value, K key) { _items[key] = to!V(value); }
	@safe override void opIndexAssign(string value, string key) { _items[key] = value; }

	override string toHTML() {
		if (empty) return "";
		
		string result;
		foreach(k; keys(true)) {
			auto v = this[k];
			auto val = "%s".format(v);
			if (val == "false") continue;
			if (val == "true") result ~= ` %s`.format(k);
			else result ~= ` %s="%s"`.format(k,v);
		}
		return result;
	}
	override Json toJson() {
		auto result = super.toJson;
		if (empty) return result;
		
		foreach(k; keys(true)) {
			result["k"] = this[k];
		}
		return result;
	}
	override string toCSS() {
		if (empty) return "";
		
		string[] result;
		foreach(k; keys(true)) {
			auto v = this[k];
			result ~= k~":"~v;
		}
		return result.join(";");
	}
}
auto MapString() { return new DMapString(); }
auto MapString(string[string] values) { return new DMapString(values); }

unittest {
	assert(MapString.items == null); 
	writeln(MapString(["a":"b", "c":"d"]).toHTML); 
	writeln(MapString(["a":"b", "c":"d"]).toJSON); 
	writeln(MapString(["a":"b", "c":"d"]).toCSS); 

	assert(MapString(["a":"b", "c":"d"]) == ["a":"b", "c":"d"]); 
	assert(MapString(["a":"b", "c":"d"]).items == ["a":"b", "c":"d"]); 
	assert(MapString.items(["a":"b", "c":"d"]).items == ["a":"b", "c":"d"]); 

	assert(MapString.items(["a":"b", "c":"d"]).keys(true) == ["a", "c"]);
	assert(MapString.items(["a":"b", "c":"d"]).values(true) == ["b", "d"]); 

	assert(MapString.items(["a":"b", "c":"d"]).hasKey("a")); 
	assert(!MapString.items(["a":"b", "c":"d"]).hasKey("x")); 
	assert(MapString.items(["a":"b", "c":"d"]).hasAnyKeys("a", "x")); 
	assert(!MapString.items(["a":"b", "c":"d"]).hasAnyKeys("x", "y")); 
	assert(MapString.items(["a":"b", "c":"d"]).hasAllKeys("a", "c")); 
	assert(!MapString.items(["a":"b", "c":"d"]).hasAllKeys("a", "x")); 
	assert(!MapString.items(["a":"b", "c":"d"]).hasAllKeys("x", "y")); 

	assert(MapString.items(["a":"b", "c":"d"]).hasValue("b")); 
	assert(!MapString.items(["a":"b", "c":"d"]).hasValue("x")); 
	assert(MapString.items(["a":"b", "c":"d"]).hasAnyValues("b", "x")); 
	assert(!MapString.items(["a":"b", "c":"d"]).hasAnyValues("x", "y")); 
	assert(MapString.items(["a":"b", "c":"d"]).hasAllValues("b", "d")); 
	assert(!MapString.items(["a":"b", "c":"d"]).hasAllValues("b", "x")); 
	assert(!MapString.items(["a":"b", "c":"d"]).hasAllValues("x", "y")); 

	auto map = MapString(["a":"b", "c":"d"]);
	map = ["x":"y", "s":"t"];
	assert(map == ["x":"y", "s":"t"]); 
	assert(map != ["a":"b", "c":"d"]); 
	map["x"] = "b"; 
	assert(map == ["x":"b", "s":"t"]); 

	assert(MapString(["a":"b", "c":"d"]).toHTML == ` a="b" c="d"`); 
	assert(MapString(["a":"b", "c":"d"]).toJSON == `"a":"b","c":"d"`); 
}
