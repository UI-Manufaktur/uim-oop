module uim.oop.mixins.properties;

import uim.oop;

public import uim.oop.mixins.properties.expandable;
public import uim.oop.mixins.properties.functional;
public import uim.oop.mixins.properties.property;
public import uim.oop.mixins.properties.safe;

public import uim.oop.mixins.properties.tproperties;
public import uim.oop.mixins.properties.oproperties;
public import uim.oop.mixins.properties.xproperties;

template SProperty(string dataType, string propertyName) {
	const char[] SProperty = "
	protected "~dataType~" _"~propertyName~";
	@safe @property "~dataType~" "~propertyName~"() { return _"~propertyName~"; }
	@safe @property O "~propertyName~"(this O)("~dataType~" newValue) { _"~propertyName~" = newValue; return cast(O)this; }";
}
