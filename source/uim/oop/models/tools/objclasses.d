module uim.oop.models.tools.objclasses;

import uim.oop;

DOOPObjclass objclassOf(DOOPModel myModel, UUID id) {
  if (myModel) {
    if (auto classes = myModel.objclasses) {
      return classes.entity(id);
  }}
  return null;
}

DOOPObjclass objclassOf(DOOPModel myModel, string idOrName) {
  if (myModel) {
    if (auto classes = myModel.objclasses) {
      return classes.entity(idOrName);
  }}
  return null;
}

DOOPObjclass objclassOf(DOOPModel myModel, UUID id, string idOrName) {
  if (myModel) {
    if (auto classes = myModel.objclasses) {
      if (auto found = classes.entity(id)) return found;
      if (auto found = classes.entity(idOrName)) return found;
  }}
  return null;
}