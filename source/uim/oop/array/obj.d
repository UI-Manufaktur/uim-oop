module uim.oop.array.obj;

import uim.oop;

class DArrayObj : Obj {
	Obj[] _objs;

	override string classname() { return "Array"; }

	mixin(BoolProperty!"sorted");
	mixin(BoolProperty!"uniqued");

	this() { super(); }
	this(bool sortedMode, bool uniqueMode) { this(); this.sorted = sortedMode; this.uniqued = uniqueMode; }

	size_t length() { return 0; }
	bool empty() { return (this.length == 0); }
	O clear(this O)() { return cast(O)this; }

	O sorting(this O)() {
		return cast(O)this;
	}
	O uniquing(this O)() {
		foreach(i, oi; _objs[0..$-1]) {
			if (oi)	foreach(j, oj; _objs[i+1..$]) {
				if (oj)	{
					if (oi == oj) _objs[j] = null;
				}
			}  
		}  
		Obj[] newObjs;
		foreach(o; _objs) if (o) newObjs ~= o;
		_objs = newObjs;

		return cast(O)this;
	}

	O dup(this O)() {
		auto result = ArrayObj();
		result.sortedMode = sorted;
		result.uniqueMode = uniqued;
		return result;
	}
	override size_t toHash() nothrow { return super.toHash; }
	override string toString() { return super.toString; }
}
auto ArrayObj() { return new DArrayObj(); }
auto ArrayObj(bool sortedMode, bool uniqueMode) { return new DArrayObj(sortedMode, uniqueMode); }

unittest {
	writeln(ArrayObj.namespace);
	writeln(ArrayObj.classname);
	writeln(ArrayObj.fullname);
	writeln(ArrayObj.fullpath);

	assert(ArrayObj.empty);
	assert(ArrayObj(true, true).sorted);
	assert(!ArrayObj(false, true).sorted);
	assert(ArrayObj(true, true).uniqued);
	assert(!ArrayObj(true, false).uniqued);
}