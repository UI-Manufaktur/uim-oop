module uim.oop.collections.list;

import uim.oop;

// Represents a non-generic collection of objects that can be individually accessed by index.
interface IOOPList(T = DOPObject) : IOOPCollection {
	T item(size_t index); 
	O item(this O)(size_t index, T value); 
}

class DOOPList(T = DOPObject) : IOOPCollection {
	this() {}
	T item(size_t index) { return null; } 
	O item(this O)(size_t index, T value) { return cast(O)this; } 
}
// TODO: error with auto OOPList() { return new DOOPList(); }

