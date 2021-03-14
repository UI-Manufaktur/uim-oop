module uim.oop.models.model;

import uim.oop;

@safe class DOOPModel {
  this() {
    this.id(randomUUID);
    _storeAttclasses = new DOOPStoreAttclasses(this);
    _storeObjclasses = new DOOPStoreObjclasses(this);
    _storeObjects = new DOOPStoreObjects(this);
  }
  this(string modelName) { this(); this.name(modelName); }

  protected DOOPStoreAttclasses _storeAttclasses;
  @property auto attclasses() { return _storeAttclasses; }

  protected DOOPStoreObjclasses _storeObjclasses;
  @property auto objclasses() { return _storeObjclasses; }

  protected DOOPStoreObjects _storeObjects;
  @property auto objects() { return _storeObjects; }

  mixin(SProperty!("UUID", "id"));
  mixin(SProperty!("string", "name"));
  unittest {
    // assert(OOPModel("test").name == "test");
    // assert(OOPModel.name("test").name == "test");
  }

  auto opIndex(UUID id) {
    DOOPEntity result = attclasses[id];
    if (!result) result =  objclasses[id];
    if (!result) result =  objects[id];
    return result;
  }
  auto opIndex(string name) {
    DOOPEntity result = attclasses[name];
    if (!result) result =  objclasses[name];
    if (!result) result =  objects[name];
    return result; }

  auto opIndex(UUID anId, size_t major) {
    DOOPEntity result = attclasses[id, major];
    if (!result) result =  objclasses[id, major];
    if (!result) result =  objects[id, major];
    return result; }

  auto opIndex(string name, size_t major) {
    DOOPEntity result = attclasses[name, major];
    if (!result) result =  objclasses[name, major];
    if (!result) result =  objects[name, major];
    return result; }

  auto opIndex(UUID anId, size_t major, size_t minor) {
    DOOPEntity result = attclasses[id, major, minor];
    if (!result) result =  objclasses[id, major, minor];
    if (!result) result =  objects[id, major, minor];
    return result; }

  auto opIndex(string name, size_t major, size_t minor) {
    DOOPEntity result = attclasses[name, major, minor];
    if (!result) result =  objclasses[name, major, minor];
    if (!result) result =  objects[name, major, minor];
    return result; }

  auto opIndex(UUID anId, string name) {
    DOOPEntity result = attclasses[id, name];
    if (!result) result =  objclasses[name];
    if (!result) result =  objects[name];
    return result; }

  auto opIndex(UUID anId, string name, size_t major) {
    DOOPEntity result = attclasses[id, name, major];
    if (!result) result =  objclasses[id, name, major];
    if (!result) result =  objects[id, name, major];
    return result; }

  auto opIndex(UUID anId, string name, size_t major, size_t minor) {
    DOOPEntity result = attclasses[id, name, major, minor];
    if (!result) result =  objclasses[id, name, major, minor];
    if (!result) result =  objects[id, name, major, minor];
    return result; }

 Bson toBson() { return Bson(toJson); }

 Json toJson() {
  auto result = Json.emptyObject;

  result["attclasses"] = _storeAttclasses.toJson;
  result["attclasses"] = _storeAttclasses.toJson;

  result["attclasses"] = _storeAttclasses.toJson;
  result["objclasses"] = _storeObjclasses.toJson;
 
  return result;   
 }
}
@safe auto OOPModel() { return new DOOPModel; }
@safe auto OOPModel(string modelName) {  return new DOOPModel(modelName); }
