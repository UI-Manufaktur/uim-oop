module uim.oop.mixins;

template PropertyDefinition(string datatype, string field, string propertyName, bool get = true, bool set = true, string defaultValue = null, string condition = null) {
	const char[] fieldDefinition = datatype~" "~field~(defaultValue.length>0?"="~defaultValue:"")~"; ";
	const char[] getDefinition = get ? "@safe @property "~datatype~" "~propertyName~"() { return "~field~"; } ":"";
	const char[] setDefinition = set ? "@safe @property O "~propertyName~"(this O)("~datatype~" value) { "~(condition.length>0?"if ("~condition~")":"")~field~"=value; return cast(O)this; } ":"";
	const char[] PropertyDefinition = fieldDefinition~getDefinition~setDefinition;
}

template PropertyDefinition(string datatype, string propertyName, bool get = true, bool set = true, string defaultValue = null, string condition = null) {
	const char[] fieldDefinition = datatype~" _"~propertyName~(defaultValue.length>0?"="~defaultValue:"")~"; ";
	const char[] getDefinition = get ? "@safe @property "~datatype~" "~propertyName~"() { return _"~propertyName~"; } ":"";
	const char[] setDefinition = set ? "@safe @property O "~propertyName~"(this O)("~datatype~" value) { "~(condition.length>0?"if ("~condition~")":"")~"_"~propertyName~"=value; return cast(O)this; } ":"";
	const char[] PropertyDefinition = fieldDefinition~getDefinition~setDefinition;
}

template ThisElement() {
	const char[] ThisElement = `
	@safe this() { super(); }
	@safe this(string aName) { super(aName); }
	`;
}

template ShortCutElement(string shortcut, string original) {
	const char[] ShortCutElement = `
	@safe `~original~` `~shortcut~`() { return new `~original~`(); }
	@safe `~original~` `~shortcut~`(string aName) { return new `~original~`(aName); }
	`;
}