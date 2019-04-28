module uim.oop.properties.obj;

import uim.oop;

template OOPPROPERTY(string name, string datatype, string defaultValue = "", bool readOnly = false) {
	const char[] OOPPROPERTY = `
	@OOP_PROPERTY("`~name~`", "`~datatype~`", "`~defaultValue~`", `~(readOnly ? "true" : "false")~`) `~datatype~` _`~name~``~((defaultValue.length > 0) ? (" = "~defaultValue) : "")~`;
	@property `~datatype~` `~name~`() { return _`~name~`; }
	`~(!readOnly ? `@property O `~name~`(this O)(`~datatype~` newValue) { _`~name~` = newValue; return cast(O)this; }` : "");
}

class PropertyObj : Element {
	mixin(ThisElement!()); 
	this(string aName, string aDataType, string aDefaultValue, bool isReadOnly = false) { 
		super(aName); 
		_datatype = aDataType;
		_defaultValue = aDefaultValue; 
		_readOnly = isReadOnly; 
	}
	mixin(PropertyDefinition!("string", "_datatype", "datatype"));
	mixin(PropertyDefinition!("string", "_defaultValue", "defaultValue"));
	mixin(PropertyDefinition!("bool", "_readOnly", "readOnly"));

	@safe override Bson toBson() {
		Bson result = super.toBson;
		result["datatype"] = _datatype;
		result["defaultValue"] = _defaultValue;
		result["readOnly"] = _readOnly;
		
		return result;
	}

	@safe override Json toJson() {
		Json result = Json.emptyObject;
		result["datatype"] = _datatype;
		result["defaultValue"] = _defaultValue;
		result["readOnly"] = _readOnly;

		return result;
	}

	@safe override string toString() { return toJson.toString; };
}
mixin(ShortCutElement!("PROPERTYOBJ", "PropertyObj")); 
//auto PROPERTY(string aName, string aType) { return new Property(aName, aType); }

//class PropertyTempl(T) : Property {
//	mixin(ThisElement!()); 
//	this(T)(string aName, T aDefault) { super(aName); this.defaultValue = aDefault; this.value = defaultValue; }
//
//	T _value;
//	@property T value() { return _value; }
//	@property O value(this O)(T newValue) { _value = newValue; return cast(O)this; }
//
//	void opAssign(T newValue) {
//		this.value = newValue;
//	}
//}

unittest {
	assert(PROPERTYOBJ("Test").name == "Test");
	assert(PROPERTYOBJ("Test").name("newName").name == "newName");
//	writeln(new PropertyTempl!string("Test").type);
//	writeln(new PropertyTempl!Property("Test").type);
//	auto p = new PropertyTempl!int("Test", 0);
//	p = 2;
//	writeln(p.value);
//
//	Property[string] props;
//	props["Test"] = new PropertyTempl!string("Test");
//	props["X"] = new PropertyTempl!int("Test", 0);
//	writeln(props);
}
