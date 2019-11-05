module uim.oop.collections.collection;

interface IOOPCollection {
	size_t count();
}

class DOOPCollection {
	this() {}
	size_t count() { return 0; };
	unittest { /// TODO 
	}
}
auto OOPCollection() { return new DOOPCollection; }

unittest { /// TODO 
}
