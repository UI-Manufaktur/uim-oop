module uim.oop.models;

import uim.oop;

public import uim.oop.models.attclass;
public import uim.oop.models.objclass;
public import uim.oop.models.attributes;
public import uim.oop.models.entities;
public import uim.oop.models.obj;
public import uim.oop.models.model;
public import uim.oop.models.stores;
public import uim.oop.models.tools;

template SProperty(string dataType, string propertyName) {
	const char[] SProperty = "
	protected "~dataType~" _"~propertyName~";
	@safe @property "~dataType~" "~propertyName~"() { return _"~propertyName~"; }
	@safe @property O "~propertyName~"(this O)("~dataType~" newValue) { _"~propertyName~" = newValue; return cast(O)this; }";
}

auto entityDeclaration(string classname, string entityname) {
  return 
  `UUID _`~entityname~`Id;
  string _`~entityname~`Name;
  size_t _`~entityname~`Major;
  size_t _`~entityname~`Minor;
  `~classname~` _`~entityname~`;`;
}

auto entityGetter(string classname, string entityname) {
  return `
  @property UUID `~entityname~`Id() { return _`~entityname~`Id; }
  @property string `~entityname~`Name() { return _`~entityname~`Name; }
  @property `~classname~` `~entityname~`(size_t major = 0, size_t minor = 0) { 
    if (_`~entityname~`) return cast(`~classname~`)_`~entityname~`;

    `~classname~` result;

    if (auto model = this.model) {
      result = cast(`~classname~`)model[_`~entityname~`Id, _`~entityname~`Name, major, minor];
    }
    
    return result; }
`;
}

auto entitySetter(string classname, string entityname) {
  return `
  @property O `~entityname~`Id(this O)(UUID newId, size_t major = 0, size_t minor = 0) { 
    _`~entityname~`Id = newId; 
    _`~entityname~`Name = null; 
    _`~entityname~`Major = versionMajor; 
    _`~entityname~`Minor = versionMinor; 
    _`~entityname~` = null; 

    return cast(O)this;  
  }
  @property O `~entityname~`Name(this O)(string newId, size_t major = 0, size_t minor = 0) { 
    _`~entityname~`Id = newId; 
    _`~entityname~`Name = null; 
    _`~entityname~`Major = versionMajor; 
    _`~entityname~`Minor = versionMinor; 
    _`~entityname~` = null; 

    return cast(O)this;  
  }
  @property O `~entityname~`(this O)(`~classname~` newEntity) { 
    _`~entityname~` = newEntity; 
    if (_`~entityname~`) { // Not null
      _`~entityname~`Id = _`~entityname~`.id;
      _`~entityname~`Name = _`~entityname~`.name;
      _`~entityname~`Major = versionMajor; 
      _`~entityname~`Minor = versionMinor; 
    }
    return cast(O)this;  
  }
  `;
}

template EProperty(string className, string entityName) {
  const char[] EProperty = 
    entityDeclaration(className, entityName)~
    entityGetter(className, entityName)~
    entitySetter(className, entityName);
}