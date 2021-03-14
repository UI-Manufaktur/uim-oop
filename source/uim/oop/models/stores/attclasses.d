module uim.oop.models.stores.attclasses;

import uim.oop;

@safe
class DOOPStoreAttclasses : DOOPStore!DOOPAttclass {
  this(DOOPModel myModel) {
    super(myModel);
  }

  unittest{
    auto model = new DOOPModel;
    auto classes = new DOOPStoreAttclasses(model);
    auto attclass = new DOOPAttclass();   
  }
}