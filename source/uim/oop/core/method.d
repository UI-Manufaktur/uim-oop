module uim.oop.core.method;

import uim.oop;

template OOPMETHOD(string name, string datatype = "") {
	const char[] OOPMETHOD = `
	@OOP_METHOD("`~name~`", "`~datatype~`") string _`~name~`;
	@property string `~name~`() { return _`~name~`; }`;
}
class Method : Element { 
	mixin(ThisElement!()); 

	@safe override Json toJson() {
		auto result = super.toJson;
		result["name"] = _name;
		return result;
	}
}
mixin(ShortCutElement!("METHOD", "Method")); 

unittest {
	
}
