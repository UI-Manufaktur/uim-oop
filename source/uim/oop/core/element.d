module uim.oop.core.element;

import uim.oop;

class Element {
	@safe this() {}
	@safe this(string newName) { this.name = newName; }

	@safe string namespace() { return "uim.oop"; }
	@safe string classname() { return "Element"; }
	@safe string fullname()  { return namespace~"."~classname; }
	@safe string fullpath()  { return fullname.replace(".", "/"); }

	mixin(PropertyDefinition!("string", "_name", "name", true, true));

	@safe Bson toBson() {
		Bson result = Bson.emptyObject;

		return result;
	}
	@safe Json toJson() {
		auto result = Json.emptyObject;
//		result["namespace"] = namespace;
//		result["classname"] = namespace;
//		result["namespace"] = namespace;
//		result["namespace"] = namespace;
		return result;
	}

	@safe override string toString() {
		return toJson.toString;
	}
}
@safe auto ELEMENT() { return new Element; }
@safe auto ELEMENT(string aName) { return new Element(aName); }

unittest {
	assert(ELEMENT.namespace == "uim.oop");
	assert(ELEMENT.classname == "Element");
	assert(ELEMENT.fullname == "uim.oop.Element");
	assert(ELEMENT.fullpath == "uim/oop/Element");

	assert(ELEMENT("test").name == "test");
	assert(ELEMENT("test").name("test2").name == "test2");
}