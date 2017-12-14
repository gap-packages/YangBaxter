DeclareCategory("IsRack", IsAttributeStoringRep);
DeclareGlobalVariable("RackType");

### To create/recognize racks 
DeclareGlobalFunction("IsRackMatrix");
DeclareOperation("Rack", [IsList]);
DeclareAttribute("Permutations", IsRack);
DeclareAttribute("Rack2YB", IsRack);

