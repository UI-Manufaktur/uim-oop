module uim.oop.annotations;

struct OOP_PROPERTY {
	string name;
	string datatype;
	string defaultValue;
	bool readOnly;
	bool multiple; // dummy	
	bool isDefault; // dummy
}

struct OOP_METHOD {
	string name;
	string datatype;
	bool multiple; // dummy
	bool isDefault; // dummy
	string defaultValue; // dummy
	bool readOnly; // dummy
}

struct OOP_EVENT {
	string name;
	string defaultValue;
	bool readOnly;
	string datatype; // dummy
	bool multiple; // dummy
	bool isDefault; // dummy
}

struct OOP_AGGREGATION {
	string name;
	string datatype;
	bool multiple;
	bool isDefault;
	string defaultValue; // dummy
	bool readOnly; // dummy
}

struct OOP_ASSOCIATION {
	string name;
	string datatype;
	bool multiple;
	bool isDefault; // dummy
	string defaultValue; // dummy
	bool readOnly; // dummy
}

//bool isProperty(alias member)() {
//	bool exists = false;
//	if (hasFunctionAttributes!(member, "@property")) exists = true;
//	return exists;
//}

bool hasAllAnnotation(T : Object, Annotations...)() {
	bool exists= true;
	foreach(annotation; Annotations) {
		static if (!hasAnnotation!(T, annotation)) exists = false;
	}
	return exists;
}

bool hasAnyAnnotation(T : Object, Annotations...)() {
	bool exists = false;
	foreach(annotation; Annotations) {
		static if (hasAnnotation!(T, annotation)) exists = true;
	}
	return exists;
}

bool hasMemberAllAnnotations(T : Object, string member, Annotations...)() {
	bool exists = true;
	foreach(annotation; Annotations) {
		static if (!hasMemberAnnotation!(T, member, annotation)) exists = false;
	}	bool exists = false;

	return exists;
}

bool hasMemberAnyAnnotation(T : Object, string member, Annotations...)() {
	bool exists = false;
	foreach(annotation; Annotations) {
		static if (hasMemberAnnotation!(T, member, annotation)) exists = true;
	}
	return exists;
}

bool hasMemberAnnotation(T : Object, string member, Annotation)() {
	bool res = false;
	static if (is(typeof(__traits(getMember, T, member)) == function)) {
		// function: check overloads
	Louter:
		foreach(overload; MemberFunctionsTuple!(T, member)) {
			static if (isGetterFunction!(overload, member)) {
				foreach(a; __traits(getAttributes, overload)) {
					static if (is(typeof(a) == Annotation) || a.stringof == Annotation.stringof) {
						res = true;
						break Louter;
					}
				}
			}
		}
	} else {
		foreach(a; __traits(getAttributes, __traits(getMember,T,member))) {
			static if (is(typeof(a) == Annotation) || a.stringof == Annotation.stringof) {
				res = true;
				break;
			}
		}
	}
	return res;
}


bool hasAnnotations(T : Object)() {
	return (__traits(getAttributes, T).length > 0) ? true : false;
}

bool hasAnnotation(T : Object, A)() {
	bool exists = false;
	foreach(attribute; __traits(getAttributes, T)) {
		static if (is(typeof(attribute) == A) || attribute.stringof == A.stringof) exists = true;
	}
	return exists;
}

unittest {
	struct annotation1 { int someValue; }
	struct annotation2 { int someValue; }

	@annotation1(1)
	class test {
		@annotation2(2) int field;
		@property int getField() { return field; }
	}
	auto obj = new test;

	assert(hasAnnotations!(test)());
	assert(hasAnnotation!(test, annotation1)());

	assert(hasAnyAnnotation!(test, annotation1)());
	assert(hasAnyAnnotation!(test, annotation1, annotation2)());

	assert(hasAllAnnotation!(test, annotation1)());
	assert(!hasAllAnnotation!(test, annotation1, annotation2)());

	assert(hasMemberAnyAnnotation!(test, "field", annotation2)());

//	assert(isProperty!(test.getField)());
}
