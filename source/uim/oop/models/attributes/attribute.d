module uim.oop.models.attributes.attribute;

import uim.oop;

@safe class DOOPAttribute {
  this() { 
    _isNullable = true;
    _isNull = true;
  }
  this(UUID anID) { 
    this();
    this.id(anID);
  }
  this(string anName) { 
    this();
    this.name(anName);
  }

  /// Model 
  mixin(SProperty!("DOOPModel", "model"));
  unittest {
    /// TODO
  }

  mixin(SProperty!("UUID", "id"));
  unittest {
    /// TODO
  }

  /// Name
  mixin(SProperty!("string", "name"));
  unittest {
    /// TODO
  }

  mixin(SProperty!("string", "valueInteger")); //")); // Shows the integer value of the property.")); //  
  mixin(SProperty!("string", "valueDecimal")); // Shows the decimal value of the property.")); //  
  mixin(SProperty!("string", "valueDouble")); // Shows the double value of the property.")); //  
  mixin(SProperty!("string", "valueString")); // Shows the string value of the property.")); //  
  mixin(SProperty!("string", "dynamicPropertyId")); // Shows the property that this record is associated with.")); //  
  mixin(SProperty!("string", "isValid")); // Shows whether the property value is valid.")); //  
  mixin(SProperty!("string", "transactionCurrencyId")); // Shows the currency associated with the record.")); //  
  mixin(SProperty!("string", "exchangeRate")); // Shows the conversion rate of the record's currency. The exchange rate is used to convert all money fields in the record from the local currency to the system's default currency.")); //  

  /// Attclass from which it inherits
  mixin(EProperty!("DOOPAttclass", "attclass"));
  unittest {
    /// TODO
  }

  mixin(EProperty!("DOOPObj", "owner"));
  unittest {
    /// TODO
  }

  /**
  * Major Version number
  */  
  mixin(SProperty!("size_t", "versionMajor"));
  unittest {
    /// TODO
  }

  mixin(SProperty!("size_t", "versionMinor"));
  unittest {
    /// TODO
  }

  protected bool _isNullable;
  @property bool isNullable() { return _isNullable; }
  @property O isNullable(this O)(bool newValue) { _isNullable = newValue; return cast(O)this; }

  protected bool _isNull;
  @property bool isNull() { return _isNull; }
  @property O isNull(this O)(bool newValue) { if (_isNullable) _isNull = newValue; return cast(O)this; }
  unittest {
    /// TODO
  }

  Bson toBson() {
    auto result = Bson.emptyObject;
    result["isNullable"] = _isNullable;
    result["isNull"] = _isNull;
    return result;
  }

  Json toJson() {
    auto result = Json.emptyObject;
    result["isNullable"] = _isNullable;
    result["isNull"] = _isNull;

    // attclass
    auto jsonAttclass = Json.emptyObject;
    jsonAttclass["id"] = _attclassId.toString;
    jsonAttclass["name"] = _attclassName;
    jsonAttclass["versionMajor"] = _attclassMajor;
    jsonAttclass["versionMinor"] = _attclassMinor;
    result["attclass"] = jsonAttclass;

    // object
    auto jsonOwner = Json.emptyObject;
    jsonOwner["id"] = _ownerId.toString;
    jsonOwner["name"] = _ownerName;
    jsonOwner["versionMajor"] = _ownerMajor;
    jsonOwner["versionMinor"] = _ownerMinor;
    result["owner"] = jsonOwner;

    return result;
  }

  override string toString() {
    return "";
  }
}
auto OOPAttribute() { return new DOOPAttribute; }
auto OOPAttribute(UUID id) { return new DOOPAttribute(id); }
auto OOPAttribute(string name) { return new DOOPAttribute(name); }
