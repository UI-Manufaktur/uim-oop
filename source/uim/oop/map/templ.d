module uim.oop.map.templ;

import std.conv;
import uim.oop;
import uim.oop.map;

class MapTempl(K, V): MapObj {
	V[K] _items;

	this() { super(); }
	this(V[K] values) { this(); this.items(values); }

	@safe @property V[K] items() { return _items; }
	@safe @property O items(this O)(V[K] newItems) { _items = newItems.dup; return cast(O)this; }

	@safe override bool empty() { return (length == 0); }
	@safe override size_t length() { return _items.length; }

	K[] keys(bool sorted = false) { 
		auto k = _items.keys; 
		if (sorted) k = k.sort.array;
		return k;
	}
	V[] values(bool sorted = false) { 
		auto v = _items.values; 
		if (sorted) v = v.sort.array; 
		return v; 
	}

	// has is Shortcaut for hasKey
	@safe bool has(K key) { return (key in _items) ? true : false; }

	@safe bool hasAnyKeys(K[] keys...) { foreach(key; keys) if (hasKey(key)) return true; return false; }
	@safe bool hasAllKeys(K[] keys...) { foreach(key; keys) if (!hasKey(key)) return false; return true; }
	@safe bool hasKey(K key) { return (key in _items) ? true : false; }

	@safe bool hasAnyValues(V[] values...) { foreach(value; values) if (hasValue(value)) return true; return false; }
	@safe bool hasAllValues(V[] values...) { foreach(value; values) if (!hasValue(value)) return false; return true; }
	@safe bool hasValue(V value) { foreach(k, v; _items) if (v == value) return true; return false; }

	@safe O add(this O)(V[K] values) { foreach(k, v; values) this.add(k, v); return cast(O)this; }
	@safe O add(this O)(K key, V value) { this[key] = value; return cast(O)this; }

//	auto opCast(T:string[string])() {
//		T result;
//		foreach(k, v; items) result["%s".format(k)] = "%s".format(v);
//		return result;
//	}

	@safe bool opEquals(V[K] values) {
		return (items == values);
	}
	@safe void opAssign(V[K] values) {
		_items = values;
	}
	@safe V opIndex(K key) {
		if (key in _items) return _items[key];
		static if ((std.traits.isNumeric!(V))) {
			return 0;
		}
		else return null;
	}
	@safe V[] opIndex(K[] keys) {
		V[] results;
		foreach(k; keys) if (hasKey(k)) results ~= this[k];
		return results;
	}
	@safe void opIndexAssign(V value, K key) {
		_items[key] = to!V(value);
	}
	@safe O remove(this O)(K key) {
		_items.remove(key);
		return cast(O)this;
	}
	@safe O remove(this O)(K[] someKeys) {
		foreach(key; someKeys) _items.remove(key);
		return cast(O)this;
	}
	@safe O clear(this O)() {
		_items.clear;
		return cast(O)this;
	}

	string[] toStrings(string mask = "%s=%s") {
		string[] result;
		foreach(k, v; items) result ~= mask.format(k,v);
		return result;
	}
	string toHTML() {
		if (empty) return "";

		string result;
		foreach(k, v; _items) {
			auto val = "%".format(v);
			if (val == "false") continue;
			if (val == "true") result ~= ` %s`.format(k);
			else result ~= ` %s="%s"`.format(k,v);
		}
		return result;
	}
	string toJSON() {
		if (empty) return "";
		
		string[] result;
		foreach(k, v; _items) result ~= `"%s"="%s"`.format(k,v);
		return result.join(",");
	}
	string toCSS() {
		if (empty) return "";
		
		string[] result;
		foreach(k; keys(true)) {
			auto v = this[k];
			result ~= `%s:%s`.format(k,v);
		}
		return result.join(";");
	}
	string toXML() {
		if (empty) return "";
		
		string result;
		foreach(k, v; _items) result ~= ` %s="%s"`.format(k,v);
		return result;
	}
}
auto OOPMap(K, V)() { return DOOPMap!(K, V)(); }
auto OOPMap(K, V)(V[K] values) { return DOOPMap!(K, V)(values); }

unittest {
	import std.stdio;

	auto map = new MapTempl!(string, string);
	map.items = ["1":"2", "3":"4"];
	assert(map.items == ["1":"2", "3":"4"]);

	auto map2 = new MapTempl!(int, int);
	map2.items = [1:2, 3:5];
	assert(map2.items == [1:2, 3:5]);

	assert(map.hasAllKeys(["1", "3"]) == true);
	assert(map.hasAllKeys(["1", "2"]) == false);
	assert(map.hasAnyKeys(["1", "3"]) == true);
	assert(map.hasAnyKeys(["1", "2"]) == true);
	assert(map.hasAnyKeys(["5", "2"]) == false);
	assert(map.hasKey("1") == true);
	assert(map.hasKey("5") == false);

	assert(map.items(["X":"Y", "XX":"YY"]) == ["X":"Y", "XX":"YY"]);

	assert(map.hasAllValues(["Y", "YY"]) == true);
	assert(map.hasAllValues(["Y", "YYY"]) == false);
	assert(map.hasAnyValues(["Y", "YY"]) == true);
	assert(map.hasAnyValues(["Y", "YY"]) == true);
	assert(map.hasAnyValues(["Z", "ZZZ"]) == false);
	assert(map.hasValue("Y") == true);
	assert(map.hasValue("Z") == false);
}
