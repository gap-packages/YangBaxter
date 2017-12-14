DeclareCategory("IsRack", IsAttributeStoringRep);
DeclareCategory("IsRackElm", IsMultiplicativeElement);

DeclareRepresentation( "IsRackElmRep", IsPositionalObjectRep, [ 1 ]);
DeclareOperation("RackElmConstructor", [IsRack, IsInt]);

BindGlobal("RackElmFamily", NewFamily("RackElmFamily", IsRackElm));
BindGlobal("RackElmType", NewType(RackElmFamily, IsRackElm));
BindGlobal("RackType", NewType(CollectionsFamily( RackElmFamily ), IsRack and IsAttributeStoringRep));

#DeclareGlobalVariable("RackType");

### To create/recognize racks 
DeclareGlobalFunction("IsRackMatrix");
DeclareOperation("Rack", [IsList]);
DeclareAttribute("Rack2YB", IsRack);
DeclareAttribute("AsList", IsRack);
DeclareAttribute("Enumerator", IsRack);

DeclareAttribute("Permutations", IsRack);
DeclareAttribute("Matrix", IsRack);

