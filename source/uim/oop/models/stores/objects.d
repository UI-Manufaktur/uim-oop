module uim.oop.models.stores.objects;

import uim.oop;

@safe
class DOOPStoreObjects : DOOPStore!DOOPObj {
    this(DOOPModel myModel) {
    super(myModel);
  }
}
auto OOPStoreObjects(DOOPModel myModel) { return new DOOPStoreObjects(myModel); }