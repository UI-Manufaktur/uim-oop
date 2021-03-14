module uim.oop.models.tools.objects;

import uim.oop;

DOOPObj objOf(DOOPModel myModel, UUID id) {
  if (myModel) {
    if (auto classes = myModel.objects) {
      return classes.entity(id);
  }}
  return null;
}

DOOPObj objOf(DOOPModel myModel, string idOrName) {
  if (myModel) {
    if (auto classes = myModel.objects) {
      return classes.entity(idOrName);
  }}
  return null;
}

DOOPObj objOf(DOOPModel myModel, UUID id, string idOrName) {
  if (myModel) {
    if (auto classes = myModel.objects) {
      if (auto found = classes.entity(id)) return found;
      if (auto found = classes.entity(idOrName)) return found;
  }}
  return null;
}