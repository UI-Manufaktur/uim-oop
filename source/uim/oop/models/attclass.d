module uim.oop.models.attclass;

import uim.oop;

@safe class DOOPAttclass : DOOPEntityVersion {
  this() { super(); }
  this(UUID myId) { super(myId); }
  this(string myName) { super(myName); }
  this(UUID myId, string myName) { super(myId, myName); }

  mixin(SProperty!("DOOPModel", "model"));
  mixin(SProperty!("bool", "isNullable"));
  mixin(SProperty!("string", "valueType")); // Select the data type of the property.")); // 
  mixin(SProperty!("string", "keyType")); // Select the data type of the property.")); // 
  mixin(SProperty!("string", "dataType_display")); // ")); // 
  mixin(SProperty!("int", "defaultValueInteger")); // Shows the default value of the property for a whole number data type.")); // 
  mixin(SProperty!("string", "defaultValueString")); // Shows the default value of the property for a string data type.")); // 
  mixin(SProperty!("string", "defaultValueDecimal")); // Shows the default value of the property for a decimal data type.")); // 
  mixin(SProperty!("string", "baseDynamicPropertyId")); // Shows the property in the product family that this property is being inherited from.")); // 
  mixin(SProperty!("string", "overwrittenDynamicPropertyId")); // Shows the related overwritten property.")); // 
  mixin(SProperty!("string", "rootDynamicPropertyId")); // Shows the root property that this property is derived from.")); // 
  mixin(SProperty!("string", "minValueDecimal")); // Shows the minimum allowed value of the property for a decimal data type.")); // 
  mixin(SProperty!("string", "maxValueDecimal")); // Shows the maximum allowed value of the property for a decimal data type.")); // 
  mixin(SProperty!("uint", "precision")); // Shows the allowed precision of the property for a whole number data type.")); // 
  mixin(SProperty!("string", "stateCode")); // Shows the state of the property.")); // 
  mixin(SProperty!("string", "stateCode_display")); // ")); // 
  mixin(SProperty!("string", "statusCode")); // Shows whether the property is active or inactive.")); // 
  mixin(SProperty!("string", "statusCode_display")); // ")); // 
  mixin(SProperty!("string", "regardingObjectId")); // Choose the product that the property is associated with.")); // 
  mixin(SProperty!("string", "defaultValueDouble")); // Shows the default value of the property for a double data type.")); // 
  mixin(SProperty!("double", "minValueDouble")); // Shows the minimum allowed value of the property for a double data type.")); // 
  mixin(SProperty!("double", "maxValueDouble")); // Shows the maximum allowed value of the property for a double data type.")); // 
  mixin(SProperty!("int", "minValueInteger")); // Shows the minimum allowed value of the property for a whole number data type.")); // 
  mixin(SProperty!("int", "maxValueInteger")); // Shows the maximum allowed value of the property for a whole number data type.")); // 
  mixin(SProperty!("bool", "isArray")); 
  mixin(SProperty!("bool", "isAssociativeArray")); 
  mixin(SProperty!("bool", "isReadOnly")); // Defines whether the attribute is read-only or if it can be edited.")); // 
  mixin(SProperty!("bool", "isHidden")); // Defines whether the attribute is hidden or shown.")); // 
  mixin(SProperty!("bool", "isRequired")); // Defines whether the attribute is mandatory.")); // 
  mixin(SProperty!("uint", "maxLengthString")); // Shows the maximum allowed length of the property for a string data type.")); // 
  mixin(SProperty!("string", "defaultValueOptionSet")); // Shows the default value of the property.

  /// Attclass from which it inherits
  UUID _attclassId;
  string _attclassName;
  size_t _attclassMajor;
  size_t _attclassMinor;
  DOOPAttclass _attclass;

  @property UUID attclassId() { return _attclassId; }
  @property string attclassName() { return _attclassName; }
  @property DOOPAttclass attclass(size_t major = 0, size_t minor = 0) { 
    if (_attclass) return cast(DOOPAttclass)_attclass;

    DOOPAttclass result;

    if (auto model = this.model) {
      result = cast(DOOPAttclass)model[_attclassId, _attclassName, major, minor];
    }
    
    return result; }

  @property O attclassId(this O)(UUID newId, size_t major = 0, size_t minor = 0) { 
    _attclassId = newId; 
    _attclassName = null; 
    _attclassMajor = versionMajor; 
    _attclassMinor = versionMinor; 
    _attclass = null; 

    return cast(O)this;  
  }
 
