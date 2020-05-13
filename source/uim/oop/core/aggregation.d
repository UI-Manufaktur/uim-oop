module uim.oop.core.aggregation;

import uim.oop;

template OOPAGGREGATION(string name, string datatype, bool isMultiple = false, bool isDefault = false) {
	const char[] OOPAGGREGATION = `
	@OOP_AGGREGATION("`~name~`", "`~datatype~`", `~(isMultiple ? "true" : "false")~`, `~(isDefault ? "true" : "false")~`) `~datatype~` _`~name~`;
	@property `~datatype~` `~name~`() { return _`~name~`; }
`;
}

class Aggregation : Element {
	mixin(ThisElement!()); 

	this(string newName, string newDataType, bool newMultiple = false, bool newDefaultAgg = false) { 
		super(newName); 
		_datatype = newDataType;
		_isMultiple = newMultiple; 
		_isDefault = newDefaultAgg; 
	}

	mixin(PropertyDefinition!("string", "_datatype", "datatype"));
	mixin(PropertyDefinition!("bool", "_isMultiple", "isMultiple"));
	mixin(PropertyDefinition!("bool", "_isDefault", "isDefault"));
}
mixin(ShortCutElement!("AGGREGATION", "Aggregation")); 

unittest {
	assert(AGGREGATION("Werte").name == "Werte");
	assert(AGGREGATION("Werte").name("Anderes").name == "Anderes");
}
