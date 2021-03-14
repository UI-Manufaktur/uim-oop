/***********************************************************************************************
*	Copyright: © 2017-2020 UI Manufaktur UG
*	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
*	Authors: UI Manufaktur Team
*	Documentation [DE]: https://ui-manufaktur.com/docu/uim-oop/models/entities/entity_version
************************************************************************************************/
module uim.oop.models.entities.entity_version;

import uim.oop;

@safe class DOOPEntityVersion : DOOPEntity {
  this() {
     super();
     this.versionOn(0L);
  }

  this(UUID myId) { 
    this();
    this
    .id(myId); 
  }

  this(string myName) { 
    this();
    this.name(myName); 
  }

  this(UUID myId, string myName) { 
    this();
    this
    .id(myId)
    .name(myName);
  }

  this(Json aJson) { 
    this();    

    this
    .fromJson(aJson); }

  /// Versioning
  mixin(SProperty!("size_t", "versionMinor"));
  mixin(SProperty!("size_t", "versionMajor"));
  ///	Date and time when the entity was versioned.	
  mixin(SProperty!("long", "versionOn"));
  O versionOn(this O)(SysTime aTime) {
    this.versionOn(toTimeStamp(aTime));
    return cast(O)this;
  }
  ///	Unique identifier of the user who versioned the entity.
  mixin(SProperty!("UUID", "versionBy"));
  O versionBy(this O)(string anUuid) { 
    this.versionBy(UUID(anUuid)); 
    return cast(O)this;
  }

  mixin(SProperty!("string", "versionDescription"));

  O createVersionMinor(this O)(string description = "") {
    this.hasVersions = true;

    auto result = new O(this.toJson);
    result.versionMinor = result.versionMinor + 1;
    result.versionDescription = description;
    result.versionOn(now);   
    result.modifiedOn(result.versionOn);   
    return cast(O)result;
  }

  O createVersionMajor(this O)(string description = "") {
    this.hasVersions = true;

    auto result = new O(this.toJson);
    result.versionMinor = 0;
    result.versionMajor = result.versionMajor + 1;
    result.versionDescription = description;
    result.versionOn(now);   
    result.modifiedOn(result.versionOn);   
    return cast(O)result;
  }

  override void fromJson(Json aJson) {
    super.fromJson(aJson);
    
    this
    .versionMinor(aJson["versionMinor"].get!long)
    .versionMajor(aJson["versionMajor"].get!long)
    .versionOn(aJson["versionOn"].get!long)
    .versionBy(aJson["versionBy"].get!string)
    .versionDescription(aJson["VersionDescription"].get!string);
  }

  override Json toJson() {
    auto result = super.toJson;
    
    result["versionMinor"] = this.versionMinor;
    result["versionMajor"] = this.versionMajor;
    result["versionOn"] = this.versionOn;
    result["versionBy"] = this.versionBy.toString;
    result["VersionDescription"] = this.versionDescription;

    return result;
  }
}
@safe auto OOPEntityVersion() { return new DOOPEntityVersion; }
