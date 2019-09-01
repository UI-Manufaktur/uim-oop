module uim.oop.array.string;

import uim.oop;

class DArrayString : DArrayTempl!string { 
	this() { super(); } 
	this(bool sortedMode, bool uniqueMode) { super(sortedMode, uniqueMode); }
	this(string[] values) { super(values); }
	this(string[] values...) { super(values); }
	this(bool sortedMode, bool uniqueMode, string[] values) { super(sortedMode, uniqueMode, values); }

	O opCall(this O)(string[] newItems) { 
		foreach(item; newItems) this.add(item); 		
		return cast(O)this;
	}
	O opCall(this O)(string[] newItems...) { 
		foreach(item; newItems) this.add(item); 		
		return cast(O)this;
	}

	string join(string separator) { return _items.join(separator); }
	string toHTML() { return join(" "); }

}
auto ArrayString() { return new DArrayString(); }
auto ArrayString(bool sortedMode, bool uniqueMode) { return new DArrayString(sortedMode, uniqueMode); }
auto ArrayString(string[] values) { return new DArrayString(values); }
auto ArrayString(string[] values...) { return new DArrayString(values); }
auto ArrayString(bool sortedMode, bool uniqueMode, string[] values) { return new DArrayString(sortedMode, uniqueMode, values); }

unittest {
}