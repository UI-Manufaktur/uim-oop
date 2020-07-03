module uim.oop.models.attclass;

import uim.oop;

class DOOPAttclass {
  mixin(OProperty!("UUID", "superId"));
  mixin(OProperty!("UUID", "id"));
  mixin(OProperty!("string", "name"));
  mixin(XPropertyArray!("UUID", "attributes"));
}
auto OOPAttclass() { return new DOOPAttclass; }

unittest {
  assert(OOPAttclass.id.empty);
}
