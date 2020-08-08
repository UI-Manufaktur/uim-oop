module uim.oop.models.attribute;

import uim.oop; 

class DOOPAttribute {
  mixin(OProperty!("DOOPModel", "model"));
  mixin(OProperty!("UUID", "id"));
  mixin(OProperty!("UUID", "classId")); // id of attclass
}
auto OOPAttribute() { return new DOOPAttribute; }

unittest {
  assert(OOPAttribute.id.empty);
  assert(OOPAttribute.id.empty);

  assert(OOPAttribute.classId.empty);
  assert(OOPAttribute.classId.empty);
}