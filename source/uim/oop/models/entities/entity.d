/***********************************************************************************************
*	Copyright: © 2017-2020 UI Manufaktur UG
*	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
*	Authors: UI Manufaktur Team
*	Documentation [DE]: https://ui-manufaktur.com/docu/uim-oop/models/entities/entity_lang
************************************************************************************************/
module uim.oop.models.entities.entity;

import uim.oop;

@safe class DOOPEntity {
// Constructors
  this() {
    this
    .id(randomUUID)
    .name(this.id.toString) 
    .createdOn(now)
    .modifiedOn(createdOn)
    .hasVersions(false)
    .hasLanguages(false); }

  this(UUID myId) { 
    this(); 
    
    this
    .id(myId)
    .name(this.id.toString); }

  this(string myName) { 
    this(); 
    
    this.name(myName); }

  this(UUID myId, string myName) { 
    this();

    this
    .id(myId)
    .name(myName); }

  this(Json aJson) { 
    this();    

    this
    .fromJson(aJson); }

  // Every entity has a unique id as a primary key
  mixin(SProperty!("UUID", "id"));
  O id(this O)(string anUuid) { return this.id(UUID(anUuid)); }
  unittest {
    auto id1 = randomUUID;
    assert(OOPEntity.id(id1).id == id1);
    auto id2 = randomUUID;
    assert(OOPEntity.id(id1).id(id2).id == id2);
  }

  // Every entity has a unique name - not primarykey only for human search
  mixin(SProperty!("string", "name"));
  unittest {
    assert(OOPEntity.name("name1").name == "name1");
    assert(OOPEntity.name("name1").name("name2").name == "name2");
  }

  /// Date and time when the entity was created.
  mixin(SProperty!("long", "createdOn"));
  O createdOn(this O)(SysTime aTime) {
    return this.createdOn(toTimeStamp(aTime));
  }
  unittest {
/*     auto now1 = now; auto now2 = now;
    assert(OOPEntity.createdOn(now1).createdOn == now1);
    assert(OOPEntity.createdOn(now1).createdOn(now2).createdOn == now2);
 */  }

  ///   createdBy	Unique identifier of the user who created the entity.	
  mixin(SProperty!("UUID", "createdBy"));
  O createdBy(this O)(string anUuid) { return this.createdBy(UUID(anUuid)); }

  ///	Date and time when the entity was modified.	
  mixin(SProperty!("long", "modifiedOn"));
  O modifiedOn(this O)(SysTime aTime) {
    return this.modifiedOn(toTimeStamp(aTime));
  }

  ///	Unique identifier of the user who modified the entity.
  mixin(SProperty!("UUID", "modifiedBy"));
  O modifiedBy(this O)(string anUuid) { return this.modifiedBy(UUID(anUuid)); }

  ///	Description about the entity and more
  mixin(SProperty!("string", "description"));

  ///	Entity has Versions. Starts with EntityVersion	
  mixin(SProperty!("bool", "hasVersions"));
  ///	entity has languages. Starts with EntityLanguage	
  mixin(SProperty!("bool", "hasLanguages"));

  ///	Date and time when the entity is locked.	
  mixin(SProperty!("bool", "isLocked"));
  ///	Date and time when the entity was locked.	
  mixin(SProperty!("long", "lockedOn"));
  O lockedOn(this O)(SysTime aTime) {
    return this.lockedOn(toTimeStamp(aTime));
  }

  ///	Unique identifier of the user who modified the entity.
  mixin(SProperty!("UUID", "lockedBy"));
  O lockedBy(this O)(string anUuid) { return this.lockedBy(UUID(anUuid)); }

  ///	Date and time when the entity is deleted.	
  mixin(SProperty!("bool", "isDeleted"));
  ///	Date and time when the entity was locked.	
  mixin(SProperty!("long", "deletedOn"));
  O deletedOn(this O)(SysTime aTime) {
    return this.deletedOn(toTimeStamp(aTime));
  }

  ///	Unique identifier of the user who deleted the entity.
  mixin(SProperty!("UUID", "deletedBy"));
  O deletedBy(this O)(string anUuid) { return this.deletedBy(UUID(anUuid)); }


/* 
  /// A title
  mixin(OLanguageString!"title");
	
  /// Additional Info 
  mixin(OLanguageString!"description");



/*   override string toString() {
    return this.toJSON().toString;
  }
 *//*   Json toJSON() {
    return serializeToJson(this);
  }
/*  * /  string[] myFields() { return ["id", "name", "title", "createdAt", "createdBy", "modifiedAt", "modifiedBy", "locked", "lockedAt", "lockedBy", 
    "deleted", "deletedAt", "deletedBy", "versionId", "currentVersion", "versionAt", "versionBy", "versionNote", "description"]; }
  string[] fields() { return this.myFields; } */

/*   string js() {
    
        string result;
        foreach(field; fields) result ~= "this.%s=%s;".format(field, field);
    return jsClass("Entity", fields, 
      jsFunc("toJSON", "return {%s};".format(result))
    );
  } */ 

  Bson toBson() { return Bson(toJson); }

  void fromJson(Json aJson) {
    this
    .id(aJson["id"].get!string)
    .name(aJson["name"].get!string)
    .createdOn(aJson["createdOn"].get!long)
    .createdBy(aJson["createdBy"].get!string)
    .modifiedOn(aJson["modifiedOn"].get!long)
    .modifiedBy(aJson["modifiedBy"].get!string)
    .description(aJson["description"].get!string)
    .isLocked(aJson["isLocked"].get!bool)
    .lockedOn(aJson["lockedOn"].get!long)
    .lockedBy(aJson["lockedBy"].get!string)
    .isDeleted(aJson["isDeleted"].get!bool)
    .deletedOn(aJson["deletedOn"].get!long)
    .deletedBy(aJson["deletedBy"].get!string);
  }

  Json toJson() {
    auto result = Json.emptyObject;

    result["id"] = this.id.toString;
    result["name"] = this.name;
    result["createdOn"] = this.createdOn;
    result["createdBy"] = this.createdBy.toString;
    result["modifiedOn"] = this.modifiedOn;
    result["modifiedBy"] = this.modifiedBy.toString;
    result["description"] = this.description;
    result["isLocked"] = this.isLocked;
    result["lockedOn"] = this.lockedOn;
    result["lockedBy"] = this.lockedBy.toString;
    result["isDeleted"] = this.isDeleted;
    result["deletedOn"] = this.deletedOn;
    result["deletedBy"] = this.deletedBy.toString;

    return result;
  }
}
@safe auto OOPEntity() { return new DOOPEntity; }


