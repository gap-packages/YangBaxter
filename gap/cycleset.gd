DeclareCategory("IsCycleSet", IsAttributeStoringRep);
DeclareGlobalVariable("CycleSetType");

### To create/recognize cycle sets 
DeclareOperation("CycleSet", [IsList]);
DeclareOperation("Permutations2CycleSet", [IsList]);
DeclareOperation("SmallCycleSet", [IsInt, IsInt]);
DeclareGlobalFunction("NrSmallCycleSets");

### Properties of a cycle set
DeclareProperty("IsSquareFree", IsCycleSet);
DeclareAttribute("IdCycleSet", IsCycleSet);

### 
DeclareAttribute("Permutations", IsCycleSet);
DeclareAttribute("CycleSet2YB", IsCycleSet);

### Dynamical cocycles and extensions
DeclareGlobalFunction("CycleSetSquareFreeCocycles");
DeclareGlobalFunction("CycleSetCocycles");
DeclareGlobalFunction("AbelianExtension");
DeclareGlobalFunction("IsCycleSetCocycle");
DeclareGlobalFunction("ConstantCycleSetCocycles");
DeclareGlobalFunction("ExtensionByConstantCocycle");
DeclareGlobalFunction("IsConstantCycleSetCocycle");
DeclareGlobalFunction("DynamicalCocycle");
DeclareGlobalFunction("IsDynamicalCocycle");
DeclareOperation("DynamicalCocycles", [IsCycleSet, IsList]);
DeclareGlobalFunction("DynamicalExtension");
DeclareGlobalFunction("Fiber");
DeclareGlobalFunction("DynamicalCocycleFromCoveringMap");

### Homomorphisms of cycle sets
DeclareOperation("Hom", [IsCycleSet, IsCycleSet]);
DeclareGlobalFunction("MakeCycleSetHomorphism");
DeclareOperation("IsQuotient", [IsCycleSet, IsCycleSet]);
DeclareOperation("IsCovering", [IsCycleSet, IsCycleSet]);
DeclareOperation("IsomorphismCycleSets", [IsCycleSet, IsCycleSet]);
DeclareOperation("IsCycleSetHomomorphism", [IsList, IsCycleSet, IsCycleSet]);

### Sub objects
DeclareOperation("SubCycleSet", [IsCycleSet, IsList]);
DeclareOperation("MinimalGenerators", [IsCycleSet]);

### Cycle sets of size <9
ReadPackage("yb", "data/CSsmall.g");
ReadPackage("yb", "data/CSsize6.g");
ReadPackage("yb", "data/CSsize7.g");
ReadPackage("yb", "data/CSsize8.g");
