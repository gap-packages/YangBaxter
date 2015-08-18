DeclareCategory("IsRack", IsAttributeStoringRep);
DeclareGlobalVariable("RackType");

### To create/recognize racks 
DeclareGlobalFunction("IsRackMatrix");
DeclareOperation("Rack", [IsList]);

#DeclareAttribute("Rack2YB", IsRack);

