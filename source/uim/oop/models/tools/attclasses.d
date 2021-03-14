module uim.oop.models.tools.attclasses;

import uim.oop;

DOOPAttclass attclassOf(DOOPModel myModel, UUID id) {
  if (myModel) {
    if (auto classes = myModel.attclasses) {
      return classes.entity(id);
  }}
  return null;
}

DOOPAttclass attclassOf(DOOPModel myModel, string idOrName) {
  if (myModel) {
    if (auto classes = myModel.attclasses) {
      return classes.entity(idOrName);
  }}
  return null;
}

DOOPAttclass attclassOf(DOOPModel myModel, UUID id, string name) {
  if (myModel) {
    if (auto classes = myModel.attclasses) {
      if (auto found = classes.entity(id)) return found;
      if (auto found = classes.entity(name)) return found;
  }}
  return null;
}
