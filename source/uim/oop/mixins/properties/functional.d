module uim.oop.mixins.properties.functional;

import std.string;

/// mixin for boolean properties
template OBool(string propertyName, string defaultValue = null, bool get = true, bool set = true) {
    const char[] OBool = `
    protected bool _`~propertyName~(defaultValue ? `=`~defaultValue:``)~`; 
    `~(get ? `@safe @property auto `~propertyName~`() { return _`~propertyName~`; }`: ``)~`
    `~(set ? `@safe @property O `~propertyName~`(this O)(bool newValue) { _`~propertyName~` = newValue; return cast(O)this; }`: ``)~`  
    `;
} 

template OBoolArray(string propertyName, string defaultValue = null, bool get = true, bool set = true) {
    const char[] OBoolArray = `
    protected bool[] _`~propertyName~(defaultValue ? `=`~defaultValue:``)~`; 
    `~(get ? `@safe @property auto `~propertyName~`() { return _`~propertyName~`; }`: ``)~`
    `~(set ? `@safe @property O `~propertyName~`(this O)(bool[] newValue) { _`~propertyName~` = newValue; return cast(O)this; }`: ``)~`  
    `;
} 

/// mixin for string properties
template OString(string propertyName, string defaultValue = null, bool get = true, bool set = true) {
	const char[] OString = `
	protected string _`~propertyName~(defaultValue ? `=`~defaultValue:``)~`;
	`~(get ? `@safe @property auto `~propertyName~`() { return _`~propertyName~`; }`: ``)~` 
	`~(set ? `@safe @property O `~propertyName~`(this O)(string newValue) { _`~propertyName~`=newValue; return cast(O)this; }`: ``)~`     
  `;
}

template OStringAA(string propertyName, string defaultValue = null, bool get = true, bool set = true) {
	const char[] OStringAA = `
	protected string[string] _`~propertyName~(defaultValue ? `=`~defaultValue:``)~`;
	`~(get ? `@safe @property auto `~propertyName~`() { return _`~propertyName~`; }`: ``)~` 
	`~(set ? `
  @safe @property O `~name~`(this O)(string key, string newValue) { _`~name~`[key] = newValue; return cast(O)this; };     
  @safe @property O `~propertyName~`(this O)(string[string] newValue) { _`~propertyName~`=newValue; return cast(O)this; }`: ``)~` 
  `;
}

/// mixin for uuid properties
template OUuid(string propertyName, string defaultValue = null, bool get = true, bool set = true) {
    const char[] OUuid = `
    protected UUID _`~propertyName~(defaultValue ? `=`~defaultValue:``)~`; 
    `~(get ? `@safe @property UUID `~propertyName~`() { return _`~propertyName~`; }`: ``)~`  
    `~(set ? `@safe @property O `~propertyName~`(this O)(UUID newValue) { _`~propertyName~` = newValue; return cast(O)this; }`: ``)~`      
    `;
} 
/// mixin for uuid properties
template OUuidArray(string propertyName, string defaultValue = null, bool get = true, bool set = true) {
    const char[] OUuidArray = `
    protected UUID[] _`~propertyName~(defaultValue ? `=`~defaultValue:``)~`; 
    `~(get ? `@safe @property UUID[] `~propertyName~`() { return _`~propertyName~`; }`: ``)~`  
    `~(set ? `
    @safe @property O `~name~`(this O)(UUID addValue) { _`~name~` ~= addValue; return cast(O)this; };     
    @safe @property O `~propertyName~`(this O)(UUID[] newValue) { _`~propertyName~` = newValue; return cast(O)this; }
    `: ``)~`      
    `;
} 
/// mixin for uuid properties
template OUuidString(string propertyName, string defaultValue = null, bool get = true, bool set = true) {
    const char[] OUuidString = `
    protected UUID[string] _`~propertyName~(defaultValue ? `=`~defaultValue:``)~`; 
    `~(get ? `@safe @property UUID[string] `~propertyName~`() { return _`~propertyName~`; }`: ``)~`  
    `~(set ? `
    @safe @property O `~name~`(this O)(string key, UUID newValue) { _`~name~`[key] = newValue; return cast(O)this; };     
    @safe @property O `~propertyName~`(this O)(UUID[string] newValue) { _`~propertyName~` = newValue; return cast(O)this; }
    `: ``)~`      
    `;
}

/// mixin for language string properties
template OLanguageString(string name, string defaultValue = null, bool get = true, bool set = true) {
    const char[] OLanguageString = `
    protected string[string] _`~name~`; 
    `~(get ? `@safe @property string[string] `~name~`() { return _`~name~`; }`: ``)~` 
    `~(set ? `
    @safe @property O `~name~`(this O)(string defValue) { _`~name~`["default"] = defValue; return cast(O)this; }   
    @safe @property O `~name~`(this O)(string language, string langValue) { _`~name~`[language] = langValue; return cast(O)this; }    
    @safe @property O `~name~`(this O)(string[string] newValue) { _`~name~` = newValue; return cast(O)this; }`: ``)~` 
    `;
} 

/// mixin for object id properties
template OObjectId(string name, string defaultValue = null, bool get = true, bool set = true) {
    const char[] OObjectId = `
    protected string[UUID] _`~name~`; 
    `~(get ? `@safe @property string[UUID] `~name~`() { return _`~name~`; }`: ``)~`  
    `~(set ? `@safe @property O `~name~`(this O)(string[UUID] newValue) { _`~name~` = newValue; return cast(O)this; }`: ``)~` 
    `;
} 

/// mixin for object Ids properties - etag[UUID]
template OObjectIds(string name, string defaultValue = null, bool get = true, bool set = true) {
    const char[] OObjectIds = `
    protected string[UUID] _`~name~`; 
    `~(get ? `@safe @property string[UUID] `~name~`() { return _`~name~`; }`: ``)~`  
    `~(set ? `@safe @property O `~name~`(this O)(string[UUID] newValue) { _`~name~` = newValue; return cast(O)this; }`: ``)~`     
    `;
} 

/// mixin for uuid properties
template OTimestamp(string name, string defaultValue = null, bool get = true, bool set = true) {
    const char[] OTimestamp = `
    protected size_t _`~name~`; 
    `~(get ? `@safe @property size_t `~name~`() { return _`~name~`; }`: ``)~`  
    `~(set ? `@safe @property O `~name~`(this O)(size_t newValue) { _`~name~` = newValue; return cast(O)this; }`: ``)~`     
    `;
} 

/// mixin for uuid properties
template OCounter(string name, string defaultValue = null, bool get = true, bool set = true) {
    const char[] OCounter = `
    protected size_t _`~name~`; 
    `~(get ? `@safe @property size_t `~name~`() { return _`~name~`; }`: ``)~` 
    `~(set ? `
    @safe @property O dec`~name.capitalize~`(this O)() { _`~name~`--; return cast(O)this; }
    @safe @property O inc`~name.capitalize~`(this O)() { _`~name~`++; return cast(O)this; }
    @safe @property O `~name~`(this O)(size_t newValue) { _`~name~` = newValue; return cast(O)this; }
    `: ``)~`    
    `;
} 