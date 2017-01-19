DeclareCategory("IsQLCycleSet", IsAttributeStoringRep);
DeclareGlobalVariable("QLCycleSetType");

DeclareOperation("QLCycleSet", [IsList, IsMatrix]);
DeclareOperation("SmallQLCycleSet", [IsInt, IsInt]);
DeclareOperation("IsQLCycleSetImplemented", [IsInt]);
DeclareOperation("QLCycleSetSum", [IsQLCycleSet, IsInt, IsInt]);

DeclareAttribute("UnderlyingGroup", IsQLCycleSet);
DeclareAttribute("UnderlyingCycleSet", IsQLCycleSet);

DeclareGlobalFunction("NrSmallQLCycleSets");

ReadPackage("yb", "data/QLsmall.g");


