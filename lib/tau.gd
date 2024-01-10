DeclareCategory("IsTauGroup", IsAttributeStoringRep);

DeclareOperation("TauGroup", [IsList, IsPerm]);
DeclareOperation("SmallTauGroup", [IsInt, IsInt]);
DeclareOperation("IsTauGroupImplemented", [IsInt]);
DeclareOperation("IsomorphismTauGroups", [IsTauGroup, IsTauGroup]);

DeclareAttribute("UnderlyingGroup", IsTauGroup);
DeclareAttribute("UnderlyingCycleSet", IsTauGroup);

DeclareGlobalFunction("NrSmallTauGroups");

ReadPackage("yangbaxter", "data/TGsmall.g");
