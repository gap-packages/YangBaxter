DeclareCategory("IsQLCycleSet", IsAttributeStoringRep);

DeclareOperation("QLCycleSet", [IsList, IsMatrix]);
DeclareOperation("SmallQLCycleSet", [IsInt, IsInt]);
DeclareOperation("IsQLCycleSetImplemented", [IsInt]);
DeclareOperation("QLCycleSetSum", [IsQLCycleSet, IsInt, IsInt]);
DeclareOperation("QLCycleSetInverse", [IsQLCycleSet, IsInt ]);

DeclareAttribute("UnderlyingGroup", IsQLCycleSet);
DeclareAttribute("UnderlyingCycleSet", IsQLCycleSet);

DeclareGlobalFunction("NrSmallQLCycleSets");

ReadPackage("yangbaxter", "data/QLsmall.g");


