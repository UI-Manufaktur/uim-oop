module uim.oop.models.tools.versions;

import uim.oop;

size_t hasVersionMajor(T:DOOPEntity)(T[] versions, size_t versionMajor) {
  foreach (v; versions) if (v.versionMajor == versionMajor) return true;          
  return false;
}

/* size_t countVersionMinor(T:DOOPEntity)(T[] versions, size_t versionMajor, size_t versionMinor) {
  size_t result;
  foreach (v; versions) if ((v.versionMajor == versionMajor) && (v.versionMinor == versionMinor)) result++;          
  return result;
}
 */
size_t versionMax(T:DOOPEntity)(T[] versions) {
  size_t result;

  foreach (v; versions) {
    if (v.versionMajor > result) result = v.versionMajor;          
  }

  return result;
}

size_t versionMin(T:DOOPEntity)(T[] versions) {
  size_t result;

  if (versions) result = versions[0].versionMajor;
  foreach (v; versions) {
    if (v.versionMajor < result) result = v.versionMajor;          
  }

  return result;
}

T[] versionsOf(T:DOOPEntity)(T[] versions, size_t versionMajor) {
  T[] results;
  foreach (v; versions) if (v.versionMajor == versionMajor) results ~= v;          
  return results;
}
T versionOf(T:DOOPEntity)(T[] versions, size_t versionMajor) {
  foreach (v; versions) if (v.versionMajor == versionMajor) return v;          
  return null;
}
T versionOf(T:DOOPEntity)(T[] versions, size_t versionMajor, size_t versionMinor) {
  foreach (v; versions) if ((v.versionMajor == versionMajor) && (v.versionMinor == versionMinor)) return v;          
  return null;
}

bool hasVersion(T:DOOPEntity)(T[] versions, size_t versionMajor) {
  if (versions.versionOf(versionMajor)) return true;          
  return false;
}
bool hasVersion(T:DOOPEntity)(T[] versions, size_t versionMajor, size_t versionMinor) {
  if (versions.versionOf(versionMajor, versionMinor)) return true;          
  return false;
}

size_t versionMajorMin(T:DOOPEntity)(T[] versions) {
  size_t result;

  if (versions) result = versions[0].versionMajor;
  foreach (v; versions) {
    if (v.versionMajor < result) result = v.versionMajor;          
  }

  return result;
}

size_t versionMax(T:DOOPEntity)(T[] versions, size_t versionMajor) {
  size_t result;
  auto vs = versionsOf(versions, versionMajor);

  foreach (v; vs) {
    if (v.versionMinor > result) result = v.versionMinor;          
  }

  return result;
}

size_t versionMin(T:DOOPEntity)(T[] versions, size_t versionMajor) {
  size_t result;
  auto versions = versions.versionsOf(versionMajor);
  
  if (versions.length > 0) result = versions[0].versionMinor;
  foreach (v; versions) {
    if (v.versionMinor < result) result = v.versionMinor;          
  }

  return result;
}

T version_(T:DOOPEntity)(T[] versions, size_t versionMajor, size_t versionMinor) {
  foreach(v; versions) if ((v.versionMajor == versionMajor) && (v.versionMinor == versionMinor)) return v;
  return null;
}

T versionLast(T:DOOPEntity)(T[] versions, size_t major = 0, size_t minor = 0) {
  T result;

  if (major == 0) {
    auto versionMajor = versions.versionMax;
    auto versionMinor = versions.versionMax(versionMajor);
    result = versions.versionOf(versionMajor, versionMinor); 
  }
  else {
    if (minor == 0) {
      auto versionMinor = versions.versionMax(major);
      result = versions.versionOf(major, versionMinor); 
    }
    else {
      result = versions.versionOf(major, minor); 
    }
  }

  return result;
}
