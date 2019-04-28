module uim.oop;

public import std.stdio;
public import std.string;

public import uim.core;
public import uim.oop.annotations;
public import uim.oop.mixins;

public import uim.oop.obj;
public import uim.oop.core;
public import uim.oop.simple;
public import uim.oop.complex;
public import uim.oop.datatypes;
public import uim.oop.array;
public import uim.oop.map;
public import uim.oop.properties;
public import uim.oop.values;
public import uim.oop.keypair;	
public import uim.oop.collections;	

//auto OOP(string classname) {
//	switch(classname) {
//		default: return OBJ;
//	}
//}

// string doubleTag(string tag, string id, Obj[] elements...) {
	// string[string] attributes;	
	// attributes["id"] = id;		
	// string[] strElements;
	// foreach(e; elements) strElements ~= e.toString;
	// return htmlDoubleTag(tag, attributes, strElements.join(""));
// }

// string doubleTag(string tag, string id, string[] classes, Obj[] elements...) {
	// string[string] attributes;
	
	// attributes["id"] = id;	
	// attributes["class"] = classes.join(" ");
	
	// string[] strElements;
	// foreach(e; elements) strElements ~= e.toString;
	// return htmlDoubleTag(tag, attributes, strElements.join(""));
// } 

// string doubleTag(string tag, string id, string[] classes, string[string] attributes, Obj[] elements...) {
	// auto atts = attributes;
	
	// atts["id"] = id;
	
	// auto cls = classes;
	// if ("class" in atts) cls ~= atts["class"];
	// atts["class"] = cls.join(" ");
	
	// string[] strElements;
	// foreach(e; elements) strElements ~= e.toString;
	// return htmlDoubleTag(tag, attributes, strElements.join(""));
// } 
unittest {
	writeln("Testing ", __MODULE__);

//	writeln(OOP("Obj"));
}