  @property O attclassName(this O)(string newId, size_t major = 0, size_t minor = 0) { 
    _attclassId = newId; 
    _attclassName = null; 
    _attclassMajor = versionMajor; 
    _attclassMinor = versionMinor; 
    _attclass = null; 

    return cast(O)this;  
  }
  @property O attclass(this O)(DOOPAttclass newEntity) { 
    _attclass = newEntity; 
    if (_attclass) { // Not null
      _attclassId = _attclass.id;
      _attclassName = _attclass.name;
      _attclassMajor = versionMajor; 
      _attclassMinor = versionMinor; 
    }
    return cast(O)this;  
  }
  unittest {
    /// TODO
  }

  // Create a new attribute based on this attclass - using attclass name 
  auto createAttribute() {
    return createAttribute(_name); }

  // Create a new attribute based on this attclass an a giving name 
  auto createAttribute(string aName) {
    DOOPAttribute result;
    switch(this.valueType) {
      case "bool": break; 
      case "byte": break; 
      case "ubyte": break; 
      case "short": break; 
      case "ushort": break; 
      case "int": break; 
      case "uint": break; 
      case "long": break; 
      case "ulong": break; 
      case "float": break; 
      case "double": break; 
      case "real": break; 
      case "ifloat": break; 
      case "idouble": break; 
      case "ireal": break; 
      case "cfloat": break; 
      case "cdouble": break; 
      case "creal": break; 
      case "char": break; 
      case "wchar": break; 
      case "dchar": break; 
      case "string": break; 
      case "uuid": break; 
      case "datetime": break; 
      default: break;
    }
    result = new DOOPAttribute(aName);
    result.attclass(this);
    result.name(aName);
    return result;
  }
  unittest {
    /// TODO
  }

  /** 
  * Convert data to json (using vibe's funcs)
  **/ 
  override Json toJson() {
    auto result = super.toJson;

    // Attclass   
    auto ac = Json.emptyObject;
    if (this.attclass) {
      ac["id"] = this.attclass.id.toString;
      ac["name"] = this.attclass.name;
    }
    else {
      ac["id"] = _attclassId.toString;
      ac["name"] = _attclassName;
    }
    result["attclass"] = ac;

    // Fields
    result["isNullable"] = this.isNullable;
    result["valueType"] = this.valueType;
    result["keyType"] = this.keyType;
    result["dataType_display"] = this.dataType_display; 
    result["defaultValueInteger"] = this.defaultValueInteger; 
    result["defaultResulttring"] = this.defaultValueString; 
    result["defaultValueDecimal"] = this.defaultValueDecimal; 
    result["baseDynamicPropertyId"] = this.baseDynamicPropertyId; 
    result["overwrittenDynamicPropertyId"] = this.overwrittenDynamicPropertyId; 
    result["rootDynamicPropertyId"] = this.rootDynamicPropertyId; 
    result["minValueDecimal"] = this.minValueDecimal; 
    result["maxValueDecimal"] = this.maxValueDecimal; 
    result["precision"] = this.precision; 
    result["stateCode"] = this.stateCode; 
    result["stateCode_display"] = this.stateCode_display; 
    result["statusCode"] = this.statusCode; 
    result["statusCode_display"] = this.statusCode_display; 
    result["regardingObjectId"] = this.regardingObjectId; 
    result["defaultValueDouble"] = this.defaultValueDouble; 
    result["minValueDouble"] = this.minValueDouble;
    result["maxValueDouble"] = this.maxValueDouble;
    result["minValueInteger"] = this.minValueInteger;
    result["maxValueInteger"] = this.maxValueInteger;
    result["isReadOnly"] = this.isReadOnly;
    result["isHidden"] = this.isHidden;
    result["isRequired"] = this.isRequired;
    result["isArray"] = this.isArray;
    result["isAssociativeArray"] = this.isAssociativeArray;
    result["maxLengthString"] = this.maxLengthString;
    result["defaultValueOptionSet"] = this.defaultValueOptionSet;

    return result;
  }
  unittest {
    /// TODO
  }
}
@safe auto OOPAttclass() { return new DOOPAttclass; }
@safe auto OOPAttclass(UUID id) { return new DOOPAttclass(id); }
@safe auto OOPAttclass(string name) { return new DOOPAttclass(name); }
@safe auto OOPAttclass(UUID id, string name) { return new DOOPAttclass(id, name); }