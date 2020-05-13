module uim.oop.collections.arraylist;

import uim.oop;

class DOOPArrayList(T) : IOOPCollection {
	this() {}

	T[] _items;

	size_t count() { return items.length; }
	unittest { /// TODO 
	}
}
auto OOPArrayList(T)() { return new DOOPArrayList!T; } 

unittest { /// TODO 
}
