/***********************************************************************************************
*	Copyright: © 2017-2020 UI Manufaktur UG
*	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
*	Authors: UI Manufaktur Team
*	Documentation [DE]: https://ui-manufaktur.com/docu/uim-oop/models/entities/entity_lang
************************************************************************************************/
module uim.oop.models.entities.entity_lang;

import uim.oop;

@safe class DOOPEntityLang : DOOPEntity {
  this() {
     super(); 
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

  mixin(SProperty!("string", "language"));

  override Json toJson() {
    auto result = super.toJson;
    
    result["language"] = this.language;

    return result;
  }
}
@safe auto OOPEntityLang() { return new DOOPEntityLang; }
