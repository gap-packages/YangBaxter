DeclareCategory("IsLinearCycleSet", IsAttributeStoringRep);

### To create/recognize braces 
DeclareOperation("LinearCycleSet", [IsList, IsMatrix]);
DeclareOperation("SmallLinearCycleSet", [IsInt, IsInt]);
DeclareOperation("IsLinearCycleSetImplemented", [IsInt]);

DeclareAttribute("UnderlyingGroup", IsLinearCycleSet);
DeclareAttribute("UnderlyingCycleSet", IsLinearCycleSet);

DeclareGlobalFunction("NrSmallLinearCycleSets");


