module uim.oop.models.objclass;

import uim.oop;

class DOOPObjclass {
  mixin(OProperty!("UUID", "superId"));
  mixin(OProperty!("UUID", "id"));
  mixin(OProperty!("string", "name"));
  mixin(XPropertyArray!("UUID", "attributes"));

/*   DOOPObject createObj() {
    auto result = new DOOPObject(this);
    return result;
  }
 */}
auto OOPObjclass() { return new DOOPObjclass; }

unittest {
  assert(OOPObjclass.id.empty);
}
