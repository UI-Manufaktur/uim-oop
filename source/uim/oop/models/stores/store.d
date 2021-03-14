module uim.oop.models.stores.store;

import uim.oop;

@safe 
class DOOPStore(T:DOOPEntityVersion) {

  this(DOOPModel myModel) { _model = myModel; }

  mixin(SProperty!("DOOPModel", "model"));

  protected T[][UUID] _entities;
  T[][UUID] entities() { return _entities; }

  auto opCall(UUID id) { return entity(id); }
  auto opCall(string name) { return entity(name); }

  T entity(UUID id) {
    T result;

    if (id in _entities) {
      if (auto versions = _entities[id]) result = versions.versionLast; 
    }

    return result;
  }

  T entity(string aName) {
    T result;

    foreach(id, versions; _entities) {
      if ((versions) && (versions[$-1].name == aName)) {
        result = versions.versionLast; 
        break;
      }}
    
    return result;
  }

  T entity(UUID anId, size_t major = 0, size_t minor = 0) {
    T result;

    if (anId in _entities) {
      if (auto versions = _entities[anId]) result = versions.versionLast(major, minor); 
    }

    return result;
  }

  T entity(string name, size_t major = 0, size_t minor = 0) {
    T result;

    foreach(id, versions; _entities) {
      if ((versions) && (versions[$-1].name == name)) {
        result = versions.versionLast(major, minor); 
        break;
      }}
    
    return result;
  }

  T entity(UUID anId, string aName, size_t major = 0, size_t minor = 0) {
    T result;

    result = entity(anId, major, minor);
    if (!result) entity(aName, major, minor);
    
    return result;
  }

  O entity(this O)(T newEntity, T[] newEntities...) {
    if (newEntity) {
      newEntity.model(this.model);
      _entities[newEntity.id] = [newEntity];
    }
    foreach(e; newEntities) {
      e.model(this.model);
      _entities[e.id] = [e];
    }
    return cast(O)this;
  }
  O entity(this O)(string name, T newEntity) {
    newEntity.model(this.model);
    newEntity.name = name;
    _entities[newEntity.id] = [newEntity];
    return cast(O)this;
  }

  // Indexing Overloading
  T opIndex(UUID anId) { return entity(anId); }
  T opIndex(string aName) { return entity(aName); }
  T opIndex(UUID anId, size_t major) { return entity(anId, major); }
  T opIndex(string aName, size_t major) { return entity(aName, major); }
  T opIndex(UUID anId, size_t major, size_t minor) { return entity(anId, major, minor); }
  T opIndex(string aName, size_t major, size_t minor) { return entity(aName, major, minor); }
  T opIndex(UUID anId, string aName) { return entity(anId, aName); }
  T opIndex(UUID anId, string aName, size_t major) { return entity(anId, aName, major); }
  T opIndex(UUID anId, string aName, size_t major, size_t minor) { return entity(anId, aName, major, minor); }


  auto versions(UUID id) {
    T[] results;

    if (id in _entities) results = _entities[id];

    return results;
  }

  auto versions(string name) {
    T[] results;

    foreach(id,versions; _entities) {
      if ((versions) && (versions[$-1].name == name)) {
        results = versions; 
        break;
      }
    }

    return results;
  }

  Bson toBson() {
    return Bson(toJson);   
  }

  Json toJson() {
    auto result = Json.emptyArray;
    
    foreach(id, versions; this.entities) {
      if (versions) result ~= versionLast(versions).toJson;
    } 
 
    return result;   
  }

}