module uim.oop.core.event;

import uim.oop;

template OOPEVENT(string name, string defaultValue = "", bool readOnly = false) {
	const char[] OOPEVENT = `
	@OOP_EVENT("`~name~`", "`~defaultValue~`", `~(readOnly ? "true" : "false")~`) string _`~name~``~((defaultValue.length > 0) ? (" = "~defaultValue) : "")~`;
	@property string `~name~`() { return _`~name~`; }
	`~(!readOnly ? `@property O `~name~`(this O)(string newValue) { _`~name~` = newValue; return cast(O)this; }` : "");
}

class Event : Element {
	mixin(ThisElement!()); 
	this(string aName, string aDataType, string aDefaultValue, bool isReadOnly = false) { 
		super(aName); 
		_defaultValue = aDefaultValue; 
		_readOnly = isReadOnly; 
	}
	mixin(PropertyDefinition!("string", "_defaultValue", "defaultValue"));
	mixin(PropertyDefinition!("bool", "_readOnly", "readOnly"));
}
mixin(ShortCutElement!("EVENT", "Event")); 

unittest {
	
}
