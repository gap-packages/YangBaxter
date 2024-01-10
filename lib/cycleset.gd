DeclareCategory("IsCycleSet", IsAttributeStoringRep);
DeclareCategory("IsCycleSetElm", IsMultiplicativeElement);

DeclareRepresentation( "IsCycleSetElmRep", IsPositionalObjectRep, [ 1 ]);
DeclareOperation("CycleSetElmConstructor", [IsCycleSet, IsInt]);

BindGlobal("CycleSetElmFamily", NewFamily("CycleSetElmFamily", IsCycleSetElm));
BindGlobal("CycleSetElmType", NewType(CycleSetElmFamily, IsCycleSetElm));
BindGlobal("CycleSetType", NewType(CollectionsFamily( CycleSetElmFamily ), IsCycleSet and IsAttributeStoringRep));

### To create/recognize cycle sets 
DeclareOperation("CycleSet", [IsList]);
DeclareOperation("Permutations2CycleSet", [IsList]);
DeclareOperation("SmallCycleSet", [IsInt, IsInt]);
DeclareOperation("AffineCycleSetZmodnZ", [IsInt, IsInt, IsInt]);
DeclareGlobalFunction("NrSmallCycleSets");

### Properties of a cycle set
DeclareProperty("IsSquareFree", IsCycleSet);
DeclareProperty("IsBalanced", IsCycleSet);
DeclareProperty("IsSimpleCycleSet", IsCycleSet);

#! @Returns true if the cycle set is indecomposable
#! @Description 
#! Let $X$ be a cycle set. We say that $X$ is indecomposable
#! if the group $\mathcal{G}(X)=\langle\varphi_x:x\in X\rangle$ acts
#! transitively on $X$. 
DeclareProperty("IsIndecomposable", IsCycleSet);

DeclareProperty("IsDecomposable", IsCycleSet);
DeclareAttribute("IdCycleSet", IsCycleSet);

### 
DeclareAttribute("IYBGroup", IsCycleSet);
DeclareAttribute("CycleSet2YB", IsCycleSet);
DeclareOperation("CycleSetCycle", [ IsCycleSet, IsInt, IsInt ]);

DeclareAttribute("AsList", IsCycleSet);
DeclareAttribute("Enumerator", IsCycleSet);
DeclareAttribute("Permutations", IsCycleSet);
DeclareAttribute("MatrixOfCycleSet", IsCycleSet);


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
#DeclareOperation("DualCycleSet", [IsCycleSet]);

### Sub objects
DeclareOperation("SubCycleSet", [IsCycleSet, IsList]);
#DeclareOperation("MinimalGenerators", [IsCycleSet]);

### Homology
DeclareOperation("BoundaryMap", [ IsCycleSet, IsInt ]);
DeclareOperation("Homology", [ IsCycleSet, IsInt ]);
DeclareOperation("BettiNumbers", [ IsCycleSet, IsInt ]);
DeclareOperation("Torsion", [ IsCycleSet, IsInt ]);

### Cycle sets of size <9
ReadPackage("yangbaxter", "data/CSsmall.g");
ReadPackage("yangbaxter", "data/CSsize6.g");
ReadPackage("yangbaxter", "data/CSsize7.g");
ReadPackage("yangbaxter", "data/CSsize8.g");


