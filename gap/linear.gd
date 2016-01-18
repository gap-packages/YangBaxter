DeclareCategory("IsLinearCycleSet", IsAttributeStoringRep);
DeclareGlobalVariable("LinearCycleSetType");

### To create/recognize braces 
DeclareOperation("LinearCycleSet", [IsList, IsMatrix]);
DeclareOperation("SmallLinearCycleSet", [IsInt, IsInt]);
DeclareOperation("IsLinearCycleSetImplemented", [IsInt]);


