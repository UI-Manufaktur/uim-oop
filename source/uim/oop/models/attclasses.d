module uim.oop.models.attclasses;

import uim.oop;

class DOOPAttclasses {
  DOOPAttclass[UUID] _items;
  size_t size() { return _items.length; }
  O clear(this O)() { _items.clear; return cast(O)this; }

  // has container attclass item
  bool has(DOOPAttclass item) { if (item) return has(item.id.toString); return false; }
  bool has(UUID id) { if (!id.empty) return (id in _items) ? true : false; return false; }
  bool has(string name) { foreach(k, v; _items) if (v.name == name) return true; return false; }

  O opCall(this O)(DOOPAttclass[] newItems...) {
    foreach(item; newItems) _items[newItems.id.toString] = item;
    return cast(O)this;
  }
  O opCall(this O)(DOOPAttclass[] newItems) {
    foreach(item; newItems) _items[newItems.id.toString] = item;
    return cast(O)this;
  }
}
auto OOPAttclasses() { return new DOOPAttclasses; }

unittest {
}