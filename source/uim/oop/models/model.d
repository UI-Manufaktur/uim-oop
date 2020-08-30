module uim.oop.models.model;

import uim.oop;

class DOOPModel {
  this() { this.id(randomUUID); this.name("model%s".format(uniform(0, 1000))); }
  this(UUID id) { this(); this.id(id); }
  this(string name) { _id = randomUUID; }
  
  mixin(OProperty!("UUID", "id"));
  mixin(OProperty!("string", "name"));

  DOOPObjclass[UUID] _objclasses;
  @property DOOPObjclass objclass(UUID id) { 
    if (id in _objclasses) return _objclasses[id]; 
    return null; } 
  @property DOOPObjclass objclass(string name) { 
    foreach(objclass; _objclasses) if (objclass.name == name) return objclass; 
    return null; } 

  DOOPAttclass[UUID] _attclasses;
  @property DOOPAttclass attclasse(UUID id) { 
    if (id in _attclasses) return _attclasses[id]; 
    return null; } 
  @property DOOPAttclass attclasses(string name) { 
    foreach(attclass; _attclasses) if (attclass.name == name) return attclass; 
    return null; } 

  auto toJSONProps() {
    string[string] results;
    results["id"] = "'"~_id.toString~"'";
    results["name"] = "'"~_name~"'";
    return results;
  }
  auto toJSONString() {
    return toJSONProps.toJSONString;
  }
}
auto OOPModel() { return new DOOPModel; }

unittest {
  auto oopModel = OOPModel;
}