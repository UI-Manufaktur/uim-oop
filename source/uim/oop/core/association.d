module uim.oop.core.association;

import uim.oop;

template OOPASSOCIATION(string name, string datatype, bool isMultiple = false) {
	const char[] OOPASSOCIATION = `
	@OOP_ASSOCIATION("`~name~`", "`~datatype~`", `~(isMultiple ? "true" : "false")~`) `~datatype~` _`~name~`;
	@property `~datatype~` `~name~`() { return _`~name~`; }
`;
}

class Association : Element {
	mixin(ThisElement!()); 
	mixin(PropertyDefinition!("string", "_datatype", "datatype"));
	mixin(PropertyDefinition!("bool", "_isMultiple", "isMultiple"));
	mixin(PropertyDefinition!("bool", "_isDefault", "isDefault"));

	this(string aName, string aDataType, bool isMultiple = false, bool isDefault = false) { 
		super(aName); 
		_datatype = aDataType;
		_isMultiple = isMultiple; 
	}	
}
mixin(ShortCutElement!("ASSOCIATION", "Association")); 

unittest {
	assert(ASSOCIATION("Werte").name == "Werte");
	assert(ASSOCIATION("Werte").name("Anderes").name == "Anderes");
}
