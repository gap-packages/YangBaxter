DeclareCategory("IsLinearCycleSet", IsAttributeStoringRep);
DeclareGlobalVariable("LinearCycleSetType");

### To create/recognize braces 
DeclareOperation("LinearCycleSet", [IsList]);
DeclareOperation("SmallLinearCycleSet", [IsInt, IsInt]);
DeclareOperation("IsLinearCycleSetImplemented", [IsInt]);


