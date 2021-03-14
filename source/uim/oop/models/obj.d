module uim.oop.models.obj;

import uim.oop;

@safe class DOOPObj : DOOPEntityVersion {
  this() { 
    super("attclass-"~this.id.toString); }
  this(UUID myId) { 
    super(myId); }
  this(string myName) { 
    super(myName); }
  this(UUID myId, string myName) { 
    super(myId, myName); }

  this(DOOPObjclass myObjclass) { 
    this(); 
    this.objclass(myObjclass);
    this.model(myObjclass.model); }

  mixin(SProperty!("DOOPModel", "model"));

  mixin(EProperty!("DOOPObjclass", "objclass"));

  mixin(SProperty!("DOOPAttribute[string]", "attributes"));  

 override Bson toBson() {
    auto result = super.toBson;
    result["objclass"] = (this.objclass ? this.objclass.id.toString : "");
    
    auto atts = Bson.emptyObject;
    foreach (attName, attribute; this.attributes) atts[name] = attribute.toBson;
    result["attributes"] = atts;

    return result;
  } 

 override Json toJson() {
    auto result = super.toJson;
    
    // objclass
    auto jsonObjclass = Json.emptyObject;
    jsonObjclass["id"] = _objclassId.toString;
    jsonObjclass["name"] = _objclassName;
    jsonObjclass["versionMajor"] = _objclassMajor;
    jsonObjclass["versionMinor"] = _objclassMinor;
    result["objclass"] = jsonObjclass;

    auto atts = Json.emptyObject;
    foreach (attName, attribute; this.attributes) atts[name] = attribute.toJson;
    result["attributes"] = atts;

    return result;
  } 
}
@ safe auto OOPObj() { return new DOOPObj; }

unittest {
  writeln(OOPObj.toJson());
  // writeln(OOPObj.attributes(["aname": "attclassname"]).toJson());
}

