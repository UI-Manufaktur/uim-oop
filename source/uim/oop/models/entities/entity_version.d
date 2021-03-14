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
     this.versionOn(0);
  }

  this(UUID myId) { 
    super(myId); 
  }

  this(string myName) { 
    super(myName);
  }

  this(UUID myId, string myName) { 
    super(myId, myName);
  }

  /// Versioning
  mixin(SProperty!("size_t", "versionMinor"));
  mixin(SProperty!("size_t", "versionMajor"));
  ///	Date and time when the entity was versioned.	
  mixin(SProperty!("SysTime", "versionOn"));
  O versionOn(this O)(SysTime aTime) {
    return this.versionOn(toTimeStamp(aTime));
  }
  ///	Unique identifier of the user who versioned the entity.
  mixin(SProperty!("UUID", "versionBy"));
  mixin(SProperty!("string", "versionDescription"));

  override Json toJson() {
    auto result = super.toJson;
    
    result["versionMinor"] = this.versionMinor;
    result["versionMajor"] = this.versionMajor;
    result["versionOn"] = this.versionOn.toTimeStamp;
    result["versionBy"] = this.versionBy.toString;
    result["VersionDescription"] = this.versionDescription;

    return result;
  }
}
@safe auto OOPEntityVersion() { return new DOOPEntityVersion; }
