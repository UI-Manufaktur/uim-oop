module uim.oop.models.objclass;

import uim.oop;

@safe class DOOPObjclass : DOOPEntityVersion {
  this() { super(); }
  this(UUID myId) { super(myId); }
  this(string myName) { super(myName); }
  this(UUID myId, string myName) { super(myId, myName); }

  /// Model 
  mixin(SProperty!("DOOPModel", "model"));
  unittest {
    // 
  }

  /// Attclass from which it inherits
  mixin(EProperty!("DOOPObjclass", "objclass"));
  unittest {
    /// TODO
  }

  ///
  string[string] _objClassAttributes; // cache
  string[string] _attclasses;
  O attclasses(this O)(string[string] newAttclasses) { foreach(k, v; newAttclasses) if (v)_attclasses[k] = v; return cast(O)this; }
  string[string] attclasses() {
    string[string] results;
    if (_objclass) results = _objclass.attclasses;
    foreach (key, attribute; _attclasses) results[key] = attribute;

    return results; }
  unittest {
  }

  auto createObject(string aName) {
    auto result = OOPObj;
    result.model(this.model);
    result.objclass(this);
    result.name(aName);
    // result.attclasses(this.attclasses);
    
    foreach(name, attclass; attclasses ) {
      if (attclass) {
        if (auto model = this.model) {
          if (auto ac = model.attclasses.entity(name)) {
            result.attributes[name] = ac.createAttribute(name);    
          }
        } 
      }
    }
    return result; }
  unittest {
    // assert(OOPObjclass.createObj("test"));
  }

  /** 
  * Convert data to json (using vibe's funcs)
  **/ 
  override Json toJson() {
    auto result = super.toJson;

    // Objclass   
    auto oc = Json.emptyObject;
    if (this.objclass) {
      oc["id"] = this.objclass.id.toString;
      oc["name"] = this.objclass.name;
    }
    result["objclass"] = oc;

    // Attclasses
    auto ac = Json.emptyObject;
    foreach(name, attName; this.attclasses) {
      ac[name] = attName;
    }
    result["attclasses"] = ac;
    
    return result;
  }
}
auto OOPObjclass() { return new DOOPObjclass; }
auto OOPObjclass(UUID id) { return new DOOPObjclass(id); }
auto OOPObjclass(string name) { return new DOOPObjclass(name); }
auto OOPObjclass(UUID id, string name) { return new DOOPObjclass(id, name); }

