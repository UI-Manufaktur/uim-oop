module uim.oop.array.templ;

import uim.oop;
import std.algorithm;

class DArrayTempl(T) : DArrayObj {

	this() { super(); } 
	this(bool sortedMode, bool uniqueMode) { super(sortedMode, uniqueMode); }
	this(T[] values) { super(); this.items = values; }
	this(T[] values...) { super(); this.items = values; }
	this(bool sortedMode, bool uniqueMode, T[] values) { this(sortedMode, uniqueMode); this.items = values; }

	T[] _items;
	@property T[] items() { return _items; }
	@property O items(this O)(T[] newItems) { 
		_items = newItems.dup; 		
		if (sorted) this.sorting;
		if (uniqued) this.uniquing;
		return cast(O)this;
	}
	O opCall(this O)(T[] newItems) { 
		foreach(item; newItems) add(item); 		
		return cast(O)this;
	}
	O opCall(this O)(T[] newItems...) { 
		foreach(item; newItems) add(item); 		
		return cast(O)this;
	}

	override size_t length() { return _items.length; }

	bool has(T value) { 
		foreach(item; this.items) if (item == value) return true;
		return false; 
	}
	bool hasAll(T[] values) {
		if (values) { 
			foreach(value; values) if (!this.has(value)) return false;
			return true; 
		}
		return true;
	}
	bool hasAny(T[] values) {
		foreach(value; values) if (this.has(value)) return true;
		return false;
	}

	bool opEquals(T[] values) {
		sorting;
		return (_items == values);
	}

	O change(this O)(size_t left, size_t right) {
		if ((left < _items.length) && (right < _items.length)) {
			T item = _items[left];
			_items[left] = _items[right];
			_items[right] = item;
		}
		return cast(O)this;
	}
	O sorting(this O)(bool asc = true) { // a < b
		if (asc) {
			for(size_t i = 0; i < _items.length; i++) {
				for(size_t j = 0; j < _items.length-i; j++) {
					if (i == j) continue;
					if (_items[i] < _items[j]) change(i, j);
				}
			}
		}
		else {
			for(size_t i = 0; i < _items.length; i++) {
				for(size_t j = 0; j < _items.length-i; j++) {
					if (i == j) continue;
					if (_items[i] > _items[j]) change(i, j);
				}
			}
		}
		return cast(O)this;
	}
	O uniquing(this O)() {
		T[T] buffer;
		T[] result;
		foreach(item; items) { 
			if (item in buffer) continue;
			result ~= item;
			buffer[item] = item;
		}
		_items = result;
		return cast(O)this;
	}

	O add(this O)(T[] values...) {
		foreach(value; values) {
			if (uniqued && has(value)) continue;
			
			_items ~= value;
			if (sorted) this.sorting;
			return cast(O)this;
		}
		return cast(O)this;
	}

	O remove(this O)(T[] values...) {
		foreach(value; values) {
			T[] result; 
			foreach(item; items) if (value != item) result ~= item;
			_items = result;
		}
		return cast(O)this;
	}
	O clear(this O)() {
		_items = null;
		return cast(O)this;
	}

	O toggle(this O)(T value)	 {
		if (has(value)) this.remove(value); else this.add(value); 
		return cast(O)this;
	}
	O toggle(this O)(T[] values) {
		foreach(value; values.unique) this.toggle(value);
		return cast(O)this;
	}

	O dup(this O)() {
		auto result = new O();
		result.sorted = sorted;
		result.uniqued = uniqued;
		result.items = items;
		return result;
	}

	override string toString() {
		return "%s".format(_items);
	}
}

unittest {
	// writeln("Testing ", __MODULE__);

	// auto a = new ArrayTempl!int([1, 2, 3, 2]);
	// writeln(a.sorting.items);
	// writeln(a.uniquing.items);
	// assert(a.uniquing.items == [1, 2, 3]);

	// a = new ArrayTempl!int(true, false, [1, 2, 3, 2]);
	// //assert(a.items == [1, 2, 2, 3]);

	// a = new ArrayTempl!int(true, true, [1, 2, 3, 2]);
	// assert(a.items == [1, 2, 3]);

	// assert(a.has(1));
	// assert(!a.has(100));
	// assert(a.hasAny([1, 2, 100]));
	// assert(a.hasAll([1, 3]));

	// assert(a.add([4, 5, 6]) == [1, 2, 3, 4, 5, 6]);
	// assert(a.add(4) == [1, 2, 3, 4, 5, 6]);
	// assert(a.remove(4) == [1, 2, 3, 5, 6]);
	// assert(a.remove([1, 2]) == [3, 5, 6]);

	// a.sorted = false;
	// a.uniqued = false;
	// auto b = a.dup;
	// writeln(b.add(100));
	// writeln(a);
}

