module uim.oop.models.entity;
/*
import uim.oop;


@safe class DMODEntity {
  this() {}
  this(UUID newId, string newName) { this().id(newId).name(newName); }
  this(DMODStore newStore) { this(); _store = newStore; }
  this(DMODStore newStore, UUID newId, string newName) { this(newStore).id(newId).name(newName); }

  DMODStore _store;

  /// Unique identifier
 mixin(OUuid!"id");
  /// A unique descriptive name
   mixin(OString!"name");
  /// A title
  mixin(OLanguageString!"title");
  /// Date and time when the entity was created.
  mixin(OTimestamp!"createdAt");
  ///   createdBy	Unique identifier of the user who created the entity.	
  mixin(OUuid!"createdBy");
  ///	Date and time when the entity was modified.	
  mixin(OTimestamp!"modifiedAt");
  ///	Unique identifier of the user who modified the entity.
  mixin(OUuid!"modifiedBy");
  ///	Status about entity is locked.	
  mixin(OBool!"locked");
  ///	Date and time when the entity was locked.	
  mixin(OTimestamp!"lockedAt");
  ///	Unique identifier of the user who locked the entity.
  mixin(OUuid!"lockedBy");
  ///	Status about entity is deleted.	
  mixin(OBool!"deleted");
  ///	Date and time when the entity was deleted.	
  mixin(OTimestamp!"deletedAt");
  ///	Unique identifier of the user who deleted the entity.
  mixin(OUuid!"deletedBy");
  /// Additional Info 
  mixin(OLanguageString!"description");

  /// Versioning
  /// Current version id / unique increment
  mixin(OCounter!"versionId");
  /// is current Version ?
  mixin(OBool!"currentVersion");
  /// timestamp of version creation
  mixin(OTimestamp!"versionAt");
  /// version created by
  mixin(OUuid!"versionBy");
  /// additional version info
  mixin(OString!"versionNote");

  override string toString() {
    return this.toJSON().toString;
  }
  Json toJSON() {
    return serializeToJson(this);
  }
  string[] myFields() { return ["id", "name", "title", "createdAt", "createdBy", "modifiedAt", "modifiedBy", "locked", "lockedAt", "lockedBy", 
    "deleted", "deletedAt", "deletedBy", "versionId", "currentVersion", "versionAt", "versionBy", "versionNote", "description"]; }
  string[] fields() { return this.myFields; }

  string js() {
    
        string result;
        foreach(field; fields) result ~= "this.%s=%s;".format(field, field);
    return jsClass("Entity", fields, 
      jsFunc("toJSON", "return {%s};".format(result))
    );
  }
}

auto MODEntity() { return new DMODEntity; }
*/